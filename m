From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 0/5] ARM: S3C24XX: move the easy parts to mach-s3c24xx from
 plat-s3c24xx
Date: Mon, 7 May 2012 19:39:37 +0200
Message-ID: <201205071939.37433.heiko@sntech.de>
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
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

plat-s3c24xx still contains code that wasn't moved during the initial
consolidation of the s3c24xx mach directories.

This series moves the easy parts, that shouldn't require changes, to
mach-s3c24xx, following the layout example set out by s3c64xx.

Heiko Stuebner (5):
  ARM: S3C24XX: move plat-s3c24xx/cpu.c
  ARM: S3C24XX: move plat-s3c24xx/irq.c into common.c
  ARM: S3C24XX: move plat-s3c24xx/dev-uart.c into common.c
  ARM: S3C24XX: move common power-management code to mach-s3c24xx
  ARM: S3C24XX: move common clock init into common.c

 arch/arm/mach-s3c24xx/Makefile                     |    6 +
 .../{plat-s3c24xx/irq.c => mach-s3c24xx/common.c}  |  367 ++++++++++++++++++--
 arch/arm/{plat-s3c24xx => mach-s3c24xx}/irq-pm.c   |    0
 arch/arm/{plat-s3c24xx => mach-s3c24xx}/pm.c       |    0
 arch/arm/{plat-s3c24xx => mach-s3c24xx}/sleep.S    |    0
 arch/arm/plat-s3c24xx/Makefile                     |    7 -
 arch/arm/plat-s3c24xx/clock.c                      |   59 ----
 arch/arm/plat-s3c24xx/cpu.c                        |  236 -------------
 arch/arm/plat-s3c24xx/dev-uart.c                   |  100 ------
 9 files changed, 336 insertions(+), 439 deletions(-)
 rename arch/arm/{plat-s3c24xx/irq.c => mach-s3c24xx/common.c} (64%)
 rename arch/arm/{plat-s3c24xx => mach-s3c24xx}/irq-pm.c (100%)
 rename arch/arm/{plat-s3c24xx => mach-s3c24xx}/pm.c (100%)
 rename arch/arm/{plat-s3c24xx => mach-s3c24xx}/sleep.S (100%)
 delete mode 100644 arch/arm/plat-s3c24xx/clock.c
 delete mode 100644 arch/arm/plat-s3c24xx/cpu.c
 delete mode 100644 arch/arm/plat-s3c24xx/dev-uart.c

-- 
1.7.5.4
