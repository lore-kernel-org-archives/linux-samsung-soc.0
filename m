From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64 dts: exynos: Last round for v4.12
Date: Fri, 21 Apr 2017 18:40:50 +0200
Message-ID: <20170421164050.7404-2-krzk@kernel.org>
References: <20170421164050.7404-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170421164050.7404-1-krzk@kernel.org>
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

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit e3c07546747cdec07ff15c984bc6cebc9c9f788c:

  arm64: dts: exynos: Add the burst and esc clock frequency properties to DSI node (2017-03-08 08:55:39 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.12-2

for you to fetch changes up to 5dccc9873c4af60f4478b3ef54267353f25cc301:

  arm64: dts: exynos: Use - instead of @ for DT OPP entries (2017-04-20 18:10:05 +0200)

----------------------------------------------------------------
Second update of  Samsung DeviceTree ARM64 for v4.12:
 - Fix DTC warnings in Exynos ARM64 Device Tree sources.
 - Add panel node to TM2E board.

----------------------------------------------------------------
Hoegeun Kwon (1):
      arm64: dts: exynos: Add support for s6e3hf2 panel device on TM2e board

Viresh Kumar (1):
      arm64: dts: exynos: Use - instead of @ for DT OPP entries

 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi | 48 ++++++++++++-------------
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts | 11 ++++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 50 +++++++++++++-------------
 3 files changed, 60 insertions(+), 49 deletions(-)
