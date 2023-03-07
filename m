Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3473BC61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Mar 2023 00:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjCGAY3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 19:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjCGAY1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 19:24:27 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F7A3CE28
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 16:24:25 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-176261d7f45so13438382fac.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 16:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678148665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D4ip3sLglqlQ7E7789pVNb0z5WZUEnYuDewtkqp1id4=;
        b=GdTih1HDlNXVA9H6OR/RW6m37uzRP3VKQX+ND1QSHcoLL9A1O2uIErkClZ3vIEDsGk
         9j77xJmF9E00zrLSJGQbtuUIPCIctKSCY+4KgPgxagf8YCVevcRO5QbpPqox2pySrkNu
         GCnSZ1re7/cUK98AwTGe7VPQbfFK6bWPwMn2vmxbxLn8UYy2seSyvU5YlGakbOZrwzxW
         aotTntUdU6hMoVhvrSZyrEdx2kQqF3bKmjRocS25yXENF4hTCAIEEJz8j8qdKVgI61Ag
         +G4XtTxLjSX3nRDWBfHATW95RTYv/n148choNo7Esl/CKLE16QkAqCEwOGz+s0ooxg2E
         rkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678148665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4ip3sLglqlQ7E7789pVNb0z5WZUEnYuDewtkqp1id4=;
        b=B0GQeYY3RXOHRg5EbPweK2LlJ3kYL/4qEjZQEfaEE3CnGdN/j5Wm/KTpx+MiO5QPCc
         llC9ne+NwwlaXjPL2uLWT3BEP7bz/l1GPm/EdpvMCbOCsEMWQi3fC+VFT400U63sRWNQ
         TQoMALoAhFHwYO3oMyCbDHZhpKhQuXi+9HsJk5oY+bcCsAFKIOZ0JuD6Pc3UosF6tOo4
         vweOpIBYRqMWQKGXzEdtyBcbW52xHgvEK9bp8VRBt98hr1KpnRpFYgNrAMsslZTobewk
         xZCss/eg2eEjHIxl9YRQsqQAcijfMuzUer256jUlRWiogDk7896R1uIklRoic85REDg9
         qvzA==
X-Gm-Message-State: AO0yUKXYzDQQMVMa4cyk4xXLm8jEDIUHCOR95v2ARBRtgdWgpU9beTvQ
        lwvcun2Ta5vyY18bEhlLT96Q7A==
X-Google-Smtp-Source: AK7set/55XNiVHEyI+5t+FJNuGNj6pwtNyPc2xIbVC1QIFUa9KMNTgq5WIEDx6T+IyxjBFyelih5kQ==
X-Received: by 2002:a05:6870:c10c:b0:163:51eb:b577 with SMTP id f12-20020a056870c10c00b0016351ebb577mr9102897oad.46.1678148664749;
        Mon, 06 Mar 2023 16:24:24 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id x7-20020a9d3787000000b00690dd5e7345sm4783041otb.26.2023.03.06.16.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 16:24:24 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] clk: samsung: Add PM support for ARM64 Exynos chips
Date:   Mon,  6 Mar 2023 18:24:20 -0600
Message-Id: <20230307002423.24454-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In order to prepare for PM enablement in clk-exynos850, common PM code
was extracted from clk-exynos5433 to clk-exynos-arm64. Also some related
cleanups were done prior to that. More specifically:

  - patches #1..2: cleanups
  - patch #3: PM code extraction

During the extraction of the exynos5433_cmu_probe() content to
exynos_arm64_register_cmu_pm() some code was reworked a bit, and also
split into smaller functions. In particular:

  - cmu_data structure now contains a pointer to ctx, which is now
    allocated in samsung_clk_init()
  - cmu_data structure initialization was moved into separate function
  - code for configuring gate clocks was added (optional)

Which in turn resulted in somehow modified code of probe function:

  Original
  --------

    ...
    devm_platform_ioremap_resource(...);
    samsung_clk_init(...);
    exynos_arm64_cmu_prepare_pm(...);
    exynos_arm64_enable_bus_clk(...);
    platform_set_drvdata(...);
    ...

  Modified
  --------

    ...
    platform_set_drvdata(...);
    exynos_arm64_cmu_prepare_pm(...);
    exynos_arm64_enable_bus_clk(...);
    exynos_arm64_init_clocks(...);
    devm_platform_ioremap_resource(...);
    samsung_clk_init(...);
    ...

That shouldn't really change the logic or mode of operation. It was
preliminary tested on Exynos850 based board, with some extra patches on
top of this series (will be submitted later).

Changes in v4:
  - Rebased on top of krzk/linux.git/for-next tree
  - Reworked exynos_arm64_enable_bus_clk() users to only print an error
    message if that function fails
  - Removed already applied patches from this series

Changes in v3:
  - Rebased on the most recent soc/for-next tree
  - Added A-b tags from Marek
  - Added Marek's authorship to clk-exynos-arm64.c

Changes in v2:
  - Rebased all patches on top of the latest soc/for-next tree
  - Added Tested-by tag from Marek
  - Addressed comments from the review

Sam Protsenko (3):
  clk: samsung: Extract clocks registration to common function
  clk: samsung: Extract parent clock enabling to common function
  clk: samsung: exynos5433: Extract PM support to common ARM64 layer

 drivers/clk/samsung/clk-exynos-arm64.c | 229 +++++++++++++++++++++++--
 drivers/clk/samsung/clk-exynos-arm64.h |   3 +
 drivers/clk/samsung/clk-exynos5433.c   | 157 +----------------
 drivers/clk/samsung/clk.c              |  46 +++--
 drivers/clk/samsung/clk.h              |   2 +
 5 files changed, 249 insertions(+), 188 deletions(-)

-- 
2.39.2

