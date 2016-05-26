From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RESEND RFT PATCH 0/2] mfd: max14577: Allow the driver to be built as a module
Date: Thu, 26 May 2016 12:32:18 -0400
Message-ID: <1464280340-13228-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This series is similar to [0] and allows the max14577 PMIC MFD driver to
be built as a module. Currently the Kconfig symbol for the driver is a
boolean but there isn't really a reason for this restriction.

Chanwoo Choi tried to test the original post but found a build issue [1].
The fix for that issue landed in v4.6 so I'm resending this series now
that there are no in-flight dependencies anymore.

The patches have been just built tested because I don't have any of the
boards using this driver, so testing will be highly appreciated.

[0]: https://lkml.org/lkml/2016/2/11/857
[1]: https://lkml.org/lkml/2016/3/17/546

Best regards,
Javier


Javier Martinez Canillas (2):
  mfd: max14577: Use module_init() instead of subsys_initcall()
  mfd: max14577: Allow driver to be built as a module

 drivers/mfd/Kconfig    | 4 ++--
 drivers/mfd/max14577.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.5.5
