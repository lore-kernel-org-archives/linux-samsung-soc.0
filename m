From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/4] mfd: max77686: Allow the driver to be built as a module
Date: Fri, 12 Feb 2016 01:30:15 -0300
Message-ID: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:48029 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751543AbcBLEaj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Feb 2016 23:30:39 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Javier Martinez Canillas <javier@osg.samsung.com>

Hello,

The Maxim77802 PMIC driver uses a boolean Kconfig symbol but there isn't
really a reason to require the driver to be built-in.

It is true that since the PMIC provides clocks and regulators that could
be critical on a system, most integrators are not going to build it as a
module but it could be useful for multi-platform or distribution kernels
that support different systems by building as much as possible as module.

Besides this series, a patch for the max77686 regulator driver is needed
or the MFD max77686 driver module won't be installed by kbuild. I didn't
include the patch in this series to avoid cross-subsystems churn for the
maintainers and also because I don't consider that a regression since it
was not possible to build the driver as a module before anyways.

Also, all the defconfigs in mainline that enable the MFD max77686 driver
Kconfig symbol are using =y of course so it shouldn't be an issue to get
this set merged, before the max77686 regulator patch already posted [0].

[0]: https://patchwork.kernel.org/patch/8287431/

Best regards,
Javier


Javier Martinez Canillas (4):
  mfd: max77686: Add max77802 to I2C device ID table
  mfd: max77686: Use module_i2c_driver() instead of subsys initcall
  mfd: max77686: Allow driver to be built as a module
  mfd: max77686: Export OF module alias information

 drivers/mfd/Kconfig    |  4 ++--
 drivers/mfd/max77686.c | 15 +++------------
 2 files changed, 5 insertions(+), 14 deletions(-)

-- 
2.5.0
