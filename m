From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: exynos: Last round for v4.12
Date: Fri, 21 Apr 2017 18:40:49 +0200
Message-ID: <20170421164050.7404-1-krzk@kernel.org>
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
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

I know it is late so just one fix for v4.12.
On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit a1146328ec47141007a6ec076e1cbfc80f31887f:

  Merge tag 'samsung-dt-hdmi-cec-4.12' into next/dt (2017-03-31 00:27:18 +0300)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.12-2

for you to fetch changes up to 6a611d149a9a1eff7c89e81bab018e4121cce17e:

  ARM: dts: exynos: Use - instead of @ for DT OPP entries (2017-04-20 18:06:03 +0200)

----------------------------------------------------------------
Fix DTC warnings in Exynos ARMv7 Device Tree sources.

----------------------------------------------------------------
Viresh Kumar (1):
      ARM: dts: exynos: Use - instead of @ for DT OPP entries

 .../devicetree/bindings/devfreq/exynos-bus.txt     | 46 +++++++--------
 arch/arm/boot/dts/exynos3250.dtsi                  | 46 +++++++--------
 arch/arm/boot/dts/exynos4210.dtsi                  | 32 +++++------
 arch/arm/boot/dts/exynos4412-prime.dtsi            |  4 +-
 arch/arm/boot/dts/exynos4412.dtsi                  | 66 +++++++++++-----------
 arch/arm/boot/dts/exynos5420.dtsi                  | 40 ++++++-------
 arch/arm/boot/dts/exynos5800.dtsi                  | 56 +++++++++---------
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 43 +++++++++++++-
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 17 ++++++
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 18 ++++++
 10 files changed, 221 insertions(+), 147 deletions(-)
