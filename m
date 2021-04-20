Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F580C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 17:01:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00369613D1
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 17:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhDTRCG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:02:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50053 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhDTRCE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 13:02:04 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtkh-0004Rv-1a
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 17:01:31 +0000
Received: by mail-ej1-f70.google.com with SMTP id j25-20020a1709060519b029037cb8ca241aso5025570eja.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 10:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CHsQSEUOmORiTB8Zkf0mC2OREpdRoRDZ4OLN4iMgWKc=;
        b=OjE2LJY5MIiMhdmQzM6LZ4BsqDVF9FUM8JmQqgTNALlHgp/EXncEBYZ31VMXEQrFdZ
         rn0REaM2GPTa7HJ8G4Dl4h3VtaJ6NtO5DuNNU6H3nohjZAe6+RlRuZn/4XJA55Nn9vsL
         GTq7uM7yiTYxsQZKunkKScQ1n0mj5vyAnDbSyldyzEHxVmVYk5L6IGAbwJxBEpE4whYJ
         /vWu7R5Ih/+3CxckucSFU217thv+Mzp5M/qZdCpXiJQ+IYG7/BknYK4Eb97RXHNj5hc5
         uBN4+r3BB+IBAV+RBWRWHw+r6eGrciLvKYhb5JtHO000PmFwhy+RkL6mUjtnmSaNkkTM
         +JEg==
X-Gm-Message-State: AOAM532Xb12SqxXjaJdc0Ehf41Rofp72M1IxPcOJ81SufY/5qzIcNk2e
        Wv1BYhPeT7OhDlo8rBuTVE1QfKljDS9v3lSKL4lotzk0oMDN3dOBLAzVm9f0QuG76qPGoc/vCCq
        hD2LrRQSXVtqmLba8ieh1++lf9NPnP43EeWt5UcJvKOTLxBLq
X-Received: by 2002:a17:906:b353:: with SMTP id cd19mr28801318ejb.253.1618938090397;
        Tue, 20 Apr 2021 10:01:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWCjFUTB+i+AWDnumgO9r4qpi2r6FWXN4Xy3B0T5zjsqdLAfvrora74Xl3gg1bViJWFcX6bQ==
X-Received: by 2002:a17:906:b353:: with SMTP id cd19mr28801300ejb.253.1618938090234;
        Tue, 20 Apr 2021 10:01:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id x7sm16334441eds.67.2021.04.20.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:01:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 0/9] mfd/rtc/regulator: Drop board file support for Samsung PMIC
Date:   Tue, 20 Apr 2021 19:01:09 +0200
Message-Id: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

The Samsung PMIC drivers since long time are used only on devicetree
platforms (Samsung Exynos) and there are no users with board files.

Drop the support for board files entirely and depend on OF for matching.

This makes the code smaller and simpler.

Dependencies
============
The MFD pieces are rebased on my previous sec-core dirver changes:
mfd: sec: Simplify getting of_device_id match data
https://lore.kernel.org/linux-samsung-soc/20210420113929.278082-1-krzysztof.kozlowski@canonical.com/T/#t

Applying - can be independent
=============================
The last RTC and regulator patches can be picked up independently via
regulator and rtc trees.  There are no board files currently, so the
code in these drivers is basically dead code and feature-bisection is
preserved.

Best regards,
Krzysztof


Krzysztof Kozlowski (9):
  mfd: sec: Drop support for board files and require devicetree
  mfd: sec: Remove unused cfg_pmic_irq in platform data
  mfd: sec: Remove unused device_type in platform data
  mfd: sec: Remove unused irq_base in platform data
  mfd: sec: Enable wakeup from suspend via devicetree property
  mfd: sec: Remove unused platform data members
  rtc: s5m: Remove reference to parent's device pdata
  regulator: s2mpa01: Drop initialization via platform data
  regulator: s2mps11: Drop initialization via platform data

 drivers/mfd/Kconfig              |  1 +
 drivers/mfd/sec-core.c           | 64 +++++---------------------------
 drivers/mfd/sec-irq.c            |  4 +-
 drivers/regulator/s2mpa01.c      |  4 --
 drivers/regulator/s2mps11.c      | 22 +----------
 drivers/rtc/rtc-s5m.c            |  6 ---
 include/linux/mfd/samsung/core.h | 33 ----------------
 7 files changed, 14 insertions(+), 120 deletions(-)

-- 
2.25.1

