From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Update keypad entries for SMDK4X12
Date: Wed, 23 May 2012 11:29:58 +0530
Message-ID: <1337752798-6987-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59258 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751032Ab2EWGKV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 May 2012 02:10:21 -0400
Received: by pbbrp8 with SMTP id rp8so9413636pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 May 2012 23:10:21 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Keypad entries are updated as per the latest revision of the board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-smdk4x12.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
index fe772d8..31b105f 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -219,8 +219,10 @@ static struct platform_pwm_backlight_data smdk4x12_bl_data = {
 
 static uint32_t smdk4x12_keymap[] __initdata = {
 	/* KEY(row, col, keycode) */
-	KEY(1, 0, KEY_D), KEY(1, 1, KEY_A), KEY(1, 2, KEY_B),
-	KEY(1, 3, KEY_E), KEY(1, 4, KEY_C)
+	KEY(1, 3, KEY_1), KEY(1, 4, KEY_2), KEY(1, 5, KEY_3),
+	KEY(1, 6, KEY_4), KEY(1, 7, KEY_5),
+	KEY(2, 5, KEY_D), KEY(2, 6, KEY_A), KEY(2, 7, KEY_B),
+	KEY(0, 7, KEY_E), KEY(0, 5, KEY_C)
 };
 
 static struct matrix_keymap_data smdk4x12_keymap_data __initdata = {
@@ -230,8 +232,8 @@ static struct matrix_keymap_data smdk4x12_keymap_data __initdata = {
 
 static struct samsung_keypad_platdata smdk4x12_keypad_data __initdata = {
 	.keymap_data	= &smdk4x12_keymap_data,
-	.rows		= 2,
-	.cols		= 5,
+	.rows		= 3,
+	.cols		= 8,
 };
 
 static struct platform_device *smdk4x12_devices[] __initdata = {
-- 
1.7.4.1
