Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC67AC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 May 2022 07:03:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245467AbiEEHG4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 May 2022 03:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235399AbiEEHGw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 May 2022 03:06:52 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1ED4474E
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 May 2022 00:03:13 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i5so4765387wrc.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 May 2022 00:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CfZ3ZePVs1zizifKFOCKdtP4owCke/xt9ZozThlShL8=;
        b=sUKmqDeLUlbnwYWcHGCCTwFM6OxAYGp/M3asB/xn+YqzZAmsxT2CbvEKXN73+VZ4N2
         k3SGgx+QUrO8bAmOmuFUKOfUpPYwtoEzn1nhTjYcIB2Hko6zoe++oggqb33ooONyDMhQ
         ad3UWqaSNYZ0ztIfeODcJQVubb6aGjEXHPmK3w4VHmg+UsdID2jnczga6mhfF3evBgBb
         Os9PX/fOySWg3W9CP8BQJG98QHzL4geytfoSyqfpVDF4sPcyE84lWcZK6KCMxPhN5eGL
         d4ORixgjl4umEjmaMOg5ftvZQ3mjDa57jKaMI5dNaClDcJdGADDX2jW8ZErxZqrNB31d
         1fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CfZ3ZePVs1zizifKFOCKdtP4owCke/xt9ZozThlShL8=;
        b=xk/OVe5SEAMi19q+A3R55/a8zqjC9T9b0xB2zTjCas7zIaLXWa54wiV2p+FNCB7Xig
         oKbbL8j2ntVFxv1cjmJbtjpb5mvINiWIXXqVXRSu8pVJc2w3xcRNAgkvvOJtEKJpAPK3
         1c0DEPga7zo7OKvNbXsffNk3kloC4WaxrZrDngT9fhGPDyYOn0W5/ESrNbmP0C1wxzFF
         sw4pfYdDSIuVqI7a6FUeaxl3B387ux5r+CsvD7xcOnRVaD7x5CSrYrhmVDkhG2Bi2Vg5
         XTjApdccpP+4Kv/7C5aY6nrMFWBWODzCS0XZnX04w0K/uXCdVLrV9Iju1siQHA10Qjax
         dpZQ==
X-Gm-Message-State: AOAM533prZX7QK0cEPXwknMRanqtX0Y7YchCcEzXjMHJ8eqxMffdhLBE
        YpKTm9iilZDn03sq2+pGN+NTBA==
X-Google-Smtp-Source: ABdhPJzxqJxw5vDooWxiWTjg+cFR1uj+e7cZJwS/W4TlRcrQrIVljaF/20ohFz5pVK5+RhVQ55tcxA==
X-Received: by 2002:adf:f504:0:b0:20c:734f:d39d with SMTP id q4-20020adff504000000b0020c734fd39dmr9547097wro.717.1651734192506;
        Thu, 05 May 2022 00:03:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n21-20020a7bc5d5000000b003942a244f47sm6233739wmk.32.2022.05.05.00.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 00:03:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: dt-bindings: samsung: exynosautov9 for v5.19
Date:   Thu,  5 May 2022 09:03:08 +0200
Message-Id: <20220505070308.29863-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

Clock bindings for v5.19.

Best regards,
Krzysztof

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-bindings-clk-exynosautov9-5.19

for you to fetch changes up to e61492e47838f4d99a3ffcc591ba57d1d5d0896f:

  dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings (2022-05-05 08:58:38 +0200)

----------------------------------------------------------------
dt-bindings for Samsung ExynosAutov9 clock controllers for v5.19

The Devicetree bindings for Samsung ExynosAutov9 clock controllers.

----------------------------------------------------------------
Chanho Park (2):
      dt-bindings: clock: add clock binding definitions for Exynos Auto v9
      dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings

 .../bindings/clock/samsung,exynosautov9-clock.yaml | 219 +++++++++++++++
 include/dt-bindings/clock/samsung,exynosautov9.h   | 299 +++++++++++++++++++++
 2 files changed, 518 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov9.h
