Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52886C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11C3A2224E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736139;
	bh=XNkTurHxcTSdlJysblP2MMoMZiIHUkTVmgg0ibKLaq0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=WxIDgh7OlXfkQ9LtONvw3We/tgKzkVbz/S1tm/JM54JzyrZJTMHR8pCmgoHK55Sgd
	 qVkYL1FQEQ4GFEcicOrL2nE0zufn0+GToAWu7IanOKP4/v7npA4BgUUnG6Ew517NBj
	 4vq12dBqr/zM+fTWRgy4bF2C36IPtuxsRWYitzck=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789322AbgJZSPi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:15:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:59034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1789318AbgJZSPi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:15:38 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 352052087C;
        Mon, 26 Oct 2020 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736137;
        bh=XNkTurHxcTSdlJysblP2MMoMZiIHUkTVmgg0ibKLaq0=;
        h=From:To:Cc:Subject:Date:From;
        b=SKaDfHKO6sHcYaKcllCDJt+l8POWAF21/mPD0TP20vC7Kf4uKwu3JZTh83RLanWGo
         QzF+NrUG4dM2sRRlNpSuRqp/IN1u2BBH4zYfO8MmzrEzaXMCzVVt1Kkf+5rn7nt9r/
         TUz0WAIXtoA6uKwf1bUlAgD64Zot59UHrp+60SrM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 00/12] ARM: dts: samsung: minor node name cleanups
Date:   Mon, 26 Oct 2020 19:15:16 +0100
Message-Id: <20201026181528.163143-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi All,

A new Exynos4412 board was recently submitted and it (as expected)
copied all not-the-best patterns from existing DTSes.  Let's fix few of
them so any new boards will not copy old choices.

I plan to follow up on this and fix few of such naming and style issues.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  ARM: dts: exynos: adjust node names to DT spec in Exynos3250 boards
  ARM: dts: exynos: adjust node names to DT spec in Exynos4210 boards
  ARM: dts: exynos: override GPIO keys node by label in Exynos4412
    Odroid family
  ARM: dts: exynos: adjust node names to DT spec in Exynos4412 boards
  ARM: dts: exynos: remove redundant status=okay in Exynos4412 boards
  ARM: dts: exynos: adjust node names to DT spec in Exynos5250 boards
  ARM: dts: exynos: adjust node names to DT spec in Odroid XU
  ARM: dts: exynos: adjust node names to DT spec in Exynos542x boards
  ARM: dts: s5pv210: adjust node names to DT spec
  arm64: dts: exynos: adjust node names to DT spec in Exynos5433 TM2
  arm64: dts: exynos: adjust node names to DT spec in Exynos7 Espresso
  arm64: dts: exynos: remove redundant status=okay in Exynos5433 TM2

 arch/arm/boot/dts/exynos3250-artik5.dtsi      |  2 +-
 arch/arm/boot/dts/exynos3250-monk.dts         |  8 +++---
 arch/arm/boot/dts/exynos3250-rinato.dts       |  8 +++---
 arch/arm/boot/dts/exynos4210-i9100.dts        |  6 ++--
 arch/arm/boot/dts/exynos4210-origen.dts       |  4 +--
 arch/arm/boot/dts/exynos4210-smdkv310.dts     | 22 +++++++--------
 arch/arm/boot/dts/exynos4210-trats.dts        |  4 +--
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi   |  9 +++---
 arch/arm/boot/dts/exynos4412-itop-elite.dts   |  2 +-
 .../boot/dts/exynos4412-itop-scp-core.dtsi    |  2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi       | 15 ++++------
 arch/arm/boot/dts/exynos4412-n710x.dts        |  2 +-
 .../boot/dts/exynos4412-odroid-common.dtsi    | 10 +++----
 arch/arm/boot/dts/exynos4412-odroidx.dts      | 28 +++++++++----------
 arch/arm/boot/dts/exynos4412-origen.dts       | 14 +++++-----
 arch/arm/boot/dts/exynos4412-smdk4412.dts     | 20 ++++++-------
 arch/arm/boot/dts/exynos5250-arndale.dts      |  4 +--
 arch/arm/boot/dts/exynos5250-smdk5250.dts     |  4 +--
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |  4 +--
 arch/arm/boot/dts/exynos5250-spring.dts       |  2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts     |  2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |  4 +--
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |  4 +--
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |  2 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  2 +-
 .../boot/dts/exynos5422-odroidxu3-audio.dtsi  |  2 +-
 .../boot/dts/exynos5422-odroidxu3-common.dtsi |  4 +--
 arch/arm/boot/dts/exynos5422-odroidxu3.dts    |  8 +++---
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |  4 +--
 arch/arm/boot/dts/s5pv210-aquila.dts          | 12 ++++----
 arch/arm/boot/dts/s5pv210-aries.dtsi          |  4 +--
 arch/arm/boot/dts/s5pv210-goni.dts            | 14 +++++-----
 arch/arm/boot/dts/s5pv210-smdkv210.dts        | 20 ++++++-------
 .../dts/exynos/exynos5433-tm2-common.dtsi     | 11 ++++----
 .../boot/dts/exynos/exynos7-espresso.dts      |  2 +-
 35 files changed, 130 insertions(+), 135 deletions(-)

-- 
2.25.1

