From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/4] ARM: dts: add support for mixer to exynos4
Date: Fri, 25 Jan 2013 05:39:42 -0500
Message-ID: <1359110384-28402-3-git-send-email-rahul.sharma@samsung.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55295 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755875Ab3AYKSR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 05:18:17 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH600LMXFA6W6G0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jan 2013 19:18:15 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MH600LMIFA67490@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jan 2013 19:18:15 +0900 (KST)
In-reply-to: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>

Conflicts:
	arch/arm/boot/dts/exynos4.dtsi
---
 arch/arm/boot/dts/exynos4.dtsi         | 8 ++++++++
 arch/arm/mach-exynos/mach-exynos4-dt.c | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 6c2c79d..07cb7d4 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -296,4 +296,12 @@
 		interrupts = <0 95 0>;
 		hpd-gpio = <&gpx3 7 0xf 1 3>;
 	};
+
+	mixer: mixer {
+		compatible = "samsung,exynos4-mixer";
+		reg = 	<0x12c10000 0x10000>,
+			<0x12c00000 0x10000>;
+		interrupts = <0 91 0>;
+		samsung,power-domain = <&pd_tv>;
+	};
 };
diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index 24f72a5..f3b85b64 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -82,6 +82,8 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 				"exynos-tmu", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4-hdmi14", EXYNOS4_PA_HDMI,
 				"exynos4-hdmi", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4-mixer", EXYNOS4_PA_MIXER,
+				"s5p-mixer", NULL),
 	{},
 };
 
-- 
1.8.0
