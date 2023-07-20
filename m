Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBE7EB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jul 2023 14:15:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbjGTOPq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jul 2023 10:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbjGTOPp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 10:15:45 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384C52130
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 07:15:43 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98de21518fbso152540366b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689862542; x=1690467342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s1eL6ou30S0LTWBf2ctKzmWNJYDyrMM+62kAi59wxTc=;
        b=Csf5vUphxxPezEj6X/HKWjmb5Ijqctg+O90d5Di9tQWsF1UJpZiZjoyKk6PBt4EGnq
         IHyk3WB2mhSwQPoxH3gy8yq3drc1BO21O3ULRW3KT0uqR/AjeXpACh1UA0Z7Gk/1Ltvb
         iUcUznyntxrudPUZtIeZwiYg52wPMpnC0k5z1y0lQCAVMTHa4x2gWnwoNtSG4NhsYLjB
         iNLZa0xrJlXm3Hd1LUrdeXvikOmOFtdk3l/GTu9RaJTEZsYzeZJPukAUyPTjWeHquHva
         ZZuykHrMFgSxGaArK2+1JheJ1iAaRrF35StlGK/lKNr51k/59Ksd6WmU8wkCYMymvoJY
         V5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689862542; x=1690467342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1eL6ou30S0LTWBf2ctKzmWNJYDyrMM+62kAi59wxTc=;
        b=dlcU5YvRKTC23rU+reNTQ1RmneLQTqwTxPQ46H3EEajrtZkSXE9H244C78SIHcihlv
         Ctc2PvKl+GCB1DIDq5mx5yZAD5Fmw05WvAXVsPDzhzpmnoPUKGR+k/jailuHb0GjkmgN
         qJMIFimtWdGZgNybqFK8YokWbcuoh30xFkyqcIsrkQgPdhAqSk4tQlduDV+MDyyEnEOd
         0e0A5Sj2NEW+6WMcOmga+Lh7r9HLjLeTu1cTzSNekijTEtJ5gpv5OW0X+U/lGhOG7x6L
         1y3TgUpf1KR+EMPlSW00jYUxBFUOgvjanpz76UKzqDN2wqkNrs56xLZTuAuHcsTZUTCp
         buwA==
X-Gm-Message-State: ABy/qLardR2C+uaNC00tbJvfdXuvE18fJzuGuYR2x0ynCWd2B0wJGbVX
        uRBm/j7XkfszYwt40fAWaz1uuQ==
X-Google-Smtp-Source: APBJJlGXM58shUkfT8f7zvBfNW7Tvgas63QMlwJPEnjw/oUQAhYfq9PAp9XxpDqkEZ5FsdFRO54xiw==
X-Received: by 2002:a17:906:cc18:b0:988:d1d5:cd5b with SMTP id ml24-20020a170906cc1800b00988d1d5cd5bmr5272688ejb.75.1689862541743;
        Thu, 20 Jul 2023 07:15:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id d20-20020a17090648d400b00992a9bd70dasm783473ejt.10.2023.07.20.07.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:15:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Artur Weber <aweber.kernel@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linux Kernel Functional Testing <lkft@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH] ARM: dts: samsung: fix Exynos4212 Tab3 makefile entries
Date:   Thu, 20 Jul 2023 16:15:37 +0200
Message-Id: <20230720141537.188869-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Makefile targets are DTB, not DTS.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/linux-arm-kernel/CA+G9fYsfziBmQGQMGAKojhemCXssFyiNgk6aNjVXpJNNFh_5mg@mail.gmail.com/
Fixes: ee37a457af1d ("ARM: dts: exynos: Add Samsung Galaxy Tab 3 8.0 boards")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
index 4469ec147ca3..7becf36656b1 100644
--- a/arch/arm/boot/dts/samsung/Makefile
+++ b/arch/arm/boot/dts/samsung/Makefile
@@ -9,9 +9,9 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4210-smdkv310.dtb \
 	exynos4210-trats.dtb \
 	exynos4210-universal_c210.dtb \
-	exynos4212-tab3-3g8.dts \
-	exynos4212-tab3-lte8.dts \
-	exynos4212-tab3-wifi8.dts \
+	exynos4212-tab3-3g8.dtb \
+	exynos4212-tab3-lte8.dtb \
+	exynos4212-tab3-wifi8.dtb \
 	exynos4412-i9300.dtb \
 	exynos4412-i9305.dtb \
 	exynos4412-itop-elite.dtb \
-- 
2.34.1

