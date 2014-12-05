From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] samsung clk cleanups and fixes for v3.19
Date: Fri, 05 Dec 2014 13:04:36 +0100
Message-ID: <54819F54.1060705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:54092 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750800AbaLEMEx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Dec 2014 07:04:53 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NG300JX1Z0NYY70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Dec 2014 12:07:35 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>


Hi Mike,

This includes a few bug fix and cleanup patches for clk/samsung.
Please pull for 3.19 if it looks OK.

The following changes since commit 2e41b9fc11f2d242f39b36ceba833471629ba3d5:

  clk: samsung: Spelling s/bwtween/between/ (2014-12-02 12:28:20 +0100)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/for-v3.19-exynos-clk-2

for you to fetch changes up to c31844ffdbd4e73a16c66e9d7df8ec290ab4b159:

  clk: samsung: Fix double add of syscore ops after driver rebind (2014-12-02
16:22:59 +0100)

----------------------------------------------------------------
- exynos4415 and exynos audio subsystem clk driver (build
  with PM_SLEEP disabled, resource release) fixes
- minor cleanups in drivers/clk/samsung/clk.c (spelling,
  includes)
- modification of the exynos4 HDMI PHY clock definition to
  model dependency of "sclk_hdmiphy" on the "hdmi" clock

----------------------------------------------------------------
Andrzej Hajda (1):
      clk: samsung: exynos4: set parent of sclk_hdmiphy to hdmi

Krzysztof Kozlowski (2):
      clk: samsung: exynos4415: Fix build with PM_SLEEP disabled
      clk: samsung: Fix double add of syscore ops after driver rebind

Pankaj Dubey (2):
      clk: samsung: remove unnecessary CONFIG_OF from clk.c
      clk: samsung: remove unnecessary inclusion of header files from clk.h

 drivers/clk/samsung/clk-exynos-audss.c |    4 ++++
 drivers/clk/samsung/clk-exynos4.c      |    2 +-
 drivers/clk/samsung/clk-exynos4415.c   |    6 ++++--
 drivers/clk/samsung/clk.c              |    4 ++--
 drivers/clk/samsung/clk.h              |    4 ----
 5 files changed, 11 insertions(+), 9 deletions(-)

--
Thanks,
Sylwester
