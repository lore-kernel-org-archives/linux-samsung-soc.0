From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [RFC PATCH v3 0/2] ARM: EXYNOS: Fix Suspend-to-RAM on Exynos5420
Date: Mon, 30 Mar 2015 17:53:20 +0200
Message-ID: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43181 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752503AbbC3Pxh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 11:53:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hello,

This series is a 3rd version of a RFC to fix Suspend-to-RAM on Exynos5420.
Abhilash Kesavan traced down to the MDMA0 DMA controller clock needed to
be enabled during suspend in order to make the system resume correctly.

I posted a RFC that grabbed the clock in the Exynos5420 specific suspend
and resume callbacks [0] and a re-spin [1] but was asked by Abhilash and
Chanwoo to do it in the clock driver instead.

So this series is an attempt to fix the issue and is composed of patches:

Javier Martinez Canillas (2):
  clk: samsung: Add a clock lookup function
  clk: exynos5420: Make sure MDMA0 clock is enabled during suspend

 drivers/clk/samsung/clk-exynos5420.c | 26 ++++++++++++++++++++++++--
 drivers/clk/samsung/clk.c            |  6 ++++++
 drivers/clk/samsung/clk.h            |  3 +++
 3 files changed, 33 insertions(+), 2 deletions(-)

Patch #1 just adds a function to lookup the provider clock instances.

Patch #2 enables the MDMA0 clock before entering into a suspend state and
disables it again once the system has been resumed.

The patches are again an RFC because I'm not sure if this is the best
approach to solve the issue. So feedback will be highly appreciated.

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/3/27/397
[1]: https://lkml.org/lkml/2015/3/27/770
