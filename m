From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: samsung: mach/soc for v5.1
Date: Mon, 11 Feb 2019 20:54:48 +0100
Message-ID: <20190211195448.19983-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.1

for you to fetch changes up to 4bdf2f3f20a9de9b07f97907820c42f3a49ba63d:

  ARM: exynos: Fix timeout when booting secondary CPUs (2019-02-01 20:07:47 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v5.1

Two fixes: one for handling timeout while booting secondary CPU of
Exynos and second for S3C24xx DVS notifier.

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      ARM: s3c24xx: Fix boolean expressions in osiris_dvs_notify

Stuart Menefy (1):
      ARM: exynos: Fix timeout when booting secondary CPUs

 arch/arm/mach-exynos/platsmp.c          | 4 ++--
 arch/arm/mach-s3c24xx/mach-osiris-dvs.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)
