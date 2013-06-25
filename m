From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] Add support for Samsung HSOTG on DT-enabled platforms
Date: Tue, 25 Jun 2013 17:38:22 +0200
Message-ID: <1372174706-5459-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This series enables platforms booting with Device Tree to use the Samsung
HSOTG IP. Since USB PHY support has been already added, it's just a matter
of adding an OF match table to the driver and respective device tree nodes
to dts files.

[On Samsung Trats board based on Exynos 4210]
Tested-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Tomasz Figa (4):
  usb: gadget: s3c-hsotg: Allow driver instantiation using device tree
  ARM: dts: exynos4: Add node for hsotg
  ARM: dts: exynos4: Add nodes for USB PHY block
  ARM: dts: exynos4210-trats: Enable USB gadget functionality

 .../devicetree/bindings/usb/samsung-hsotg.txt      | 40 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos4.dtsi                     |  9 +++++
 arch/arm/boot/dts/exynos4210-trats.dts             | 10 ++++++
 arch/arm/boot/dts/exynos4210.dtsi                  | 15 ++++++++
 arch/arm/boot/dts/exynos4x12.dtsi                  | 15 ++++++++
 drivers/usb/gadget/s3c-hsotg.c                     | 10 ++++++
 6 files changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung-hsotg.txt

-- 
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
