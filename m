From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/2] Samsung CLK update for v3.11
Date: Wed, 19 Jun 2013 23:48:51 +0900
Message-ID: <51C1C4D3.5050206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:56269 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756724Ab3FSOs4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 10:48:56 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz11so5253264pad.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 07:48:56 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Mike Turquette <mturquette@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arun Kumar K <arun.kk@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

Hi Arnd, Olof

This is updates for Samsung clks but some of them didn't get Mike's ack 
but I think, it should be fine and remained in mailing list long time.

Mike, if you have any objection on this branch, please let us know.

Just note, based on tags/exynos-dt-2 to avoid merge conflicts ;)

Thanks,
- Kukjin


The following changes since commit 5f13269130d6798571ffbd9d84dbef0950984c5b:

   ARM: dts: Set BUCK7 as always on for Origen board (2013-06-19 
00:41:56 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-clk-1

for you to fetch changes up to 765ab41132b24c9d40b11b2100ae7f01c19a64af:

   clk: exynos5440: Staticize local symbols (2013-06-19 23:29:59 +0900)

----------------------------------------------------------------
clk updates
- fix HDMI clock number for exynos5250
- add G3D clocks for exynos5250
- add TMU clocks for exynos4
- use static for local symbols for exynos clk

----------------------------------------------------------------
Arun Kumar K (2):
       Documentation: Fix HDMI clock number for exynos5250-clock
       clk: exynos5250: Add clocks for G3D

Sachin Kamat (4):
       clk: exynos4: Add clock entries for TMU
       clk: exynos4: Staticize local symbols
       clk: exynos5250: Staticize local symbols
       clk: exynos5440: Staticize local symbols

  .../devicetree/bindings/clock/exynos4-clock.txt    |  1 +
  .../devicetree/bindings/clock/exynos5250-clock.txt |  3 ++-
  drivers/clk/samsung/clk-exynos4.c                  | 28 
++++++++++++----------
  drivers/clk/samsung/clk-exynos5250.c               | 26 
+++++++++++++-------
  drivers/clk/samsung/clk-exynos5440.c               | 14 +++++------
  5 files changed, 43 insertions(+), 29 deletions(-)
