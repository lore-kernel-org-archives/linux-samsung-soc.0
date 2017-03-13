From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: s2mpa01: Fix inconsistent indenting" to the regulator tree
Date: Mon, 13 Mar 2017 16:56:39 +0000
Message-ID: <E1cnTGx-0004gw-PW@debutante>
References: <20170311190124.11512-7-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170311190124.11512-7-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   regulator: s2mpa01: Fix inconsistent indenting

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

>From 5339c34f3906b34ddcd8c9614232ae1302d30c7b Mon Sep 17 00:00:00 2001
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sat, 11 Mar 2017 21:01:24 +0200
Subject: [PATCH] regulator: s2mpa01: Fix inconsistent indenting

Broken indenting makes code more difficult to read and brings
confusion. Fix warning reported by Smatch:
	s2mpa01.c:362 s2mpa01_pmic_probe() warn: inconsistent indenting

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/s2mpa01.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index dc2105c619a6..8ac50bc9d5ff 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -357,11 +357,11 @@ static int s2mpa01_pmic_probe(struct platform_device *pdev)
 	if (iodev->dev->of_node) {
 		reg_np = of_get_child_by_name(iodev->dev->of_node,
 							"regulators");
-			if (!reg_np) {
-				dev_err(&pdev->dev,
-					"could not find regulators sub-node\n");
-				return -EINVAL;
-			}
+		if (!reg_np) {
+			dev_err(&pdev->dev,
+				"could not find regulators sub-node\n");
+			return -EINVAL;
+		}
 
 		of_regulator_match(&pdev->dev, reg_np, rdata,
 						S2MPA01_REGULATOR_MAX);
-- 
2.11.0
