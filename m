Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675D2C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Feb 2022 18:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242898AbiBSSnb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 19 Feb 2022 13:43:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238402AbiBSSn3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Feb 2022 13:43:29 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC54227B28
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 10:42:48 -0800 (PST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A2F6D3F1B4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645296167;
        bh=eds4hwJvnu4NA5qKYzbOl5rJlIyGJooNPDbjWhSXxPA=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=KTvco26jXKx6bMJ5JCrURfCo/BPBG6ItpOzalBt2G15sNi5go+alnE6Q0Dc+Iu9/V
         pmzfcwCp8r6p++3gePzMlJSuDvuZLOfKRq7qwAb3M5dlFewAbl7PDaSItSWACGCv9Q
         uQzoK68Cjmy/JXY5L+DUUBRKenVS6ERfYbzw3Ub4doXEf+iHDVffdfFkYJW8c3qmGb
         FoUdOJLs+P2Sdz4kj8xWKuEN+nhW87ag7x+HiQFZo3xNUA8HQ3TSPEdOBhISH/+czl
         bDGFTM0Wh9zlyqdh1lNaAjGk6ecBLctWPrVoJ4XlK/jVrHKUVV6WWlSUm/MkffzUtM
         i37QeUym8TUfA==
Received: by mail-wr1-f72.google.com with SMTP id g17-20020adfa591000000b001da86c91c22so4933373wrc.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 10:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eds4hwJvnu4NA5qKYzbOl5rJlIyGJooNPDbjWhSXxPA=;
        b=RkkQKGR7E/k5+iyU+rzG+EdgeIp72wEn0e3JHlCImymQxx8IipO3Sz49fpE4RAwRSM
         GIRPn4V6gpelKb8Id1hOHmEYuZnGQXOFG37zJL6Dkta5JZ5qsc1SQOGJTqvYqC0oTDqy
         zFQcXe0YKfeMUMImIzTfJ9WcEnz7d/TikMd56PdPkSHfNP2thHkE0DPA7W/xIkx4CFw0
         DTrMncp93bGkfRmNqRPxK5Gm3D2Qv4huFERFPDVIsiz6szWbzbciI/Pa3FCfVgZFE3Nd
         opaPhnmbZ5QU2QNW9dioKeHIYAgPdwodYCvIFKqEqQXN1T/DsAoAqoVlgXjywg49IBOZ
         zGIw==
X-Gm-Message-State: AOAM531bmVsZBRVX6Wnmn1J334mlBdmPuTrk3ppRVL+/boK0zghUpuZ7
        sGUOBqDZvjX3bDWg/NB0IDVLawtSX+rXZogw6Hp58lPjBEIFLlEMJij5AlLKUS6U1cIkFABDa3K
        cc8iSXZT9qosAF3oakrywV6PtGGzvgVTMU0u/+ZG6mWaqx/6v
X-Received: by 2002:a17:906:8557:b0:6cf:2730:b5cf with SMTP id h23-20020a170906855700b006cf2730b5cfmr10757182ejy.368.1645296156513;
        Sat, 19 Feb 2022 10:42:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiBlObuIE4yboQDPgcUgD7fnjCG8ClJXJKKeDYvCOmZcNc7+X05uMuAKMAKm2NUzCGxOVM8g==
X-Received: by 2002:a17:906:8557:b0:6cf:2730:b5cf with SMTP id h23-20020a170906855700b006cf2730b5cfmr10757162ejy.368.1645296156345;
        Sat, 19 Feb 2022 10:42:36 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id j8sm6680745edw.40.2022.02.19.10.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 10:42:35 -0800 (PST)
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
Subject: [RFC PATCH 6/8] arm64: dts: exynos: use 'freq-table' in UFS node
Date:   Sat, 19 Feb 2022 19:42:22 +0100
Message-Id: <20220219184224.44339-7-krzysztof.kozlowski@canonical.com>
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
 arch/arm64/boot/dts/exynos/exynos7.dtsi      | 3 ++-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index e38bb02a2152..beeca27a7415 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -656,7 +656,8 @@ ufs: ufs@15570000 {
 			clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
 				<&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
 			clock-names = "core_clk", "sclk_unipro_main";
-			freq-table-hz = <0 0>, <0 0>;
+			freq-table = <0 0
+				      0 0>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
 			phys = <&ufs_phy>;
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 807d500d6022..0d00543952c6 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -311,7 +311,8 @@ ufs_0: ufs0@17e00000 {
 			clocks = <&ufs_core_clock>,
 				<&ufs_core_clock>;
 			clock-names = "core_clk", "sclk_unipro_main";
-			freq-table-hz = <0 0>, <0 0>;
+			freq-table = <0 0
+				      0 0>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
 			phys = <&ufs_0_phy>;
-- 
2.32.0

