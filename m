From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3rd 3/3] Samsung clk-2 updates for 3.16
Date: Mon, 26 May 2014 13:03:27 +0900
Message-ID: <035801cf7897$72d573e0$58805ba0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57486 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751532AbaEZED3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 00:03:29 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6500FTDXXS8Z70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 May 2014 13:03:28 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com

The following changes since commit 6520e968eef4f88c076a84a80e026049d157132e:

  clk: exynos5420: Add 5800 specific clocks (2014-05-19 22:15:08 +0900)

are available in the git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-clk-2

for you to fetch changes up to bfed1074f213051e94648bfad0d0611a16d81366:

  clk: exynos5250: Add missing sysmmu clocks for DISP and ISP blocks
(2014-05-26 06:48:10 +0900)

----------------------------------------------------------------
Samsung 2nd clock updates for 3.16	

- Add missing sysmmu clocks for DISP and ISP blocks for exynos5250

----------------------------------------------------------------
Cho KyongHo (1):
      clk: exynos5250: Add missing sysmmu clocks for DISP and ISP blocks

 drivers/clk/samsung/clk-exynos5250.c   |   35
++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/exynos5250.h |   16 +++++++++++++++
 2 files changed, 51 insertions(+)
