From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Exynos5422 EHCI (USB 2.0) - Odroid XU4 - port 1 resume error -110
Date: Sun, 29 Jan 2017 15:35:37 +0200
Message-ID: <CAJKOXPdFuixraNh_aZt9OMU5bEjtS81dz-mBLfWRBE6ejjeWaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Richard Genoud <richard.genoud@gmail.com>, Anand Moon <linux.amoon@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Odroid XU4 with an external usb2514 hub (evaluation board from SMSC
or TI) connected to the USB2.0 port of EHCI controller, whenever I
plug some USB device into the usb2514 hub I see errors like:
[   73.969179] exynos-ehci 12110000.usb: port 1 resume error -110
[   74.003259] usb 1-1: USB disconnect, device number 2
[   74.017432] usb usb1-port1: cannot reset (err = -32)
[   74.021141] usb usb1-port1: cannot reset (err = -32)
[   74.026832] usb usb1-port1: cannot reset (err = -32)
[   74.030974] usb usb1-port1: cannot reset (err = -32)
[   74.036677] usb usb1-port1: cannot reset (err = -32)
[   74.041919] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[   74.140923] usb usb1-port1: unable to enumerate USB device

Flooding the console. USB device does not work.

Tested:
1. next-20170125,
2. mainline v4.10-rc5-393-g53cd1ad1a68f,
3. Hardkernel vendor kernel 3.10


It does not look like an issue of usb2514 but rather a combination of
usb2514 + Exynos EHCI because:
1. Happens only when usb2514 hub is directly connected to the USB2.0
port of EHCI controller.
2. If usb2514 is connected through other hub (like to other ports on
the board) - everything works fine.
3. I tested two different usb2514 hubs - one from TI, second from
SMSC. Both behave the same.
4. I had the same issue on DWC3 controller (USB 3.0 port) and in that
case helped ENABLING bits DWC3_GUSB2PHYCFG_SUSPHY and
DWC3_GUSB3PIPECTL_SUSPHY which is I think equal to disabling the
snps,dis_u3_susphy_quirk quirks.


It seems that issue is strictly related to Exynos5422 USB 2.0 driver
(phy?) and this hub. The drivers involved:
 - drivers/phy/phy-exynos5250-usb2.c
 - drivers/phy/phy-samsung-usb2.c
 - drivers/usb/host/ehci-exynos.c

Any ideas?

Best regards,
Krzysztof
