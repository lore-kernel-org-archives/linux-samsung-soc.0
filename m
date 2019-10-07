From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: s2mps11: switch to using devm_fwnode_gpiod_get" to the regulator tree
Date: Mon,  7 Oct 2019 14:03:16 +0100 (BST)
Message-ID: <20191007130316.7A7D9274162F@ypsilon.sirena.org.uk>
References: <20191004231017.130290-5-dmitry.torokhov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004231017.130290-5-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   regulator: s2mps11: switch to using devm_fwnode_gpiod_get

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.5

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

>From de2792b507675641885075bc99e283de861b1ce6 Mon Sep 17 00:00:00 2001
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 4 Oct 2019 16:10:14 -0700
Subject: [PATCH] regulator: s2mps11: switch to using devm_fwnode_gpiod_get

devm_gpiod_get_from_of_node() is being retired in favor of
devm_fwnode_gpiod_get_index(), that behaves similar to
devm_gpiod_get_index(), but can work with arbitrary firmware node. It
will also be able to support secondary software nodes.

Let's switch this driver over.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/r/20191004231017.130290-5-dmitry.torokhov@gmail.com
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/s2mps11.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 5bc00884cf51..4f2dc5ebffdc 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -844,10 +844,9 @@ static void s2mps14_pmic_dt_parse_ext_control_gpio(struct platform_device *pdev,
 		if (!rdata[reg].init_data || !rdata[reg].of_node)
 			continue;
 
-		gpio[reg] = devm_gpiod_get_from_of_node(&pdev->dev,
-				rdata[reg].of_node,
-				"samsung,ext-control-gpios",
-				0,
+		gpio[reg] = devm_fwnode_gpiod_get(&pdev->dev,
+				of_fwnode_handle(rdata[reg].of_node),
+				"samsung,ext-control",
 				GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 				"s2mps11-regulator");
 		if (PTR_ERR(gpio[reg]) == -ENOENT)
-- 
2.20.1
