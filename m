From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH] usb: phy: Cleanup error code in **_usb_get_phy_**() APIs
Date: Wed, 07 Aug 2013 18:38:58 +0530
Message-ID: <1375880938-6979-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, kishon@ti.com, jwerner@chromium.org
List-Id: linux-samsung-soc@vger.kernel.org

**_usb_get_phy_**() APIs should generate equivalent
error codes in case of failure in getting phy. There's no
need of returning NULL pointer, like in devm_usb_get_phy()
or devm_usb_get_phy_dev(), since it's nowhere handled.

Earlier series of patches starting:
9ee1c7f usb: host: ohci-exynos: fix PHY error handling,
fixed PHY error handling.

Also adding error handling in usb_phy_**() APIs.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 drivers/usb/phy/phy.c   |   18 ++++++++++--------
 include/linux/usb/phy.h |   42 ++++++++++++++++++++++--------------------
 2 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index a9984c7..86f9905 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -25,7 +25,7 @@ static DEFINE_SPINLOCK(phy_lock);
 static struct usb_phy *__usb_find_phy(struct list_head *list,
 	enum usb_phy_type type)
 {
-	struct usb_phy  *phy = NULL;
+	struct usb_phy  *phy;
 
 	list_for_each_entry(phy, list, head) {
 		if (phy->type != type)
@@ -40,7 +40,7 @@ static struct usb_phy *__usb_find_phy(struct list_head *list,
 static struct usb_phy *__usb_find_phy_dev(struct device *dev,
 	struct list_head *list, u8 index)
 {
-	struct usb_phy_bind *phy_bind = NULL;
+	struct usb_phy_bind *phy_bind;
 
 	list_for_each_entry(phy_bind, list, list) {
 		if (!(strcmp(phy_bind->dev_name, dev_name(dev))) &&
@@ -94,11 +94,11 @@ static int devm_usb_phy_match(struct device *dev, void *res, void *match_data)
  */
 struct usb_phy *devm_usb_get_phy(struct device *dev, enum usb_phy_type type)
 {
-	struct usb_phy **ptr, *phy;
+	struct usb_phy	*phy = ERR_PTR(-ENOMEM), **ptr;
 
 	ptr = devres_alloc(devm_usb_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return NULL;
+		goto err0;
 
 	phy = usb_get_phy(type);
 	if (!IS_ERR(phy)) {
@@ -107,6 +107,7 @@ struct usb_phy *devm_usb_get_phy(struct device *dev, enum usb_phy_type type)
 	} else
 		devres_free(ptr);
 
+err0:
 	return phy;
 }
 EXPORT_SYMBOL_GPL(devm_usb_get_phy);
@@ -123,7 +124,7 @@ EXPORT_SYMBOL_GPL(devm_usb_get_phy);
  */
 struct usb_phy *usb_get_phy(enum usb_phy_type type)
 {
-	struct usb_phy	*phy = NULL;
+	struct usb_phy	*phy;
 	unsigned long	flags;
 
 	spin_lock_irqsave(&phy_lock, flags);
@@ -221,7 +222,7 @@ EXPORT_SYMBOL_GPL(devm_usb_get_phy_by_phandle);
  */
 struct usb_phy *usb_get_phy_dev(struct device *dev, u8 index)
 {
-	struct usb_phy	*phy = NULL;
+	struct usb_phy	*phy;
 	unsigned long	flags;
 
 	spin_lock_irqsave(&phy_lock, flags);
@@ -254,11 +255,11 @@ EXPORT_SYMBOL_GPL(usb_get_phy_dev);
  */
 struct usb_phy *devm_usb_get_phy_dev(struct device *dev, u8 index)
 {
-	struct usb_phy **ptr, *phy;
+	struct usb_phy	*phy = ERR_PTR(-ENOMEM), **ptr;
 
 	ptr = devres_alloc(devm_usb_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return NULL;
+		goto err0;
 
 	phy = usb_get_phy_dev(dev, index);
 	if (!IS_ERR(phy)) {
@@ -267,6 +268,7 @@ struct usb_phy *devm_usb_get_phy_dev(struct device *dev, u8 index)
 	} else
 		devres_free(ptr);
 
+err0:
 	return phy;
 }
 EXPORT_SYMBOL_GPL(devm_usb_get_phy_dev);
diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
index 4403680..9aa6aae 100644
--- a/include/linux/usb/phy.h
+++ b/include/linux/usb/phy.h
@@ -142,7 +142,7 @@ extern void usb_remove_phy(struct usb_phy *);
 /* helpers for direct access thru low-level io interface */
 static inline int usb_phy_io_read(struct usb_phy *x, u32 reg)
 {
-	if (x->io_ops && x->io_ops->read)
+	if (!IS_ERR(x) && x->io_ops && x->io_ops->read)
 		return x->io_ops->read(x, reg);
 
 	return -EINVAL;
@@ -150,7 +150,7 @@ static inline int usb_phy_io_read(struct usb_phy *x, u32 reg)
 
 static inline int usb_phy_io_write(struct usb_phy *x, u32 val, u32 reg)
 {
-	if (x->io_ops && x->io_ops->write)
+	if (!IS_ERR(x) && x->io_ops && x->io_ops->write)
 		return x->io_ops->write(x, val, reg);
 
 	return -EINVAL;
@@ -159,7 +159,7 @@ static inline int usb_phy_io_write(struct usb_phy *x, u32 val, u32 reg)
 static inline int
 usb_phy_init(struct usb_phy *x)
 {
-	if (x->init)
+	if (!IS_ERR(x) && x->init)
 		return x->init(x);
 
 	return 0;
@@ -168,26 +168,27 @@ usb_phy_init(struct usb_phy *x)
 static inline void
 usb_phy_shutdown(struct usb_phy *x)
 {
-	if (x->shutdown)
+	if (!IS_ERR(x) && x->shutdown)
 		x->shutdown(x);
 }
 
 static inline int
 usb_phy_vbus_on(struct usb_phy *x)
 {
-	if (!x->set_vbus)
-		return 0;
+	if (!IS_ERR(x) && x->set_vbus)
+		return x->set_vbus(x, true);
 
-	return x->set_vbus(x, true);
+	return 0;
 }
 
 static inline int
 usb_phy_vbus_off(struct usb_phy *x)
 {
-	if (!x->set_vbus)
-		return 0;
+	if (!IS_ERR(x) && x->set_vbus)
+		return x->set_vbus(x, false);
+
+	return 0;
 
-	return x->set_vbus(x, false);
 }
 
 /* for usb host and peripheral controller drivers */
@@ -249,8 +250,9 @@ static inline int usb_bind_phy(const char *dev_name, u8 index,
 static inline int
 usb_phy_set_power(struct usb_phy *x, unsigned mA)
 {
-	if (x && x->set_power)
+	if (!IS_ERR(x) && x->set_power)
 		return x->set_power(x, mA);
+
 	return 0;
 }
 
@@ -258,28 +260,28 @@ usb_phy_set_power(struct usb_phy *x, unsigned mA)
 static inline int
 usb_phy_set_suspend(struct usb_phy *x, int suspend)
 {
-	if (x->set_suspend != NULL)
+	if (!IS_ERR(x) && x->set_suspend != NULL)
 		return x->set_suspend(x, suspend);
-	else
-		return 0;
+
+	return 0;
 }
 
 static inline int
 usb_phy_notify_connect(struct usb_phy *x, enum usb_device_speed speed)
 {
-	if (x->notify_connect)
+	if (!IS_ERR(x) && x->notify_connect)
 		return x->notify_connect(x, speed);
-	else
-		return 0;
+
+	return 0;
 }
 
 static inline int
 usb_phy_notify_disconnect(struct usb_phy *x, enum usb_device_speed speed)
 {
-	if (x->notify_disconnect)
+	if (!IS_ERR(x) && x->notify_disconnect)
 		return x->notify_disconnect(x, speed);
-	else
-		return 0;
+
+	return 0;
 }
 
 /* notifiers */
-- 
1.7.6.5
