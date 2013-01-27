From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v4 0/9] ARM: S3C24XX: rework irq handling for a later dt usage
Date: Sun, 27 Jan 2013 21:24:18 +0100
Message-ID: <201301272124.18530.heiko@sntech.de>
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
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
List-Id: linux-samsung-soc@vger.kernel.org

This v4 does not change any code part. The patches are merely rebased
to apply to the next/cleanup-s3c24xx branch as requested.

Heiko Stuebner (9):
  ARM: S3C24XX: transform irq handling into a declarative form
  ARM: S3C24XX: Move irq syscore-ops to irq-pm
  ARM: S3C24XX: Modify s3c_irq_wake to use the hwirq property
  ARM: S3C24XX: move s3c2416 irq init to common irq code
  ARM: S3C24XX: modify s3c2416 irq init to initialize all irqs
  ARM: S3C24XX: transform s3c2416 irqs into new structure
  ARM: S3C24XX: move s3c2443 irq code to irq.c
  ARM: S3C24XX: modify s3c2443 irq init to initialize all irqs
  ARM: S3C24XX: transform s3c2443 subirqs into new structure

 arch/arm/mach-s3c24xx/Makefile               |    4 +-
 arch/arm/mach-s3c24xx/common.h               |    2 +
 arch/arm/mach-s3c24xx/irq-pm.c               |   41 +-
 arch/arm/mach-s3c24xx/irq-s3c2416.c          |  348 --------
 arch/arm/mach-s3c24xx/irq-s3c2443.c          |  281 -------
 arch/arm/mach-s3c24xx/mach-smdk2416.c        |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2443.c        |    2 +-
 arch/arm/mach-s3c24xx/s3c2410.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2412.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2416.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2440.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2442.c              |    4 +-
 arch/arm/plat-s3c24xx/Kconfig                |    1 +
 arch/arm/plat-s3c24xx/irq.c                  | 1110 +++++++++++++++-----------
 arch/arm/plat-samsung/include/plat/pm.h      |    6 -
 arch/arm/plat-samsung/include/plat/s3c2416.h |    1 +
 arch/arm/plat-samsung/include/plat/s3c2443.h |    2 +
 17 files changed, 688 insertions(+), 1132 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2416.c
 delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2443.c

-- 
1.7.10.4
