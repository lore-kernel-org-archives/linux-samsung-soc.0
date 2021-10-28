Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC0BC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 18:35:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21FB860D43
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 18:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhJ1Sh6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Oct 2021 14:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbhJ1Sh5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 14:37:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404AFC061767
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 11:35:30 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u11so15555061lfs.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 11:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4WzQadX+RqazB/22Gcyj8+qG3ieppJrK8iuTkJY04o=;
        b=lz9xHVl/WZ2+qnHRULOWJhF3wAg+Qu/4QXcPuEBwjl0bcQxDa7ZcADKsUnqisJL85m
         9QuxVaumc9MsznWizeq3BP1NSxZv7ZZKlHK0QE7Bt3b1WVXBM4cd1AQ+bZSm9I81B/+y
         nrw2D9un7XZGlJbRX4HJx4X+vEMQysSSi9CKh4jgzthdODy8xr6DoJz9mecr8DutP+vd
         4InCy0xFoZRcbF7Xm+9ocRSWR0Nn24L+m+Xtf+ZAVZnWhEQO/f37Miw4CpwOn192h3dY
         SYx9lUgPK9DHydFFvuDaDUxvKoBcA4cUZN+0GEGni0H3/OF+3HBCMV3nTsr1lj44uFFa
         XG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4WzQadX+RqazB/22Gcyj8+qG3ieppJrK8iuTkJY04o=;
        b=qMUbfn9JDdZsPRwCg+npLD4bUoy2EXUDmXtFPjTySnuYjUCN2IgbSqWjlv48LBHOW3
         KQ4bhB4RemrWj4HKwfmmCN+V3ppyiOiC/LafhTNV/E2dlPoYQhwyy0lPAsy4oXb97e4V
         l4gG2kbzxc06u6TGDpu9mOgWk0dyf3pyz4ZpFiuYYSlcemHAMZt3UhXtxYr9RxpHJgLN
         VSt91lZ6ImSKqNcjNF8DKLZn8UTbhEqYEzf6kzuASutUErh2qZWSMd95x6GvbLEw0WJd
         D79S8AoQUobifgbRJRlgDVAufX31hqrvFc+yL81hR9NW7gb64ahzh3MpbB4AKDiJLDS7
         khog==
X-Gm-Message-State: AOAM532AwdFLigY3nkjL2iYLyEFEdrsn6e7OMi112o9c4dEFpIvFttbw
        eyus2kJUPEzORcyXEoJpjcdGYw==
X-Google-Smtp-Source: ABdhPJzw48y/mBL2BnGr0m1Qqbbip97MzoXwpbjKR4smI4OiyzC/sI4MTwQAwE05fJIq4q+TjgD1Pw==
X-Received: by 2002:a05:6512:b8b:: with SMTP id b11mr5822144lfv.99.1635446128588;
        Thu, 28 Oct 2021 11:35:28 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id z3sm390466lfh.17.2021.10.28.11.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:35:28 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/7] watchdog: s3c2410: Add Exynos850 support
Date:   Thu, 28 Oct 2021 21:35:20 +0300
Message-Id: <20211028183527.3050-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos850 WDT IP-core differs a bit from existing platforms:
  - Another set of PMU registers
  - Separate WDT instance for each CPU cluster, having different PMU
    registers/bits
  - Source clock is different from PCLK

Implement all missing features above and enable Exynos850 WDT support.

Sam Protsenko (7):
  dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
  dt-bindings: watchdog: Document Exynos850 watchdog bindings
  watchdog: s3c2410: Make reset disable optional
  watchdog: s3c2410: Add support for WDT counter enable
  watchdog: s3c2410: Introduce separate source clock
  watchdog: s3c2410: Add Exynos850 support
  watchdog: s3c2410: Let kernel kick watchdog

 .../bindings/watchdog/samsung-wdt.yaml        |  17 +-
 drivers/watchdog/s3c2410_wdt.c                | 215 ++++++++++++++----
 2 files changed, 190 insertions(+), 42 deletions(-)

-- 
2.30.2

