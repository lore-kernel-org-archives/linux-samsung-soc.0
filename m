From: Mark Brown <broonie@kernel.org>
Subject: Applied "MAINTAINERS: ASoC: samsung: Add Sylwester Nawrocki and Krzysztof Kozlowski" to the asoc tree
Date: Tue, 24 May 2016 17:25:54 +0100
Message-ID: <E1b5F9W-0003ZA-B8@debutante>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34646 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752846AbcEXQ0J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 12:26:09 -0400
In-Reply-To: 
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.orgMark Brown <broonie@kernel.org>

The patch

   MAINTAINERS: ASoC: samsung: Add Sylwester Nawrocki and Krzysztof Kozlowski

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

>From eea5495bab0d365f4dca04869b21e557a9df48d5 Mon Sep 17 00:00:00 2001
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Date: Tue, 24 May 2016 15:35:42 +0200
Subject: [PATCH] MAINTAINERS: ASoC: samsung: Add Sylwester Nawrocki and
 Krzysztof Kozlowski

Extend maintainer entry for Samsung SoC sound drivers with Krzysztof
Kozlowski and Sylwester Nawrocki. The file pattern is duplicated in main
Exynos ARM section so remove it from there.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 03e00c7c88eb..45dd1db87cff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1542,7 +1542,6 @@ F:	drivers/*/*s3c2410*
 F:	drivers/*/*/*s3c2410*
 F:	drivers/soc/samsung/*
 F:	drivers/spi/spi-s3c*
-F:	sound/soc/samsung/*
 F:	Documentation/arm/Samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/sram/samsung-sram.txt
@@ -9601,7 +9600,9 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG AUDIO (ASoC) DRIVERS
+M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
 M:	Sangbeom Kim <sbkim73@samsung.com>
+M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/samsung/
-- 
2.8.1
