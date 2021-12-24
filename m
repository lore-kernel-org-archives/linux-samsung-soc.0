Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AF3C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Dec 2021 20:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234475AbhLXUdE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Dec 2021 15:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhLXUdE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Dec 2021 15:33:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2368C061401;
        Fri, 24 Dec 2021 12:33:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3B7E7620FB;
        Fri, 24 Dec 2021 20:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D27C36AE8;
        Fri, 24 Dec 2021 20:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640377982;
        bh=Y7q0klHLRoGsyVP8/4zBAALcwxFrMtiFWKNg7/MXzzo=;
        h=From:Subject:To:Cc:Date:From;
        b=lZR8Gxpsh2UZQQ/MvmzMT1olchl3U1pDCxjOC8LtfxItW1Ly/7H1Ou4jATcFdSEnA
         PbD90X4qusRDISVKuMZOiLcy8xSa0VwPqs9AedFOuxmAxH5Tf92lIYWw8Rj6k0/ggV
         G1QTTuggN2CdR/VOR9bkRcgrcHuv5rjGDfH4AjY2B1G3B9R8qAcIP2m3rvaFKGlqv7
         VvHIuIZlJgH85UIkjtBE1Mq5IKKKXCfdvY07fPwPIcR6Alj9oMV68oRi7mz13SmLtY
         olMgrojvTVFjxatiIQOuddWnZHGb9Dag93Bb0NkuUPpS76Sc4W02gnWI4/aDYXXeXQ
         7EBdlWvFMnBCQ==
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [GIT PULL] clk: samsung: Updates for v5.17
To:     Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Message-ID: <28464eae-92c4-809c-6dde-ba487fcf0343@kernel.org>
Date:   Fri, 24 Dec 2021 21:32:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


Hi Stephen, Mike,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.17-samsung

for you to fetch changes up to 45bd8166a1d821eb8fada3092514a7c8543f537c:

   clk: samsung: Add initial Exynos7885 clock driver (2021-12-19 23:39:01 +0100)

----------------------------------------------------------------
clk/samsung updates for v5.17

  - removal of all remaining uses of __clk_lookup() in drivers/clk/samsung,
  - refactoring of the CPU clocks registration to use common interface,
  - an update of the Exynos850 driver (support for more clock domains)
    required by the E850-96 development board,
  - initial clock driver for the Exynos7885 SoC (Samsung Galaxy A8).

----------------------------------------------------------------
David Virag (5):
       dt-bindings: clock: Add bindings definitions for Exynos7885 CMU
       dt-bindings: clock: Document Exynos7885 CMU bindings
       clk: samsung: Make exynos850_register_cmu shared
       clk: samsung: clk-pll: Add support for pll1417x
       clk: samsung: Add initial Exynos7885 clock driver

Marek Szyprowski (2):
       dt-bindings: clock: samsung: add IDs for some core clocks
       clk: samsung: remove __clk_lookup() usage

Sam Protsenko (8):
       dt-bindings: clock: Add bindings for Exynos850 CMU_APM
       clk: samsung: exynos850: Implement CMU_APM domain
       dt-bindings: clock: Add bindings for Exynos850 CMU_CMGP
       clk: samsung: exynos850: Implement CMU_CMGP domain
       clk: samsung: exynos850: Keep some crucial clocks running
       clk: samsung: exynos850: Register clocks early
       dt-bindings: clock: Add bindings for Exynos850 sysreg clocks
       clk: samsung: exynos850: Add missing sysreg clocks

Sylwester Nawrocki (1):
       clk: samsung: Remove meaningless __init and extern from header files

Will McVicker (1):
       clk: samsung: Update CPU clk registration

  .../bindings/clock/samsung,exynos7885-clock.yaml  | 166 ++++++
  .../bindings/clock/samsung,exynos850-clock.yaml   |  38 ++
  drivers/clk/samsung/Makefile                      |   2 +
  drivers/clk/samsung/clk-cpu.c                     |   2 +-
  drivers/clk/samsung/clk-cpu.h                     |   7 -
  drivers/clk/samsung/clk-exynos-arm64.c            |  94 +++
  drivers/clk/samsung/clk-exynos-arm64.h            |  20 +
  drivers/clk/samsung/clk-exynos3250.c              |  54 +-
  drivers/clk/samsung/clk-exynos4.c                 |  41 +-
  drivers/clk/samsung/clk-exynos5250.c              |  21 +-
  drivers/clk/samsung/clk-exynos5420.c              |  29 +-
  drivers/clk/samsung/clk-exynos7885.c              | 597 +++++++++++++++++++
  drivers/clk/samsung/clk-exynos850.c               | 366 +++++++++---
  drivers/clk/samsung/clk-pll.c                     |   1 +
  drivers/clk/samsung/clk-pll.h                     |   1 +
  drivers/clk/samsung/clk-s3c2410.c                 |   6 +-
  drivers/clk/samsung/clk-s3c64xx.c                 |   8 +-
  drivers/clk/samsung/clk-s5pv210.c                 |   8 +-
  drivers/clk/samsung/clk.c                         |  14 -
  drivers/clk/samsung/clk.h                         |  36 +-
  include/dt-bindings/clock/exynos4.h               |   4 +-
  include/dt-bindings/clock/exynos5250.h            |   4 +-
  include/dt-bindings/clock/exynos7885.h            | 115 ++++
  include/dt-bindings/clock/exynos850.h             |  54 +-
  24 files changed, 1503 insertions(+), 185 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml
  create mode 100644 drivers/clk/samsung/clk-exynos-arm64.c
  create mode 100644 drivers/clk/samsung/clk-exynos-arm64.h
  create mode 100644 drivers/clk/samsung/clk-exynos7885.c
  create mode 100644 include/dt-bindings/clock/exynos7885.h

-- 
Regards,
Sylwester
