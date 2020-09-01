Return-Path: <SRS0=7h8a=CK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F63AC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Sep 2020 07:54:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 599C72087D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Sep 2020 07:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598946872;
	bh=hGEI/ofcezmzuQaXuob3lez+98BFO5sSIf5h57sXBSI=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=PlfQBcktQpC2DgvSXeWiz7OtKxNOkXLngmioNuVxP6H0RbrlGx22v5WFvNpG83asn
	 SgQtvEz/mO8YbqaTVMEzGvR2rLbQJAaTjKWKAoIU7GNXdGwAUw1jND4Q4OHYsoHbUZ
	 b8b5MIZv/SvukLfP0idtiEZ5foIAXhL7g+m66fhI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgIAHya (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Sep 2020 03:54:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:44912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgIAHy2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 03:54:28 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA7BD2071B;
        Tue,  1 Sep 2020 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598946868;
        bh=hGEI/ofcezmzuQaXuob3lez+98BFO5sSIf5h57sXBSI=;
        h=From:To:Cc:Subject:Date:From;
        b=LhLH7mT5NfS4W9jasj6YiSHEkSeWyoaCctvrEXYpmWlRup1tZIDAdR6CrmHvKZv2W
         plbFr1o0MH14KlZ58jDBnb5HgftyxtehwzSeorMj67KhIhrfpqaDCalEXPN1nGkKI9
         A6fTQi/aXCpiuaeSVC++6sfBB1tfoG/s19XLw79E=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 00/13] ARM: dts: exynos: dtschema cleanups for Exynos5
Date:   Tue,  1 Sep 2020 09:54:04 +0200
Message-Id: <20200901075417.22481-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

This is continuation of my series of dtschema cleanup for Exynos SoCs.

The previous series are here:
https://lore.kernel.org/linux-samsung-soc/20200830135200.24304-1-krzk@kernel.org/T/#t
https://lore.kernel.org/linux-samsung-soc/20200830135200.24304-1-krzk@kernel.org/T/#t
https://lore.kernel.org/linux-samsung-soc/20200830135200.24304-1-krzk@kernel.org/T/#t
https://lore.kernel.org/linux-samsung-soc/20200830135200.24304-1-krzk@kernel.org/T/#t

TODO - remaining: S3C, S5Pv210.

Best regards,
Krzysztof

Krzysztof Kozlowski (13):
  ARM: dts: exynos: Correct compatible for Exynos5 GIC
  ARM: dts: exynos: Correct compatible for Exynos5260 GIC
  ARM: dts: exynos: Remove unneeded address/size cells in Exynos5260 GIC
  ARM: dts: exynos: Correct S3C RTC bindings in SMDK5410
  ARM: dts: exynos: Silence i2c-gpio dtschema warning in Exynos5250
    Arndale
  ARM: dts: exynos: Correct whitespace and indentation issues in Exynos5
  ARM: dts: exynos: Override thermal by label in Exynos5250
  ARM: dts: exynos: Add max77686 clocks for S3C RTC in SMDK5250
  ARM: dts: exynos: Use S5M8767 clock in S3C RTC in Exynos5250 Spring
  ARM: dts: exynos: Silence DP HPD pinctrl dtschema warning in
    Exynos5250 Spring
  ARM: dts: exynos: Silence SATA PHY warning in Exynos5250 Arndale
  ARM: dts: exynos: Silence SATA PHY warning in SMDK5250
  ARM: dts: exynos: Use S2MPS11 clock in S3C RTC in SMDK5420

 arch/arm/boot/dts/exynos5.dtsi                | 10 ++--
 arch/arm/boot/dts/exynos5250-arndale.dts      | 12 ++---
 arch/arm/boot/dts/exynos5250-smdk5250.dts     |  8 +++-
 arch/arm/boot/dts/exynos5250-spring.dts       | 41 ++++++++++-------
 arch/arm/boot/dts/exynos5250.dtsi             | 46 +++++++++----------
 arch/arm/boot/dts/exynos5260.dtsi             |  4 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts     |  8 ++--
 arch/arm/boot/dts/exynos5410-smdk5410.dts     | 12 +++++
 arch/arm/boot/dts/exynos5410.dtsi             | 12 ++---
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |  3 ++
 arch/arm/boot/dts/exynos5420.dtsi             | 16 +++----
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  4 +-
 12 files changed, 99 insertions(+), 77 deletions(-)

-- 
2.17.1

