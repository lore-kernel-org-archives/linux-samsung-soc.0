Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188ECC05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Feb 2023 15:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjBQPHG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 17 Feb 2023 10:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjBQPHE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 10:07:04 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105226FF29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Feb 2023 07:06:44 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id g29so470759eda.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Feb 2023 07:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfR58zk5Lq0Y4NpQRVcnXrMaw/hr0XQUMG7wTZBuFEA=;
        b=xltorjJqnSMn9avO+CAsyd8bicX3NQVHPp2PNAklprp4tJLGKGevWTMcEr34ls0ZFC
         0bR/EVXvyCS4R+RWN8/dbeBa7h0tRyd1m+OL80XEfzI8MHMmrl3exVUscP7io7EsB+Qa
         QjtZEUk+8K0oUV4OYsdx2ubv3woHrCuuGsCAn+WSQf8t8WfDFfBk+kl+6q9C27hg0+Xu
         L4Jj4rmMKdBgC2Sp2oc01OLN3V9PQk5YFyLPYGBC2FN+EyBcpO3JZveG+9m+/Rc+hAVj
         Q085YiwR1p+xvLr36lC9k811UeBquC44G4SKDBBpsaNBjY4Mo8NqL9CpcjFIrPBTfl5m
         zSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfR58zk5Lq0Y4NpQRVcnXrMaw/hr0XQUMG7wTZBuFEA=;
        b=KOagtWFSX/nfMQnFyb+cpZyNSH4HZbYKmbDpvoUmnTC3yNFNB+eISOHDlRecxH2hfW
         6utA0q3/IweFiLAh86yw/dhjO9V+rNJD3tVKY6/114NUWj75vrIcqw7c2yZR5b3FJFGM
         mNFXOaP12kgSwNdEFY2nGeUz4J7firMZ2rUfy/rUAyVuQ9qdcgDtg6HNxP8ahIxuu41k
         F5aO8Gy9x9hOgALWuzZBkuPTutRDORZryB/O8aK7V02S2muc/i7QGXTk3tCriWUduqGk
         8nrzmMwNOdyn/wyAB9cuGA5jVfQhwDyUkhMqFotchbVMEc2JdpkYuRBSveFhs2XUJozV
         817w==
X-Gm-Message-State: AO0yUKWAdU9LeJ1Y5QFAFpww/M0cT5TDWSKkCQfDvWoOcQ+3cbp+5MLd
        iqo1Wmd4ZAjRjEHqw34mMMh9mg==
X-Google-Smtp-Source: AK7set/KwPZmBYn2iAIMR26SlMvThSNNLiKnjZs3zyLE9MpxGJ+X05/w4/XNBlegEFA+gRT9U4tMJw==
X-Received: by 2002:a17:906:5a4c:b0:8b1:811e:cd30 with SMTP id my12-20020a1709065a4c00b008b1811ecd30mr2904858ejc.22.1676646401896;
        Fri, 17 Feb 2023 07:06:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fx15-20020a170906b74f00b008b14ba6c954sm2221303ejb.194.2023.02.17.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 07:06:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        - <patches@opensource.cirrus.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Randy Li <ayaka@soulik.info>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: exynos: fix WM8960 clock name in Itop Elite
Date:   Fri, 17 Feb 2023 16:06:27 +0100
Message-Id: <20230217150627.779764-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
References: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The WM8960 Linux driver expects the clock to be named "mclk".  Otherwise
the clock will be ignored and not prepared/enabled by the driver.

Cc: <stable@vger.kernel.org>
Fixes: 339b2fb36a67 ("ARM: dts: exynos: Add TOPEET itop elite based board")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-itop-elite.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index b596e997e451..6260da187e92 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -182,7 +182,7 @@ codec: audio-codec@1a {
 		compatible = "wlf,wm8960";
 		reg = <0x1a>;
 		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
+		clock-names = "mclk";
 		wlf,shared-lrclk;
 		#sound-dai-cells = <0>;
 	};
-- 
2.34.1

