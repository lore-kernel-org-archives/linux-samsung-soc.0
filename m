Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF39C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 12:21:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0CEE6023F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 12:21:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhJaMYH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 08:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbhJaMYG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 08:24:06 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A5FC061764
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:21:34 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id j21so32075454edt.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4WzQadX+RqazB/22Gcyj8+qG3ieppJrK8iuTkJY04o=;
        b=ohtuIdd4vh9qNNrqP0VjTTJDPBrzB0ztQ0p8vC1WTfmdgdOsQ7a4fhhKuvoTknKvJ2
         pBUe4pjmDRWlQtGyGIN7BMT4m5E43rWeUEhE13R+jk5eRo+INCNMvLU1NKUhsFyWy+Kz
         yStHRoKMXIsuwCLobZixKYneIVHRvP4Hlx36ILnoGDfIcvNIj686xa02xepgHPcseiky
         /Vve3f6VPZOTA1nphyBFJxKQYIJ1Dc2ccgCx80v6rIMo1TY4mW+dU+Yz43kY805au2OO
         X+zSiZaIW1qfmCZVyOAHo+N31bcfHhq2Cjtjm1VV2bvR0Lhaxf9Eu7V9lweTYmoIiKpL
         37Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4WzQadX+RqazB/22Gcyj8+qG3ieppJrK8iuTkJY04o=;
        b=EaX3Y2mJKms6rBMBzfN4ZfpoLo6gTAzT0UH5lcjgG4FCqLa/GxYvKLdly8cu2+3BVO
         zr4YkNZlUtn56wldc4VbH86RWGWbr0S8ZVyCfKM+bBGorBjJnfKZ3yrDA/laCRFpoQ+t
         5U1EVxZMYZeUVZnhz+i1eGFnr8MTIKSFy/1RJTppOg93cyBFkiqwXvuOved12ZnClCJK
         R6UYaa4sHY6YWkK9r5WC8iMNzJrw0P9PsbCDVaaZ/YglzGMQXzIdX7WXV2Sfq+XGnSJh
         pDAEg1JqR+TtYtvQv+IEgdhlKTVl+6jW69UVUKzlWQmzx1y10Dco+KdNLaa8vstpC/as
         46+w==
X-Gm-Message-State: AOAM530Wx0nbXVCqqTD9xTo2lVbkRHrObLlxjHayY3EK9N3j0iUoZCCU
        Q/1GICcZzfSXs3t9cpZ2otNVlg==
X-Google-Smtp-Source: ABdhPJw0qzYV1pHGqTvipYoNRo19NlreHlylwDp56Zx9kLdJoDn/xaNBjZzq0ojs9jwRzRB9mYLyKg==
X-Received: by 2002:a17:906:3947:: with SMTP id g7mr28787664eje.407.1635682892627;
        Sun, 31 Oct 2021 05:21:32 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id s16sm7398690edd.32.2021.10.31.05.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:21:32 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/7] watchdog: s3c2410: Add Exynos850 support
Date:   Sun, 31 Oct 2021 14:21:24 +0200
Message-Id: <20211031122131.30097-1-semen.protsenko@linaro.org>
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

