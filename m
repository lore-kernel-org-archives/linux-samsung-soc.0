From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/2] ARM: dts: enable display for exynos5800 based peach-pi
 board
Date: Mon, 12 May 2014 12:15:18 +0530
Message-ID: <1399877120-4634-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41570 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377AbaELGqB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 02:46:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, jg1.han@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Add nodes for fimd and dp controller for exynos5800 based
peach-pi board.

This series is based on Kukjin Kims, for-next branch.

It is dependent on
1) Arun's patches for basic Exynos5800 support, available at
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/30667

Rahul Sharma (2):
  ARM: dts: enable display controller for exynos5800 based peach-pi
    board
  ARM: dts: enable fimd for exynos5800 based peach-pi board

 arch/arm/boot/dts/exynos5800-peach-pi.dts |   41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

-- 
1.7.9.5
