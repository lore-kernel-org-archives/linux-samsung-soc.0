From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] GPIO: Samsung: fix broken configuration for Exynos4 GPIO banks
Date: Thu, 22 Sep 2011 12:02:39 +0200
Message-ID: <1316685759-14401-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42554 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484Ab1IVKCv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Sep 2011 06:02:51 -0400
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LRX0073X58QR8@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 11:02:50 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LRX0054258PP3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 11:02:50 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>, Grant Likely <grant.likely@secretlab.ca>

Commit 1b39d5f2cc introduced new common gpio driver for all Samsung GPIO
SoCs. The new driver doesn't work correctly on Samsung Exynos4 SoC. It
fails to set configuration for all but external interrupt pins. This
patch fixes this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpio/gpio-samsung.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 36f3675..be13580 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -446,6 +446,8 @@ static struct samsung_gpio_cfg s3c24xx_gpiocfg_banka = {
 static struct samsung_gpio_cfg exynos4_gpio_cfg = {
 	.set_pull	= exynos4_gpio_setpull,
 	.get_pull	= exynos4_gpio_getpull,
+	.set_config	= samsung_gpio_setcfg_4bit,
+	.get_config	= samsung_gpio_getcfg_4bit,
 };
 
 static struct samsung_gpio_cfg s5p64x0_gpio_cfg_rbank = {
-- 
1.7.1.569.g6f426
