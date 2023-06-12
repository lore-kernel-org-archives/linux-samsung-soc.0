Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D2BC7EE2E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Jun 2023 17:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbjFLR7R (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Jun 2023 13:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234187AbjFLR7Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Jun 2023 13:59:16 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07A7E4A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jun 2023 10:59:15 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-970028cfb6cso841289066b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jun 2023 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686592754; x=1689184754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/kja3SgwesCI8mivV99SZPOWE2UVpV1r0v4iU8FZZkk=;
        b=pjXh9aVZiXOJFFCjCmr7A4oawfygz/Bd4NeTlZUT122McbGv90yOB+QM7dRZkDguAv
         pdaR2/52/J28BpsZXW2d/aXQp5afOWtnMULnJAA0qqQV45bw4S5T/NSxthNA4O9c1zxT
         kHgVYauEPJLkTmV/A2kDbDwcAU3OMfwAPURH80CfFtpa9U6RhOKqtoZGAD1PiQ60D4fo
         /iTKt8B1C8srtP/qazc3X1d4osO/IGZgeZZxxS/DqB+lVkwAQga5SwnCSF/v0YiX5xFg
         kpUk5xOQ43xbHKqQvw8DxLPX0fMXjXqkkxhQ+be5X4o/S2AFpH9/jODYkwcFDQyOPLdG
         6b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686592754; x=1689184754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kja3SgwesCI8mivV99SZPOWE2UVpV1r0v4iU8FZZkk=;
        b=QqodLm3MLQBbCNn9iZEy8ihTkAxQ9zkg6Z5tYYS4ZDaL0WRZzlPL9Ls5s/cnNZgRXz
         z+GfK1t/AzZVMS6OBqB6iO0zPmTBE+4gc9voWTm9JHIzZs++OC2WxQT3VB+LMeSq5xH3
         klgo0f8ByIASnj2P+maSB4ji1qTk7Xn5C1kxy3opNES7Ip73d4cP9o1oPDgSG9OXwmo1
         r+ap6DFqBor0AO3aaThNyJhqccz4bbtcL3pmKP2MtorJ8yTAaPGW9gQ+ZW4NRcSTu+av
         qn7896CypT2ySbtiDbukkrjXbF93wuBgv3Yh/Q5yUBjzUWzLrFZeN9VXKvtd8a9iay9V
         3y+Q==
X-Gm-Message-State: AC+VfDxNtcohNPP8TNe679M8Xv0aqAGFpYbwJW8/WnEeKlVODA2JU7RJ
        xNtsixEn9aT/M/8Gs7lOvFziXw==
X-Google-Smtp-Source: ACHHUZ6oEp6zQOXL+EEOKj1+6lJ1O0RK86/UNGZco7BEnX9YCFuXS+nIiKnIbUHujOwR9mw2Knukxw==
X-Received: by 2002:a17:907:7202:b0:96f:cb13:8715 with SMTP id dr2-20020a170907720200b0096fcb138715mr10521958ejc.69.1686592754157;
        Mon, 12 Jun 2023 10:59:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id dx22-20020a170906a85600b009745e1065f1sm5396790ejb.206.2023.06.12.10.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 10:59:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.5
Date:   Mon, 12 Jun 2023 19:59:10 +0200
Message-Id: <20230612175910.289428-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.5

for you to fetch changes up to 2aac2d8b95923203e683c60124877ab434133679:

  clk: samsung: add CONFIG_OF dependency (2023-06-12 11:45:20 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.5

1. Re-add support for Exynos4212 clock controller because we are
   re-introducing the SoC in the mainline.

2. Add CONFIG_OF dependency to solve some objtool warnings.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: samsung: add CONFIG_OF dependency

Artur Weber (3):
      dt-bindings: clock: samsung,exynos: add Exynos4212 clock compatible
      clk: samsung: Add Exynos4212 compatible to CLKOUT driver
      clk: samsung: Re-add support for Exynos4212 CPU clock

 .../bindings/clock/samsung,exynos-clock.yaml       |  1 +
 drivers/clk/samsung/Kconfig                        |  1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |  3 ++
 drivers/clk/samsung/clk-exynos4.c                  | 44 +++++++++++++++++++---
 4 files changed, 44 insertions(+), 5 deletions(-)
