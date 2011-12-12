From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/2] ARM: Exynos: Adapt to generic power domain
Date: Mon, 12 Dec 2011 21:16:27 +0530
Message-ID: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15404 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751026Ab1LLPpP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Dec 2011 10:45:15 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Cc: rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, patches@linaro.org

The power domains available on Exynos4 are made controllable using the generic
power domain infrastructure. The existing power domain code is not removed by
this patchset. Support for both DT and non-DT Exynos platforms is added.

The first patch adds device tree support for generic power domain. A device
node is added to the generic power domain strucure that represents a power
domain node in the device tree. Other device nodes in the device tree can
include a property with a phandle of the power domain node which will enable
that device to be associated with a power domain.

The second patch registers available power domains to generic power domain
framework with support for both dt and non-dt platforms.

The patchset is based on the following tree
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next

with all patches merged from
http://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next

Thomas Abraham (2):
  PM / Domains: Add OF support
  ARM: Exynos: Hook up power domains to generic power domain infrastructure

 arch/arm/mach-exynos/Kconfig |    1 +
 arch/arm/mach-exynos/pm.c    |  179 ++++++++++++++++++++++++++++++++++++++++++
 drivers/base/power/domain.c  |   14 +++-
 include/linux/pm_domain.h    |   13 +++-
 4 files changed, 204 insertions(+), 3 deletions(-)
