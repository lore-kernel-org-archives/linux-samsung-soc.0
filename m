From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 0/3] Add clk support for PDMA, SPI and audio on Exynos7
Date: Tue, 13 Jan 2015 16:57:39 +0530
Message-ID: <1421148462-11755-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24471 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569AbbAMLf3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jan 2015 06:35:29 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NI400HDD5J35S10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Jan 2015 20:35:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org, kgene.kim@samsung.com

Add PDMA0,PDMA1 gate clock, required clks for 5 SPI channels and 
for clks in audio block.

This patchset is dependent on usb clk support from Vivek in below link.
http://www.spinics.net/lists/linux-samsung-soc/msg39342.html

Changes since V1:
	- Added documentation for source clks of peric1 block.
	- Changed the parent of sclk_i2s1_user,sclk_pcm1_user and sclk_spdif_user
	  from divider clk to gate clk.
	- Removed unused clk IDs

Padmavathi Venna (3):
  clk: samsung: exynos7: add gate clock for DMA block
  clk: samsung: exynos7: add clocks for SPI block
  clk: samsung: exynos7: add clocks for audio block

 .../devicetree/bindings/clock/exynos7-clock.txt    |   14 ++
 drivers/clk/samsung/clk-exynos7.c                  |  220 +++++++++++++++++++-
 include/dt-bindings/clock/exynos7-clk.h            |   43 ++++-
 3 files changed, 271 insertions(+), 6 deletions(-)

-- 
1.7.4.4
