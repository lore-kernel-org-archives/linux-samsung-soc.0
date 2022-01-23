Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE763C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 11:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236264AbiAWLQ7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 06:16:59 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56002
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236233AbiAWLQz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 06:16:55 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 929F33F1C4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936611;
        bh=XFI4x1c9o5rGbL4nhgosKocwg6qcvl4V6Q0rNOHSnCo=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=LQWqauY3KDL03QMvpqAus/Aqq7gLXSHqz/AOWp7ERLF9ZVUx/fZSy9gFE7Sdktk6t
         TGs17Ytrl32faJXiLSZjNUgDke8KGwThwGCDTzVbUI0cKz/X0mNRkM7LOXUU8+8pNK
         x1ujPH9nBBUXR6Yd31piUyQajkKhBktIo/YutrXPM2T+ZsuP53IDnnrr0RG0yOVzjT
         Z619yPV3q3kEuUX9w7tAuBTk4+luGqMufeNPixRwM54gOszyYwOTKHwBy6oXaww/ZF
         I33UULuvYxZMOfkxy+G7/Q4kcuHB17ie9SGbLpIh/eEtcHuJnZ618NnExCZ8rxS3vz
         4Pquk1RUzxmNg==
Received: by mail-wm1-f70.google.com with SMTP id d140-20020a1c1d92000000b0034edefd55caso2639382wmd.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 03:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XFI4x1c9o5rGbL4nhgosKocwg6qcvl4V6Q0rNOHSnCo=;
        b=6aBNV7KK1TOmvI3/dHIV2MSgHflcD6SkrpDsknnZXWzFTkT3m22zsvWEdfZ9B5+81X
         xP6mRZ8HNCe2mVUhH5c0aO7hPOUcoq/aKVjvzUmIz/CRTqk9in8vci5QMY3Nu5XGv/Zr
         0ZH2Kl1rSCoQgoRE5GEKYkJnFYwCRlQFV5Gd84ErPNrypGqFEW+1gmWvFDrpYp/p9iiA
         ueiDuAmb08XhhYPiOr3oqxxDY6YMB/xL2vV5MWTBCMj++HuucI7W7OiDVhTBC8tJhY2d
         Y+tqRRbFHyAMpza11zGwxRC8ZJFNqSpLbw0pxXgD4KAaSk90BOdRP3Za3rxT+qrvX4eS
         zh6w==
X-Gm-Message-State: AOAM533m3CYyoZeBBvRnuZGj1eRC4+ZJfvg8Z48nzvQAEznBgzvRH6/X
        USSXrUYLJBRI3NYmc8vJO6F5V2d7f+bktvE9EUPbiD3H9g/DYsbq28ujClKaAiAJLEPe3WJJauG
        49xF6o4Vg3FZ1iyLG58r8JnwFX4QrmYufLkXfeqzUCC4NqlDP
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr10537113wrm.522.1642936610794;
        Sun, 23 Jan 2022 03:16:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmyLPzIeaK4+b6dxFPm5eFCVZH0SGn36vHYUkppgtWL3y8Qu5THGeh6bGAfFL4+v1aOI+4pQ==
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr10537102wrm.522.1642936610662;
        Sun, 23 Jan 2022 03:16:50 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] ARM: dts: exynos: add USB DWC3 supplies to Arndale
Date:   Sun, 23 Jan 2022 12:16:34 +0100
Message-Id: <20220123111644.25540-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5250 Arndale
board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 5 +++++
 arch/arm/boot/dts/exynos5250.dtsi        | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 3583095fbb2a..e639cf6d9b64 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -632,3 +632,8 @@ i2c_ddc: i2c-10 {
 		#size-cells = <0>;
 	};
 };
+
+&usbdrd {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 139778928b93..a6f48f31f618 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -637,7 +637,7 @@ i2s2: i2s@12d70000 {
 			#sound-dai-cells = <1>;
 		};
 
-		usb_dwc3 {
+		usbdrd: usb3 {
 			compatible = "samsung,exynos5250-dwusb3";
 			clocks = <&clock CLK_USB3>;
 			clock-names = "usbdrd30";
-- 
2.32.0

