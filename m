From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCHi v2] ARM: dts: Fix bootup issue on smdk5250
Date: Tue, 18 Aug 2015 11:59:20 +0530
Message-ID: <1439879360-21150-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33447 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751133AbbHRG32 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Aug 2015 02:29:28 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: k.kozlowski@samsung.com, kgene@kernel.org, robh+dt@kernel.org, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

From: Yadwinder Singh Brar <yadi.brar01@gmail.com>

With default config on smdk5250 latest tree throws below message :

[    2.226049] thermal thermal_zone0: critical temperature reached(224 C),shutting down
[    2.227840] reboot: Failed to start orderly shutdown: forcing the issue

and hangs randomly because it reads wrong temperature value.

I can't figure out any direct relation between LDO10 and TMU from board
schematics which I have. So making LDO10 always-on to fix issue for now.

Signed-off-by: Yadwinder Singh Brar <yadi.brar01@gmail.com>
[pankaj.dubey: resubmitted after rebasing to latest kgene tree]
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Tested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
Resending this patch after rebasing. Previous discussion can be found here [1]


[1]: http://www.spinics.net/lists/linux-samsung-soc/msg39100.html

Changes since v1:
 - Rebased on latest kgene tree, test booting and s2r on SMDK5250 board.
 - Removed Yadwinder Singh's Samsung's email id as it's no more valid.
 - Added my Signed-off-by for touching this file and patch.

 arch/arm/boot/dts/exynos5250-smdk5250.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 15aea76..c625e71 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -197,6 +197,7 @@
 				regulator-name = "P1.8V_LDO_OUT10";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
 			};
 
 			ldo11_reg: LDO11 {
-- 
2.4.5
