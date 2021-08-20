Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BC5C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 08:22:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A985961075
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 08:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhHTIWk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Aug 2021 04:22:40 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52468
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230036AbhHTIWj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Aug 2021 04:22:39 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3AFF93F31F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629447721;
        bh=zRZhmaoGMcaJaPICPE6TccctvOp1vsbXc3aVSfmVIbE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=rQ5892GPZwMMlIScCxglwlow4m5iWOwPyDRePbhoKAJBA5N9dOjvC548BxOv1XXHn
         W6L/xrFInO71zOfuKeWKlV+zQzL8i2wd0Jegoolx3Iocd1MmcqIPjymFPheH1OLA6o
         7REIDM1iwCIpQ8G6HPAbJVg/ohRvED4FaOLPaqb6JjwoNDXh7k9PwblQxvJ8zDK32y
         9Sy6EoGPuDTiM7bnmkhXOsi6oXezDC/1sYe4HKvJhToNBOeL3766Ofs5UftZ3HkJGR
         ow++oBty9iyZvikMtmw/njHFOwgA2CbF4R+icZzIovccYHhs7vD671lIA0EYLfc21V
         XmO4ggVZMrb0w==
Received: by mail-ed1-f70.google.com with SMTP id eg56-20020a05640228b8b02903be79801f9aso4140601edb.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 01:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zRZhmaoGMcaJaPICPE6TccctvOp1vsbXc3aVSfmVIbE=;
        b=sgSDb3Pi7wfWIrD9ZCxUowTk9wrvwM3F8Io3QK/sMFgwdeP6XYFEDxyTBvrnhBVm1L
         RbKuuBrkYaJH7X+TBOXxaMYHEBtjzlSzVjaZtxqLmlR8j2WEy08u44Qc+yGB3Jew0DGA
         FTzM3fbxhN5IKwoHOFXgMR3QORvl2k0832A92xUXum3D20zmP/IqGrrOw4EfVacCFdpN
         Qqa37ZkZ4ZlV/WrNbquEu7F4WY5eG5usti2chNWVVqqnqIr8AW9l3kajQKhleF8FDQLy
         wdS1Q7eZ39/QHdRvyOE5gSgfrmoRVJ2VYnD5/VIGbTa8Ox0O57DsJvjFhbzmI4pUmban
         eZhw==
X-Gm-Message-State: AOAM530n5Pkfgb4tRAGL9tnnQ33ltMJLcy+c9/Pn3dattAVuQzkuhd+c
        v6EhPD41JAlAihcWXeVd83FSDv7XKH29SlEWdniUhvvRshNYHvY8U8jM2ZjCH2zi5nOzt1JgbWD
        NGLcjX7bRFEQFWQW5LmHeTnE3SBpzPEIcVxCZuTRLzHz/Bp4/
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr20169708ejc.384.1629447720948;
        Fri, 20 Aug 2021 01:22:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAyekGLASdxDEafoqSUOhMjIYn/jPWLNXMGYNah6D8jucmIcX+tfF1GfJUYM85M9JtgxJDSA==
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr20169697ejc.384.1629447720841;
        Fri, 20 Aug 2021 01:22:00 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id m18sm3162922edr.18.2021.08.20.01.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 01:22:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: exynos: add proper comaptible FSYS syscon in Exynos5433
Date:   Fri, 20 Aug 2021 10:21:49 +0200
Message-Id: <20210820082149.84613-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820081458.83406-1-krzysztof.kozlowski@canonical.com>
References: <20210820081458.83406-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The syscon nodes should come with specific compatible.  Correct theh
FSYS syscon to fix dtbs_check warnings:

  syscon@156f0000: compatible: 'anyOf' conditional failed, one must be fixed:
  ['syscon'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index ebd5091d68b4..4422021cf4b2 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1132,7 +1132,7 @@ syscon_cam1: syscon@145f0000 {
 		};
 
 		syscon_fsys: syscon@156f0000 {
-			compatible = "syscon";
+			compatible = "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x156f0000 0x1044>;
 		};
 
-- 
2.30.2

