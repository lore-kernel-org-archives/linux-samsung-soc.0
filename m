Return-Path: <SRS0=/wZl=AV=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235D5C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Jul 2020 17:35:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 062E32078B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Jul 2020 17:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tMqTCU7O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgGJRfV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Jul 2020 13:35:21 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36136 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgGJRfV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 13:35:21 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200710173520euoutp01eed5c71cbc0f9aab2f44d15eae1e8521~gdKUBE0Hy1632316323euoutp01C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2020 17:35:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200710173520euoutp01eed5c71cbc0f9aab2f44d15eae1e8521~gdKUBE0Hy1632316323euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594402520;
        bh=V0DP11+a7ZZ2suSsfZcV3gV1k2ID9odXgqPlooDBJjI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tMqTCU7OnANbhgR9N/BYtIvrG4xth07vLMYyieufmsM1ahjyG5z1KCjTBytOO+BH7
         7xW0bAq5TFfDihq9aPSpXA2tIdqhKTTsYXvD8H7l+jXNIQov+RDXjSpGNyMv4O32SK
         foI6CS7NEx6TxKUJ7YajJayVELSKIl70XkXYdt9A=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200710173519eucas1p19fa5cf2c4976ab3a52b23e3065e21ae7~gdKTbYHoa3026630266eucas1p15;
        Fri, 10 Jul 2020 17:35:19 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id A9.5B.06456.7D6A80F5; Fri, 10
        Jul 2020 18:35:19 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200710173518eucas1p1eeaaadd2359da3c863c43cd368a84213~gdKSQz-5S2982929829eucas1p1x;
        Fri, 10 Jul 2020 17:35:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200710173518eusmtrp1225ed0bb8d11e234318c8507cbec6700~gdKSQLuu60562605626eusmtrp1g;
        Fri, 10 Jul 2020 17:35:18 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-bd-5f08a6d7f1cf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id BA.3F.06314.6D6A80F5; Fri, 10
        Jul 2020 18:35:18 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200710173517eusmtip119c54ce648d517a151d289f92a48e137~gdKRyxr8W2582925829eusmtip1W;
        Fri, 10 Jul 2020 17:35:17 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org, krzk@kernel.org
Cc:     simon@lineageos.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com
Subject: [PATCH 3/3] ARM: dts: exynos: Add sound support to Midas
Date:   Fri, 10 Jul 2020 19:35:00 +0200
Message-Id: <20200710173500.22365-3-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710173500.22365-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduzned3ryzjiDeZ3SFhcuXiIyWLjjPWs
        FlMfPmGzmH/kHKvF+fMb2C1mnN/HZLH2yF12i9a9R9gtDr9pZ7XYcuY2mwOXx4bPTWwem1Z1
        snm0rN/E5tG3ZRWjx+dNcgGsUVw2Kak5mWWpRfp2CVwZHScEC07pVPRcP8XUwDhRpYuRk0NC
        wETi5f9W9i5GLg4hgRWMErM3LWGBcL4wSvTdXMAI4XxmlNhw/yhbFyMHWMv6nQoQ8eWMEudm
        P2OF63j2dQozyFw2AUOJ3qN9jCC2iIC6xP0ZTWBFzAI3GSVmbupjA0kICzhK/Dj2jx3EZhFQ
        lZi+5AczyAZeAWuJ56+yIO6Tl1i94QBYmFPARuLANxeQMRICzewSh68dYISocZGYefEvK4Qt
        LPHq+BZ2CFtG4vTkHhaoBkaJnt232SGcCYwS948vgOq2lrhz7hfYa8wCmhLrd+lDhB0l7l64
        xwLxMZ/EjbeCIGFmIHPStunMEGFeiY42IYhqFYnfq6YzQdhSEt1P/rNA2B4S57b8AYsLCfQz
        Svy4A7RbfhbCrgWMjKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNzNzEC08fpf8c/7WD8einp
        EKMAB6MSD++CRI54IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccXleakFh9ilOZgURLn
        NV70MlZIID2xJDU7NbUgtQgmy8TBKdXAyB5lx3f55cuu8oC9OduE7Vm+ek3ewbN45v/bgVdM
        vf5m7jJhCfk9NerV6v7vwucF7Yyvs5yyLn6iuIuDZ8qtL+/EnvDL8u3e8fHzdcU05sa/Dhw5
        5xms66fs3H241Vj/PYcX5/mV4kp6Wnvn9Wmy2m4WjHzOFPB+1WwPjV8/fTdtdTN2jHlVpMRS
        nJFoqMVcVJwIANC43pAbAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsVy+t/xu7rXlnHEG9xZyWNx5eIhJouNM9az
        Wkx9+ITNYv6Rc6wW589vYLeYcX4fk8XaI3fZLVr3HmG3OPymndViy5nbbA5cHhs+N7F5bFrV
        yebRsn4Tm0ffllWMHp83yQWwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq
        6dvZpKTmZJalFunbJehldJwQLDilU9Fz/RRTA+NElS5GDg4JAROJ9TsVuhi5OIQEljJKXNu1
        mhkiLiUxv0Wpi5ETyBSW+HOtiw2i5hOjxLIzx9lBEmwChhK9R/sYQWwRAU2Jjnm3WUGKmAUe
        MkrsP34fLCEs4Cjx49g/sAYWAVWJ6Ut+gC3gFbCWeP4qC2KBvMTqDQfAwpwCNhIHvrmAhIWA
        Kh69+s06gZFvASPDKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMBQ3nbs5+YdjJc2Bh9iFOBg
        VOLhXZDIES/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQCdNZJYSTc4H
        xlleSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQZGW5/ZrfrxYddi
        7F3+Njf4fxA+5NyryiJ58uSadQvZejz3qN1yd1HjWfgwzn+yyJIv3znnsPXNO2KRzZ834VdG
        WvFCEa2dPkaTCo06y/JqGu4FpQY1Ne2Vvhtw8Wv6a+t8/rRwntAKVr9zWsctdZe8/qVhfuhd
        ndMbjqsbNj3a0GRxo7jkX5wSS3FGoqEWc1FxIgDYZSzfewIAAA==
X-CMS-MailID: 20200710173518eucas1p1eeaaadd2359da3c863c43cd368a84213
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200710173518eucas1p1eeaaadd2359da3c863c43cd368a84213
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200710173518eucas1p1eeaaadd2359da3c863c43cd368a84213
References: <20200710173500.22365-1-s.nawrocki@samsung.com>
        <CGME20200710173518eucas1p1eeaaadd2359da3c863c43cd368a84213@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Simon Shields <simon@lineageos.org>

Update the never-mainlined "samsung,trats2-audio" binding and instead
use the new "samsung,midas-audio" binding.

Signed-off-by: Simon Shields <simon@lineageos.org>
[s.nawrocki: fixed DAPM routing entries for MICBIAS1/2, adjusted to
 changes in the DT binding]
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 38 ++++++++++++++
 arch/arm/boot/dts/exynos4412-i9300.dts      |  4 ++
 arch/arm/boot/dts/exynos4412-midas.dtsi     | 78 ++++++++++++++++++++++++-----
 arch/arm/boot/dts/exynos4412-n710x.dts      | 35 +++++++++++++
 4 files changed, 142 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 53b3ca3..cff0980 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -175,3 +175,41 @@
 	gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
+
+&submic_bias_reg {
+	gpio = <&gpf2 0 GPIO_ACTIVE_HIGH>;
+	enable-active-high;
+};
+
+&sound {
+	samsung,audio-routing =
+		"HP", "HPOUT1L",
+		"HP", "HPOUT1R",
+
+		"SPK", "SPKOUTLN",
+		"SPK", "SPKOUTLP",
+		"SPK", "SPKOUTRN",
+		"SPK", "SPKOUTRP",
+
+		"RCV", "HPOUT2N",
+		"RCV", "HPOUT2P",
+
+		"HDMI", "LINEOUT1N",
+		"HDMI", "LINEOUT1P",
+
+		"LINE", "LINEOUT2N",
+		"LINE", "LINEOUT2P",
+
+		"IN1LP", "MICBIAS1",
+		"IN1LN", "MICBIAS1",
+		"Main Mic", "MICBIAS1",
+
+		"IN1RP", "Sub Mic",
+		"IN1RN", "Sub Mic",
+
+		"IN2LP:VXRN", "MICBIAS2",
+		"Headset Mic", "MICBIAS2",
+
+		"IN2RN", "FM In",
+		"IN2RP:VXRP", "FM In";
+};
diff --git a/arch/arm/boot/dts/exynos4412-i9300.dts b/arch/arm/boot/dts/exynos4412-i9300.dts
index f8125a9..3691802 100644
--- a/arch/arm/boot/dts/exynos4412-i9300.dts
+++ b/arch/arm/boot/dts/exynos4412-i9300.dts
@@ -20,3 +20,7 @@
 		reg =  <0x40000000 0x40000000>;
 	};
 };
+
+&sound {
+	fm-sel-gpios = <&gpl0 3 GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 2c8111c..2752363 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -102,6 +102,30 @@
 		status = "disabled";
 	};
 
+	vbatt_reg: voltage-regulator-9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VBATT";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	mic_bias_reg: voltage-regulator-10 {
+		compatible = "regulator-fixed";
+		regulator-name = "MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpf1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	submic_bias_reg: voltage-regulator-11 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUB_MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -266,16 +290,18 @@
 		clock-names = "ext_clock";
 	};
 
-	sound {
-		compatible = "samsung,trats2-audio";
-		samsung,i2s-controller = <&i2s0>;
-		samsung,model = "Trats2";
-		samsung,audio-codec = <&wm1811>;
-		samsung,audio-routing =
-			"SPK", "SPKOUTLN",
-			"SPK", "SPKOUTLP",
-			"SPK", "SPKOUTRN",
-			"SPK", "SPKOUTRP";
+	sound: sound {
+		compatible = "samsung,midas-audio";
+		model = "Midas";
+		mic-bias-supply = <&mic_bias_reg>;
+		submic-bias-supply = <&submic_bias_reg>;
+
+		cpu {
+			sound-dai =  <&i2s0 0>;
+		};
+		codec {
+			sound-dai = <&wm1811>;
+		};
 	};
 
 	thermistor-ap {
@@ -597,11 +623,37 @@
 	wm1811: wm1811@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
-		DCVDD-supply = <&ldo3_reg>;
+		clocks = <&pmu_system_controller 0>,
+			<&max77686 MAX77686_CLK_PMIC>;
+		clock-names = "MCLK1", "MCLK2";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpx3>;
+		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		#sound-dai-cells = <0>;
+
+		wlf,gpio-cfg = <0x3 0x0 0x0 0x0 0x0 0x0
+			0x0 0x8000 0x0 0x0 0x0>;
+		wlf,micbias-cfg = <0x2f 0x2b>;
+
+		wlf,lineout1-feedback;
+		wlf,lineout1-se;
+		wlf,lineout2-se;
+		wlf,ldoena-always-driven;
+
+		AVDD2-supply = <&vbatt_reg>;
 		DBVDD1-supply = <&ldo3_reg>;
+		DBVDD2-supply = <&vbatt_reg>;
+		DBVDD3-supply = <&vbatt_reg>;
+		DCVDD-supply = <&ldo3_reg>;
+		CPVDD-supply = <&vbatt_reg>;
+		SPKVDD1-supply = <&vbatt_reg>;
+		SPKVDD2-supply = <&vbatt_reg>;
 		wlf,ldo1ena = <&gpj0 4 0>;
+		wlf,ldo2ena = <&gpj0 4 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
index 4189e1f..e0c907e 100644
--- a/arch/arm/boot/dts/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/exynos4412-n710x.dts
@@ -78,3 +78,38 @@
 	gpio = <&gpm0 5 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
+
+&sound {
+	samsung,audio-routing =
+		"HP", "HPOUT1L",
+		"HP", "HPOUT1R",
+
+		"SPK", "SPKOUTLN",
+		"SPK", "SPKOUTLP",
+
+		"RCV", "HPOUT2N",
+		"RCV", "HPOUT2P",
+
+		"HDMI", "LINEOUT1N",
+		"HDMI", "LINEOUT1P",
+
+		"LINE", "LINEOUT2N",
+		"LINE", "LINEOUT2P",
+
+		"IN1LP", "MICBIAS2",
+		"IN1LN", "MICBIAS2",
+		"Headset Mic", "MICBIAS2",
+
+		"IN1RP", "Sub Mic",
+		"IN1RN", "Sub Mic",
+
+		"IN2LP:VXRN", "Main Mic",
+		"IN2LN", "Main Mic",
+
+		"IN2RN", "FM In",
+		"IN2RP:VXRP", "FM In";
+};
+
+&submic_bias_reg {
+	regulator-always-on;
+};
-- 
2.7.4

