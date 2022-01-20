Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F554C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jan 2022 20:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377630AbiATUUK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jan 2022 15:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377617AbiATUUH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jan 2022 15:20:07 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95770C061401
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jan 2022 12:20:06 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id s30so26010279lfo.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jan 2022 12:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pw1RtCNR2WInVJgGie+Q591Om/Vjp92bOiH63X22+is=;
        b=FAdCTNmkHImYatU6XdpAhSzDgjpEHYTA8ykjZkL8qQEwt8M3aGeEkFew2DxyYDo6S4
         clRFhXaNpa1+MvZ8/upKHqiLhBleahsBjGp6tcbdWPsg+qiTp43SFtaujb7+uBS4Mgek
         SexbAtvOX/BaIeXgG5eZf/ZMWrhW33TwD1t3jTa4H18pqPjGSBTPGBEcM3Bp4opSJMZb
         HVRJp2m6N0zdFXwLGXlCvot2JLouKrJsrtdfMUU5H8mh5TFf2lSGTQeFBtEmAMdbWB0C
         r4VbzJixNVw618ma7tF3/l7cNZQHjHzcnzdWNdHhgyxG+l+ONcIRukEw51/BNDRgGjbI
         Xvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pw1RtCNR2WInVJgGie+Q591Om/Vjp92bOiH63X22+is=;
        b=f6qZdaAtaYzV+fp9+PhhZOHQRuBKflWL2tIM3zqKh4Y/ARZTivmxVnzougqV11Vgie
         UIBYYYoOwG8KWlL73aJn20Qr5+1DioCnvYk2ZGaVGSGfzE33aKDH9cVbZVhfyO8slwNA
         qzveRD/iCQQNyABHPi/1bJjN+JWOsIxzFeCXHBX5SDGE070o2wdOorEgukJKj+YFXbSX
         NII7bN0YByIiAH9dEM2p7Idz9B/gYmTGVYC36pCVUjtrwezw+Fp93UfEFfr8D+krDdDH
         iiVW/xp4NdezMWrC6wuOD7dePF4pPiow6ypyf3YFjtndIS1g0CIMXS2v4keoc1ouQmSx
         GoVg==
X-Gm-Message-State: AOAM533xPw/301RVosnD6axgt4BOvy1vSHwTlCp0Jts58TnvmleqvOTb
        xOk9C/eM2Hm7qHr0lOGZguosrw==
X-Google-Smtp-Source: ABdhPJyRbihYr9cGQwla7AU56lEI70374A+Hs+FgskQxGyDvi3BiO6ZqsqY2fvBEWKGvjsTKNn1jjA==
X-Received: by 2002:a05:6512:74a:: with SMTP id c10mr750754lfs.234.1642710005001;
        Thu, 20 Jan 2022 12:20:05 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id h4sm21716lfv.220.2022.01.20.12.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 12:20:04 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Hyesoo Yu <hyesoo.yu@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Jinkyu Yang <jinkyu1.yang@samsung.com>,
        Alex <acnwigwe@google.com>, Carlos Llamas <cmllamas@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Erick Reyes <erickreyes@google.com>,
        "J . Avila" <elavila@google.com>, Jonglin Lee <jonglin@google.com>,
        Mark Salyzyn <salyzyn@google.com>,
        Thierry Strudel <tstrudel@google.com>,
        Will McVicker <willmcvicker@google.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [RFC 3/3] arm64: defconfig: Enable sysmmu-v8 IOMMU
Date:   Thu, 20 Jan 2022 22:19:58 +0200
Message-Id: <20220120201958.2649-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120201958.2649-1-semen.protsenko@linaro.org>
References: <20220120201958.2649-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 30516dc0b70e..bb03628b5e25 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1033,6 +1033,8 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_SAMSUNG_IOMMU=m
+CONFIG_SAMSUNG_IOMMU_GROUP=y
 CONFIG_REMOTEPROC=y
 CONFIG_QCOM_Q6V5_MSS=m
 CONFIG_QCOM_Q6V5_PAS=m
-- 
2.30.2

