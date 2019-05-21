From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/5] Exynos EHCI/OHCI: resolve conflict with the generic USB
 device bindings
Date: Tue, 21 May 2019 13:58:44 +0200
Message-ID: <20190521115849.9882-1-m.szyprowski@samsung.com>
References: <CGME20190521120015eucas1p1da2f3f32d6b8af8cb550463686fd4e12@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Dear All,

Commit 69bec7259853 ("USB: core: let USB device know device node") added
support for attaching devicetree node for USB devices. Those nodes are
children of their USB host controller. However Exynos EHCI and OHCI
driver bindings already define child-nodes for each physical root hub
port and assigns respective PHY controller and parameters to them. This
leads to the conflict. A workaround for it has been merged as commit
01d4071486fe ("usb: exynos: add workaround for the USB device bindings
conflict"), but it disabled support for USB device binding for Exynos
EHCI/OHCI controllers.

This patchset tries to resolve this binding conflict by changing Exynos
EHCI/OHCI bindings: PHYs are moved from the sub-nodes to a standard array
under the 'phys' property. Such solution has been suggested by Måns
Rullgård in the following thread: https://lkml.org/lkml/2019/5/13/228

To keep everything working during the transitional time, the changes has
been split into 2 steps. First step (patches 1-3) need to be merged before
the second one (patches 4-5). Patches from each step can be merged to
respective trees without any dependencies - the only requirement is that
second step has to be merged after merging all patches from the first one.

This patchset has been tested on various Exynos4 boards with different
USB host controller configurations (Odroids family: X2, U3, XU3).

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Marek Szyprowski (5):
  dt-bindings: switch Exynos EHCI/OHCI bindings to use array of generic
    PHYs
  ARM: dts: exynos: Add array of generic PHYs to EHCI/OHCI devices
  usb: exynos: add support for getting PHYs from the standard dt array
  ARM: dts: exynos: Remove obsolete port sub-nodes from EHCI/OHCI
    devices
  usb: exynos: Remove support for legacy PHY bindings

 .../devicetree/bindings/usb/exynos-usb.txt    | 41 ++++++----------
 arch/arm/boot/dts/exynos4.dtsi                | 28 ++---------
 .../boot/dts/exynos4210-universal_c210.dts    |  8 +---
 arch/arm/boot/dts/exynos4412-itop-elite.dts   |  9 +---
 arch/arm/boot/dts/exynos4412-odroidu3.dts     |  8 +---
 arch/arm/boot/dts/exynos4412-odroidx.dts      |  5 +-
 arch/arm/boot/dts/exynos4412-origen.dts       |  9 +---
 arch/arm/boot/dts/exynos5250.dtsi             | 16 ++-----
 arch/arm/boot/dts/exynos54xx.dtsi             | 18 ++-----
 drivers/usb/host/ehci-exynos.c                | 48 +++----------------
 drivers/usb/host/ohci-exynos.c                | 48 +++----------------
 11 files changed, 50 insertions(+), 188 deletions(-)

-- 
2.17.1
