From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] regulator: max77686: Configure enable time to properly
 handle regulator enable
Date: Fri, 29 Apr 2016 12:59:51 +0200
Message-ID: <1461927591-7864-4-git-send-email-k.kozlowski@samsung.com>
References: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1461927591-7864-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The enable time for buck regulators was not configured but actually is
essential: consumers, like usb3503, doing hard reset (regulator off/on)
should wait for the regulator to settle.

Configure the enable time according to datasheet.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/regulator/max77686-regulator.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/regulator/max77686-regulator.c b/drivers/regulator/max77686-regulator.c
index d1ab6a4da88f..ac4fa581e0a5 100644
--- a/drivers/regulator/max77686-regulator.c
+++ b/drivers/regulator/max77686-regulator.c
@@ -41,6 +41,8 @@
 #define MAX77686_LDO_LOW_UVSTEP	25000
 #define MAX77686_BUCK_MINUV	750000
 #define MAX77686_BUCK_UVSTEP	50000
+#define MAX77686_BUCK_ENABLE_TIME	40		/* us */
+#define MAX77686_DVS_ENABLE_TIME	22		/* us */
 #define MAX77686_RAMP_DELAY	100000			/* uV/us */
 #define MAX77686_DVS_RAMP_DELAY	27500			/* uV/us */
 #define MAX77686_DVS_MINUV	600000
@@ -422,6 +424,7 @@ static struct regulator_ops max77686_buck_dvs_ops = {
 	.min_uV		= MAX77686_BUCK_MINUV,				\
 	.uV_step	= MAX77686_BUCK_UVSTEP,				\
 	.ramp_delay	= MAX77686_RAMP_DELAY,				\
+	.enable_time	= MAX77686_BUCK_ENABLE_TIME,			\
 	.n_voltages	= MAX77686_VSEL_MASK + 1,			\
 	.vsel_reg	= MAX77686_REG_BUCK5OUT + (num - 5) * 2,	\
 	.vsel_mask	= MAX77686_VSEL_MASK,				\
@@ -439,6 +442,7 @@ static struct regulator_ops max77686_buck_dvs_ops = {
 	.min_uV		= MAX77686_BUCK_MINUV,				\
 	.uV_step	= MAX77686_BUCK_UVSTEP,				\
 	.ramp_delay	= MAX77686_RAMP_DELAY,				\
+	.enable_time	= MAX77686_BUCK_ENABLE_TIME,			\
 	.n_voltages	= MAX77686_VSEL_MASK + 1,			\
 	.vsel_reg	= MAX77686_REG_BUCK1OUT,			\
 	.vsel_mask	= MAX77686_VSEL_MASK,				\
@@ -456,6 +460,7 @@ static struct regulator_ops max77686_buck_dvs_ops = {
 	.min_uV		= MAX77686_DVS_MINUV,				\
 	.uV_step	= MAX77686_DVS_UVSTEP,				\
 	.ramp_delay	= MAX77686_DVS_RAMP_DELAY,			\
+	.enable_time	= MAX77686_DVS_ENABLE_TIME,			\
 	.n_voltages	= MAX77686_DVS_VSEL_MASK + 1,			\
 	.vsel_reg	= MAX77686_REG_BUCK2DVS1 + (num - 2) * 10,	\
 	.vsel_mask	= MAX77686_DVS_VSEL_MASK,			\
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
