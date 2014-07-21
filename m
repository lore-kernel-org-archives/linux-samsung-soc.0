From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] exynos: Support big endian mode in secondary_startup
Date: Mon, 21 Jul 2014 17:01:47 +0100
Message-ID: <1405958507-8606-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48050 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932876AbaGUQCT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 12:02:19 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Victor Kamensky <victor.kamensky@linaro.org>, Mark Brown <broonie@linaro.org>

From: Victor Kamensky <victor.kamensky@linaro.org>

Exynos processors generally operate in little endian mode so their
bootloader and ROM will almost always operate in little endian mode.
This means that if a big endian kernel is run it must switch the CPU
into big endian mode after gaining control.

The generic secondary_startup that is called from exynos specific
secondary startup code will do the switch, but we need it to do earlier
because exynos specific secondary_startup code which runs first also
works with data that is big endian when the kernel is compiled for big
endian.

[Rewrote commit message. -- broonie]

Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/mach-exynos/headsmp.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-exynos/headsmp.S b/arch/arm/mach-exynos/headsmp.S
index b54f9701e421..ac8364efb985 100644
--- a/arch/arm/mach-exynos/headsmp.S
+++ b/arch/arm/mach-exynos/headsmp.S
@@ -18,6 +18,11 @@
  * ready for them to initialise.
  */
 ENTRY(exynos4_secondary_startup)
+	/*
+	 * ROM code operates in little endian mode, when we get control we
+	 * need to switch it to big endian mode.
+	 */
+ARM_BE8(setend	be)
 	mrc	p15, 0, r0, c0, c0, 5
 	and	r0, r0, #15
 	adr	r4, 1f
-- 
2.0.1
