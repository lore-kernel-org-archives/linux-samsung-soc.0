Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13371C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 15:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbiBVPBS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbiBVPAt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:49 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FABB10E57F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 07:00:03 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D596C40253
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 15:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645542001;
        bh=5q3Cvfs96FMgD3OViDSeZ+rSi5cV583JAJ+X+hKXLOQ=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nvdcbnQ/xZ0r/RwvKIgZjHzAx3TJAiFIdoDMzVLTuLmTgk2SudTNQ/zerpVZye1ry
         vbySq38AVmiB3qAKeGAdfUifhW6BlX1WZtmZ63fl0RCi7BU7C6jkNQrCjgAbcSefu7
         GKeafwVaWoWWMLyRqaM2hg8qZC4sPwnUSdtgTOTD1GLvFncixf+4o9dlUEHtSt7Cpm
         ZAR6q/fQ2IJC/OCvEu16LXK34c3BnlNGU0eQtQGD4iRB7WfYP3c8JNZF+HJbxft8wu
         vkBX0ZNmkTjcdZKVmsAFAObQqUoL1e4nMsCR7RRiAXTA+ytFjSszY5ZkGqxbB6ny+6
         NQxsD6tWpP4Rg==
Received: by mail-ej1-f69.google.com with SMTP id mp5-20020a1709071b0500b0069f2ba47b20so5803387ejc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 07:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5q3Cvfs96FMgD3OViDSeZ+rSi5cV583JAJ+X+hKXLOQ=;
        b=Saj9yvuHUMzqc48x1gmBTpiugWwUufKBPwT7G9CAiQKRKboDyBb4PXi0rSxVaCNBFq
         8thp4XzxUSDIt2JqoLpitUv1shboIyP0L52q3R9GXNji7rA26WsvHl9G/JqLrxE+OnEN
         w2kD7TT9CbeUD9FRtBWbejIuOl/q4lNEYnYwi2z5+dJdqDWT+BhEL+zMvScd5ziXkmLQ
         XK3aLmB+eNmuAS5KBCFGhMEhDw//ma7stDT5Id/6kos6A4sGurXd7TXEg6MkJ+UOf7TO
         YVt5+1aQ54AtNXx/hpykcG1NkWxg3SJokJEcvjDI9aNcXAC0Je44W4NaQxKAh7yim4AA
         c69g==
X-Gm-Message-State: AOAM532MKhUNjReRb+rFulqM5Zk/hFRCE+eQ3QMUxmAgJZPRsFXgIsL2
        b21P7fvUew7VK69Gv2RbxQFMaizb7frQBis2Xa0kMPJslWX5Q9TMFN/r9yNNckMnEnGnlvacau3
        POP7X1Ex6XduYz3PAc4w+8ziJYHDS5OtlhUJvHNAoAvxirz3j
X-Received: by 2002:a50:e144:0:b0:410:d813:92 with SMTP id i4-20020a50e144000000b00410d8130092mr26862693edl.9.1645542001205;
        Tue, 22 Feb 2022 07:00:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMw582wnovmDAi/CIh3lxLYM2LG2ODyt+mkZ0ZiJXVQxrV8hjaQpoxhGRnSRAJris1bHJ60A==
X-Received: by 2002:a50:e144:0:b0:410:d813:92 with SMTP id i4-20020a50e144000000b00410d8130092mr26862658edl.9.1645542000976;
        Tue, 22 Feb 2022 07:00:00 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 07:00:00 -0800 (PST)
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
Subject: [PATCH v2 13/15] arm64: dts: qcom: msm8996: drop unsupported UFS vddp-ref-clk-max-microamp
Date:   Tue, 22 Feb 2022 15:58:52 +0100
Message-Id: <20220222145854.358646-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The property vddp-ref-clk-max-microamp (for VDDP ref clk supply which is
l25 regulator) is not documented in MSM8996 UFS PHY bindings
(qcom,msm8996-qmp-ufs-phy).  It is mentioned in the other UFS PHY
bindings for qcom,msm8996-ufs-phy-qmp-14nm.

The MSM8996-based Xiaomi devices configure l25 regulator in a
conflicting way:
1. with maximum 100 uAmp for VDDP ref clk supply of UFS PHY,
2. with maximum 450 mAmp for VCCQ supply of UFS.

Since the vddp-ref-clk-max-microamp property is basically not
documented for that UFS PHY and has a conflicting values, drop it
entirely as it looks like not tested and not used ever.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 7a9fcbe9bb31..3ade756e1cd9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -341,7 +341,6 @@ &ufsphy {
 	vdda-pll-max-microamp = <9440>;
 
 	vddp-ref-clk-supply = <&vreg_l25a_1p2>;
-	vddp-ref-clk-max-microamp = <100>;
 	vddp-ref-clk-always-on;
 };
 
-- 
2.32.0

