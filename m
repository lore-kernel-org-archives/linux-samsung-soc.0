Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13003C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 15:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbiBVPB6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbiBVPBO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:01:14 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1658110EC77
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 07:00:10 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 99264407C6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645542006;
        bh=YBEC74wb9GPpBj/B6mQOA+S5GClKlTxflH8/ImjOGfA=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=jo9w8bIUs1C0Izyrk20saT4XLdL7BHlv4MJO36EJKSYbA0Og1rc4uUaxx9W+EuTUo
         4wPFh0kfuXNGy8dXgp5ZOiD9W/nwhW215rvY0Fp9gs2M1S3BHvW5qXsyOzrFQD7yXb
         Pw+5qxdXV67fxHKbKPti8LAekLY/KnbtxZYPkNsmfM05n4+427mKNvzaWqSsB+jlAu
         mbbVwcdS0PymwLrQoJo3AbfBDZG7SYM+SsgrK+0RUf5HdL6h02hMuAYK3DMBwy71hK
         L/eArnBF2h3SjHfp2V+q851xGA0hUZUa8QaIN1RVkQqnPekciMA5+IGfLy4Oc9gp2L
         ZBDKmo++3siZw==
Received: by mail-ed1-f69.google.com with SMTP id e10-20020a056402190a00b00410f20467abso12088312edz.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 07:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YBEC74wb9GPpBj/B6mQOA+S5GClKlTxflH8/ImjOGfA=;
        b=Xj7k3N6OqfYrlEKPzv2aB9LJojM4w5qeRPYN/unr9Dpn8czN0sgq1wO3ISIycsnURM
         5EuwbMcjcbw8nm/A2GZfF7KaQNaIsvUAeun7DDKQc7XLoeCi2jzO/TvJSoidC65pLnod
         IZHY7Zwz6atQeTV0qtllpAalksXV+aS9kfAvaJmUS771nXYa7avJV7zz8RnltwlefVlK
         JX71irvhXYsQiNDQtzU9H+AzaMo9vqV4CyWCCK1M/haSwZLx4z70djJSySwxwIz8+CY4
         m6qyGNFLF2Yf908ekSQck12tvL26FQU/oOAz3MFDbPAeA3OeJAIWQ3W7UmoUgA3akSmh
         hvZg==
X-Gm-Message-State: AOAM532q6xXp/Bzv88lEHGyOldp5t6EErc6pP2ZI3aD4x2g+x+zNcGF0
        RxIwFx6yORADhzkoc1i9U4ItOYDJNTuu4GRQZ9qQJC8B/GNFTz+qd4U3SFGJpM6RTM/Fpf4o4W6
        V0466923Ar18ufmhujgXI8NBjZQrkek4S1A4oyz5QtS0eczfm
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id o6-20020a170906774600b006cea12e489fmr18914894ejn.551.1645542003129;
        Tue, 22 Feb 2022 07:00:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLi2RkpjMH1XnBpd7ijPxBtJkEM6ya606jWmcrmuPZusdxAuidRgjMaupSJDwmi2J8JqbfkQ==
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id o6-20020a170906774600b006cea12e489fmr18914869ejn.551.1645542002826;
        Tue, 22 Feb 2022 07:00:02 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.07.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 07:00:02 -0800 (PST)
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
Subject: [PATCH v2 14/15] arm64: dts: qcom: msm8996: correct UFS compatible
Date:   Tue, 22 Feb 2022 15:58:53 +0100
Message-Id: <20220222145854.358646-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
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
index fad1bbfa1c0a..f25c68511b64 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1728,7 +1728,8 @@ pcie2: pcie@610000 {
 		};
 
 		ufshc: ufshc@624000 {
-			compatible = "qcom,ufshc";
+			compatible = "qcom,msm8996-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
 			reg = <0x00624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
2.32.0

