Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EBCC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Feb 2022 18:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242959AbiBSSp1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 19 Feb 2022 13:45:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242962AbiBSSpU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Feb 2022 13:45:20 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14E6694B9
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 10:45:01 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 48ADA40040
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 18:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645296299;
        bh=VdBW5eJ0KRtkG5qq7BggPOtnxfiLOHvvLGr1LQKWRHE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=qOrRrJRzp1apUDjWnfhhbFOp5EhY1YRb6shJ5S7NfrmzNPzQVukogZ2bnLte5RcbW
         7veL98sCoCvq0+7ISLYDSqZ823eo8LIyd/KxtA42GBzfNfSF7yVV8R+JXvRB6ARGUJ
         8DGMlH2438T6c1Ov+tPKP64rS2eatkAEM7NHqlrMxFzbLeM1z7CeLvHRdvifAoqUmL
         TKB1lRKLbp8zoM+z0C/Q4XsLTfeHCH26+pPhIGLKGzLh2LxCn1eE1VYwienff9DlIq
         Tkm1zTH/Mo6EujjIPUaYFFRMcufkhgg8rD76egoMOYCOl/VoXaZpoyfdXfrR6Tb7cB
         l3vinYAUAYxIA==
Received: by mail-ed1-f71.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso7569910edt.20
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 10:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VdBW5eJ0KRtkG5qq7BggPOtnxfiLOHvvLGr1LQKWRHE=;
        b=eTrnrPkgQM1K8+sy7JgfLkexGQPj1XThFJ5CJhdPQdy4nNVYSCNbZyleygrlug6Tuz
         AWQ4Linm3ZRVKPxR1jfBFRD3NoWEVJ9wXGEmwRyjrX+GzNvGVwCDQ8Spsg6jwFj8kDwu
         5GekQi/CFcOMpI933qKxgYydCI77h98dgUzm4lbCh4/dnVZGfN6O7hPlTYV46GyXab4y
         p9wO850v37QDWRp7ijNakXouPG7KQ9lmIvhfaesz9/tF8NzLwfxyMDwo/k0SJ1beJl3U
         MgDS5T3OwvGMTzbAnhv84+CauXM3PwcvdYcsGb4WI5v0dgZw8zCE+eCkE4fsaJvCwXKn
         8qRw==
X-Gm-Message-State: AOAM532ugfFJF+4Slh+RY8AiouN/ohbVXlIC0ln5c0KJPGvS/pffFTi8
        5Ai5XpjOO98vV4+A7P0GkZKvzbg1wz3NheyoKqc27rQW4EpOUaYasmhdvjUicvPm8Mmvwsd6kcg
        WuYziF5vK9EoxFbS1HDbM1A6+ECU3YsTcc+EqMjckKjrWVOs8
X-Received: by 2002:a17:906:9bed:b0:6ce:6bbc:dc8b with SMTP id de45-20020a1709069bed00b006ce6bbcdc8bmr11003786ejc.428.1645296296750;
        Sat, 19 Feb 2022 10:44:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5eELNrX+BuAo2fm8/sdIZW7wyUGvlrGjYgJmeUvcZV4dLJloHpIRrlrSDF/y9czaR/IL1Hg==
X-Received: by 2002:a17:906:9bed:b0:6ce:6bbc:dc8b with SMTP id de45-20020a1709069bed00b006ce6bbcdc8bmr11003769ejc.428.1645296296564;
        Sat, 19 Feb 2022 10:44:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id v24sm3417780ejf.7.2022.02.19.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 10:44:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jan Kotas <jank@cadence.com>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 7/8] arm64: dts: qcom: use 'freq-table' in UFS node
Date:   Sat, 19 Feb 2022 19:44:52 +0100
Message-Id: <20220219184453.44689-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
References: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The 'freq-table-hz' property is deprecated by UFS bindings.
The uint32-array requires also element to be passed within one <> block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 23 +++++++++++------------
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 17 ++++++++---------
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 19 +++++++++----------
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 19 +++++++++----------
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 17 ++++++++---------
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 19 +++++++++----------
 arch/arm64/boot/dts/qcom/sm8450.dtsi  | 17 ++++++++---------
 7 files changed, 62 insertions(+), 69 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c85825ea1623..2d6ad6dfa0dd 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1761,18 +1761,17 @@ ufshc: ufshc@624000 {
 				<&rpmcc RPM_SMD_LN_BB_CLK>,
 				<&gcc GCC_UFS_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>;
-			freq-table-hz =
-				<100000000 200000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<150000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
+			freq-table = <100000000 200000000
+				      0 0
+				      0 0
+				      0 0
+				      0 0
+				      150000000 300000000
+				      0 0
+				      0 0
+				      0 0
+				      0 0
+				      0 0>;
 
 			lanes-per-direction = <1>;
 			#reset-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 2fda21e810c9..eee7bc35e468 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -990,15 +990,14 @@ ufshc: ufshc@1da4000 {
 				<&gcc GCC_UFS_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
-				<50000000 200000000>,
-				<0 0>,
-				<0 0>,
-				<37500000 150000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
+			freq-table = <50000000 200000000
+				      0 0
+				      0 0
+				      37500000 150000000
+				      0 0
+				      0 0
+				      0 0
+				      0 0>;
 
 			resets = <&gcc GCC_UFS_BCR>;
 			reset-names = "rst";
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0d6286d27dd4..987730032c0b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2274,16 +2274,15 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
 				<&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
-			freq-table-hz =
-				<50000000 200000000>,
-				<0 0>,
-				<0 0>,
-				<37500000 150000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 300000000>;
+			freq-table = <50000000 200000000
+				      0 0
+				      0 0
+				      37500000 150000000
+				      0 0
+				      0 0
+				      0 0
+				      0 0
+				      0 300000000>;
 
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index d15fee495238..3c5acf07337d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1782,16 +1782,15 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
 				<&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
-			freq-table-hz =
-				<37500000 300000000>,
-				<0 0>,
-				<0 0>,
-				<37500000 300000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 300000000>;
+			freq-table = <37500000 300000000
+				      0 0
+				      0 0
+				      37500000 300000000
+				      0 0
+				      0 0
+				      0 0
+				      0 0
+				      0 300000000>;
 
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index fdaf303ba047..308585cde3b0 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2133,15 +2133,14 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
-				<37500000 300000000>,
-				<0 0>,
-				<0 0>,
-				<37500000 300000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
+			freq-table = <37500000 300000000
+				      0 0
+				      0 0
+				      37500000 300000000
+				      0 0
+				      0 0
+				      0 0
+				      0 0>;
 
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index d242bab69c2e..526a328a9b7e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1935,16 +1935,15 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
-				<75000000 300000000>,
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
+			freq-table = <75000000 300000000
+				      75000000 300000000
+				      0 0
+				      0 0
+				      75000000 300000000
+				      0 0
+				      0 0
+				      0 0
+				      0 0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 934e29b9e153..ed72dbdf3435 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1398,15 +1398,14 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<75000000 300000000>,
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
+			freq-table = <75000000 300000000
+				      0 0
+				      0 0
+				      75000000 300000000
+				      75000000 300000000
+				      0 0
+				      0 0
+				      0 0>;
 			status = "disabled";
 		};
 
-- 
2.32.0

