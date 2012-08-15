From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/2] Enable pinctrl driver support for Exynos4210 based
 platforms
Date: Thu, 16 Aug 2012 01:40:40 +0530
Message-ID: <1345061442-32378-1-git-send-email-thomas.abraham@linaro.org>
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
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linus.walleij@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch series enables support for pin controller driver for Exynos4210 SoC
based device tree enabled platforms. The first patch in this series adds the
pin group nodes for each of the three pin controller instances, but it is not
a exhaustive list of all possible pin group nodes. As the coverage of pinctrl
driver is extended device drivers used on Exynos4210 platforms, additional
pin group nodes can be added as required.

Thomas Abraham (2):
  ARM: dts: Add pinctrl node entries for Samsung Exynos4210 SoC
  ARM: EXYNOS: Enable PINCTRL config option for Exynos4 device tree enabled platform

 arch/arm/boot/dts/exynos4210-pinctrl.dtsi |  457 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi         |   37 +++
 arch/arm/mach-exynos/Kconfig              |    1 +
 3 files changed, 495 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4210-pinctrl.dtsi
