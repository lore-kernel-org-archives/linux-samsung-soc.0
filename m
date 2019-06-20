From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: s2mps11: Fix ERR_PTR dereference on GPIO lookup failure" to the regulator tree
Date: Thu, 20 Jun 2019 14:32:31 +0100 (BST)
Message-ID: <20190620133231.9ADFB44004A@finisterre.sirena.org.uk>
References: <1560948159-21926-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560948159-21926-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Georg Waibel <georg.waibel@sensor-technik.de>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, stable@vger.kernel.orgstable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   regulator: s2mps11: Fix ERR_PTR dereference on GPIO lookup failure

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 70ca117b02f3b1c8830fe95e4e3dea2937038e11 Mon Sep 17 00:00:00 2001
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 19 Jun 2019 14:42:39 +0200
Subject: [PATCH] regulator: s2mps11: Fix ERR_PTR dereference on GPIO lookup
 failure

If devm_gpiod_get_from_of_node() call returns ERR_PTR, it is assigned
into an array of GPIO descriptors and used later because such error is
not treated as critical thus it is not propagated back to the probe
function.

All code later expects that such GPIO descriptor is either a NULL or
proper value.  This later might lead to dereference of ERR_PTR.

Only devices with S2MPS14 flavor are affected (other do not control
regulators with GPIOs).

Fixes: 1c984942f0a4 ("regulator: s2mps11: Pass descriptor instead of GPIO number")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/s2mps11.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 134c62db36c5..af9bf10b4c33 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -824,6 +824,7 @@ static void s2mps14_pmic_dt_parse_ext_control_gpio(struct platform_device *pdev,
 		if (IS_ERR(gpio[reg])) {
 			dev_err(&pdev->dev, "Failed to get control GPIO for %d/%s\n",
 				reg, rdata[reg].name);
+			gpio[reg] = NULL;
 			continue;
 		}
 		if (gpio[reg])
-- 
2.20.1
