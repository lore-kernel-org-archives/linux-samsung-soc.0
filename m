From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: Enable SND_SIMPLE_CARD for Odroid X2/U3
Date: Wed, 18 Mar 2015 11:52:19 +0100
Message-ID: <1426675939-25125-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62895 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756077AbbCRKwu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Mar 2015 06:52:50 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NLE00CHEM80XG70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Mar 2015 19:52:48 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: liquid.acid@gmx.net, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Odroid X2/U3 sound support can now be specified in device tree using
the simple card binding, make SND_SOC_ODROIDX2 select SND_SIMPLE_CARD
to ensure there are always required drivers in place.

Reported-by: Tobias Jakobi <liquid.acid@gmx.net>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 0632a36..25caadf 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -226,6 +226,7 @@ config SND_SOC_ODROIDX2
 	depends on SND_SOC_SAMSUNG && I2C
 	select SND_SOC_MAX98090
 	select SND_SAMSUNG_I2S
+	select SND_SIMPLE_CARD
 	help
 	  Say Y here to enable audio support for the Odroid-X2/U3.
 
-- 
1.7.9.5
