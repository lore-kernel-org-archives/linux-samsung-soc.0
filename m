From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v7 05/24] mfd: max77686: Return correct error when pdata isn't found
Date: Fri,  4 Jul 2014 22:24:08 +0200
Message-ID: <1404505467-26526-6-git-send-email-javier.martinez@collabora.co.uk>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Tushar Behera <trblinux@gmail.com>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

When platform data is not found an -EIO (I/O error) code is returned.
This doesn't seem to be the correct error so better return -EINVAL
(Invalid argument) which is what most drivers do in this case.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/mfd/max77686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index 12d4c17..ada4976 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -129,7 +129,7 @@ static int max77686_i2c_probe(struct i2c_client *i2c,
 
 	if (!pdata) {
 		dev_err(&i2c->dev, "No platform data found.\n");
-		return -EIO;
+		return -EINVAL;
 	}
 
 	max77686 = devm_kzalloc(&i2c->dev,
-- 
2.0.0.rc2
