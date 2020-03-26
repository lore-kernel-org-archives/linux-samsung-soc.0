Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313D1C43331
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 14:45:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEE2720775
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 14:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZeVxu4x5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbgCZOpL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 10:45:11 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37549 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727547AbgCZOpL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 10:45:11 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200326144508euoutp01e42b2748c0f09683d70c80630e742534~-4dcr6eFL0084800848euoutp01j
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 14:45:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200326144508euoutp01e42b2748c0f09683d70c80630e742534~-4dcr6eFL0084800848euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585233908;
        bh=Tad7cU+sq7NzbmZ4QTHJXI2Cm72r+zNVTBnzC93qJw0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ZeVxu4x5aw4R356mZL2cQ6WFwDwqLAeKzrWNiZiA1VY0ZlnZWhBdFvsTkM4Lk0HN/
         Cq4yZ8sLIf3DtW4d3yvuf6hh/nWE91NNFVXgk9GJ7vl80TnYx6Z+8XPg7K8EDnz77G
         jg6FYxRbmiBrU54CZfzCnea3n0mM1n+MrCpB3fy8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200326144507eucas1p2510c83f43c240c79a23d40eefaba1d5f~-4dchwZwC3271232712eucas1p2Q;
        Thu, 26 Mar 2020 14:45:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 68.7D.60698.3FFBC7E5; Thu, 26
        Mar 2020 14:45:07 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200326144507eucas1p20db20c7a53d01d0218e7dc71121cba94~-4dcCZ-hT3187831878eucas1p2E;
        Thu, 26 Mar 2020 14:45:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200326144507eusmtrp271b2c86ed5badd51c9e69f8d9efabecd~-4db-ANPw0141701417eusmtrp2e;
        Thu, 26 Mar 2020 14:45:07 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-3c-5e7cbff3b288
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 6D.30.08375.3FFBC7E5; Thu, 26
        Mar 2020 14:45:07 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200326144507eusmtip132cd0d66517d2bf5d1920492d7688de9~-4dbo1cT92768527685eusmtip1U;
        Thu, 26 Mar 2020 14:45:06 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Correct regulator names
Date:   Thu, 26 Mar 2020 15:44:55 +0100
Message-Id: <20200326144455.25893-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsWy7djP87qf99fEGWzut7DYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBkPFk9n
        KjjrUjHz5numBsbPpl2MnBwSAiYSbzetZAaxhQRWMErMXuzfxcgFZH9hlLg35wgzhPOZUWLj
        niMsMB3bjx9khehYzihx86Y1hA3U8e10GojNJmAo0fW2iw3EFhFQlfjctoAdZBCzwDZGiS29
        D4CmcnAIC1hJ9P73AalhAaqZ+mk/2ExeAVuJzqvroHbJS6zecADsCAmBPWwS168vZ4RIuEg8
        eX8ayhaWeHV8CzuELSPxf+d8JoiGZkaJh+fWskM4PYwSl5tmQHVYS9w594sN5ApmAU2J9bv0
        IcKOEhvOLWAFCUsI8EnceCsIEmYGMidtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFD2B4SH+7P
        ZoeESazEhXfbmCcwys1C2LWAkXEVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZGYISf/nf8
        6w7GfX+SDjEKcDAq8fA2tNXECbEmlhVX5h5ilOBgVhLhfRoJFOJNSaysSi3Kjy8qzUktPsQo
        zcGiJM5rvOhlrJBAemJJanZqakFqEUyWiYNTqoFxSVrul8jLkfPububIX3Slo8J5D1uISkAE
        G8fXspbChIlqpnbvzky+cLWSo7Sle6uEs+/emo6ilBM+jWVXMtKsf8jY6Ef9C/nt9ecyc5K0
        xYpXXfK+7lP2i0s9M4vPrjoV6iDXkbgoKdPrhOGxOJGArMDv74qTH6qbuxpwJ1c9fyzYkTZr
        vhJLcUaioRZzUXEiAEWnsVzsAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsVy+t/xu7qf99fEGSy4JmKxccZ6VovrX56z
        Wpw/v4HdYsb5fUwWa4/cZXdg9di0qpPNo2/LKkaPz5vkApij9GyK8ktLUhUy8otLbJWiDS2M
        9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DIeLJ7OVHDWpWLmzfdMDYyfTbsYOTkk
        BEwkth8/yNrFyMUhJLCUUWLO/HZmiISMxMlpDawQtrDEn2tdbBBFnxglNh2+zw6SYBMwlOh6
        C5Lg5BARUJX43LaAHaSIWWAHo8SWHW+Bujk4hAWsJHr/+4DUsADVTP20H2wor4CtROfVdSwQ
        C+QlVm84wDyBkWcBI8MqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwODaduzn5h2MlzYGH2IU
        4GBU4uHVaKmJE2JNLCuuzD3EKMHBrCTC+zQSKMSbklhZlVqUH19UmpNafIjRFGj5RGYp0eR8
        YODnlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgVHmzhZFDP+Bz
        ak5jc+FhBrPCd7UKZx6tCV+qpOXUMrn02sXFYrtyA/bkTedQb87kV5R5ZTJJdxp716SPnWeE
        zswNunr6Xd/vy/9kf5/ZuHXS5EgTZs6TU45PeJIyuVd6/RqVd7diPs6teHNb/jkbw+PNFr2r
        bv3fXCmt5/vh8tueeRkbRfhYbyixFGckGmoxFxUnAgDRJNfyRAIAAA==
X-CMS-MailID: 20200326144507eucas1p20db20c7a53d01d0218e7dc71121cba94
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326144507eucas1p20db20c7a53d01d0218e7dc71121cba94
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326144507eucas1p20db20c7a53d01d0218e7dc71121cba94
References: <CGME20200326144507eucas1p20db20c7a53d01d0218e7dc71121cba94@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Both CPU-freq and dev-freq drivers support proper regulator lookup from
device-tree, so the early introduced hacks for registering main ARM VDD
regulator under 'vdd_arm' name are no longer needed. Similar for devfreq.
Fix this by removing the obsolete comments and changing the regulator
names to the one, which match the schematics and style for the given
board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-origen.dts         |  7 +------
 arch/arm/boot/dts/exynos4210-trats.dts          |  7 +------
 arch/arm/boot/dts/exynos4210-universal_c210.dts |  2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi         |  8 ++++----
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  8 ++++----
 arch/arm/boot/dts/exynos4412-origen.dts         | 14 +++++++-------
 arch/arm/boot/dts/exynos5250-arndale.dts        |  8 ++++----
 arch/arm/boot/dts/exynos5420-arndale-octa.dts   |  2 +-
 8 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 0d1e1a9c2f6e..890525b10d22 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -251,12 +251,7 @@
 			};
 
 			buck1_reg: BUCK1 {
-				/*
-				* HACK: The real name is VDD_ARM_1.2V,
-				* but exynos-cpufreq does not support
-				* DT-based regulator lookup yet.
-				*/
-				regulator-name = "vdd_arm";
+				regulator-name = "VDD_ARM_1.2V";
 				regulator-min-microvolt = <950000>;
 				regulator-max-microvolt	= <1350000>;
 				regulator-always-on;
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index df901f113df5..c15c6d7cd352 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -408,12 +408,7 @@
 			};
 
 			varm_breg: BUCK1 {
-			     /*
-			      * HACK: The real name is VARM_1.2V_C210,
-			      * but exynos-cpufreq does not support
-			      * DT-based regulator lookup yet.
-			      */
-			     regulator-name = "vdd_arm";
+			     regulator-name = "VARM_1.2V_C210";
 			     regulator-min-microvolt = <900000>;
 			     regulator-max-microvolt = <1350000>;
 			     regulator-always-on;
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index c78423a2d10f..c9673d6aa328 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -322,7 +322,7 @@
 		max8952,sync-freq = <0>;
 		max8952,ramp-speed = <0>;
 
-		regulator-name = "vdd_arm";
+		regulator-name = "VARM_1.2V_C210";
 		regulator-min-microvolt = <770000>;
 		regulator-max-microvolt = <1400000>;
 		regulator-always-on;
diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 3023bc3b68ce..aa20396ae543 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -820,7 +820,7 @@
 			};
 
 			buck1_reg: BUCK1 {
-				regulator-name = "vdd_mif";
+				regulator-name = "VDD_MIF";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
@@ -831,7 +831,7 @@
 			};
 
 			buck2_reg: BUCK2 {
-				regulator-name = "vdd_arm";
+				regulator-name = "VDD_ARM";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
@@ -842,7 +842,7 @@
 			};
 
 			buck3_reg: BUCK3 {
-				regulator-name = "vdd_int";
+				regulator-name = "VDD_INT";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1150000>;
 				regulator-always-on;
@@ -853,7 +853,7 @@
 			};
 
 			buck4_reg: BUCK4 {
-				regulator-name = "vdd_g3d";
+				regulator-name = "VDD_G3D";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1150000>;
 				regulator-boot-on;
diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 73d6a71da88d..a5c1ce1e396c 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -430,7 +430,7 @@
 			};
 
 			buck1_reg: BUCK1 {
-				regulator-name = "vdd_mif";
+				regulator-name = "VDD_MIF";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
@@ -438,7 +438,7 @@
 			};
 
 			buck2_reg: BUCK2 {
-				regulator-name = "vdd_arm";
+				regulator-name = "VDD_ARM";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
@@ -446,7 +446,7 @@
 			};
 
 			buck3_reg: BUCK3 {
-				regulator-name = "vdd_int";
+				regulator-name = "VDD_INT";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-always-on;
@@ -454,7 +454,7 @@
 			};
 
 			buck4_reg: BUCK4 {
-				regulator-name = "vdd_g3d";
+				regulator-name = "VDD_G3D";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-microvolt-offset = <50000>;
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index ecd14b283a6b..dc865be40751 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -363,7 +363,7 @@
 			};
 
 			buck1_reg: BUCK1 {
-				regulator-name = "vdd_mif";
+				regulator-name = "VDD_MIF";
 				regulator-min-microvolt = <950000>;
 				regulator-max-microvolt	= <1100000>;
 				regulator-always-on;
@@ -372,7 +372,7 @@
 			};
 
 			buck2_reg: BUCK2 {
-				regulator-name = "vdd_arm";
+				regulator-name = "VDD_ARM";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt	= <1350000>;
 				regulator-always-on;
@@ -381,7 +381,7 @@
 			};
 
 			buck3_reg: BUCK3 {
-				regulator-name = "vdd_int";
+				regulator-name = "VDD_INT";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt	= <1200000>;
 				regulator-always-on;
@@ -390,7 +390,7 @@
 			};
 
 			buck4_reg: BUCK4 {
-				regulator-name = "vdd_g3d";
+				regulator-name = "VDD_G3D";
 				regulator-min-microvolt = <750000>;
 				regulator-max-microvolt	= <1500000>;
 				regulator-always-on;
@@ -399,7 +399,7 @@
 			};
 
 			buck5_reg: BUCK5 {
-				regulator-name = "vdd_m12";
+				regulator-name = "VDD_M12";
 				regulator-min-microvolt = <750000>;
 				regulator-max-microvolt	= <1500000>;
 				regulator-always-on;
@@ -408,7 +408,7 @@
 			};
 
 			buck6_reg: BUCK6 {
-				regulator-name = "vdd12_5m";
+				regulator-name = "VDD12_5M";
 				regulator-min-microvolt = <750000>;
 				regulator-max-microvolt	= <1500000>;
 				regulator-always-on;
@@ -417,7 +417,7 @@
 			};
 
 			buck9_reg: BUCK9 {
-				regulator-name = "vddf28_emmc";
+				regulator-name = "VDDF28_EMMC";
 				regulator-min-microvolt = <750000>;
 				regulator-max-microvolt	= <3000000>;
 				regulator-always-on;
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 6904091d4837..dbf3d8167fe6 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -454,7 +454,7 @@
 			};
 
 			buck1_reg: BUCK1 {
-				regulator-name = "vdd_mif";
+				regulator-name = "VDD_MIF";
 				regulator-min-microvolt = <950000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
@@ -463,7 +463,7 @@
 			};
 
 			buck2_reg: BUCK2 {
-				regulator-name = "vdd_arm";
+				regulator-name = "VDD_ARM";
 				regulator-min-microvolt = <912500>;
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
@@ -472,7 +472,7 @@
 			};
 
 			buck3_reg: BUCK3 {
-				regulator-name = "vdd_int";
+				regulator-name = "VDD_INT";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
@@ -481,7 +481,7 @@
 			};
 
 			buck4_reg: BUCK4 {
-				regulator-name = "vdd_g3d";
+				regulator-name = "VDD_G3D";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index e9a09dd0a49b..dd7f8385d81e 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -673,7 +673,7 @@
 			};
 
 			buck2_reg: BUCK2 {
-				regulator-name = "vdd_arm";
+				regulator-name = "PVDD_ARM_1V0";
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
-- 
2.17.1

