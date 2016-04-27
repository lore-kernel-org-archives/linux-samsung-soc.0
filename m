From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 1/3] ARM: dts: exynos: Secound round of DTS for v4.7
Date: Wed, 27 Apr 2016 11:10:54 +0200
Message-ID: <1461748256-4394-2-git-send-email-k.kozlowski@samsung.com>
References: <1461748256-4394-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1461748256-4394-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Few DTS changes, nothing special.

Best regards,
Krzysztof


The following changes since commit 06e520c4f067e7284fded10656acca924123c58e:

  ARM: dts: s5p: Fix DTC unit name warnings in SMDKv210 board (2016-04-13 11:14:52 +0200)

are available in the git repository at:

  kernel.org:/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.7-2

for you to fetch changes up to 8691f91b5f5b8687515654b065ebca447ba8b13a:

  ARM: dts: exynos: Enable PRNG and SSS for all Exynos4 devices (2016-04-27 10:14:12 +0200)

----------------------------------------------------------------
Secound round of Samsung Device Tree updates and improvements for v4.7:
1. Cleanup regulator bindings on Exynos5420 boards.
2. Support MIC bypass in display path for Exynos5420.
3. Enable PRNG and SSS for all Exynos4 devices.

----------------------------------------------------------------
Chanho Park (1):
      ARM: dts: exynos: Add exynos5420-fimd compatible

Krzysztof Kozlowski (2):
      ARM: dts: exynos: Remove unsupported s2mps11 regulator bindings from Exynos5420 boards
      ARM: dts: exynos: Enable PRNG and SSS for all Exynos4 devices

 arch/arm/boot/dts/exynos4.dtsi                     | 2 --
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    | 4 ----
 arch/arm/boot/dts/exynos4412-trats2.dts            | 8 --------
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 7 -------
 arch/arm/boot/dts/exynos5420-smdk5420.dts          | 7 -------
 arch/arm/boot/dts/exynos5420.dtsi                  | 1 +
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 7 -------
 7 files changed, 1 insertion(+), 35 deletions(-)
