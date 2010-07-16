From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v2 0/5] ARM: S5PV210: CPUFREQ Initial Support
Date: Fri, 16 Jul 2010 17:01:12 +0900
Message-ID: <1279267277-6804-1-git-send-email-myungjoo.ham@samsung.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

S5PV210 CPUFREQ Initial Support.

This is a series of patches to enable CPUFREQ for S5PV210.

Although this works without PMIC's DVS support, it is not
as effective without DVS support as supposed. AVS is not
supported in this version.


MyungJoo Ham (5):
  ARM: Samsung SoC: added hclk/pclk info to s3c_freq for s5pv210
    cpu-freq
  ARM: S5P: Added default pll values for APLL 800/1000MHz
  ARM: S5PV210: macros for clock registers at regs-clock.h
  ARM: S5PV210: add DMCx access virtual address
  ARM: S5PV210: Initial CPUFREQ Support

 arch/arm/Kconfig                                |    1 +
 arch/arm/mach-s5pv210/Makefile                  |    3 +
 arch/arm/mach-s5pv210/cpu.c                     |   12 +-
 arch/arm/mach-s5pv210/cpufreq-s5pv210.c         |  776 +++++++++++++++++++++++
 arch/arm/mach-s5pv210/include/mach/cpu-freq.h   |   50 ++
 arch/arm/mach-s5pv210/include/mach/map.h        |    8 +
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |   45 ++-
 arch/arm/plat-s5p/include/plat/pll.h            |    8 +
 arch/arm/plat-samsung/include/plat/cpu-freq.h   |    6 +
 9 files changed, 905 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/cpufreq-s5pv210.c
 create mode 100644 arch/arm/mach-s5pv210/include/mach/cpu-freq.h
