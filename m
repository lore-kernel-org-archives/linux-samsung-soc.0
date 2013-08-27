From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] pinctrl: s3c24xx: off by one in s3c24xx_eint_init()
Date: Tue, 27 Aug 2013 04:11:26 +0300
Message-ID: <20130826233217.GA17061@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

If "irq == NUM_EINT" then it writes one space beyond the end of the
eint_data->domains[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinctrl-s3c24xx.c b/drivers/pinctrl/pinctrl-s3c24xx.c
index 24446da..ad3eaad 100644
--- a/drivers/pinctrl/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/pinctrl-s3c24xx.c
@@ -549,7 +549,7 @@ static int s3c24xx_eint_init(struct samsung_pinctrl_drv_data *d)
 		irq = bank->eint_offset;
 		mask = bank->eint_mask;
 		for (pin = 0; mask; ++pin, mask >>= 1) {
-			if (irq > NUM_EINT)
+			if (irq >= NUM_EINT)
 				break;
 			if (!(mask & 1))
 				continue;
