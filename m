Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA4EC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:49:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C9196115C
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbhDTQuW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49789 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhDTQuV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:21 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZN-0003Uu-Ih
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:49:49 +0000
Received: by mail-ed1-f71.google.com with SMTP id i18-20020aa7c7120000b02903853032ef71so4521615edq.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lf3R3UlD7H86mpi6A7mTNMrbIdtgoRuo/+qKw5ATzUM=;
        b=Nqlq1O4lnNYI9lQuAVGnndJPU357eMfIb6hVHftTvwkjsvWfP5x3x6tVJl7tfC2h9+
         96bnaw5g/MYh1aTcNf7m+yovySP/VU5cQrdO70lzHDAY7AKBkYKZOeVoXwYC3C9/OASv
         /E4o5PerFWBKA1L4ozU5tuKn/cqmyLV9c167qlkH24JIOhGVWedf6qn/rPHC28QfI77o
         M5Dab4UtZDl9fPRhVpO03EhXckH9AZilcZ3C8dYkbGTlYyAKL+b4XxndVgI3nW1y9QZ8
         yB7K6+cu3lEu6uCFAUStqOPd3f8En3TpN9oe4MowRGKMIiwfSSnAqmGPeB9LeGrbod13
         qpzQ==
X-Gm-Message-State: AOAM5314KMW5pBxEhHnWD9Clkon1xLQctQ7yTckq3CKHXsAfTdumCylb
        HEObS8xiCFAppdN4lXTW265JloPbgswpoRQmgV0UQ2+M9lFSMZC5RKlaJTD+T9pndM6Ht1vU8/f
        uMaCHkXMvjXQtEMkZ4STsg25GeM4kRZUZsb6XKk90VoKg10XY
X-Received: by 2002:a17:907:3ac1:: with SMTP id fi1mr28609677ejc.139.1618937388090;
        Tue, 20 Apr 2021 09:49:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqnsgxDKVVF3jVQIl+y95qKX0R7WnE2ZWOWN34qb+/L0a4hZg40fBDZLGnkF70sm5SFbLapg==
X-Received: by 2002:a17:907:3ac1:: with SMTP id fi1mr28609664ejc.139.1618937387922;
        Tue, 20 Apr 2021 09:49:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:49:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Itop Core
Date:   Tue, 20 Apr 2021 18:49:33 +0200
Message-Id: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The RTC on S5M8767 PMIC can wakeup the system from suspend to RAM.
Add a generic property for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
index 4583d342af39..b3726d4d7d93 100644
--- a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
+++ b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
@@ -163,6 +163,7 @@ s5m8767: pmic@66 {
 						 <1025000>, <950000>,
 						 <918750>, <900000>,
 						 <875000>, <831250>;
+		wakeup-source;
 
 		regulators {
 			ldo1_reg: LDO1 {
-- 
2.25.1

