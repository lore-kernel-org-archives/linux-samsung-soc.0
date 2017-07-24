From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/5] ARM: dts: exynos: Updates for v4.14
Date: Mon, 24 Jul 2017 21:08:53 +0200
Message-ID: <20170724190856.19055-2-krzk@kernel.org>
References: <20170724190856.19055-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170724190856.19055-1-krzk@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.14

for you to fetch changes up to 9d2770b8e49a1726310e706ae23b52c83b33a986:

  ARM: dts: exynos: Remove num-slots from exynos platforms (2017-07-18 07:14:22 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v4.13

Remove deprecated and unneeded properties from Exynos boards.

----------------------------------------------------------------
Hoegeun Kwon (1):
      ARM: dts: exynos: Remove the OF graph from DSI node

Shawn Lin (1):
      ARM: dts: exynos: Remove num-slots from exynos platforms

 arch/arm/boot/dts/exynos3250-artik5-eval.dts    |  1 -
 arch/arm/boot/dts/exynos3250-artik5.dtsi        |  1 -
 arch/arm/boot/dts/exynos3250-monk.dts           |  1 -
 arch/arm/boot/dts/exynos3250-rinato.dts         | 22 ----------------------
 arch/arm/boot/dts/exynos4210-trats.dts          | 21 ---------------------
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi |  1 -
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  1 -
 arch/arm/boot/dts/exynos4412-origen.dts         |  1 -
 arch/arm/boot/dts/exynos4412-trats2.dts         | 22 ----------------------
 arch/arm/boot/dts/exynos5250-arndale.dts        |  2 --
 arch/arm/boot/dts/exynos5250-smdk5250.dts       |  2 --
 arch/arm/boot/dts/exynos5250-snow-common.dtsi   |  3 ---
 arch/arm/boot/dts/exynos5250-spring.dts         |  2 --
 arch/arm/boot/dts/exynos5260-xyref5260.dts      |  2 --
 arch/arm/boot/dts/exynos5410-smdk5410.dts       |  2 --
 arch/arm/boot/dts/exynos5420-peach-pit.dts      |  3 ---
 arch/arm/boot/dts/exynos5800-peach-pi.dts       |  3 ---
 17 files changed, 90 deletions(-)
