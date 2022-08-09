Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CB6C19F2D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Aug 2022 11:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241412AbiHILdp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Aug 2022 07:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242031AbiHILdg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 07:33:36 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA9E248DD
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Aug 2022 04:33:34 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z2so14754118edc.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2022 04:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=sNYeOxUoEGuVYNpza89lhnw6NA3mprqgMkWtANsN61o=;
        b=g6Gy0EYgx+VcZ5d0vxTlUt6Zh9X/+cYLIz0xI8NGJ1OdelMaXuN2dNSONewE17q64G
         a8WDhnaU4ORUcyVCdPOjlAKCYtOqRGPHLj5fuXCveRDbrUh/d71mzgS1x4Dbj/4GkasF
         5Ay8Q3FfQSjCLtE6rgH2fy5kq2JGn0BMvvrMqtwdtQcqOtGRfixT6XpeNVpAtUJtSDIS
         9RaVmSEhCNaMtqz4G3wp4Vr7QJqruViVoZliNFONqggpXO0OjOxmii491msAXJZ3Kvmx
         3jms6O4xjBio8SFzRHJWlpVmZjaq2v1nfMWwNHKmWRjwPfMiyLReB+MFMZLF1kuaw86h
         Y/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=sNYeOxUoEGuVYNpza89lhnw6NA3mprqgMkWtANsN61o=;
        b=1mcll+qf70ml9Oq9U5MATqJs2PDnRPgu40VJWTna6A9O9zn4qMbiT+qhxCNGl9pD1H
         DoSqx6FVTbSzOJGp7itpiK4owefatRFOKCJET9ONyG80gkUgUm9ThI1oj1admqC54DEm
         k7/rZkzRYbcK/CUC/UCQkJJtOwpAHyXD3lg2Qb/vN2+8RsUCZgf+tsR98Y+AwxqcDk+S
         IO9VOX52Cz8Jiq5wM8W1qeZpyr6vIgQTdcCgWtqvCe8IYWRph7Iqd+thoXApMVdhXg+7
         EkDH8PolaNTXoT7KxndLaVMtFZnWQX0ok7HSBEdrKMdbgWiRkKnnSp5lflSGflds2nFA
         nNZQ==
X-Gm-Message-State: ACgBeo08rygD/yTTtIkqVAjsthOSkqSd6LmwblqfK02+uZGLk6iaXLfg
        vq/CarhJto7MehfzSvquzQ+gFg==
X-Google-Smtp-Source: AA6agR6q7X7j23myqs/wyR19MGJN+pgALez3VBpdFv+wVw+6/hMG1O792NCE1Gzhn0aoAdzRFBd0JA==
X-Received: by 2002:aa7:ccc4:0:b0:43d:9e0e:b7ff with SMTP id y4-20020aa7ccc4000000b0043d9e0eb7ffmr21837836edt.14.1660044814014;
        Tue, 09 Aug 2022 04:33:34 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id d5-20020a170906304500b007262b9f7120sm995066ejd.167.2022.08.09.04.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:33:33 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 8/9] arm64: dts: exynos: Add CMU_AUD, CMU_IS and CMU_MFCMSCL for Exynos850
Date:   Tue,  9 Aug 2022 14:33:22 +0300
Message-Id: <20220809113323.29965-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220809113323.29965-1-semen.protsenko@linaro.org>
References: <20220809113323.29965-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add missing clock domains to Exynos850 SoC device tree.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none)

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 9076afd4bb3e..8e78b50416d8 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -286,6 +286,21 @@ cmu_top: clock-controller@120e0000 {
 			clock-names = "oscclk";
 		};
 
+		cmu_mfcmscl: clock-controller@12c00000 {
+			compatible = "samsung,exynos850-cmu-mfcmscl";
+			reg = <0x12c00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_MFCMSCL_MFC>,
+				 <&cmu_top CLK_DOUT_MFCMSCL_M2M>,
+				 <&cmu_top CLK_DOUT_MFCMSCL_MCSC>,
+				 <&cmu_top CLK_DOUT_MFCMSCL_JPEG>;
+			clock-names = "oscclk", "dout_mfcmscl_mfc",
+				      "dout_mfcmscl_m2m", "dout_mfcmscl_mcsc",
+				      "dout_mfcmscl_jpeg";
+		};
+
 		cmu_dpu: clock-controller@13000000 {
 			compatible = "samsung,exynos850-cmu-dpu";
 			reg = <0x13000000 0x8000>;
@@ -308,6 +323,29 @@ cmu_hsi: clock-controller@13400000 {
 				      "dout_hsi_mmc_card", "dout_hsi_usb20drd";
 		};
 
+		cmu_is: clock-controller@14500000 {
+			compatible = "samsung,exynos850-cmu-is";
+			reg = <0x14500000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_IS_BUS>,
+				 <&cmu_top CLK_DOUT_IS_ITP>,
+				 <&cmu_top CLK_DOUT_IS_VRA>,
+				 <&cmu_top CLK_DOUT_IS_GDC>;
+			clock-names = "oscclk", "dout_is_bus", "dout_is_itp",
+				      "dout_is_vra", "dout_is_gdc";
+		};
+
+		cmu_aud: clock-controller@14a00000 {
+			compatible = "samsung,exynos850-cmu-aud";
+			reg = <0x14a00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>, <&cmu_top CLK_DOUT_AUD>;
+			clock-names = "oscclk", "dout_aud";
+		};
+
 		pinctrl_alive: pinctrl@11850000 {
 			compatible = "samsung,exynos850-pinctrl";
 			reg = <0x11850000 0x1000>;
-- 
2.30.2

