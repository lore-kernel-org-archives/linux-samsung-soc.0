Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A5CC4320E
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3DB861042
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbhGaJY4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Jul 2021 05:24:56 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47750
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233114AbhGaJYz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 05:24:55 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id B4F8E3F22C
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627723488;
        bh=UFrU0S2bBX7EdA6lqG0g8Nn8+OpcqLpY1eSVFyrsvVw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=hv95Psv5VXrVqAf1wWO9neBwg+KWuLRry5vuxP1fNi0TqlVkruhI8c5vmQ8vlLDYn
         Q6yNpTCW1fpqRg6uEgs6J9QVsqu2wj22m05kSz5uP7A8qgXVxwnpaGAE33EFAfBsRO
         wW4acWNEKrAYwN6yCbbmbgpmHbqHDGkVKCVUAfuUYV8K2T5qjbd2hpuKTArf0VxH0C
         ZoAk29tsH0TR4ql8beHYvS1se0LuX2cvNklJjV33dy1dCI2Hxr1GEPZDybQ/sHNTlA
         M6fIsSWQBMGc3n7dBt8oKALFpKQw9vjdRNZYjfnm4/qiHd2utTtA5EW787/Co9KLzR
         d65b61F1mnzGg==
Received: by mail-ed1-f69.google.com with SMTP id k14-20020a05640212ceb02903bc50d32c17so5924920edx.12
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 02:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UFrU0S2bBX7EdA6lqG0g8Nn8+OpcqLpY1eSVFyrsvVw=;
        b=eYKvrdPzre8g0mRsU+SXeVrc/jrIEuTCSQoTRK1A2LLStR+FLMcOC5WHj9X0G4BcyB
         0EYe4wXtjwaM66mA9gvZ1kFDZd6+QRwcB4tS0vI5r5TlBqzXL+F7zRHvmp2PBUWFOH/y
         2DvyvlOPyARwa8+fAkYjhnvozvHnC0levqlzz89YFCWY00HM2xbo2j0K7KTeWX0Aqiiz
         wU41FkPm1y9n6Has9DYuus0FqndUtBhVp1lcU/mNDP0qSItQUx338PH0TxCDKa0LDgMe
         kEAIAcf5I5HrBM3jKa88Bn29NV0EQjUEE5JE1UQmDUC3AD6CwdC5gDFSQ8t975ptDD1u
         5Lzw==
X-Gm-Message-State: AOAM533MxuhWq8m7SMeejyMlB2/DLoangCzl2jRd5JKovDXQAmWTkPqr
        mu7MucMmyNackmYAEveyTbO5ZWxav7B7TMRgq5f3PLq/SnWef0MS7y00X2Ea5ziEluz0q/B2nx/
        yotZuTpt8MFi8cpiR70uhbv2GKxBQ1bZ73bn76eZAhBWzn+Nm
X-Received: by 2002:a17:906:2c45:: with SMTP id f5mr6578238ejh.464.1627723487952;
        Sat, 31 Jul 2021 02:24:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1xUNY9MDqXQPMmbYu8q3NXm6Wwff2iuWqe6SEijIFM6pC3pnzQBfwNFCRmBOiJeVKeItFrg==
X-Received: by 2002:a05:6402:40d4:: with SMTP id z20mr1261891edb.89.1627723477052;
        Sat, 31 Jul 2021 02:24:37 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id r16sm1947693edt.15.2021.07.31.02.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 02:24:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 3/8] ARM: dts: exynos: add CPU topology to Exynos4412
Date:   Sat, 31 Jul 2021 11:24:04 +0200
Message-Id: <20210731092409.31496-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
References: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe Exynos4412 CPU topology.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos4412.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index a142fe84010b..d3802046c8b8 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -35,6 +35,23 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+		};
+
 		cpu0: cpu@a00 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
-- 
2.27.0

