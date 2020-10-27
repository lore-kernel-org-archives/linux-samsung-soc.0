Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC51C388F9
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63F0C20809
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603818653;
	bh=XtjcBS5Lhouk1GGD4YuSoH6o1G1EH4KbfzX4ov7qSDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=1gcvf4yB2YIC/9c1HxRiIDPNCUQfQ40mN/BvQLLaesQ+LwkK2N4pKxJ8MG9oda+od
	 uiSkl0NFo5lT/JHGp3vohTLTnID6K8iZWm9MuQlcveLyMA72NZapvdcB33i2w7VI4C
	 wOOQXr5s1EFB23EHe1Fp84Dy8GH2NYYqpe1mMYFs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1816896AbgJ0RK0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:10:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:38548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1816893AbgJ0RKY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:10:24 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A581C20809;
        Tue, 27 Oct 2020 17:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603818623;
        bh=XtjcBS5Lhouk1GGD4YuSoH6o1G1EH4KbfzX4ov7qSDQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=si90TyutPPFBBmhwNFhNSdt3Y75/YlI5Uzdw9Bv9Vg2mzhGgnr4vgMWuDsvJ2fJGW
         E+irD8gO0zGT5JFv9hPr5Zw6jqExBSH/MrcfaMT+sANJKSdpgl2ylTbd+nWpWseVaw
         h6k7eRwFqj8Zx0/OqpcEEaZH+U9jpvCLhEXvoIec=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 09/12] ARM: dts: s5pv210: adjust node names to DT spec
Date:   Tue, 27 Oct 2020 18:09:44 +0100
Message-Id: <20201027170947.132725-10-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027170947.132725-1-krzk@kernel.org>
References: <20201027170947.132725-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Devicetree specification expects device node names to have a generic
name, representing the class of a device.  Also the convention for node
names is to use hyphens, not underscores.

No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/s5pv210-aquila.dts   | 12 ++++++------
 arch/arm/boot/dts/s5pv210-aries.dtsi   |  4 ++--
 arch/arm/boot/dts/s5pv210-goni.dts     | 14 +++++++-------
 arch/arm/boot/dts/s5pv210-smdkv210.dts | 20 ++++++++++----------
 4 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210-aquila.dts b/arch/arm/boot/dts/s5pv210-aquila.dts
index 8e57e5a1f0c5..6423348034b6 100644
--- a/arch/arm/boot/dts/s5pv210-aquila.dts
+++ b/arch/arm/boot/dts/s5pv210-aquila.dts
@@ -277,37 +277,37 @@ &keypad {
 			<&keypad_col0>, <&keypad_col1>, <&keypad_col2>;
 	status = "okay";
 
-	key_1 {
+	key-1 {
 		keypad,row = <0>;
 		keypad,column = <1>;
 		linux,code = <KEY_CONNECT>;
 	};
 
-	key_2 {
+	key-2 {
 		keypad,row = <0>;
 		keypad,column = <2>;
 		linux,code = <KEY_BACK>;
 	};
 
-	key_3 {
+	key-3 {
 		keypad,row = <1>;
 		keypad,column = <1>;
 		linux,code = <KEY_CAMERA_FOCUS>;
 	};
 
-	key_4 {
+	key-4 {
 		keypad,row = <1>;
 		keypad,column = <2>;
 		linux,code = <KEY_VOLUMEUP>;
 	};
 
-	key_5 {
+	key-5 {
 		keypad,row = <2>;
 		keypad,column = <1>;
 		linux,code = <KEY_CAMERA>;
 	};
 
-	key_6 {
+	key-6 {
 		keypad,row = <2>;
 		keypad,column = <2>;
 		linux,code = <KEY_VOLUMEDOWN>;
diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5pv210-aries.dtsi
index bd4450dbdcb6..91ecad85abfc 100644
--- a/arch/arm/boot/dts/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
@@ -54,7 +54,7 @@ pmic_ap_clk: clock-0 {
 		clock-frequency = <32768>;
 	};
 
-	bt_codec: bt_sco {
+	bt_codec: bt-sco {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <0>;
 	};
@@ -113,7 +113,7 @@ i2c_sound: i2c-gpio-0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&sound_i2c_pins>;
 
-		wm8994: wm8994@1a {
+		wm8994: audio-codec@1a {
 			compatible = "wlf,wm8994";
 			reg = <0x1a>;
 
diff --git a/arch/arm/boot/dts/s5pv210-goni.dts b/arch/arm/boot/dts/s5pv210-goni.dts
index ad8d5d2fa32d..5c1e12d39747 100644
--- a/arch/arm/boot/dts/s5pv210-goni.dts
+++ b/arch/arm/boot/dts/s5pv210-goni.dts
@@ -259,37 +259,37 @@ &keypad {
 			<&keypad_col0>, <&keypad_col1>, <&keypad_col2>;
 	status = "okay";
 
-	key_1 {
+	key-1 {
 		keypad,row = <0>;
 		keypad,column = <1>;
 		linux,code = <KEY_CONNECT>;
 	};
 
-	key_2 {
+	key-2 {
 		keypad,row = <0>;
 		keypad,column = <2>;
 		linux,code = <KEY_BACK>;
 	};
 
-	key_3 {
+	key-3 {
 		keypad,row = <1>;
 		keypad,column = <1>;
 		linux,code = <KEY_CAMERA_FOCUS>;
 	};
 
-	key_4 {
+	key-4 {
 		keypad,row = <1>;
 		keypad,column = <2>;
 		linux,code = <KEY_VOLUMEUP>;
 	};
 
-	key_5 {
+	key-5 {
 		keypad,row = <2>;
 		keypad,column = <1>;
 		linux,code = <KEY_CAMERA>;
 	};
 
-	key_6 {
+	key-6 {
 		keypad,row = <2>;
 		keypad,column = <2>;
 		linux,code = <KEY_VOLUMEDOWN>;
@@ -353,7 +353,7 @@ &i2c2 {
 	samsung,i2c-slave-addr = <0x10>;
 	status = "okay";
 
-	tsp@4a {
+	touchscreen@4a {
 		compatible = "atmel,maxtouch";
 		reg = <0x4a>;
 		interrupt-parent = <&gpj0>;
diff --git a/arch/arm/boot/dts/s5pv210-smdkv210.dts b/arch/arm/boot/dts/s5pv210-smdkv210.dts
index 7459e41e8ef1..fbae768d65e2 100644
--- a/arch/arm/boot/dts/s5pv210-smdkv210.dts
+++ b/arch/arm/boot/dts/s5pv210-smdkv210.dts
@@ -76,61 +76,61 @@ &keypad {
 			<&keypad_col6>, <&keypad_col7>;
 	status = "okay";
 
-	key_1 {
+	key-1 {
 		keypad,row = <0>;
 		keypad,column = <3>;
 		linux,code = <KEY_1>;
 	};
 
-	key_2 {
+	key-2 {
 		keypad,row = <0>;
 		keypad,column = <4>;
 		linux,code = <KEY_2>;
 	};
 
-	key_3 {
+	key-3 {
 		keypad,row = <0>;
 		keypad,column = <5>;
 		linux,code = <KEY_3>;
 	};
 
-	key_4 {
+	key-4 {
 		keypad,row = <0>;
 		keypad,column = <6>;
 		linux,code = <KEY_4>;
 	};
 
-	key_5 {
+	key-5 {
 		keypad,row = <0
 		>;
 		keypad,column = <7>;
 		linux,code = <KEY_5>;
 	};
 
-	key_6 {
+	key-6 {
 		keypad,row = <1>;
 		keypad,column = <3>;
 		linux,code = <KEY_A>;
 	};
-	key_7 {
+	key-7 {
 		keypad,row = <1>;
 		keypad,column = <4>;
 		linux,code = <KEY_B>;
 	};
 
-	key_8 {
+	key-8 {
 		keypad,row = <1>;
 		keypad,column = <5>;
 		linux,code = <KEY_C>;
 	};
 
-	key_9 {
+	key-9 {
 		keypad,row = <1>;
 		keypad,column = <6>;
 		linux,code = <KEY_D>;
 	};
 
-	key_10 {
+	key-10 {
 		keypad,row = <1>;
 		keypad,column = <7>;
 		linux,code = <KEY_E>;
-- 
2.25.1

