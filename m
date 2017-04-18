From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH 0/7] regulator: arizona: Prepare for sharing with Madera codecs
Date: Tue, 18 Apr 2017 11:43:46 +0100
Message-ID: <1492512234-19210-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: broonie@kernel.org, lee.jones@linaro.org, kgene@kernel.org, krzk@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

These patches make various changes to the Arizona regulators so that they
can be re-used for the Cirrus Madera codecs:
- pdata is moves out of struct arizona_pdata into driver-specific structs
- all unnecessary dependence on struct arizona is removed
- generic init that doesn't depend on struct arizona is factored out
- The ldo and micsupp drivers now have separate KConfig options because
  only the CS47L85/WM1840 Madera codecs have an LDO1, no other Madera
  codecs will.

The Exynos based Cragganmore platform is a user of struct arizona_pdata
for the LDO1 so patch #5 updates it to the new pdata.

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
