Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118B0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Dec 2021 11:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbhLMLVM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Dec 2021 06:21:12 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35210
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235250AbhLMLVK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 06:21:10 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 07CDC3F208
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639394469;
        bh=xdfPDnUa/UcvSSeLF3saSWMWAAoRJzBhdsMDRnO/JDQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=cT45xyvOpvnt49ktn1vPtJ+rWa7i52BwtFfgkpC1OdRjYTDuysqdovuTPM8NvLymU
         hqZEpfYITJyJe5NWY2iUpto/2u5GkbvI54ibE5LRq8XyluDv3FvyHHB8225v3PCN38
         sw4xtnLgvma6/J6SWk62t0JOaOq/lHOVk/7l6MJLB25l0ufKeGv20cVNRfVR8ZSB+P
         aq1PjT/7kn/6B4259nbj2HcrPK1lcb8l1ovqqmtxGZ6M3QWveoCxwq28KkOyd6C+3E
         wWM9X00gYiA1GYoq5lKNJojZ03Ki3Db0cMpmeca3SocKhkhYu15YKdf0kpjejig4Ij
         95XQiCaeHyeKg==
Received: by mail-lf1-f71.google.com with SMTP id c40-20020a05651223a800b004018e2f2512so7402034lfv.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xdfPDnUa/UcvSSeLF3saSWMWAAoRJzBhdsMDRnO/JDQ=;
        b=AKlW8NDPouEwi0b5lf4DEy2BGrLiHMHuPyqruSuP+qHZc1Fw0E5a7UoHN9wlEaiaHL
         DxpBCgSv2w7bHOzt2wOivay2Oqdy1minpKXDMDcSC2O8v9KXq5XPPr/3cHoGGmYf9uCN
         SabiWquKfKBLF6MV+tqaRH7bYi+0XCLxyVbPxGYBLTK1WoVq6f/gr6cVtwKGOb2uzLkD
         +FsuDKAzWWVWTjkA/yyktVb3raDyWvMnJUiuuyYS5yk9FrgoMMLfTvpCT6QB741KdGJ/
         HLw9ePlXC+xf2+efOJalIEFYIDWKk0/INPHW4ASe39OiyT9KQbBljVlapRTDbCdlt5ci
         Ge1w==
X-Gm-Message-State: AOAM530OIpdIvReLf5qSW4b9E77V/b0ZAL/hoCIMooJr2Az/E88giAwO
        po9jqJSWPmAA7YBXZoO5o6Uf3bIRt0/hvoGfPUMeDr0zYRPGlEEgU7vHqvgRtfEE8mB5Jtp7r8K
        sd/sFJX8Em/iX+ivPBYNCjAJgSBDRBRQMVrOPnCHiUG90qg7A
X-Received: by 2002:ac2:5317:: with SMTP id c23mr28053343lfh.525.1639394468225;
        Mon, 13 Dec 2021 03:21:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWZO1hjyHi3R4CUnRLP/FUuM1hUtLtmHevibc8NPWHgNjYpl3AgKLpdoWTlWW3NXfnSe/3ng==
X-Received: by 2002:ac2:5317:: with SMTP id c23mr28053326lfh.525.1639394468040;
        Mon, 13 Dec 2021 03:21:08 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bq18sm43660lfb.88.2021.12.13.03.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:21:07 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: samsung: keep SoC driver bindings together
Date:   Mon, 13 Dec 2021 12:20:57 +0100
Message-Id: <20211213112057.16709-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Recently added Samsung Exynos USI driver devicetree bindings were added
under ../bindings/soc/samsung/exynos-usi.yaml, so move there also two
other bindings for Exynos SoC drivers: the PMU and ChipID.

Update Samsung Exynos MAINTAINERS entry to include this new path.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/{arm => soc}/samsung/exynos-chipid.yaml | 2 +-
 .../{arm/samsung/pmu.yaml => soc/samsung/exynos-pmu.yaml}       | 2 +-
 MAINTAINERS                                                     | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc}/samsung/exynos-chipid.yaml (93%)
 rename Documentation/devicetree/bindings/{arm/samsung/pmu.yaml => soc/samsung/exynos-pmu.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-chipid.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
rename to Documentation/devicetree/bindings/soc/samsung/exynos-chipid.yaml
index bfc352a2fdd6..4bb8efb83ac1 100644
--- a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-chipid.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/samsung/exynos-chipid.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/exynos-chipid.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Samsung Exynos SoC series Chipid driver
diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/arm/samsung/pmu.yaml
rename to Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 0bbd89265b28..c30a6437030d 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/samsung/pmu.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Samsung Exynos SoC series Power Management Unit (PMU)
diff --git a/MAINTAINERS b/MAINTAINERS
index 79ef55bf2ca7..8926b925514d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2554,6 +2554,7 @@ Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
 F:	Documentation/arm/samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/
 F:	arch/arm/boot/dts/exynos*
 F:	arch/arm/boot/dts/s3c*
 F:	arch/arm/boot/dts/s5p*
-- 
2.32.0

