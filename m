From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/2] phy: samsung: add exynos5 SoCs for as simple phy providers
Date: Sun, 20 Apr 2014 15:38:13 +0530
Message-ID: <1397988495-29376-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19865 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754911AbaDTKJA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 06:09:00 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4B00HUPQUY1X20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 20 Apr 2014 19:08:58 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kishon@ti.com, kgene.kim@samsung.com, inki.dae@samsung.com, t.stanislaws@samsung.com, joshi@samsung.com, pankaj.dubey@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Add Exynos5250 and 5420 as Simple phy providers to
the proposed simple phy driver by Tomasz Stanislawski
at https://lkml.org/lkml/2014/4/8/226.

Rahul Sharma (2):
  phy: samsung: add simple phys for exynos5250 SoC
  phy: samsung: add simple phys for exynos5420 SoC

 .../devicetree/bindings/phy/samsung-phy.txt        |   28 ++++++++++++++++++++
 drivers/phy/exynos-simple-phy.c                    |   17 ++++++++++++
 2 files changed, 45 insertions(+)
 mode change 100644 => 100755 drivers/phy/exynos-simple-phy.c

-- 
1.7.9.5
