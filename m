From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH] pwm: Add clk enable/disable for pwm_samsung_enable/pwm_samsung_disable
Date: Wed, 15 Apr 2015 03:35:08 +0930
Message-ID: <1429034708-4537-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-pwm-owner@vger.kernel.org>
Sender: linux-pwm-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

It's safe to disable the clk when we following.
	pwm_config(pwm, 0, period);
 	pwm_disable(pwm);
And enable clk when we do following.
	pwm_config(pwm, duty, period);
 	pwm_enable(pwm);

Tested on OdroidXU3 Board.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pwm/pwm-samsung.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index 3e9b583..b579753 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -247,6 +247,7 @@ static int pwm_samsung_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	tcon &= ~TCON_MANUALUPDATE(tcon_chan);
 	tcon |= TCON_START(tcon_chan) | TCON_AUTORELOAD(tcon_chan);
 	writel(tcon, our_chip->base + REG_TCON);
+	clk_prepare_enable(our_chip->base_clk);
 
 	spin_unlock_irqrestore(&samsung_pwm_lock, flags);
 
@@ -265,6 +266,7 @@ static void pwm_samsung_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	tcon = readl(our_chip->base + REG_TCON);
 	tcon &= ~TCON_AUTORELOAD(tcon_chan);
 	writel(tcon, our_chip->base + REG_TCON);
+	clk_disable_unprepare(our_chip->base_clk);
 
 	spin_unlock_irqrestore(&samsung_pwm_lock, flags);
 }
-- 
1.9.1

