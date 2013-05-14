From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 0/3] Add DP related DT and Display-timing Node to exynos5250 based Arndale Board
Date: Tue, 14 May 2013 19:42:43 +0530
Message-ID: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:47206 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754772Ab3ENOM5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 10:12:57 -0400
Received: by mail-pd0-f182.google.com with SMTP id 3so463278pdj.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 May 2013 07:12:56 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jg1.han@samsung.com, s.trumtrar@pengutronix.de, tomasz.figa@gmail.com, olof@lixom.net, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org

This patch series adds support for DP on Exynos5250 based Arndale Board

changes since v1:
	- moved display-timimg node inside fimd DT node as suggested by
	Steffen Trumtrar s.trumtrar@pengutronix.de

Is based on branch "for-next"
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git


Vikas Sajjan (3):
  ARM: dts: Add DT node for DP controller for Arndale Board
  ARM: dts: Add clock provider information for DP controller in
    Exynos5250 SoC
  ARM: dts: Add display timing node to exynos5250-arndale.dts

 arch/arm/boot/dts/exynos5250-arndale.dts |   28 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi        |    2 ++
 2 files changed, 30 insertions(+)

-- 
1.7.9.5
