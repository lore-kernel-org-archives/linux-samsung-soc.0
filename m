From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/5] ARM: s3c24xx: Early stuff for v4.14
Date: Mon, 24 Jul 2017 21:08:52 +0200
Message-ID: <20170724190856.19055-1-krzk@kernel.org>
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
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-4.14

for you to fetch changes up to f991ce429a420dbb42b3e4b5a47490c84390d7e1:

  ARM: s3c24xx: make H1940BT depend on RFKILL (2017-07-20 20:26:24 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v4.14

Only for S3C24xx platform:
1. Cleanup from non-existent CONFIG entries.
2. Fix unmet NET dependency when H1940 bluetooth chip is selected..

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: s3c24xx: make H1940BT depend on RFKILL

Krzysztof Kozlowski (3):
      ARM: s3c24xx: Remove non-existing CONFIG_CPU_S3C2413
      ARM: s3c24xx: Remove non-existing SND_SOC_SMDK2443_WM9710
      ARM: s3c24xx: Do not confuse local define with Kconfig

 arch/arm/mach-s3c24xx/Kconfig                   |  2 +-
 arch/arm/mach-s3c24xx/common.c                  |  2 +-
 arch/arm/mach-s3c24xx/include/mach/regs-clock.h |  4 ++--
 arch/arm/mach-s3c24xx/mach-smdk2443.c           |  8 --------
 arch/arm/mach-s3c24xx/sleep.S                   | 11 ++++++-----
 arch/arm/plat-samsung/include/plat/map-s3c.h    |  2 +-
 6 files changed, 11 insertions(+), 18 deletions(-)
