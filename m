Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0D8C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Mar 2022 11:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbiCFLOP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Mar 2022 06:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbiCFLNo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Mar 2022 06:13:44 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF32E4991E
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Mar 2022 03:12:34 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B90153F645
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Mar 2022 11:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646565143;
        bh=vMFnkOH1WJAajK2DqdRDAa0cLEGNFmbkS8Gtp9GKvtI=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ROITc7eFLwKZ1Pm+liD2ktDOHo5zpukQwDKcj4HhebsQk9Fg41Ue0ZjjEjJqzdvER
         HrgoAhgRw9i1kfNU7gon5pjjX8eCZW1oTExKZ1p4QeIKNW1KoGtZ4c2N5aDBOHi/Fy
         VUM/KXV+ofHi8rn5sTKu3gFQtYdDCO8spcJp4yUpXwYYvHSVhjARV6asrOISzc+aqn
         alB0PXyb7jDTtImkUzd21v1xtHzZTdHzqvkrXtocdCGn0HKQFihNbeuCbdN+5MlFTD
         MQ3sG4uXslJcrARGbkl8/HEAOVsEg+6YNmMbdcstZlbqqAWln7aGc7pAzHUpJpz36C
         52a0WVy1RO+vg==
Received: by mail-ed1-f69.google.com with SMTP id l24-20020a056402231800b00410f19a3103so6761504eda.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Mar 2022 03:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vMFnkOH1WJAajK2DqdRDAa0cLEGNFmbkS8Gtp9GKvtI=;
        b=tk60rPjIrR3yk57ZA1wX6ZfHOogoT7oia2+PsOwWmfqZEkrCcMXSAAleS61Wypl1XV
         qX2RYx2kHMN8Q2NcA6e7e8wlZYreZrMcUlD6ENoTdbfeR3tt0K+E6vgBHmn1+Y7tX7sg
         6SnX975sjRZU2sFPI788ad8XWKObkVD7xTBzQYK3ALrJTU+GImyMb8eaKpU9dRA7vka8
         AYna8uXMVdWz0gI1T9UwqIIXLRnrz8VkOMNNX3/8cRoZ1ykBdXnakSiQO3j6IBAdlEhd
         64E7Lfe+QPtIY6N071pJpAUWNwO+4GtdiWGScL1Hv2R5lIHSbSxGxg5bU4tC7Q/vInEO
         5neQ==
X-Gm-Message-State: AOAM530UDx8mmaxmq2bhRQREY7adVHuQIwpMpOyZ/lzpHelraVXdp/aW
        R5InHCAlmwA2vrLxtuxXRix4pPo/8CI6IyWehkKBTLfYbXXsqWH3hQ0Qs2aKJrnpwydAM+hVekg
        r7EB0e7Uvmy76malPPaII+iSuWN6ugKUtBOd7BLYQA623/7mw
X-Received: by 2002:a05:6402:2d8:b0:416:34b0:5d5c with SMTP id b24-20020a05640202d800b0041634b05d5cmr2294046edx.6.1646565107741;
        Sun, 06 Mar 2022 03:11:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTQ1jrVfZZl3Nu0dKHXWLrV//RroIxSgPbz2wvMOZz/2cmoQu/ylE+3YUml5SvnaWO1iXePw==
X-Received: by 2002:a05:6402:2d8:b0:416:34b0:5d5c with SMTP id b24-20020a05640202d800b0041634b05d5cmr2294031edx.6.1646565107595;
        Sun, 06 Mar 2022 03:11:47 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 03:11:47 -0800 (PST)
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
Subject: [PATCH v3 11/12] arm64: dts: qcom: msm8996: correct UFS compatible
Date:   Sun,  6 Mar 2022 12:11:24 +0100
Message-Id: <20220306111125.116455-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Qualcomm UFS bindings require to use specific (qcom,msm8996-ufshc)
and generic (jedec,ufs-2.0) compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f0f81c23c16f..fa491f2271ff 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1730,7 +1730,8 @@ pcie2: pcie@610000 {
 		};
 
 		ufshc: ufshc@624000 {
-			compatible = "qcom,ufshc";
+			compatible = "qcom,msm8996-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
 			reg = <0x00624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
2.32.0

