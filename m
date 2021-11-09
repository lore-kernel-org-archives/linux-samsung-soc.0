Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5EDC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Nov 2021 16:44:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06A27611C8
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Nov 2021 16:44:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbhKIQr2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Nov 2021 11:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbhKIQr1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 11:47:27 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CD0C061767
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Nov 2021 08:44:41 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id p16so45806395lfa.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Nov 2021 08:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gEScOF3/fw9hfeuyrd9ku7cHldjk9nIyGiDu/7seULA=;
        b=MR++4vZ4vG4FCKdpRBfywjVFO5yNCXuVnyv1/SHgE9HW9k/XqOQwpFHl9QKRjiSEU2
         woWqOTktxEX30PFTbvJooXG61MnKG8DZP3wwbe2mVbmYch9iWdD/j6enby+LlYeddg+W
         lkxeOBGxiIIm8gDik8QWNiKoi/8drzHwjOHEucz2nMR0nKBkKnjgjUX0ZIz2wHPvJlo7
         l0OJrJObWp4pjLN9/xT8SErv9qPt9O/TAAX/MuMSvrS5GiHl2oBqk4HV2gYcarHA9ze6
         qMaU7SbGOUPgRq6WjRKbbqICd+oddVFAP3vJ+Btcbe/yQKcKmHVbdjOyFrcacQtwOeOl
         Ef7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gEScOF3/fw9hfeuyrd9ku7cHldjk9nIyGiDu/7seULA=;
        b=CqDVDGzlbYfDT2UfZb/PNVY2InlIJF6Y7qnz6GSSFp1eorM5Rtf/KIJU6mvBssZ0sU
         LSIDiyifDd9BKufZJ8B6LDssxxool+ao5Dse593Qev4Y1ZyRxlLn3E1EVvjCaK/wxsmz
         ARzzordU3VTuFxhPkDvWnyGALjINVhGWugWytG8efWAuwYQHBHPpHXdLlOScuoTd7Fmx
         Kpa2CQiJFvGT1d2TopnXHVMYhZ6a4nNNwY9U1uXD5NfKSZddCPOxobwkzxxmsXL76HOQ
         yPsVgD14hXWdlYVaXu2AaW0+oc5RD5q/101mV2P6pFJG4RS7BTsAtykOjO0odBpo3Zu/
         DgQg==
X-Gm-Message-State: AOAM531+TfhLcbUisoO2OjhlhUX9MHPj5oOuA7/s9Ow0hFEdCFWBMF5b
        agG27y5v80VMWI2zc2kGFoaN8w==
X-Google-Smtp-Source: ABdhPJxaqTeGSD5hAODwamYztqyOG/300aI6Te+SWZ1OufFDsvmu2hOQiEmiz8iRKsklyuQnYX/HNA==
X-Received: by 2002:ac2:4313:: with SMTP id l19mr8161739lfh.132.1636476278151;
        Tue, 09 Nov 2021 08:44:38 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id w40sm2189475lfu.48.2021.11.09.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 08:44:37 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/2] clk: samsung: exynos850: Implement CMU_CMGP
Date:   Tue,  9 Nov 2021 18:44:34 +0200
Message-Id: <20211109164436.11098-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series adds CMU_CMGP clock domain to Exynos850 clock driver. In
particular it needs to enable HSI2C (High-Speed I2C) nodes. This series
depends on CMU_APM series [1].

Tested via /sys/kernel/debug/clk/clk_summary:

<<<<<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                 enable  prepare  protect
   clock                          count    count    count        rate
---------------------------------------------------------------------

clk_rco_cmgp                         0        0        0    49152000
oscclk                               1        1        0    26000000
    mout_cmgp_adc                    0        0        0    26000000
...
    gout_clkcmu_cmgp_bus             1        1        0   399750000
       gout_cmgp_usi1_pclk           0        0        0   399750000
       gout_cmgp_usi0_pclk           0        0        0   399750000
       gout_gpio_cmgp_pclk           0        0        0   399750000
       dout_cmgp_adc                 0        0        0    28553572
       mout_cmgp_usi1                0        0        0   399750000
          dout_cmgp_usi1             0        0        0   199875000
             gout_cmgp_usi1_ipclk    0        0        0   199875000
       mout_cmgp_usi0                0        0        0   399750000
          dout_cmgp_usi0             0        0        0   199875000
             gout_cmgp_usi0_ipclk    0        0        0   199875000
<<<<<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

[1] https://lkml.org/lkml/2021/10/22/979

Sam Protsenko (2):
  dt-bindings: clock: samsung: Document Exynos850 CMU_CMGP
  clk: samsung: exynos850: Implement CMU_CMGP domain

 .../clock/samsung,exynos850-clock.yaml        |  19 ++++
 drivers/clk/samsung/clk-exynos850.c           | 100 ++++++++++++++++++
 include/dt-bindings/clock/exynos850.h         |  17 +++
 3 files changed, 136 insertions(+)

-- 
2.30.2

