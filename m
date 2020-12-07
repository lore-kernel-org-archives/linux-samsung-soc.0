Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D734CC4361B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 19:06:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70DC4238E3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 19:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgLGTGM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Dec 2020 14:06:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:46014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbgLGTGM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 14:06:12 -0500
From:   Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 0/4] soc: samsung: exynos-chipid and asv improvements
Date:   Mon,  7 Dec 2020 20:05:13 +0100
Message-Id: <20201207190517.262051-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v1:
1. Drop patch "soc: samsung: exynos-chipid: initialize later - with
   arch_initcall" which is now superseded by convertin to a driver.
2. Include Marek's patch, just for the reference and rebase.
3. Add patch "soc: samsung: exynos-asv: handle reading revision register
   error".
4. Add patch "soc: samsung: exynos-chipid: convert to driver and merge
   exynos-asv".

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  soc: samsung: exynos-asv: handle reading revision register error
  soc: samsung: exynos-chipid: order list of SoCs by name
  soc: samsung: exynos-chipid: convert to driver and merge exynos-asv

Marek Szyprowski (1):
  soc: samsung: exynos-asv: don't defer early on not-supported SoCs

 arch/arm/mach-exynos/Kconfig        |  1 -
 drivers/soc/samsung/Kconfig         | 12 ++---
 drivers/soc/samsung/Makefile        |  3 +-
 drivers/soc/samsung/exynos-asv.c    | 57 ++++++++-------------
 drivers/soc/samsung/exynos-asv.h    |  2 +
 drivers/soc/samsung/exynos-chipid.c | 78 ++++++++++++++++++++---------
 6 files changed, 81 insertions(+), 72 deletions(-)

-- 
2.25.1

