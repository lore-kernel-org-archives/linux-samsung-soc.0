Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B109C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 11:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236215AbiAWLQw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 06:16:52 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38360
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236211AbiAWLQv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 06:16:51 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1763A3F1E8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936610;
        bh=XKeSGyC9ItmJqAyykgNV42LPM38fJ31nboSTLUTfyvc=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=h7yL0qChX2eUu0cQ2CZurKPxVblH61lAvQNPufdWPVCCNjMrQTSz3L+MJz+bhOnpQ
         ntRAHlO6iPhM05USzFNMZZUC+rC4u8I5SMEbyAqdEWREPcJNVxZWC5kbWK8unqWCg1
         oQmMXa6gglxtp26kyFJiQOYd3Xk1kCWc1k69M9VKvVBzqHjKj6xtxuAQp+lf75XQmr
         gP7go+yW9EocBVWJ+w+Wu2Nqjv+BX7gQ4j5cq+IgYH8OGIw5nyqvx/Zs9EiJUOzOE5
         FlMIimZGCydpgLKut4yM59bqQo8GNG5ICPAvDzhYJvhQLeRBRhrwsRtOsuwN5qkMSJ
         jl2hf8iPsPXzA==
Received: by mail-wm1-f71.google.com with SMTP id f7-20020a1cc907000000b0034b63f314ccso8984699wmb.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 03:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XKeSGyC9ItmJqAyykgNV42LPM38fJ31nboSTLUTfyvc=;
        b=0SGFnM27WMEzOX0/nJ3MqgVxinv40TVdrBQVca9Kluly861YQOEeXYWmSKN6fnu/+2
         DLKu6j9X9bjtBG0/A81TGNzAmUBTlyaMxLonHJ3T6J8B9fZARaj8IveNA+933N6B3Yof
         IBz5lDuYsZsNnqmrcJWCI/OKn51ZXsa6uMCymvGoEWOIBxtP7w30oiUQmesVQNZ29Ahy
         n15vCVvsH8XuT9/soDeOO5hdeKO4yZkKq5EtDABYlmqLYD2Im5hL7Zebdr51bpKTW92y
         N9eZIW+pjSLIAvnJvN59TxJLTtc3uVaSIU1BKNLCCYv4TYc34JsltZvlKYaBHReSZPYg
         6WZA==
X-Gm-Message-State: AOAM533BGqnNwTxv75E1rHsjJkRMUGGmVdw1eHTt/A/lBrWeLtk/Csvp
        zJNj3gYJVcpbpqqKUpTkYX+yyWDnf7LCp1gSN+Sx1hQq8RxI7DgNcD1q+E9xGw/C99Wke7p+HhM
        Dn0nXx6VGiaIDSrXn9EfGnjlIWB4PoKjJwEcoHOhYwokcE86N
X-Received: by 2002:adf:f686:: with SMTP id v6mr9080079wrp.568.1642936609610;
        Sun, 23 Jan 2022 03:16:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQBteHKoyyNnf4rlz2MD505Wn16oOqHwd91HINqnK/froSXkyccBpxKSM0tEJs7mrQYEKfxw==
X-Received: by 2002:adf:f686:: with SMTP id v6mr9080070wrp.568.1642936609419;
        Sun, 23 Jan 2022 03:16:49 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] arm64: dts: exynos: add USB DWC3 supplies to Espresso board
Date:   Sun, 23 Jan 2022 12:16:33 +0100
Message-Id: <20220123111644.25540-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos7 Espresso
board.  Due to lack of schematics of Espresso board, the choice of
regulators is approximate.  What bindings call VDD10, for Exynos7 should
be actually called VDD09 (0.9 V).  Use regulators with a matching
voltage range based on vendor sources for Meizu Pro 5 M576 handset (also
with Exynos7420).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 5 +++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi         | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 125c03f351d9..4c45e689d34a 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -412,6 +412,11 @@ &ufs {
 	status = "okay";
 };
 
+&usbdrd {
+	vdd10-supply = <&ldo4_reg>;
+	vdd33-supply = <&ldo6_reg>;
+};
+
 &usbdrd_phy {
 	vbus-supply = <&usb30_vbus_reg>;
 	vbus-boost-supply = <&usb3drd_boost_5v>;
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index c3efbc8add38..01b4210d8b62 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -672,7 +672,7 @@ usbdrd_phy: phy@15500000 {
 			#phy-cells = <1>;
 		};
 
-		usbdrd3 {
+		usbdrd: usb {
 			compatible = "samsung,exynos7-dwusb3";
 			clocks = <&clock_fsys0 ACLK_USBDRD300>,
 			       <&clock_fsys0 SCLK_USBDRD300_SUSPENDCLK>,
-- 
2.32.0

