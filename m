From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: Stuff for v4.12
Date: Sat,  8 Apr 2017 16:20:49 +0200
Message-ID: <20170408142050.1164-2-krzk@kernel.org>
References: <20170408142050.1164-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:38126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752512AbdDHOV2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 8 Apr 2017 10:21:28 -0400
In-Reply-To: <20170408142050.1164-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>

Hi,

Update for v4.12. Marek's commits were also shared (as separate sub-tag) to MFD
(Lee Jones) for his work (it is a dependency).

Best regards,
Krzysztof

Cc: Lee Jones <lee.jones@linaro.org>

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-4.12

for you to fetch changes up to f69ae4f58a198ad15b0422637434d2bcf6fc2e2a:

  pinctrl: samsung: Use devres version of gpiochip_add_data (2017-03-23 21:13:19 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers update for v4.12:
1. Add support for pad retention control through pinctrl drivers which
   moves us forward to better runtime PM of pinctrl, clocks, power domains
   and other devices.
2. Fix GPIO hogs by registering pinctrl before registering gpiolib.
3. Use devm-like interface.

----------------------------------------------------------------
Charles Keepax (2):
      pinctrl: samsung: Register pinctrl before GPIO
      pinctrl: samsung: Use devres version of gpiochip_add_data

Marek Szyprowski (2):
      pinctrl: samsung: Ensure that pad retention is disabled on driver init
      pinctrl: samsung: Add support for pad retention control for Exynos5433 SoCs

 drivers/pinctrl/samsung/pinctrl-exynos.c  | 63 +++++++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c | 45 ++++++++++------------
 2 files changed, 83 insertions(+), 25 deletions(-)
