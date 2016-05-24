From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] MAINTAINERS: ASoC: samsung: Add Sylwester Nawrocki and
 Krzysztof Kozlowski
Date: Tue, 24 May 2016 15:35:42 +0200
Message-ID: <1464096942-14215-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:21202 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751634AbcEXNfx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 09:35:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

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
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 243c0811a4d8..f0f4ca58d264 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1603,7 +1603,6 @@ F:	drivers/*/*/*s3c2410*
 F:	drivers/memory/samsung/*
 F:	drivers/soc/samsung/*
 F:	drivers/spi/spi-s3c*
-F:	sound/soc/samsung/*
 F:	Documentation/arm/Samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/sram/samsung-sram.txt
@@ -9857,7 +9856,9 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG AUDIO (ASoC) DRIVERS
+M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
 M:	Sangbeom Kim <sbkim73@samsung.com>
+M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/samsung/
-- 
1.9.1
