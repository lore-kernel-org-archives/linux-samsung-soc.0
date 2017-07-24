From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/5] arm64: dts: exynos: Updates for v4.14
Date: Mon, 24 Jul 2017 21:08:54 +0200
Message-ID: <20170724190856.19055-3-krzk@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.14

for you to fetch changes up to 10acba1293db5c28d1b81d673e75c2415cb96f62:

  arm64: dts: exynos: Remove num-slots from exynos platforms (2017-07-18 07:16:14 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v4.14

1. Remove deprecated and unneeded properties from Exynos boards.
2. Implement proper (working) support for USB On-The-Go on Exynos5433
   TM2/TM2E boards.

----------------------------------------------------------------
Dongwoo Lee (2):
      arm64: dts: exynos: Fix wrong label for USB 3.0 controller node
      arm64: dts: exynos: Add extcon property for TM2 and TM2E

Hoegeun Kwon (1):
      arm64: dts: exynos: Remove the OF graph from DSI node

Shawn Lin (1):
      arm64: dts: exynos: Remove num-slots from exynos platforms

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 19 ++-----------------
 arch/arm64/boot/dts/exynos/exynos5433.dtsi            |  4 ++--
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       |  2 --
 3 files changed, 4 insertions(+), 21 deletions(-)
