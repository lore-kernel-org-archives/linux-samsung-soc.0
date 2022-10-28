Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9CBECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Oct 2022 19:12:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiJ1TMt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Oct 2022 15:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJ1TMs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 15:12:48 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DD222BC86
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Oct 2022 12:12:47 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id fy4so15168662ejc.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Oct 2022 12:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KXpKlDaHcGP9aL2xwDRjvuf/ZwMUXVgeArUbFNz1VVw=;
        b=LSfBJW23LFoqUDPoE33wm7pBBscnRPehQlHh/GjsUbvvxRfa0TzP2oaoTqW4e9oJus
         Ng4CR7xtFl7DzRkeyl1BsZLqzKzLaTwNjTOObdHDgMGRt1MY3HMx7OgQseweWwcNRMBT
         xTpEwvfeBO6dCqun6ouMwpleX5jd6nqG1N6OC4V/Y5e7w0ccwRIFIPC0/qsrNSIS61on
         BwHjxDxDOe8sCOmNzh+XUBXjtJTAWum0G1TbHRaryVAZZt9mOXVjGFO8rEqYk3TJcT1R
         K8yyXR8Lo3GPRvbCWZs+/nS7wZLyru5Q8h0W0W91aTVjmmVcjxEaRVTcUeikaGlQWiUJ
         BXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXpKlDaHcGP9aL2xwDRjvuf/ZwMUXVgeArUbFNz1VVw=;
        b=jqla/f+8IUM+KaFyeJne+W+a4h3U8SJFk+EI7pGr6LhQMMD2NgadKDoyaKlgMaBzE3
         ssqFlhFCmPoQ0K257xwGlVMF1d0KY7K3ziTIH9K0IGOvC1PZ2SAzS51myIRO9ZzR4Vu1
         09SFi3ACHR3hNDUx7HausfFUVJM+ExM8e+lKkk3yosBYu398xyUytTSgeIOAM3vZliLD
         nhtOgz95qWfLfKvjwKMKSibWYX9SGEKfDGyfQthQ2G7aZKN3JpyFmFZslKjnqkyWJG+K
         NdAhvGI+Ghufvo3ufrbTU698Z8S7P/kN/xGD3/nebK4PGiflRvwpN0uDvN6xpsJ+A5JS
         OrvQ==
X-Gm-Message-State: ACrzQf2K28+t9DbHhJC5uIKJQdz7q28WWhI2yaXdOdD1qZNesDeMOYSp
        eVgJQtl7NOfPI6NyrNVWY5K/Ow==
X-Google-Smtp-Source: AMsMyM5MkZl53YFLn2UatfBLI+3bULVVllqhzGA402l1oTddZxFQiz6yVf7w7PtP3re7q0Po01Tv7Q==
X-Received: by 2002:a17:907:1dc7:b0:7ad:83d5:6abd with SMTP id og7-20020a1709071dc700b007ad83d56abdmr755570ejc.412.1666984366090;
        Fri, 28 Oct 2022 12:12:46 -0700 (PDT)
Received: from localhost (cgw.msart-bajzova4.ke.cust.o2bs.sk. [90.176.4.227])
        by smtp.gmail.com with ESMTPSA id cd13-20020a170906b34d00b0077a1dd3e7b7sm2544787ejb.102.2022.10.28.12.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 12:12:45 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/4] iommu/exynos: Convert to module
Date:   Fri, 28 Oct 2022 21:12:39 +0200
Message-Id: <20221028191243.31721-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

As exynos-iommu driver is not a critical platform driver, it can be
converted to loadable module, to avoid loading it on non-Exynos
platforms in order to improve the RAM footprint. This patch series
converts it to a module and does some related cleanups. IOMMU/DMA
specifics were taken into the account, so remove/exit methods weren't
added.

Sam Protsenko (4):
  iommu: Export iommu_group_default_domain() API
  iommu/exynos: Fix retval on getting clocks in probe
  iommu/exynos: Modularize the driver
  iommu/exynos: Rearrange the platform driver code

 drivers/iommu/Kconfig        |   2 +-
 drivers/iommu/exynos-iommu.c | 353 ++++++++++++++++++-----------------
 drivers/iommu/iommu.c        |   1 +
 3 files changed, 186 insertions(+), 170 deletions(-)

-- 
2.35.1

