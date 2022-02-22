Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CA5C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 15:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbiBVPAk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233035AbiBVPAU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:20 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8891010E045
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:51 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8FCDD40049
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645541986;
        bh=QS6C0GzUsESFnOlW679wMJjG5Id453GO4JtPx943Lak=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=MVpTjeTFfq2YaJeNybJBjKmcms2z4Y9uqW33q99pgyfvkVVqxC8VqZoS78b2KT7cC
         Q7aA/nerYZRDXv10Oj4qwdEhZAV471yti6bNd9310rVP/TJSfxFDGYmHaN5ioAKfuY
         +PcFkovR9X5mOLU5Lo2kR6OpWcHYI25sMWHhm9c2/Wx0ky+cbYl7vyZBtu8PRJijvc
         gyNe+lNz0ydAyKsskca3EUpXULO+LyP5i2VK6MW2y4JI0sfWZ30uZOi2jbJkD1oi6G
         WEWOjM0m3RIYEzCTtknjygYTbQartZGzOjmw23ZWmnQht5nb/4XJ59nyM+G8XNXh8w
         FA1g4qwhbaZkA==
Received: by mail-ej1-f71.google.com with SMTP id gn20-20020a1709070d1400b006cf1fcb4c8dso5886392ejc.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QS6C0GzUsESFnOlW679wMJjG5Id453GO4JtPx943Lak=;
        b=rVV0FcJeNp3ndUDwMGXTntiJlfnwJzlmL3BaxF2c8XpUNxt1pg1dYPCZsROPyMnelr
         f1W/f9sGNxo5zcqiC1OvlKEktFAe4DkORLCUQYK0ZkUNyYi8o3pEaAUUMiX932LOHOzW
         3ScGZ04uyF98UchYV7Xa1xUXRboqF53DF/ErvdDAb02kOZIkUCcYAo7YWERhpLFuRRX1
         /EkiNUb/aMJrgxhvW/D+B3Z0SwM+lJoaEcpVhcO+AuzQjedUNK5XcqPNdZKS6Z+1qYKR
         HspVJguqBE+y4AlflhkbA/z7GN6GFmrNntzoAf3n5jXWORN4yz+Bih9hVRWMi9RXJdiF
         9oKA==
X-Gm-Message-State: AOAM532he48QIEcSqsdtdw992Ju3iVPxWBdlgV5LGRbAmVVtCP8h8aiF
        oJjtV0BpG3tk5Uv96jOkPfcyFoykCjFDKs+Hx4/iq4NRVf6Bfw+WOH/QrIvnej53g6iBrq/r4hY
        YZpGf5B/RfzADSof1Mo6ZcYDzHCpqzhMEGu4d+Rx0QRh+DnaC
X-Received: by 2002:aa7:df12:0:b0:410:a50b:de00 with SMTP id c18-20020aa7df12000000b00410a50bde00mr26955902edy.2.1645541986229;
        Tue, 22 Feb 2022 06:59:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLhBfWrLlHym0osIm6uJ6NjAAfcWJy5tog0t5Nfvn14lcOwLiw9f5Pm3zKcbnRxuKypKbKmg==
X-Received: by 2002:aa7:df12:0:b0:410:a50b:de00 with SMTP id c18-20020aa7df12000000b00410a50bde00mr26955872edy.2.1645541986043;
        Tue, 22 Feb 2022 06:59:46 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 04/15] dt-bindings: ufs: drop unused/old ufs-qcom PHY bindings
Date:   Tue, 22 Feb 2022 15:58:43 +0100
Message-Id: <20220222145854.358646-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Qualcomm UFS PHY bindings are documented in
bindings/phy/qcom,qmp-phy.yaml and the compatibles from separate file
bindings/ufs/ufs-qcom.txt are not used at all.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/ufs/ufs-qcom.txt      | 63 -------------------
 1 file changed, 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-qcom.txt

diff --git a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
deleted file mode 100644
index fd59f93e9556..000000000000
--- a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-* Qualcomm Technologies Inc Universal Flash Storage (UFS) PHY
-
-UFSPHY nodes are defined to describe on-chip UFS PHY hardware macro.
-Each UFS PHY node should have its own node.
-
-To bind UFS PHY with UFS host controller, the controller node should
-contain a phandle reference to UFS PHY node.
-
-Required properties:
-- compatible        : compatible list, contains one of the following -
-			"qcom,ufs-phy-qmp-20nm" for 20nm ufs phy,
-			"qcom,ufs-phy-qmp-14nm" for legacy 14nm ufs phy,
-			"qcom,msm8996-ufs-phy-qmp-14nm" for 14nm ufs phy
-			 present on MSM8996 chipset.
-- reg               : should contain PHY register address space (mandatory),
-- reg-names         : indicates various resources passed to driver (via reg proptery) by name.
-                      Required "reg-names" is "phy_mem".
-- #phy-cells        : This property shall be set to 0
-- vdda-phy-supply   : phandle to main PHY supply for analog domain
-- vdda-pll-supply   : phandle to PHY PLL and Power-Gen block power supply
-- clocks	    : List of phandle and clock specifier pairs
-- clock-names       : List of clock input name strings sorted in the same
-		      order as the clocks property. "ref_clk_src", "ref_clk",
-		      "tx_iface_clk" & "rx_iface_clk" are mandatory but
-		      "ref_clk_parent" is optional
-
-Optional properties:
-- vdda-phy-max-microamp : specifies max. load that can be drawn from phy supply
-- vdda-pll-max-microamp : specifies max. load that can be drawn from pll supply
-- vddp-ref-clk-supply   : phandle to UFS device ref_clk pad power supply
-- vddp-ref-clk-max-microamp : specifies max. load that can be drawn from this supply
-- resets : specifies the PHY reset in the UFS controller
-
-Example:
-
-	ufsphy1: ufsphy@fc597000 {
-		compatible = "qcom,ufs-phy-qmp-20nm";
-		reg = <0xfc597000 0x800>;
-		reg-names = "phy_mem";
-		#phy-cells = <0>;
-		vdda-phy-supply = <&pma8084_l4>;
-		vdda-pll-supply = <&pma8084_l12>;
-		vdda-phy-max-microamp = <50000>;
-		vdda-pll-max-microamp = <1000>;
-		clock-names = "ref_clk_src",
-			"ref_clk_parent",
-			"ref_clk",
-			"tx_iface_clk",
-			"rx_iface_clk";
-		clocks = <&clock_rpm clk_ln_bb_clk>,
-			<&clock_gcc clk_pcie_1_phy_ldo >,
-			<&clock_gcc clk_ufs_phy_ldo>,
-			<&clock_gcc clk_gcc_ufs_tx_cfg_clk>,
-			<&clock_gcc clk_gcc_ufs_rx_cfg_clk>;
-		resets = <&ufshc 0>;
-	};
-
-	ufshc: ufshc@fc598000 {
-		#reset-cells = <1>;
-		...
-		phys = <&ufsphy1>;
-		phy-names = "ufsphy";
-	};
-- 
2.32.0

