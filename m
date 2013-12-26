From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH RESEND 0/4] Add support for clocks in S5M8767
Date: Thu, 26 Dec 2013 15:48:57 +0530
Message-ID: <1388053141-30085-1-git-send-email-tushar.behera@linaro.org>
References: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:54413 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750897Ab3LZKWc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Dec 2013 05:22:32 -0500
Received: by mail-pd0-f173.google.com with SMTP id p10so7878577pdj.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2013 02:22:31 -0800 (PST)
In-Reply-To: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, lee.jones@linaro.org, kgene.kim@samsung.com, patches@linaro.org

S5M8767 chip has 3 crystal oscillators which are operated in the same
as the crystal oscillators in S2MPS11. Extend s2mps11-clk driver to
support clocks in S5M8767.

The earlier set of patches no longer apply cleanly on linux-next, hence
rebased them on top of next-20131224.

Tushar Behera (4):
  clk: clk-s2mps11: Refactor for including support for other MFD clocks
  clk: clk-s2mps11: Add support for clocks in S5M8767 MFD
  mfd: sec-core: Add cells for S5M8767-clocks
  ARM: dts: Add S5M8767 clock nodes on Arndale board

 arch/arm/boot/dts/exynos5250-arndale.dts |    7 +++++++
 drivers/clk/Kconfig                      |    6 ++++--
 drivers/clk/clk-s2mps11.c                |   25 +++++++++++++++++++++----
 drivers/mfd/sec-core.c                   |    4 +++-
 4 files changed, 35 insertions(+), 7 deletions(-)

-- 
1.7.9.5
