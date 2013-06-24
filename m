From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/2] Samsung Exynos5420 clock for hdmi for v3.11
Date: Tue, 25 Jun 2013 02:09:15 +0900
Message-ID: <51C87D3B.90701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:43973 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750899Ab3FXRJT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Jun 2013 13:09:19 -0400
Received: by mail-pa0-f54.google.com with SMTP id kx10so11307249pab.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2013 10:09:19 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>

The following changes since commit eff4e7c7f32a4e4be60b19b209ffab5cb430b385:

   ARM: EXYNOS: extend soft-reset support for EXYNOS5420 (2013-06-19 
04:09:37 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/soc-exynos5420-3

for you to fetch changes up to 2c862cf943771b4859ecc54bc13d72b309472427:

   clk: exynos5420: assign sclk_pixel id to pixel clock divider 
(2013-06-25 01:43:42 +0900)

----------------------------------------------------------------
based on tags/soc-exynos5420-1

Add clock support hdmi subsystem on exynos5420
- add new clocks, mout_hdmi and smmu_tv, associating ID to clk_hdmiphy
- include some essential corrections

----------------------------------------------------------------
Rahul Sharma (5):
       clk: exynos5420: add sclk_hdmiphy to the list of special clocks
       clk: exynos5420: add gate clock for tv sysmmu
       clk: exynos5420: fix the order of parents of hdmi mux
       clk: exynos5420: add hdmi mux to change parents in hdmi driver
       clk: exynos5420: assign sclk_pixel id to pixel clock divider

  .../devicetree/bindings/clock/exynos5420-clock.txt     |  7 +++++++
  drivers/clk/samsung/clk-exynos5420.c                   | 18 
+++++++++++-------
  2 files changed, 18 insertions(+), 7 deletions(-)
