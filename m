From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: exynos: Second round for v5.2
Date: Sun, 28 Apr 2019 16:42:20 +0200
Message-ID: <20190428144221.11187-1-krzk@kernel.org>
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

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 8cc76b1c75722196fb3d7ffe67cbfeb721a7b0e3:

  ARM: dts: exynos: Remove console argument from bootargs (2019-04-10 18:13:31 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.2-2

for you to fetch changes up to b4bcbdee137833aab04942671b48a9a3beb0801b:

  ARM: dts: s5pv210: Fix camera clock provider on Goni board (2019-04-24 19:55:14 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.2, second round

1. DTC warning fixes: move timer and pmu nodes outside of soc node,
2. Properly override MDMA0 on Universal C210,
3. Fix camera clock provider (to match bindings and driver) on Goni.

----------------------------------------------------------------
Krzysztof Kozlowski (5):
      ARM: dts: exynos: Move pmu and timer nodes out of soc
      ARM: dts: exynos: Remove unneeded address/size cells from fixed-clock on Exynos3250
      ARM: dts: exynos: Move fixed-clocks out of soc on Exynos3250
      ARM: dts: exynos: Properly override node to use MDMA0 on Universal C210
      ARM: dts: s5pv210: Fix camera clock provider on Goni board

 arch/arm/boot/dts/exynos3250.dtsi               | 72 ++++++++++++-------------
 arch/arm/boot/dts/exynos4.dtsi                  | 14 ++---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 17 +++++-
 arch/arm/boot/dts/exynos5250.dtsi               | 40 +++++++-------
 arch/arm/boot/dts/exynos54xx.dtsi               | 38 ++++++-------
 arch/arm/boot/dts/s5pv210-goni.dts              |  2 +-
 arch/arm/boot/dts/s5pv210.dtsi                  |  6 +--
 7 files changed, 100 insertions(+), 89 deletions(-)
