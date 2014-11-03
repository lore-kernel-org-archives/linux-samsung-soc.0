From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v4 09/14] regulator: s2mpa01: zero-initialize regulator match table array
Date: Mon,  3 Nov 2014 15:40:44 +0100
Message-ID: <1415025649-8119-10-git-send-email-javier.martinez@collabora.co.uk>
References: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The struct of_regulator_match rmatch[] is declared as a non-static local
variable so the structure members are not auto-initialized.

Initialize the array at declaration time to avoid the structure members
values to be indeterminate and have sane defaults instead.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/regulator/s2mpa01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index 2263071..5db4e12 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -341,7 +341,7 @@ static int s2mpa01_pmic_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct sec_platform_data *pdata = dev_get_platdata(iodev->dev);
-	struct of_regulator_match rdata[S2MPA01_REGULATOR_MAX];
+	struct of_regulator_match rdata[S2MPA01_REGULATOR_MAX] = { };
 	struct device_node *reg_np = NULL;
 	struct regulator_config config = { };
 	struct s2mpa01_info *s2mpa01;
-- 
2.1.0
