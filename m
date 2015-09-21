From: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
Subject: [PATCH v3 3/4] platform/chrome: Support reading/writing the vboot context
Date: Mon, 21 Sep 2015 10:38:22 -0300
Message-ID: <1442842703-5309-4-git-send-email-emilio.lopez@collabora.co.uk>
References: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Some EC implementations include a small nvram space used to store
verified boot context data. This patch offers a way to expose this
data to userspace.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>
---

Changes from v1:
 - Use is_bin_visible instead of is_visible

Changes from v2:
 - Changes suggested by Javier (makefile, size checks, etc)
 - Add his reviewed-by

 drivers/platform/chrome/Makefile      |   3 +-
 drivers/platform/chrome/cros_ec_dev.c |   1 +
 drivers/platform/chrome/cros_ec_vbc.c | 137 ++++++++++++++++++++++++++=
++++++++
 include/linux/mfd/cros_ec.h           |   1 +
 4 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/chrome/cros_ec_vbc.c

diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome=
/Makefile
index 4a11b01..bc498bd 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -1,7 +1,8 @@
=20
 obj-$(CONFIG_CHROMEOS_LAPTOP)	+=3D chromeos_laptop.o
 obj-$(CONFIG_CHROMEOS_PSTORE)	+=3D chromeos_pstore.o
-cros_ec_devs-objs               :=3D cros_ec_dev.o cros_ec_sysfs.o cro=
s_ec_lightbar.o
+cros_ec_devs-objs		:=3D cros_ec_dev.o cros_ec_sysfs.o \
+				   cros_ec_lightbar.o cros_ec_vbc.o
 obj-$(CONFIG_CROS_EC_CHARDEV)   +=3D cros_ec_devs.o
 obj-$(CONFIG_CROS_EC_LPC)       +=3D cros_ec_lpc.o
 obj-$(CONFIG_CROS_EC_PROTO)	+=3D cros_ec_proto.o
diff --git a/drivers/platform/chrome/cros_ec_dev.c b/drivers/platform/c=
hrome/cros_ec_dev.c
index e8fcdc2..d19263f 100644
--- a/drivers/platform/chrome/cros_ec_dev.c
+++ b/drivers/platform/chrome/cros_ec_dev.c
@@ -32,6 +32,7 @@ static int ec_major;
 static const struct attribute_group *cros_ec_groups[] =3D {
 	&cros_ec_attr_group,
 	&cros_ec_lightbar_attr_group,
+	&cros_ec_vbc_attr_group,
 	NULL,
 };
=20
diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform/c=
hrome/cros_ec_vbc.c
new file mode 100644
index 0000000..564a0d0
--- /dev/null
+++ b/drivers/platform/chrome/cros_ec_vbc.c
@@ -0,0 +1,137 @@
+/*
+ * cros_ec_vbc - Expose the vboot context nvram to userspace
+ *
+ * Copyright (C) 2015 Collabora Ltd.
+ *
+ * based on vendor driver,
+ *
+ * Copyright (C) 2012 The Chromium OS Authors
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/cros_ec.h>
+#include <linux/mfd/cros_ec_commands.h>
+#include <linux/slab.h>
+
+static ssize_t vboot_context_read(struct file *filp, struct kobject *k=
obj,
+				  struct bin_attribute *att, char *buf,
+				  loff_t pos, size_t count)
+{
+	struct device *dev =3D container_of(kobj, struct device, kobj);
+	struct cros_ec_dev *ec =3D container_of(dev, struct cros_ec_dev,
+					      class_dev);
+	struct cros_ec_device *ecdev =3D ec->ec_dev;
+	struct ec_params_vbnvcontext *params;
+	struct cros_ec_command *msg;
+	int err;
+	const size_t para_sz =3D sizeof(params->op);
+	const size_t resp_sz =3D sizeof(struct ec_response_vbnvcontext);
+	const size_t payload =3D max(para_sz, resp_sz);
+
+	msg =3D kmalloc(sizeof(*msg) + payload, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	/* NB: we only kmalloc()ated enough space for the op field */
+	params =3D (struct ec_params_vbnvcontext *)msg->data;
+	params->op =3D EC_VBNV_CONTEXT_OP_READ;
+
+	msg->version =3D EC_VER_VBNV_CONTEXT;
+	msg->command =3D EC_CMD_VBNV_CONTEXT;
+	msg->outsize =3D para_sz;
+	msg->insize =3D resp_sz;
+
+	err =3D cros_ec_cmd_xfer(ecdev, msg);
+	if (err < 0) {
+		dev_err(dev, "Error sending read request: %d\n", err);
+		kfree(msg);
+		return err;
+	}
+
+	memcpy(buf, msg->data, resp_sz);
+
+	kfree(msg);
+	return resp_sz;
+}
+
+static ssize_t vboot_context_write(struct file *filp, struct kobject *=
kobj,
+				   struct bin_attribute *attr, char *buf,
+				   loff_t pos, size_t count)
+{
+	struct device *dev =3D container_of(kobj, struct device, kobj);
+	struct cros_ec_dev *ec =3D container_of(dev, struct cros_ec_dev,
+					      class_dev);
+	struct cros_ec_device *ecdev =3D ec->ec_dev;
+	struct ec_params_vbnvcontext *params;
+	struct cros_ec_command *msg;
+	int err;
+	const size_t para_sz =3D sizeof(*params);
+	const size_t data_sz =3D sizeof(params->block);
+
+	/* Only write full values */
+	if (count !=3D data_sz)
+		return -EINVAL;
+
+	msg =3D kmalloc(sizeof(*msg) + para_sz, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	params =3D (struct ec_params_vbnvcontext *)msg->data;
+	params->op =3D EC_VBNV_CONTEXT_OP_WRITE;
+	memcpy(params->block, buf, data_sz);
+
+	msg->version =3D EC_VER_VBNV_CONTEXT;
+	msg->command =3D EC_CMD_VBNV_CONTEXT;
+	msg->outsize =3D para_sz;
+	msg->insize =3D 0;
+
+	err =3D cros_ec_cmd_xfer(ecdev, msg);
+	if (err < 0) {
+		dev_err(dev, "Error sending write request: %d\n", err);
+		kfree(msg);
+		return err;
+	}
+
+	kfree(msg);
+	return data_sz;
+}
+
+static umode_t cros_ec_vbc_is_visible(struct kobject *kobj,
+				      struct bin_attribute *a, int n)
+{
+	struct device *dev =3D container_of(kobj, struct device, kobj);
+	struct cros_ec_dev *ec =3D container_of(dev, struct cros_ec_dev,
+					      class_dev);
+	struct device_node *np =3D ec->ec_dev->dev->of_node;
+
+	if (IS_ENABLED(CONFIG_OF) && np) {
+		if (of_property_read_bool(np, "google,has-vbc-nvram"))
+			return a->attr.mode;
+	}
+
+	return 0;
+}
+
+static BIN_ATTR_RW(vboot_context, 16);
+
+static struct bin_attribute *cros_ec_vbc_bin_attrs[] =3D {
+	&bin_attr_vboot_context,
+	NULL
+};
+
+struct attribute_group cros_ec_vbc_attr_group =3D {
+	.name =3D "vbc",
+	.bin_attrs =3D cros_ec_vbc_bin_attrs,
+	.is_bin_visible =3D cros_ec_vbc_is_visible,
+};
diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index da72671..494682c 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -255,5 +255,6 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev=
);
 /* sysfs stuff */
 extern struct attribute_group cros_ec_attr_group;
 extern struct attribute_group cros_ec_lightbar_attr_group;
+extern struct attribute_group cros_ec_vbc_attr_group;
=20
 #endif /* __LINUX_MFD_CROS_EC_H */
--=20
2.1.4
