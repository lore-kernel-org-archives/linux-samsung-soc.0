From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 0/2] Add USB DRD 3.0 device node for Exynos7
Date: Wed, 18 Jan 2017 12:02:51 +0530
Message-ID: <1484721173-30474-1-git-send-email-pankaj.dubey@samsung.com>
References: <CGME20170118063006epcas5p28e5430460e604e9c1017ea0a46c89baa@epcas5p2.samsung.com>
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
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, krzk@kernel.org, javier@osg.samsung.com, robh+dt@kernel.org, kgene@kernel.org, sanath@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch series adds USB 3.0 DRD device node for Exynos7 and 
required Vbus and Vbus-boost support for espresso dev boards.
These patches are part of patch series [1] earlier submitted by Vivek


While other patches in these series got merged, DTS related change were
left. I have prepared and tested these patches on top of krzk/for-next and
my patch series "Use macros for pinctrl configuration on Exynos7" [2].

[1]: https://lkml.org/lkml/2014/11/21/247
[2]: https://www.spinics.net/lists/arm-kernel/msg555333.html

Changes since v1:
 - Updated S-o-B order and Authorship of patches.
 - Added Javier's Reviewed-by.
 - Replaced GPIO polarity values with appropriate macros.

Changes since v2:
 - Changed order of S-o-B and R-o-B lines
 - Removed address node from parent usb node
 - Replaced pinctrl configuration values with macros

Vivek Gautam (2):
  arm64: dts: exynos: Add USB 3.0 controller node for Exynos7
  arm64: dts: exynos: Add regulators for Vbus and Vbus-Boost

 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 45 +++++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi         | 34 +++++++++++++++++++
 2 files changed, 79 insertions(+)

-- 
2.7.4
