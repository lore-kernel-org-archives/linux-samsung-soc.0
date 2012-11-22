From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v4 0/5] ARM: EXYNOS: Add secure firmware support
Date: Thu, 22 Nov 2012 16:51:13 +0100
Message-ID: <1353599478-24617-1-git-send-email-t.figa@samsung.com>
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
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, t.figa@samsung.com, tomasz.figa@gmail.com, kyungmin.park@samsung.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Some Exynos-based boards are running with secure firmware running in
TrustZone secure world, which changes the way some things have to be
initialized.

This series adds support for specifying firmware operations, implements
some firmware operations for Exynos secure firmware and adds a method of
enabling secure firmware operations on Exynos-based boards through board
file and device tree.

Depends on:
  - ARM: EXYNOS: Add support for secondary CPU bring-up on Exynos4412

Changes since v3
( http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13442 )
  - Replaced cpu_boot_reg call with cpu_set_boot_addr
  - Added interface documentation
  - Separated from Exynos4x12 secondary CPU bring-up patch

Changes since v2
( http://thread.gmane.org/gmane.linux.kernel.samsung-soc/12848 )
  - Made Exynos firmware binding require address
  - Minor style fixes

Changes since v1
( http://thread.gmane.org/gmane.linux.kernel.samsung-soc/12583/focus=12820 )
  - Changed return types of all operations to int
  - Defined all operations to return 0 on success, -ENOSYS when not
    implemented or appropriate error code on error

Tomasz Figa (5):
  ARM: Add interface for registering and calling firmware-specific
    operations
  ARM: EXYNOS: Add support for secure monitor calls
  ARM: EXYNOS: Add support for Exynos secure firmware
  ARM: EXYNOS: Add IO mapping for non-secure SYSRAM.
  ARM: EXYNOS: Add secure firmware support to secondary CPU bring-up

 Documentation/arm/firmware.txt                     | 88 ++++++++++++++++++++++
 .../devicetree/bindings/arm/samsung-boards.txt     | 10 +++
 arch/arm/common/Makefile                           |  2 +
 arch/arm/common/firmware.c                         | 18 +++++
 arch/arm/include/asm/firmware.h                    | 66 ++++++++++++++++
 arch/arm/mach-exynos/Makefile                      |  6 ++
 arch/arm/mach-exynos/common.c                      | 35 +++++++++
 arch/arm/mach-exynos/common.h                      |  2 +
 arch/arm/mach-exynos/exynos-smc.S                  | 22 ++++++
 arch/arm/mach-exynos/firmware.c                    | 70 +++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h            |  3 +
 arch/arm/mach-exynos/mach-exynos4-dt.c             |  1 +
 arch/arm/mach-exynos/platsmp.c                     | 32 ++++++--
 arch/arm/mach-exynos/smc.h                         | 31 ++++++++
 arch/arm/plat-samsung/include/plat/map-s5p.h       |  1 +
 15 files changed, 382 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/arm/firmware.txt
 create mode 100644 arch/arm/common/firmware.c
 create mode 100644 arch/arm/include/asm/firmware.h
 create mode 100644 arch/arm/mach-exynos/exynos-smc.S
 create mode 100644 arch/arm/mach-exynos/firmware.c
 create mode 100644 arch/arm/mach-exynos/smc.h

-- 
1.8.0
