Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855F3C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Jan 2022 15:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236163AbiAJP1c (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Jan 2022 10:27:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236132AbiAJP1b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 10:27:31 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F58FC06173F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jan 2022 07:27:31 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id l16-20020a17090a409000b001b2e9628c9cso282526pjg.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jan 2022 07:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ilyruNHVzTxTe7086aSJ2h9UOBiRtTM3eY0ivIZkoYs=;
        b=NRgOtCK60mwtXnz3wuka4Zp8oRE3IFGFFH2YrWAjxCrX/A8JXG6uHgFzud0G4qrjro
         KJBcLy/sFQxjp5AOu8co1FFaZEoKAhgyvzNlYCFwqcOlv/KD7YjgyoJ3BDUbKqHBTib9
         E3cPLKSvhVzduvHDmFhvtuWV++EQX1Yt326fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ilyruNHVzTxTe7086aSJ2h9UOBiRtTM3eY0ivIZkoYs=;
        b=KMztkOOSfUPuajso4u9iucycAOSfIcwZvE6pEi1uJJKqgC9ZVnFzZvGTrQyUeMs2Yz
         y0EG7dQ97eJYqB9s2KxiPay/xvZr7oTZhxkrUUPkRN6vUREXKlsMARbt/qdsWaNMa5Rh
         T4EohGXhY2eGwbGhN1BlMf+GxuiSGCPi09XUC+k037MMT53OG3FZ+O4SEa3RqeeEByFj
         3VDoggbwUPEFVMsOek8A4kIffWiB9Q2bQ9du8r4mFYeFRYsBOFBYWPUNCh5cl6D6Z1ru
         EZutufbiJUrLvl+d+46JBYjqZ1CSQzh7cDS7yH3dXc9rbjjchnLDq5qKKTyYUalG95fH
         4H1Q==
X-Gm-Message-State: AOAM531irIf5CFH5WauW000/M3IHxVRQLS+mbxvcl5UszPyL34GHT0n9
        gU2uKLivon4Ih94qnp6e6SMk8A==
X-Google-Smtp-Source: ABdhPJz/yk/VdSzb9E1TQdRW//AUrLNkhnDnuI0tgqS5VuhUuhGIi2kzGL2xzUar+X5xusbEM8v4sA==
X-Received: by 2002:a63:10c:: with SMTP id 12mr215928pgb.67.1641828450764;
        Mon, 10 Jan 2022 07:27:30 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:98b9:3ff7:5eda:a7cc])
        by smtp.gmail.com with ESMTPSA id s207sm6087638pgs.74.2022.01.10.07.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 07:27:30 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 1/2] arm64: dts: exynos: Link DSI panel at port@1 for TM2 board
Date:   Mon, 10 Jan 2022 20:57:13 +0530
Message-Id: <20220110152714.58220-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

TM2 board DSI pipeline has input from MIC and output to
s6e3ha2 panel.

The existing pipeline has child nodes of ports, panel and
MIC is remote-endpoint reference of port@0 of ports. 

Adding panel as another child node to DSI is unconventional
as pipeline has ports child. However it can be true if MIC
is added inside port node like this.

dsi {
	compatible = "samsung,exynos5433-mipi-dsi";
	#address-cells = <1>;
	#size-cells = <0>;

	port {
		dsi_to_mic: endpoint {
			remote-endpoint = <&mic_to_dsi>;
		};
	};

	panel@0 {
		compatible = "samsung,s6e3hf2";
                reg = <0>;
                vdd3-supply = <&ldo27_reg>;
                vci-supply = <&ldo28_reg>;
                reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
                enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
	};
};

The above pipeline is proper but it requires the DSI input MIC
pipeline to update.

This patch is trying to add panel at port@1 so-that the entire
pipeline before to panel output is untouched.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index aca01709fd29..e13210c8d7e0 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -53,6 +53,16 @@ &cmu_disp {
 };
 
 &dsi {
+	ports {
+		port@1 {
+			reg = <1>;
+
+			dsi_out_panel: endpoint {
+				remote-endpoint = <&dsi_in_panel>;
+			};
+		};
+	};
+
 	panel@0 {
 		compatible = "samsung,s6e3ha2";
 		reg = <0>;
@@ -60,6 +70,12 @@ panel@0 {
 		vci-supply = <&ldo28_reg>;
 		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
 		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
+
+		port {
+			dsi_in_panel: endpoint {
+				remote-endpoint = <&dsi_out_panel>;
+			};
+		};
 	};
 };
 
-- 
2.25.1

