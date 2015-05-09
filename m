From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 08/10] mfd: cros_ec: Support multiple EC in a system
Date: Sat,  9 May 2015 12:10:39 +0200
Message-ID: <1431166241-15775-9-git-send-email-javier.martinez@collabora.co.uk>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

From: Gwendal Grignou <gwendal@chromium.org>

Chromebooks can have more than one Embedded Controller so the
cros_ec device id has to be incremented for each EC registered.

Add code to handle multiple EC. First ec found is cros-ec0,
second cros-ec1 and so on.

Add a new structure to represent multiple EC as different char
devices (e.g: /dev/cros_ec, /dev/cros_pd). It connects to
cros_ec_device and allows sysfs inferface for cros_pd.

Also reduce number of allocated objects, make chromeos sysfs
class object a static and add refcounting to prevent object
deletion while command is in progress.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes since v1:
 - Squash patch that adds support to represent EC's as different
   char devices (e.g: /dev/cros_ec, /dev/cros_pd):
   https://chromium-review.googlesource.com/#/c/217297/
   Suggested by Gwendal Grignou
 - Use cros_ec instead of cros-ec in the subject line to be consistent.
   Suggested by Gwendal Grignou
---
 drivers/input/keyboard/cros_ec_keyb.c      |   2 +-
 drivers/mfd/cros_ec.c                      |  66 +++++++++++++--
 drivers/mfd/cros_ec_i2c.c                  |   1 -
 drivers/mfd/cros_ec_spi.c                  |   1 -
 drivers/platform/chrome/cros_ec_dev.c      | 128 ++++++++++++++++++++---------
 drivers/platform/chrome/cros_ec_dev.h      |   7 --
 drivers/platform/chrome/cros_ec_lightbar.c |  75 +++++++++--------
 drivers/platform/chrome/cros_ec_lpc.c      |   1 -
 drivers/platform/chrome/cros_ec_sysfs.c    |  50 +++++------
 include/linux/mfd/cros_ec.h                |  44 ++++++++--
 10 files changed, 248 insertions(+), 127 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 090f8a75412a..ef3ba20f4560 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -269,7 +269,7 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
 	ckdev->dev = dev;
 	dev_set_drvdata(&pdev->dev, ckdev);
 
-	idev->name = ec->ec_name;
+	idev->name = CROS_EC_DEV_NAME;
 	idev->phys = ec->phys_name;
 	__set_bit(EV_REP, idev->evbit);
 
diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index 956a827de826..6acf350b3ce6 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -289,6 +289,8 @@ exit:
 	return ret;
 }
 
+static int dev_id;
+
 int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
 		       struct cros_ec_command *msg)
 {
@@ -379,12 +381,46 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
 }
 EXPORT_SYMBOL(cros_ec_cmd_xfer);
 
-static const struct mfd_cell cros_devs[] = {
-	{
+static int cros_ec_dev_register(struct cros_ec_device *ec_dev,
+				int dev_id, int devidx)
+{
+	struct device *dev = ec_dev->dev;
+	struct cros_ec_platform ec_p = {
+		.cmd_offset = 0,
+	};
+
+	struct mfd_cell ec_cell = {
 		.name = "cros-ec-ctl",
 		.id = PLATFORM_DEVID_AUTO,
-	},
-};
+		.platform_data = &ec_p,
+		.pdata_size = sizeof(ec_p),
+	};
+
+	switch (devidx) {
+	case 0:
+		if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
+			ec_p.ec_name = of_get_property(dev->of_node, "devname",
+						       NULL);
+			if (ec_p.ec_name == NULL) {
+				dev_dbg(dev,
+					"Device name not found, using default");
+				ec_p.ec_name = CROS_EC_DEV_NAME;
+			}
+		} else {
+			ec_p.ec_name = CROS_EC_DEV_NAME;
+		}
+		break;
+	case 1:
+		ec_p.ec_name = CROS_EC_DEV_PD_NAME;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ec_p.cmd_offset = EC_CMD_PASSTHRU_OFFSET(devidx);
+	return mfd_add_devices(dev, dev_id, &ec_cell, 1,
+			       NULL, ec_dev->irq, NULL);
+}
 
 int cros_ec_register(struct cros_ec_device *ec_dev)
 {
@@ -407,14 +443,28 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 
 	cros_ec_probe_all(ec_dev);
 
-	err = mfd_add_devices(dev, 0, cros_devs,
-			      ARRAY_SIZE(cros_devs),
-			      NULL, ec_dev->irq, NULL);
+	err = cros_ec_dev_register(ec_dev, dev_id++, 0);
 	if (err) {
-		dev_err(dev, "failed to add mfd devices\n");
+		dev_err(dev, "failed to add ec\n");
 		return err;
 	}
 
+	if (ec_dev->max_passthru) {
+		/*
+		 * Register a PD device as well on top of this device.
+		 * We make the following assumptions:
+		 * - behind an EC, we have a pd
+		 * - only one device added.
+		 * - the EC is responsive at init time (it is not true for a
+		 *   sensor hub.
+		 */
+		err = cros_ec_dev_register(ec_dev, dev_id++, 1);
+		if (err) {
+			dev_err(dev, "failed to add additional ec\n");
+			return err;
+		}
+	}
+
 	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
 		err = of_platform_populate(dev->of_node, NULL, NULL, dev);
 		if (err) {
diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
index 22e8a4ae1711..b9a0963ca5c3 100644
--- a/drivers/mfd/cros_ec_i2c.c
+++ b/drivers/mfd/cros_ec_i2c.c
@@ -302,7 +302,6 @@ static int cros_ec_i2c_probe(struct i2c_client *client,
 	ec_dev->irq = client->irq;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_i2c;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_i2c;
-	ec_dev->ec_name = client->name;
 	ec_dev->phys_name = client->adapter->name;
 	ec_dev->din_size = sizeof(struct ec_host_response_i2c) +
 			   sizeof(struct ec_response_get_protocol_info);
diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index 4e6f2f6b1095..faba03e2f1ef 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -637,7 +637,6 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	ec_dev->irq = spi->irq;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_spi;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_spi;
-	ec_dev->ec_name = ec_spi->spi->modalias;
 	ec_dev->phys_name = dev_name(&ec_spi->spi->dev);
 	ec_dev->din_size = EC_MSG_PREAMBLE_COUNT +
 			   sizeof(struct ec_host_response) +
diff --git a/drivers/platform/chrome/cros_ec_dev.c b/drivers/platform/chrome/cros_ec_dev.c
index 7f7e3db59234..e52c636da404 100644
--- a/drivers/platform/chrome/cros_ec_dev.c
+++ b/drivers/platform/chrome/cros_ec_dev.c
@@ -29,11 +29,22 @@
 #define CROS_MAX_DEV 128
 /* Most EC commands size is ~64 bytes so allocate a buffer for the usual case */
 #define PREALLOC_SIZE 64
-static struct class *cros_class;
 static int ec_major;
 
+static const struct attribute_group *cros_ec_groups[] = {
+	&cros_ec_attr_group,
+	&cros_ec_lightbar_attr_group,
+	NULL,
+};
+
+static struct class cros_class = {
+	.owner          = THIS_MODULE,
+	.name           = "chromeos",
+	.dev_groups     = cros_ec_groups,
+};
+
 /* Basic communication */
-static int ec_get_version(struct cros_ec_device *ec, char *str, int maxlen)
+static int ec_get_version(struct cros_ec_dev *ec, char *str, int maxlen)
 {
 	struct ec_response_get_version *resp;
 	static const char * const current_image_name[] = {
@@ -49,7 +60,7 @@ static int ec_get_version(struct cros_ec_device *ec, char *str, int maxlen)
 	msg->insize = sizeof(*resp);
 	msg->outsize = 0;
 
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0)
 		return ret;
 
@@ -74,8 +85,10 @@ static int ec_get_version(struct cros_ec_device *ec, char *str, int maxlen)
 /* Device file ops */
 static int ec_device_open(struct inode *inode, struct file *filp)
 {
-	filp->private_data = container_of(inode->i_cdev,
-					  struct cros_ec_device, cdev);
+	struct cros_ec_dev *ec = container_of(inode->i_cdev,
+					      struct cros_ec_dev, cdev);
+	filp->private_data = ec;
+	nonseekable_open(inode, filp);
 	return 0;
 }
 
@@ -87,7 +100,7 @@ static int ec_device_release(struct inode *inode, struct file *filp)
 static ssize_t ec_device_read(struct file *filp, char __user *buffer,
 			      size_t length, loff_t *offset)
 {
-	struct cros_ec_device *ec = filp->private_data;
+	struct cros_ec_dev *ec = filp->private_data;
 	char msg[sizeof(struct ec_response_get_version) +
 		 sizeof(CROS_EC_DEV_VERSION)];
 	size_t count;
@@ -110,7 +123,7 @@ static ssize_t ec_device_read(struct file *filp, char __user *buffer,
 }
 
 /* Ioctls */
-static long ec_device_ioctl_xcmd(struct cros_ec_device *ec, void __user *arg)
+static long ec_device_ioctl_xcmd(struct cros_ec_dev *ec, void __user *arg)
 {
 	long ret;
 	int alloc_size;
@@ -137,7 +150,8 @@ static long ec_device_ioctl_xcmd(struct cros_ec_device *ec, void __user *arg)
 		goto exit;
 	}
 
-	ret = cros_ec_cmd_xfer(ec, s_cmd);
+	s_cmd->command += ec->cmd_offset;
+	ret = cros_ec_cmd_xfer(ec->ec_dev, s_cmd);
 	/* Only copy data to userland if data was received. */
 	if (ret < 0)
 		goto exit;
@@ -150,19 +164,21 @@ exit:
 	return ret;
 }
 
-static long ec_device_ioctl_readmem(struct cros_ec_device *ec, void __user *arg)
+static long ec_device_ioctl_readmem(struct cros_ec_dev *ec, void __user *arg)
 {
+	struct cros_ec_device *ec_dev = ec->ec_dev;
 	struct cros_ec_readmem s_mem = { };
 	long num;
 
 	/* Not every platform supports direct reads */
-	if (!ec->cmd_readmem)
+	if (!ec_dev->cmd_readmem)
 		return -ENOTTY;
 
 	if (copy_from_user(&s_mem, arg, sizeof(s_mem)))
 		return -EFAULT;
 
-	num = ec->cmd_readmem(ec, s_mem.offset, s_mem.bytes, s_mem.buffer);
+	num = ec_dev->cmd_readmem(ec_dev, s_mem.offset, s_mem.bytes,
+				  s_mem.buffer);
 	if (num <= 0)
 		return num;
 
@@ -175,7 +191,7 @@ static long ec_device_ioctl_readmem(struct cros_ec_device *ec, void __user *arg)
 static long ec_device_ioctl(struct file *filp, unsigned int cmd,
 			    unsigned long arg)
 {
-	struct cros_ec_device *ec = filp->private_data;
+	struct cros_ec_dev *ec = filp->private_data;
 
 	if (_IOC_TYPE(cmd) != CROS_EC_DEV_IOC)
 		return -ENOTTY;
@@ -198,45 +214,81 @@ static const struct file_operations fops = {
 	.unlocked_ioctl = ec_device_ioctl,
 };
 
+static void __remove(struct device *dev)
+{
+	struct cros_ec_dev *ec = container_of(dev, struct cros_ec_dev,
+					      class_dev);
+	kfree(ec);
+}
+
 static int ec_device_probe(struct platform_device *pdev)
 {
-	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
-	int retval = -ENOTTY;
-	dev_t devno = MKDEV(ec_major, 0);
+	int retval = -ENOMEM;
+	struct device *dev = &pdev->dev;
+	struct cros_ec_platform *ec_platform = dev_get_platdata(dev);
+	dev_t devno = MKDEV(ec_major, pdev->id);
+	struct cros_ec_dev *ec = kzalloc(sizeof(*ec), GFP_KERNEL);
+
+	if (!ec)
+		return retval;
 
-	/* Instantiate it (and remember the EC) */
+	dev_set_drvdata(dev, ec);
+	ec->ec_dev = dev_get_drvdata(dev->parent);
+	ec->dev = dev;
+	ec->cmd_offset = ec_platform->cmd_offset;
+	device_initialize(&ec->class_dev);
 	cdev_init(&ec->cdev, &fops);
 
+	/*
+	 * Add the character device
+	 * Link cdev to the class device to be sure device is not used
+	 * before unbinding it.
+	 */
+	ec->cdev.kobj.parent = &ec->class_dev.kobj;
 	retval = cdev_add(&ec->cdev, devno, 1);
 	if (retval) {
-		dev_err(&pdev->dev, ": failed to add character device\n");
-		return retval;
+		dev_err(dev, ": failed to add character device\n");
+		goto cdev_add_failed;
 	}
 
-	ec->vdev = device_create(cros_class, NULL, devno, ec,
-				 CROS_EC_DEV_NAME);
-	if (IS_ERR(ec->vdev)) {
-		retval = PTR_ERR(ec->vdev);
-		dev_err(&pdev->dev, ": failed to create device\n");
-		cdev_del(&ec->cdev);
-		return retval;
+	/*
+	 * Add the class device
+	 * Link to the character device for creating the /dev entry
+	 * in devtmpfs.
+	 */
+	ec->class_dev.devt = ec->cdev.dev;
+	ec->class_dev.class = &cros_class;
+	ec->class_dev.parent = dev;
+	ec->class_dev.release = __remove;
+
+	retval = dev_set_name(&ec->class_dev, "%s", ec_platform->ec_name);
+	if (retval) {
+		dev_err(dev, "dev_set_name failed => %d\n", retval);
+		goto set_named_failed;
 	}
 
-	/* Initialize extra interfaces */
-	ec_dev_sysfs_init(ec);
-	ec_dev_lightbar_init(ec);
+	retval = device_add(&ec->class_dev);
+	if (retval) {
+		dev_err(dev, "device_register failed => %d\n", retval);
+		goto dev_reg_failed;
+	}
 
 	return 0;
+
+dev_reg_failed:
+set_named_failed:
+	dev_set_drvdata(dev, NULL);
+	cdev_del(&ec->cdev);
+cdev_add_failed:
+	kfree(ec);
+	return retval;
 }
 
 static int ec_device_remove(struct platform_device *pdev)
 {
-	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
-
-	ec_dev_lightbar_remove(ec);
-	ec_dev_sysfs_remove(ec);
-	device_destroy(cros_class, MKDEV(ec_major, 0));
+	struct cros_ec_dev *ec = dev_get_drvdata(&pdev->dev);
 	cdev_del(&ec->cdev);
+	device_unregister(&ec->class_dev);
 	return 0;
 }
 
@@ -253,10 +305,10 @@ static int __init cros_ec_dev_init(void)
 	int ret;
 	dev_t dev = 0;
 
-	cros_class = class_create(THIS_MODULE, "chromeos");
-	if (IS_ERR(cros_class)) {
+	ret  = class_register(&cros_class);
+	if (ret) {
 		pr_err(CROS_EC_DEV_NAME ": failed to register device class\n");
-		return PTR_ERR(cros_class);
+		return ret;
 	}
 
 	/* Get a range of minor numbers (starting with 0) to work with */
@@ -278,7 +330,7 @@ static int __init cros_ec_dev_init(void)
 failed_devreg:
 	unregister_chrdev_region(MKDEV(ec_major, 0), CROS_MAX_DEV);
 failed_chrdevreg:
-	class_destroy(cros_class);
+	class_unregister(&cros_class);
 	return ret;
 }
 
@@ -286,7 +338,7 @@ static void __exit cros_ec_dev_exit(void)
 {
 	platform_driver_unregister(&cros_ec_dev_driver);
 	unregister_chrdev(ec_major, CROS_EC_DEV_NAME);
-	class_destroy(cros_class);
+	class_unregister(&cros_class);
 }
 
 module_init(cros_ec_dev_init);
diff --git a/drivers/platform/chrome/cros_ec_dev.h b/drivers/platform/chrome/cros_ec_dev.h
index 45d67f7e518c..bfd2c84c3571 100644
--- a/drivers/platform/chrome/cros_ec_dev.h
+++ b/drivers/platform/chrome/cros_ec_dev.h
@@ -24,7 +24,6 @@
 #include <linux/types.h>
 #include <linux/mfd/cros_ec.h>
 
-#define CROS_EC_DEV_NAME "cros_ec"
 #define CROS_EC_DEV_VERSION "1.0.0"
 
 /*
@@ -44,10 +43,4 @@ struct cros_ec_readmem {
 #define CROS_EC_DEV_IOCXCMD   _IOWR(CROS_EC_DEV_IOC, 0, struct cros_ec_command)
 #define CROS_EC_DEV_IOCRDMEM  _IOWR(CROS_EC_DEV_IOC, 1, struct cros_ec_readmem)
 
-void ec_dev_sysfs_init(struct cros_ec_device *);
-void ec_dev_sysfs_remove(struct cros_ec_device *);
-
-void ec_dev_lightbar_init(struct cros_ec_device *);
-void ec_dev_lightbar_remove(struct cros_ec_device *);
-
 #endif /* _CROS_EC_DEV_H_ */
diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 6e1986a2dce1..144e09df9b84 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -92,7 +92,7 @@ out:
 	return ret;
 }
 
-static struct cros_ec_command *alloc_lightbar_cmd_msg(void)
+static struct cros_ec_command *alloc_lightbar_cmd_msg(struct cros_ec_dev *ec)
 {
 	struct cros_ec_command *msg;
 	int len;
@@ -105,14 +105,14 @@ static struct cros_ec_command *alloc_lightbar_cmd_msg(void)
 		return NULL;
 
 	msg->version = 0;
-	msg->command = EC_CMD_LIGHTBAR_CMD;
+	msg->command = EC_CMD_LIGHTBAR_CMD + ec->cmd_offset;
 	msg->outsize = sizeof(struct ec_params_lightbar);
 	msg->insize = sizeof(struct ec_response_lightbar);
 
 	return msg;
 }
 
-static int get_lightbar_version(struct cros_ec_device *ec,
+static int get_lightbar_version(struct cros_ec_dev *ec,
 				uint32_t *ver_ptr, uint32_t *flg_ptr)
 {
 	struct ec_params_lightbar *param;
@@ -120,13 +120,13 @@ static int get_lightbar_version(struct cros_ec_device *ec,
 	struct cros_ec_command *msg;
 	int ret;
 
-	msg = alloc_lightbar_cmd_msg();
+	msg = alloc_lightbar_cmd_msg(ec);
 	if (!msg)
 		return 0;
 
 	param = (struct ec_params_lightbar *)msg->data;
 	param->cmd = LIGHTBAR_CMD_VERSION;
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0) {
 		ret = 0;
 		goto exit;
@@ -165,7 +165,8 @@ static ssize_t version_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
 	uint32_t version = 0, flags = 0;
-	struct cros_ec_device *ec = dev_get_drvdata(dev);
+	struct cros_ec_dev *ec = container_of(dev,
+					      struct cros_ec_dev, class_dev);
 	int ret;
 
 	ret = lb_throttle();
@@ -187,12 +188,13 @@ static ssize_t brightness_store(struct device *dev,
 	struct cros_ec_command *msg;
 	int ret;
 	unsigned int val;
-	struct cros_ec_device *ec = dev_get_drvdata(dev);
+	struct cros_ec_dev *ec = container_of(dev,
+					      struct cros_ec_dev, class_dev);
 
 	if (kstrtouint(buf, 0, &val))
 		return -EINVAL;
 
-	msg = alloc_lightbar_cmd_msg();
+	msg = alloc_lightbar_cmd_msg(ec);
 	if (!msg)
 		return -ENOMEM;
 
@@ -203,7 +205,7 @@ static ssize_t brightness_store(struct device *dev,
 	if (ret)
 		goto exit;
 
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0)
 		goto exit;
 
@@ -231,11 +233,12 @@ static ssize_t led_rgb_store(struct device *dev, struct device_attribute *attr,
 {
 	struct ec_params_lightbar *param;
 	struct cros_ec_command *msg;
-	struct cros_ec_device *ec = dev_get_drvdata(dev);
+	struct cros_ec_dev *ec = container_of(dev,
+					      struct cros_ec_dev, class_dev);
 	unsigned int val[4];
 	int ret, i = 0, j = 0, ok = 0;
 
-	msg = alloc_lightbar_cmd_msg();
+	msg = alloc_lightbar_cmd_msg(ec);
 	if (!msg)
 		return -ENOMEM;
 
@@ -268,7 +271,7 @@ static ssize_t led_rgb_store(struct device *dev, struct device_attribute *attr,
 					return ret;
 			}
 
-			ret = cros_ec_cmd_xfer(ec, msg);
+			ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 			if (ret < 0)
 				goto exit;
 
@@ -304,9 +307,10 @@ static ssize_t sequence_show(struct device *dev,
 	struct ec_response_lightbar *resp;
 	struct cros_ec_command *msg;
 	int ret;
-	struct cros_ec_device *ec = dev_get_drvdata(dev);
+	struct cros_ec_dev *ec = container_of(dev,
+					      struct cros_ec_dev, class_dev);
 
-	msg = alloc_lightbar_cmd_msg();
+	msg = alloc_lightbar_cmd_msg(ec);
 	if (!msg)
 		return -ENOMEM;
 
@@ -316,7 +320,7 @@ static ssize_t sequence_show(struct device *dev,
 	if (ret)
 		goto exit;
 
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0)
 		goto exit;
 
@@ -345,9 +349,10 @@ static ssize_t sequence_store(struct device *dev, struct device_attribute *attr,
 	struct cros_ec_command *msg;
 	unsigned int num;
 	int ret, len;
-	struct cros_ec_device *ec = dev_get_drvdata(dev);
+	struct cros_ec_dev *ec = container_of(dev,
+					      struct cros_ec_dev, class_dev);
 
-	msg = alloc_lightbar_cmd_msg();
+	msg = alloc_lightbar_cmd_msg(ec);
 	if (!msg)
 		return -ENOMEM;
 
@@ -372,7 +377,7 @@ static ssize_t sequence_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0)
 		return ret;
 
@@ -397,25 +402,27 @@ static struct attribute *__lb_cmds_attrs[] = {
 	&dev_attr_sequence.attr,
 	NULL,
 };
-static struct attribute_group lb_cmds_attr_group = {
-	.name = "lightbar",
-	.attrs = __lb_cmds_attrs,
-};
 
-void ec_dev_lightbar_init(struct cros_ec_device *ec)
+static umode_t cros_ec_lightbar_attrs_are_visible(struct kobject *kobj,
+						  struct attribute *a, int n)
 {
-	int ret = 0;
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct cros_ec_dev *ec = container_of(dev,
+					      struct cros_ec_dev, class_dev);
+	struct platform_device *pdev = container_of(ec->dev,
+						   struct platform_device, dev);
+	if (pdev->id != 0)
+		return 0;
 
 	/* Only instantiate this stuff if the EC has a lightbar */
-	if (!get_lightbar_version(ec, NULL, NULL))
-		return;
-
-	ret = sysfs_create_group(&ec->vdev->kobj, &lb_cmds_attr_group);
-	if (ret)
-		pr_warn("sysfs_create_group() failed: %d\n", ret);
+	if (get_lightbar_version(ec, NULL, NULL))
+		return a->mode;
+	else
+		return 0;
 }
 
-void ec_dev_lightbar_remove(struct cros_ec_device *ec)
-{
-	sysfs_remove_group(&ec->vdev->kobj, &lb_cmds_attr_group);
-}
+struct attribute_group cros_ec_lightbar_attr_group = {
+	.name = "lightbar",
+	.attrs = __lb_cmds_attrs,
+	.is_visible = cros_ec_lightbar_attrs_are_visible,
+};
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index e98b0345288a..ca7cdc6eef0b 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -273,7 +273,6 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ec_dev);
 	ec_dev->dev = dev;
-	ec_dev->ec_name = pdev->name;
 	ec_dev->phys_name = dev_name(dev);
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_lpc;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_lpc;
diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index 88d0a7c9bbff..056855c32187 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -73,7 +73,8 @@ static ssize_t store_ec_reboot(struct device *dev,
 	int got_cmd = 0, offset = 0;
 	int i;
 	int ret;
-	struct cros_ec_device *ec = dev_get_drvdata(dev);
+	struct cros_ec_dev *ec = container_of(dev,
+					      struct cros_ec_dev, class_dev);
 
 	msg = (struct cros_ec_command *)msg_buf;
 	param = (struct ec_params_reboot_ec *)msg->data;
@@ -107,13 +108,13 @@ static ssize_t store_ec_reboot(struct device *dev,
 	if (!got_cmd)
 		return -EINVAL;
 
-	msg->command = EC_CMD_REBOOT_EC;
+	msg->command = EC_CMD_REBOOT_EC + ec->cmd_offset;
 	msg->outsize = sizeof(*param);
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0)
 		return ret;
 	if (msg->result != EC_RES_SUCCESS) {
-		dev_dbg(ec->dev, "EC result %d\n", msg->result);
+		dev_dbg(&ec->class_dev, "EC result %d\n", msg->result);
 		return -EINVAL;
 	}
 
@@ -131,14 +132,15 @@ static ssize_t show_ec_version(struct device *dev,
 	u8 msg_buf[sizeof(*msg) + EC_HOST_PARAM_SIZE] = { 0 };
 	int ret;
 	int count = 0;
-	struct cros_ec_device *ec = dev_get_drvdata(dev);
+	struct cros_ec_dev *ec = container_of(dev,
+					      struct cros_ec_dev, class_dev);
 
 	msg = (struct cros_ec_command *)msg_buf;
 
 	/* Get versions. RW may change. */
-	msg->command = EC_CMD_GET_VERSION;
+	msg->command = EC_CMD_GET_VERSION + ec->cmd_offset;
 	msg->insize = sizeof(*r_ver);
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0)
 		return ret;
 	if (msg->result != EC_RES_SUCCESS)
@@ -159,9 +161,9 @@ static ssize_t show_ec_version(struct device *dev,
 			    image_names[r_ver->current_image] : "?"));
 
 	/* Get build info. */
-	msg->command = EC_CMD_GET_BUILD_INFO;
+	msg->command = EC_CMD_GET_BUILD_INFO + ec->cmd_offset;
 	msg->insize = EC_HOST_PARAM_SIZE;
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0)
 		count += scnprintf(buf + count, PAGE_SIZE - count,
 				   "Build info:    XFER ERROR %d\n", ret);
@@ -175,9 +177,9 @@ static ssize_t show_ec_version(struct device *dev,
 	}
 
 	/* Get chip info. */
-	msg->command = EC_CMD_GET_CHIP_INFO;
+	msg->command = EC_CMD_GET_CHIP_INFO + ec->cmd_offset;
 	msg->insize = sizeof(*r_chip);
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0)
 		count += scnprintf(buf + count, PAGE_SIZE - count,
 				   "Chip info:     XFER ERROR %d\n", ret);
@@ -199,9 +201,9 @@ static ssize_t show_ec_version(struct device *dev,
 	}
 
 	/* Get board version */
-	msg->command = EC_CMD_GET_BOARD_VERSION;
+	msg->command = EC_CMD_GET_BOARD_VERSION + ec->cmd_offset;
 	msg->insize = sizeof(*r_board);
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0)
 		count += scnprintf(buf + count, PAGE_SIZE - count,
 				   "Board version: XFER ERROR %d\n", ret);
@@ -225,15 +227,16 @@ static ssize_t show_ec_flashinfo(struct device *dev,
 	struct ec_response_flash_info *resp;
 	struct cros_ec_command *msg;
 	int ret;
-	struct cros_ec_device *ec = dev_get_drvdata(dev);
+	struct cros_ec_dev *ec = container_of(dev,
+					      struct cros_ec_dev, class_dev);
 	u8 msg_buf[sizeof(*msg) + sizeof(*resp)] = { 0 };
 
 	msg = (struct cros_ec_command *)msg_buf;
 
 	/* The flash info shouldn't ever change, but ask each time anyway. */
-	msg->command = EC_CMD_FLASH_INFO;
+	msg->command = EC_CMD_FLASH_INFO + ec->cmd_offset;
 	msg->insize = sizeof(*resp);
-	ret = cros_ec_cmd_xfer(ec, msg);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, msg);
 	if (ret < 0)
 		return ret;
 	if (msg->result != EC_RES_SUCCESS)
@@ -262,20 +265,7 @@ static struct attribute *__ec_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group ec_attr_group = {
+struct attribute_group cros_ec_attr_group = {
 	.attrs = __ec_attrs,
 };
 
-void ec_dev_sysfs_init(struct cros_ec_device *ec)
-{
-	int error;
-
-	error = sysfs_create_group(&ec->vdev->kobj, &ec_attr_group);
-	if (error)
-		pr_warn("failed to create group: %d\n", error);
-}
-
-void ec_dev_sysfs_remove(struct cros_ec_device *ec)
-{
-	sysfs_remove_group(&ec->vdev->kobj, &ec_attr_group);
-}
diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index 15dc8317a767..fd5b92b60d62 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -17,10 +17,14 @@
 #define __LINUX_MFD_CROS_EC_H
 
 #include <linux/cdev.h>
+#include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/mfd/cros_ec_commands.h>
 #include <linux/mutex.h>
 
+#define CROS_EC_DEV_NAME "cros_ec"
+#define CROS_EC_DEV_PD_NAME "cros_pd"
+
 /*
  * The EC is unresponsive for a time after a reboot command.  Add a
  * simple delay to make sure that the bus stays locked.
@@ -71,11 +75,8 @@ struct cros_ec_command {
 /**
  * struct cros_ec_device - Information about a ChromeOS EC device
  *
- * @ec_name: name of EC device (e.g. 'chromeos-ec')
  * @phys_name: name of physical comms layer (e.g. 'i2c-4')
  * @dev: Device pointer for physical comms device
- * @vdev: Device pointer for virtual comms device
- * @cdev: Character device structure for virtual comms device
  * @was_wake_device: true if this device was set to wake the system from
  * sleep at the last suspend
  * @cmd_readmem: direct read of the EC memory-mapped region, if supported
@@ -87,6 +88,7 @@ struct cros_ec_command {
  *
  * @priv: Private data
  * @irq: Interrupt to use
+ * @id: Device id
  * @din: input buffer (for data from EC)
  * @dout: output buffer (for data to EC)
  * \note
@@ -109,11 +111,8 @@ struct cros_ec_command {
 struct cros_ec_device {
 
 	/* These are used by other drivers that want to talk to the EC */
-	const char *ec_name;
 	const char *phys_name;
 	struct device *dev;
-	struct device *vdev;
-	struct cdev cdev;
 	bool was_wake_device;
 	struct class *cros_class;
 	int (*cmd_readmem)(struct cros_ec_device *ec, unsigned int offset,
@@ -138,6 +137,35 @@ struct cros_ec_device {
 	struct mutex lock;
 };
 
+/* struct cros_ec_platform - ChromeOS EC platform information
+ *
+ * @ec_name: name of EC device (e.g. 'cros-ec', 'cros-pd', ...)
+ * used in /dev/ and sysfs.
+ * @cmd_offset: offset to apply for each command. Set when
+ * registering a devicde behind another one.
+ */
+struct cros_ec_platform {
+	const char *ec_name;
+	u16 cmd_offset;
+};
+
+/*
+ * struct cros_ec_dev - ChromeOS EC device entry point
+ *
+ * @class_dev: Device structure used in sysfs
+ * @cdev: Character device structure in /dev
+ * @ec_dev: cros_ec_device structure to talk to the physical device
+ * @dev: pointer to the platform device
+ * @cmd_offset: offset to apply for each command.
+ */
+struct cros_ec_dev {
+	struct device class_dev;
+	struct cdev cdev;
+	struct cros_ec_device *ec_dev;
+	struct device *dev;
+	u16 cmd_offset;
+};
+
 /**
  * cros_ec_suspend - Handle a suspend operation for the ChromeOS EC device
  *
@@ -216,4 +244,8 @@ int cros_ec_remove(struct cros_ec_device *ec_dev);
  */
 int cros_ec_register(struct cros_ec_device *ec_dev);
 
+/* sysfs stuff */
+extern struct attribute_group cros_ec_attr_group;
+extern struct attribute_group cros_ec_lightbar_attr_group;
+
 #endif /* __LINUX_MFD_CROS_EC_H */
-- 
2.1.4
