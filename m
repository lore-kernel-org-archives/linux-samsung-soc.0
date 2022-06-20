Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF929C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 12:19:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241331AbiFTMT5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 08:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240101AbiFTMT5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 08:19:57 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1576338
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 05:19:56 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id e40so2319329eda.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 05:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fOxxXWDCmT4VlI0QP8zYNBrVbjnoR1cMpcur/fwkues=;
        b=hqgaT7eqL+ZGFcUrD8UyVLJHHXULrEwZJAYyFIikimThExXDF8jL04sot9bfSVvnHo
         2mfZi8G2AxNJiDmNrzvocoKFgB14UJD8flKjKbU10SaGSyXtmrWGKBfxI/I7tm5WRI4n
         FtypTbHMAOsBKQ6Lhdl0j0nCS45R5X/IM9beuaGlHDyw47KJYMxVDvNWu7K9DWJ/gZA9
         2Mr5G8Yak4svelL/JvxhLTbkpPROixstu8GeciQvm9y/1j1y4fexwzW7LNnkMCzUK3Qn
         4E04Yxma/xSzzFN0SrjYT8pjxw5YzM3nMkk1J2fPq3HPmuTkIGltfERQRqB1lLUu0fiE
         6USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fOxxXWDCmT4VlI0QP8zYNBrVbjnoR1cMpcur/fwkues=;
        b=M/eQh0n40u0VWlzVeFWeaHizOYb0CzLS5NjsOZOrnPbCC+iRgZ0M0P+9+Aaqwj2rJH
         nctfIECXV9SpIsF6rNG+QeeW7iO+AkQzOf2nvXaPfOtI4dyTgRkGAbSzjJwhRwK98xQ+
         kZowXx4kmTr4LCo/aTy8YTRrG1Xph6lDnP8UBJkdOvoGlVnr+IZiCXhyp/h95jLVZPsA
         r75lhY5sOI/dPEXEmvJGv39iezebsgdpwhO+JlE3C1RQ7sgsfm3V1vXN6j6RFnT12QVP
         iw5D7LqA8qjMgXcOW9wuDIwZTa3DGsSK6hYbIXCmbiPpq3pJ8/+yhOrDUImhAX44c4SE
         xQQA==
X-Gm-Message-State: AJIora995BpendX8PXKkkpPTM4pbUjczstowcQHyDbqfQDcA15+kyi3g
        nIEWGoXyCOCzpxpckdGFmWq7bQ==
X-Google-Smtp-Source: AGRyM1tsykB59CUTJb8JLSnlFjFGcmSM6049dfMsto5MK+grNMISh5jWMfyl5ZV3em9S+NMNhWvWyw==
X-Received: by 2002:a05:6402:c95:b0:435:8113:1276 with SMTP id cm21-20020a0564020c9500b0043581131276mr5743279edb.193.1655727595189;
        Mon, 20 Jun 2022 05:19:55 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y21-20020a056402441500b0042dcbc3f302sm10494892eda.36.2022.06.20.05.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 05:19:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: exynos 7885 eMMC bindings
Date:   Mon, 20 Jun 2022 14:19:43 +0200
Message-Id: <20220620121944.42942-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

Bindings for you.

Best regards,
Krzysztof


The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-exynos7885-emmc-5.20

for you to fetch changes up to e756e932a3a16418cd8bad757b028bfb337b4a51:

  dt-bindings: clock: Add indices for Exynos7885 TREX clocks (2022-06-20 13:57:20 +0200)

----------------------------------------------------------------
Samsung clock controller changes for v5.20

Add bindings for Exynos7885 eMMC used on Samsung Galaxy A8 (2018).

----------------------------------------------------------------
David Virag (2):
      dt-bindings: clock: Add bindings for Exynos7885 CMU_FSYS
      dt-bindings: clock: Add indices for Exynos7885 TREX clocks

 .../bindings/clock/samsung,exynos7885-clock.yaml   | 27 +++++++++++
 include/dt-bindings/clock/exynos7885.h             | 54 ++++++++++++++++++----
 2 files changed, 72 insertions(+), 9 deletions(-)
