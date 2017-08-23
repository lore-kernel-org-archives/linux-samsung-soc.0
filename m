From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: dts: exynos: Changes for v4.14
Date: Wed, 23 Aug 2017 18:36:35 +0200
Message-ID: <20170823163635.6064-3-krzk@kernel.org>
References: <20170823163635.6064-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170823163635.6064-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Just one commit. If needed you can also cherry-pick it directly.
Based on top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 9d2770b8e49a1726310e706ae23b52c83b33a986:

  ARM: dts: exynos: Remove num-slots from exynos platforms (2017-07-18 07:14:22 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.14-2

for you to fetch changes up to 5911fc65f6da56ba55ccab34832e040522e9a3b5:

  ARM: dts: exynos: fix PCI bus dtc warnings (2017-07-28 07:49:14 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v4.14, part 2

Fix PCI bus dtc warnings.

----------------------------------------------------------------
Rob Herring (1):
      ARM: dts: exynos: fix PCI bus dtc warnings

 arch/arm/boot/dts/exynos5440.dtsi | 2 ++
 1 file changed, 2 insertions(+)
