From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v2] i2c: Mark adapter devices with pm_runtime_no_callbacks
Date: Thu, 16 Apr 2015 13:05:19 +0100
Message-ID: <1429185919-26098-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Commit 523c5b89640e ("i2c: Remove support for legacy PM") removed the PM
ops from the bus type, which causes the pm operations on the s3c2410
adapter device to fail (-ENOSUPP in rpm_callback). The adapter device
doesn't get bound to a driver and as such can't have its own pm_runtime
callbacks. Previously this was fine as the bus callbacks would have been
used, but now this can cause devices which use PM runtime and are
attached over I2C to fail to resume.

This commit fixes this issue by marking all adapter devices with
pm_runtime_no_callbacks, since they can't have any.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---

Changes since v1:
 - Simple mark all adapter devices with pm_runtime_no_callbacks in the i2c
   core

Thanks,
Charles

 drivers/i2c/i2c-core.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index 1672e6b..eac3331 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -1410,6 +1410,8 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 
 	dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
 
+	pm_runtime_no_callbacks(&adap->dev);
+
 #ifdef CONFIG_I2C_COMPAT
 	res = class_compat_create_link(i2c_adapter_compat_class, &adap->dev,
 				       adap->dev.parent);
-- 
1.7.2.5
