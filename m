From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH v2 3/3] pwm: samsung: replace pwm_id with hwpwm memeber of
 pwm_device
Date: Fri, 03 Aug 2012 15:47:21 +0900
Message-ID: <001801cd7143$d4dc0930$7e941b90$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28669 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175Ab2HCGrW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Aug 2012 02:47:22 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thierry Reding' <thierry.reding@avionic-design.de>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

This patch replaces pwm_id with hwpwm memeber of pwm_device.
The pwm_id of struct s3c_chip is unncessary, since hwpwm can
do same thing.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Tested on SMDKV310 board
 drivers/pwm/pwm-samsung.c |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index aa0fe6b..8888841 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -39,7 +39,6 @@ struct s3c_chip {
 	unsigned int		 duty_ns;
 
 	unsigned char		 tcon_base;
-	unsigned char		 pwm_id;
 	struct pwm_chip		 chip;
 };
 
@@ -138,8 +137,8 @@ static int s3c_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	/* The TCMP and TCNT can be read without a lock, they're not
 	 * shared between the timers. */
 
-	tcmp = __raw_readl(S3C2410_TCMPB(s3c->pwm_id));
-	tcnt = __raw_readl(S3C2410_TCNTB(s3c->pwm_id));
+	tcmp = __raw_readl(S3C2410_TCMPB(pwm->hwpwm));
+	tcnt = __raw_readl(S3C2410_TCNTB(pwm->hwpwm));
 
 	period = NS_IN_HZ / period_ns;
 
@@ -182,8 +181,8 @@ static int s3c_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	local_irq_save(flags);
 
-	__raw_writel(tcmp, S3C2410_TCMPB(s3c->pwm_id));
-	__raw_writel(tcnt, S3C2410_TCNTB(s3c->pwm_id));
+	__raw_writel(tcmp, S3C2410_TCMPB(pwm->hwpwm));
+	__raw_writel(tcnt, S3C2410_TCNTB(pwm->hwpwm));
 
 	tcon = __raw_readl(S3C2410_TCON);
 	tcon |= pwm_tcon_manulupdate(s3c);
-- 
1.7.1
