From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: s2c24xx-i2s: remove redundant error message" to the asoc tree
Date: Wed, 02 Nov 2016 10:49:20 -0600
Message-ID: <E1c1yj2-0006Eq-P9@finisterre>
References: <1478085107-30865-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38676 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753107AbcKBQtk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 12:49:40 -0400
In-Reply-To: <1478085107-30865-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, krzk@kernel.org, m.szyprowski@samsung.comalsa-devel@alsa-project.org

The patch

   ASoC: samsung: s2c24xx-i2s: remove redundant error message

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

>From 5d3c1f633ea2984602bbbfe84e3e858050cb36f3 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 2 Nov 2016 12:11:47 +0100
Subject: [PATCH] ASoC: samsung: s2c24xx-i2s: remove redundant error message

There is no need to report the resource request error in
the driver as it is already handled within devm_ioremap_resource().
While at it also drop a redundant variable initialization.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/s3c24xx-i2s.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 3b4bef9025a7..c93169823c7c 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -426,13 +426,9 @@ static const struct snd_soc_component_driver s3c24xx_i2s_component = {
 static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 {
 	struct resource *res;
-	int ret = 0;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Can't get IO resource.\n");
-		return -ENOENT;
-	}
 	s3c24xx_i2s.regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(s3c24xx_i2s.regs))
 		return PTR_ERR(s3c24xx_i2s.regs);
-- 
2.10.1
