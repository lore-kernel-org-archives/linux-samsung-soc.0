Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1584AC6FD19
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 23:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjCHXJg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:09:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjCHXJf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 18:09:35 -0500
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1BD62860
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:09:33 -0800 (PST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-17683b570b8so440025fac.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 15:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678316972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BSUy9pqri34RafzXpduDuTiVpZ9W29iQLOdXi9MBbjc=;
        b=W8Fgv56006OYf+0vMpu9nCC7xSYySTNCf0Cq58RxoqFSqWBy3WHUMo0PhtBQmLY2Qh
         JBGa+5hpuL9dZLX2aVOx8lBr+srtTvlGXu/f5ZhjYUzyfKmBBoOY6kENHqWDKBYixMr8
         FwNqVkzrAsR9lMFG0iRbN1LRBTVvPDsVGalUcxtRqIxTbNSDYNy3TW30lH5qZ6LvztCE
         F0Y3hoAAkI8Sb108QzNayVfT7Q4aN+ra9IjCZRR4WrsD1VUETaceIp4CHoa3OyrIBt1i
         ucAL1bOZqlOnn/rLQ78+Ah6f1T48YKRJ5BG5y4Sf0bsGSjpqhaBNSD36Aa4buBlYA1O6
         X6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678316972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSUy9pqri34RafzXpduDuTiVpZ9W29iQLOdXi9MBbjc=;
        b=j24qMh30BDPukwP3SycP5AFk7iZpbs85fK4l4YBBq3RBoaW0fuSSDl7t1O1sPpNtBR
         5RpfzHuiGh/UQQBITrQh8fHGSMWJDnUWSSpHcS0bAIglOXpSVQXmJ6ssJGP+RuktsbD6
         nODfpMmyz5w+BtYIqr4tJtIv6e5KCDesPc/VSkByIxHkZ2d1dQamUk9FO2LfRGJueW45
         PN+qqE0s4jADCh/C9DSaNtVepYaRB/IdvIYMt4Vnzo/4ZSt9kMA84B3hD7TQEowJQzlL
         YTqFKfiwm76ELc90SIcS+OF2tfdtdGElIP7iPtU3zsmtBJfL7lYTBFNqzefv5o9zb+al
         APWA==
X-Gm-Message-State: AO0yUKX8/Qo2TZyXd3GI3Z+XaKUlAbp/mNjw5pA45i7LEtHU95BqWp/B
        diOa6BllPWYko0q3Crqjh/+n4A==
X-Google-Smtp-Source: AK7set8N1gB2a3Ev0DG0ifVpKRpIm2ymT29/NKvYWTyo6j5FanN5C+/s4trt5ujy9fqa+Tgwue1MVw==
X-Received: by 2002:a05:6871:6a0:b0:172:55c5:780 with SMTP id l32-20020a05687106a000b0017255c50780mr12841967oao.23.1678316972450;
        Wed, 08 Mar 2023 15:09:32 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id h21-20020a056870d25500b0016e9308e17bsm6704527oac.52.2023.03.08.15.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:09:32 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] soc: samsung: pm_domains: Add Exynos850 support
Date:   Wed,  8 Mar 2023 17:09:25 -0600
Message-Id: <20230308230931.27261-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Power Domains in Exynos850 are not really different from other Exynos
platforms. Enabling Exynos850 support in the PD driver is really just a
matter of adding:

    static const struct exynos_pm_domain_config exynos850_cfg = {
        .local_pwr_cfg = 0x1,
    };

to the driver. But in the face of recent developments, e.g. this patch:

    arm64: dts: exynos: move MIPI phy to PMU node in Exynos5433

it looked logical to rework the PD driver a bit to support its nesting
under the PMU node, while adding Exynos850 support to it. Initially I
only wanted to add syscon regmap support via some dedicated property,
but pulling PD nodes under the PMU syscon looks like more correct way.

This patch series provides next changes:

  1. Make it possible for PD nodes to be children of PMU
  2. Add Exynos850 support to PD driver
  3. A bit of refactoring in PD driver
  4. Corresponding changes to dt-bindings

Dependencies inside of the series:

  - patch #2 depends on patch #1
  - patch #6 depends on patch #1
  - patches 3,4,5,6 should be applied in the same order as in the series

Sam Protsenko (6):
  dt-bindings: power: pd-samsung: Add Exynos850 support
  dt-bindings: power: pd-samsung: Allow pd nodes to be children of PMU
  soc: samsung: pm_domains: Extract DT handling into a separate function
  soc: samsung: pm_domains: Implement proper I/O operations
  soc: samsung: pm_domains: Allow PD to be a child of PMU syscon
  soc: samsung: pm_domains: Add Exynos850 support

 .../devicetree/bindings/power/pd-samsung.yaml |  12 +-
 MAINTAINERS                                   |   1 +
 drivers/soc/samsung/Kconfig                   |   1 +
 drivers/soc/samsung/pm_domains.c              | 132 +++++++++++++++---
 .../power/samsung,exynos850-power.h           |  17 +++
 5 files changed, 142 insertions(+), 21 deletions(-)
 create mode 100644 include/dt-bindings/power/samsung,exynos850-power.h

-- 
2.39.2

