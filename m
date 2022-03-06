Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FF4C43217
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Mar 2022 11:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbiCFLOP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Mar 2022 06:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbiCFLNo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Mar 2022 06:13:44 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A90949922
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Mar 2022 03:12:34 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F1DED3F646
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Mar 2022 11:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646565143;
        bh=fptfaOUAaErRHK6yyvwk8Ba2q3vPhWe6MKEfwn6hivY=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=mcQWE2Q741EbwM/PSEaMOpqgVv7NfjxJv9gONv9I6FnjOelMGs46GWSWnWQsqWqOo
         BovAitTBiw83bx4DOSWe97ZsShCwIOCTdkwvHT0ce/7C5Ot+9m3HnC9SB9vVqwRa8a
         hhTrws0tbe2Fqi8jdDdKNosGE0kCyiKaNhhjyCi6UZppim2wu3SOBZ7L1Nz5CVvpUT
         COlVnT6uwD+T479Se8Upzi8rrMnML9cRy3i227puEqM92i60xCJ9j4CSG6g6FuQ834
         TZFbJXTQYVNT1hxSHLawWOMfTXw7wHHSnnN5WP4pthgHjRaSGAQrRtdNsWgiw+//kV
         cHnlAN7K3FnGg==
Received: by mail-ed1-f70.google.com with SMTP id l14-20020a056402344e00b0041593c729adso6764302edc.18
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Mar 2022 03:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fptfaOUAaErRHK6yyvwk8Ba2q3vPhWe6MKEfwn6hivY=;
        b=XVnNMGsTiuifjLhUPHwS6VNaJgWf96l2YOKshxd1zsUdrafOlHT3IhtG+OR5pZsVUN
         JgeDkJdTxIJp44PJPzs8dJM9A5D17asw0vQssZhFFxyBxcjhZXwFQdPrBYxPxjNOINNN
         t5viD1ZFFppKqvRVLawV5o5VR8MImXMiI9fGMSN0em3QF1rNhrgqv/fXEYtTzARhLQuj
         4DSREjAKcxFsE+D8/Rfnf9YiJqr9fUoiY1Mxg6MXjGFs15F0tXj0mN0Njf0NX7UHTwRd
         u+A/jYuoNa3Iw9M4m7jvVBB9Ep6U1hAWo68vHYWAVMQv0loBd+fOKDvMLKmmXDTA0vix
         0buw==
X-Gm-Message-State: AOAM530/IRQNeEkqXl1Fd/oyP+Xj4PzvXBM0iM2Hda9c6O4L+SlmJgZV
        3r316vPfY8opCjVHBRle/NUU1LcbxHkSP3ahAGv17p1QB/gfvcXrUHx49Ks50nuzavBYJT2KQRk
        DJXe2IZ6Uh+P41L+JOAr4M2+yixpFf/gF1rAIc2BJ6QmV9sgP
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id i7-20020a1709064fc700b006da92b2f572mr5333894ejw.184.1646565109085;
        Sun, 06 Mar 2022 03:11:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya7NhXOCbqGIagE53ZCTSIPIL5hGs6/ccWmxHFezSS2trgYWXGqqPKbwVvYlPcyFRrUXKq6w==
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id i7-20020a1709064fc700b006da92b2f572mr5333879ejw.184.1646565108853;
        Sun, 06 Mar 2022 03:11:48 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 03:11:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 12/12] arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS
Date:   Sun,  6 Mar 2022 12:11:25 +0100
Message-Id: <20220306111125.116455-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

ref_clk clock in UFS node is already there with a <0 0> frequency, which
matches other DTSI files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index d242bab69c2e..02589b3beb7c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1916,7 +1916,6 @@ ufs_mem_hc: ufshc@1d84000 {
 			iommus = <&apps_smmu 0xe0 0x0>;
 
 			clock-names =
-				"ref_clk",
 				"core_clk",
 				"bus_aggr_clk",
 				"iface_clk",
@@ -1926,7 +1925,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				"rx_lane0_sync_clk",
 				"rx_lane1_sync_clk";
 			clocks =
-				<&rpmhcc RPMH_CXO_CLK>,
 				<&gcc GCC_UFS_PHY_AXI_CLK>,
 				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				<&gcc GCC_UFS_PHY_AHB_CLK>,
@@ -1936,7 +1934,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
 			freq-table-hz =
-				<75000000 300000000>,
 				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
-- 
2.32.0

