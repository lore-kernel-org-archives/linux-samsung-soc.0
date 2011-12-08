From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/2] Add device tree support for MAX8997
Date: Thu, 08 Dec 2011 21:57:37 +0530
Message-ID: <1323361659-11835-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53210 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988Ab1LHQ0U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Dec 2011 11:26:20 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: rpurdie@rpsys.net, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

MAX8997 is a multi-function device which includes support for regulators, rtc,
battery charger and other sub-blocks. This patchset adds device tree support
for the pmic (regulators) sub-block.

The first patch adds irq domain support for the interrupts supported by max8997
mainly for removing the need to pass a irq_base from the platform code. The
irq_base could not anyway be passed in case of device tree based instantiation.

The second patch adds device tree support for max8997. This patch modifies both
mfd and regulator portions of the max8997 code. So does this patch have to be
split into two, one for mfd and one for regulator?

This patchset is based on the following tree.
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git  for-next

and depends on the following patchs.
[1] All the regulator device tree related patches from
    git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git topic/dt
    (from commit 8f446e6fa1d506be2cb80f91c214f1705327c7f9).
[2] Device tree support patches for wakeup interrupt sources on Exynos4.
[3] [PATCH] irqdomain: export irq_domain._simple_op.s for !CONFIG_OF

This patchset has been tested on Origen board.

Thomas Abraham (2):
  mfd: add irq domain support for max8997 interrupts
  regulator: add device tree support for max8997

 .../devicetree/bindings/regulator/max8997-pmic.txt |  122 +++++++++++++++++
 arch/arm/mach-exynos/mach-nuri.c                   |    4 -
 arch/arm/mach-exynos/mach-origen.c                 |    1 -
 drivers/mfd/max8997-irq.c                          |   33 +++--
 drivers/mfd/max8997.c                              |   71 ++++++++++-
 drivers/regulator/max8997.c                        |  137 ++++++++++++++++++++
 include/linux/mfd/max8997-private.h                |    4 +-
 include/linux/mfd/max8997.h                        |    1 -
 8 files changed, 350 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/max8997-pmic.txt
