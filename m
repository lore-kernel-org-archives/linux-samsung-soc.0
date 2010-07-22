From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v4 0/7] ARM: S5PV210: CPUFREQ Initial Support
Date: Thu, 22 Jul 2010 18:22:46 +0900
Message-ID: <1279790573-24179-1-git-send-email-myungjoo.ham@samsung.com>
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


MyungJoo Ham (7):
  ARM: S5PV210: Allow to probe whether workaround codes are required.
  ARM: Samsung SoC: added hclk/pclk info to s3c_freq for s5pv210
    cpu-freq
  ARM: S5P: Added default pll values for APLL 800/1000MHz
  ARM: S5P: Virtual Addresses for DMCx registers.
  ARM: S5PV210: Access for DMCx registers
  ARM: S5PV210: macros for clock registers at regs-clock.h
  ARM: S5PV210: Initial CPUFREQ Support

 arch/arm/Kconfig                                |    1 +
 arch/arm/mach-s5pv210/Kconfig                   |    5 +
 arch/arm/mach-s5pv210/Makefile                  |    2 +
 arch/arm/mach-s5pv210/cpu.c                     |   45 ++-
 arch/arm/mach-s5pv210/cpufreq.c                 |  783 +++++++++++++++++++++++
 arch/arm/mach-s5pv210/include/mach/cpu-freq.h   |   40 ++
 arch/arm/mach-s5pv210/include/mach/hardware.h   |    3 +-
 arch/arm/mach-s5pv210/include/mach/map.h        |    4 +
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |   45 ++-
 arch/arm/mach-s5pv210/mach-aquila.c             |    4 +
 arch/arm/plat-s5p/include/plat/map-s5p.h        |    3 +
 arch/arm/plat-s5p/include/plat/pll.h            |    3 +
 arch/arm/plat-samsung/include/plat/cpu-freq.h   |    6 +
 13 files changed, 939 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/cpufreq.c
 create mode 100644 arch/arm/mach-s5pv210/include/mach/cpu-freq.h

--
v2:
	- Ramp-up delay is removed. (let regulator framework do the job)
	- Provide proper max values for regulator_set_voltage
	- Removed unneccesary #ifdef's.
	- Removed unnecessary initialiser for CLK_OUT
v3:
	- Style corrections (pr_info/pr_err, ...)
	- Revised dvs_conf struct
v4:
	- Renamed cpufreq-s5pv210.c -> cpufreq.c
	- Style corrections (less #ifdef's, comments)
	- Removed unncessary codes
	- Remove #ifdef for WORKAROUND, use s5pv210_workaround()
	- Renamed some static variables (get rid of s5pv210 prefix)
	- Added machine dependency to Kconfig/Makefile
	- DMC0, DMC1 refresh counter is not updated by a hardcoded value, but
	with the value given as the default and relative clock speeds. Besides,
	the algorithm to update DMC0/1 refresh counter is reformed.
