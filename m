From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH 0/7] regulator: arizona: Prepare for sharing with Madera codecs
Date: Tue, 18 Apr 2017 11:43:47 +0100
Message-ID: <1492512234-19210-2-git-send-email-rf@opensource.wolfsonmicro.com>
References: <1492512234-19210-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:56060 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756035AbdDRKo3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 06:44:29 -0400
In-Reply-To: <1492512234-19210-1-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org, kgene@kernel.org, krzk@kernel.org
Cc: linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

These patches make various changes to the Arizona regulators so that they
can be re-used for the Cirrus Madera codecs:
- pdata is moves out of struct arizona_pdata into driver-specific structs
- all unnecessary dependence on struct arizona is removed
- generic init that doesn't depend on struct arizona is factored out
- The ldo and micsupp drivers now have separate KConfig options because
  only the CS47L85/WM1840 Madera codecs have an LDO1, no other Madera
  codecs will.

The Exynos based Cragganmore platform is a user of struct arizona_pdata
for the LDO1 so patch 0005 updates it to the new pdata.

Richard Fitzgerald (7):
  regulator: arizona: Split KConfig options for LDO1 and MICSUPP
    regulators
  regulator: arizona-micsupp: Move pdata into a separate structure
  regulator: arizona-micsupp: Make arizona_micsupp independent of struct
    arizona
  regulator: arizona-micsupp: Factor out generic initialization
  regulator: arizona-ldo1: Move pdata into a separate structure
  regulator: arizona-ldo1: Make arizona_ldo1 independent of struct
    arizona
  regulator: arizona-ldo1: Factor out generic initialization

 MAINTAINERS                                  |   1 +
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |   8 +-
 drivers/regulator/Kconfig                    |  14 ++-
 drivers/regulator/Makefile                   |   3 +-
 drivers/regulator/arizona-ldo1.c             | 143 +++++++++++++++------------
 drivers/regulator/arizona-micsupp.c          | 122 +++++++++++++----------
 include/linux/mfd/arizona/pdata.h            |   7 +-
 include/linux/regulator/arizona-ldo1.h       |  24 +++++
 include/linux/regulator/arizona-micsupp.h    |  21 ++++
 9 files changed, 221 insertions(+), 122 deletions(-)
 create mode 100644 include/linux/regulator/arizona-ldo1.h
 create mode 100644 include/linux/regulator/arizona-micsupp.h

-- 
1.9.1
