From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk: exynos3250 updates for 4.1
Date: Wed, 25 Mar 2015 13:12:56 +0100
Message-ID: <5512A648.2090202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44550 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220AbbCYMNH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Mar 2015 08:13:07 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hello Mike,

Please pull the following changes, it seems all we have for next release
for clk/samsung.

The following changes since commit 5bc43f9b6ffff15f02c57b1ca782128ef5daf055:

  Merge branch 'clk-fixes' into clk-next (2015-03-09 14:23:45 -0700)

are available in the git repository at:


  git://linuxtv.org/snawrocki/samsung.git tags/for-v4.1-exynos-clk

for you to fetch changes up to b5f81840f48ca580774ca6cccb14a254ea35d51e:

  clk: samsung: exynos3250: Add driver for CMU_ISP clock domain (2015-03-18
11:35:51 +0100)

----------------------------------------------------------------
Support for the Image Signal Processor clock management unit
and the CLKOUT block on Exynos3250.

----------------------------------------------------------------
Inha Song (1):
      clk: samsung: Add CLKOUT driver support for Exynos3250 SoC

Tomasz Figa (1):
      clk: samsung: exynos3250: Add driver for CMU_ISP clock domain

 .../devicetree/bindings/clock/exynos3250-clock.txt |    8 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    2 +
 drivers/clk/samsung/clk-exynos3250.c               |  163 ++++++++++++++++++++
 include/dt-bindings/clock/exynos3250.h             |   61 ++++++++
 4 files changed, 234 insertions(+)

--
Thanks,
Sylwester
