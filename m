From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 0/3] dts: exynos5: Add required VDD supplies for USB
Date: Wed, 23 Apr 2014 20:59:26 +0530
Message-ID: <1398266969-26000-1-git-send-email-gautam.vivek@samsung.com>
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
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, jg1.han@samsung.com, linux-kernel@vger.kernel.org, balbi@ti.com, av.tikhomirov@samsung.com, stern@rowland.harvard.edu, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Based on for-next branch of Kgene's linux-samsung tree, with
following patch series:
[PATCH 0/9] Enable USB 3.0 support on Exynos5 systems
https://lkml.org/lkml/2014/4/23/389

These are device tree patches corresponding to the usb driver patch-series:
[PATCH 1/3] usb: ohci-exynos: Make provision for vdd regulators
[PATCH 2/3] usb: ehci-exynos: Make provision for vdd regulators
[PATCH 3/3] usb: dwc3-exynos: Make provision for vdd regulators

Vivek Gautam (3):
  dts: exynos5250: Add required VDD regulator supplies for usb
  dts: exynos5250-snow: Add required VDD regulator supplies for usb
  dts: exynos5420-smdk5420: Add required VDD regulator supplies for usb

 arch/arm/boot/dts/exynos5250-smdk5250.dts |   12 ++++++++++++
 arch/arm/boot/dts/exynos5250-snow.dts     |   12 ++++++++++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   20 ++++++++++++++++++++
 3 files changed, 44 insertions(+)

-- 
1.7.10.4
