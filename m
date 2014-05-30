From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/5] Samsung CLK update for 3.16
Date: Sat, 31 May 2014 04:58:57 +0900
Message-ID: <5388E301.7080407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:49527 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932303AbaE3T7D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 15:59:03 -0400
Received: by mail-pa0-f44.google.com with SMTP id lj1so2052201pab.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 12:59:02 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>

The following changes since commit bfed1074f213051e94648bfad0d0611a16d81366:

   clk: exynos5250: Add missing sysmmu clocks for DISP and ISP blocks 
(2014-05-26 06:48:10 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-clk-3

for you to fetch changes up to e7ef0b632eb45b0c725629da3561ecde8935a398:

   clk: exynos5410: register clocks using common clock framework 
(2014-05-31 02:13:16 +0900)

----------------------------------------------------------------
Samsung 3rd clock updates for 3.16

- add clock for new exynos5410 SoC

----------------------------------------------------------------
Tarek Dakhran (1):
       clk: exynos5410: register clocks using common clock framework

  .../devicetree/bindings/clock/exynos5410-clock.txt |  45 +++++
  drivers/clk/samsung/Makefile                       |   1 +
  drivers/clk/samsung/clk-exynos5410.c               | 209 
+++++++++++++++++++++
  include/dt-bindings/clock/exynos5410.h             |  33 ++++
  4 files changed, 288 insertions(+)
  create mode 100644 
Documentation/devicetree/bindings/clock/exynos5410-clock.txt
  create mode 100644 drivers/clk/samsung/clk-exynos5410.c
  create mode 100644 include/dt-bindings/clock/exynos5410.h
