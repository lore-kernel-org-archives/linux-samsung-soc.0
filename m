From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH 2/3] ARM: SAMSUNG: Let s3c_pm_do_restore_*() take const sleep_save
Date: Thu, 21 Nov 2013 02:21:25 +0800
Message-ID: <1384971686-7208-2-git-send-email-djkurtz@chromium.org>
References: <1384971686-7208-1-git-send-email-djkurtz@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1384971686-7208-1-git-send-email-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Andersen <dianders@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

The restore functions do not modify the passed in struct sleep_save,
so that parameter can be const.

This allows us to pass in const struct.  This allows us to use const
structs sleep_save to define system registers that will always be
restored to a constant value.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 arch/arm/plat-samsung/include/plat/pm.h | 4 ++--
 arch/arm/plat-samsung/pm.c              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/pm.h b/arch/arm/plat-samsung/include/plat/pm.h
index 6bc1a8f..ff6063f 100644
--- a/arch/arm/plat-samsung/include/plat/pm.h
+++ b/arch/arm/plat-samsung/include/plat/pm.h
@@ -101,8 +101,8 @@ struct pm_uart_save {
 /* helper functions to save/restore lists of registers. */
 
 extern void s3c_pm_do_save(struct sleep_save *ptr, int count);
-extern void s3c_pm_do_restore(struct sleep_save *ptr, int count);
-extern void s3c_pm_do_restore_core(struct sleep_save *ptr, int count);
+extern void s3c_pm_do_restore(const struct sleep_save *ptr, int count);
+extern void s3c_pm_do_restore_core(const struct sleep_save *ptr, int count);
 
 #ifdef CONFIG_SAMSUNG_PM
 extern int s3c_irq_wake(struct irq_data *data, unsigned int state);
diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index d0c2301..416e5be 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -182,7 +182,7 @@ void s3c_pm_do_save(struct sleep_save *ptr, int count)
  * restore the UARTs state yet
 */
 
-void s3c_pm_do_restore(struct sleep_save *ptr, int count)
+void s3c_pm_do_restore(const struct sleep_save *ptr, int count)
 {
 	for (; count > 0; count--, ptr++) {
 		printk(KERN_DEBUG "restore %p (restore %08lx, was %08x)\n",
@@ -203,7 +203,7 @@ void s3c_pm_do_restore(struct sleep_save *ptr, int count)
  * peripherals, as things may be changing!
 */
 
-void s3c_pm_do_restore_core(struct sleep_save *ptr, int count)
+void s3c_pm_do_restore_core(const struct sleep_save *ptr, int count)
 {
 	for (; count > 0; count--, ptr++)
 		__raw_writel(ptr->val, ptr->reg);
-- 
1.8.4.1
