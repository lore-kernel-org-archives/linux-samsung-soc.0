From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 1/3] phy: Add new Exynos USB PHY driver
Date: Wed, 06 Nov 2013 13:58:45 +0100
Message-ID: <2413995.ezl3Ca2YTh@amdc1227>
References: <1383668001-19141-1-git-send-email-k.debski@samsung.com>
 <2656549.jVSier62Qi@amdc1227> <527A3B1C.50200@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61351 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756152Ab3KFM6x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Nov 2013 07:58:53 -0500
In-reply-to: <527A3B1C.50200@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Kamil Debski <k.debski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org, kyungmin.park@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org

On Wednesday 06 of November 2013 18:20:36 Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Wednesday 06 November 2013 05:08 PM, Tomasz Figa wrote:
> > Hi Kishon
> >
> > On Wednesday 06 of November 2013 13:48:13 Kishon Vijay Abraham I wrote:
> >> Hi,
> >>
> >> On Tuesday 05 November 2013 09:43 PM, Kamil Debski wrote:
> >>> Add a new driver for the Exynos USB PHY. The new driver uses the generic
> >>> PHY framework. The driver includes support for the Exynos 4x10 and 4x12
> >>> SoC families.
> >>>
> >>> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> >>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >>> ---
> >>>    .../devicetree/bindings/phy/samsung-usbphy.txt     |   52 ++++
> >>>    drivers/phy/Kconfig                                |   23 +-
> >>>    drivers/phy/Makefile                               |    4 +
> >>>    drivers/phy/phy-exynos-usb2.c                      |  234 ++++++++++++++
> >>>    drivers/phy/phy-exynos-usb2.h                      |   87 ++++++
> >>>    drivers/phy/phy-exynos4210-usb2.c                  |  272 ++++++++++++++++
> >>>    drivers/phy/phy-exynos4212-usb2.c                  |  324 ++++++++++++++++++++
> >>>    7 files changed, 995 insertions(+), 1 deletion(-)
> >>>    create mode 100644 Documentation/devicetree/bindings/phy/samsung-usbphy.txt
> >>>    create mode 100644 drivers/phy/phy-exynos-usb2.c
> >>>    create mode 100644 drivers/phy/phy-exynos-usb2.h
> >>>    create mode 100644 drivers/phy/phy-exynos4210-usb2.c
> >>>    create mode 100644 drivers/phy/phy-exynos4212-usb2.c
> > [snip]
> >>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> >>> index a344f3d..bdf0fab 100644
> >>> --- a/drivers/phy/Kconfig
> >>> +++ b/drivers/phy/Kconfig
> > [snip]
> >>> @@ -51,4 +51,25 @@ config PHY_EXYNOS_DP_VIDEO
> >>>    	help
> >>>    	  Support for Display Port PHY found on Samsung EXYNOS SoCs.
> >>>
> >>> +config PHY_EXYNOS_USB2
> >>> +	tristate "Samsung USB 2.0 PHY driver"
> >>> +	help
> >>> +	  Enable this to support Samsung USB phy helper driver for Samsung SoCs.
> >>> +	  This driver provides common interface to interact, for Samsung
> >>> +	  USB 2.0 PHY driver.
> >>
> >> I still think we can get rid of this helper driver and have a single
> >> driver for both PHY_EXYNOS4210_USB2 and PHY_EXYNOS4212_USB2.
> >
> > This helper driver is a really nice way to avoid code duplication, while
> > still leaving the code clean and readable.
> >
> > All the Samsung USB 2.0 PHYs require exactly the same semantics
> > (isolation, reference rate configuration, power up, power on), but each
> > one has completely different layout of registers and bits inside
> > registers.
> 
> I just did a diff of registers in exynos 4210 and 4212 PHY drivers [1] 
> and couldn't find that big a difference in register layout. Of course 
> there are a few changes in HSIC bit fields and PHYFSEL but that's only 
> minimal and could well be handled in a single driver.
> 
> [1] -> http://diffchecker.com/py3tp68m

This is quite a lot of differences, especially including shifted
bitfields... In addition there is another set of available PHYs
and inter-dependencies between them.

> >
> > Making a big single driver would end up being identical to the old Exynos
> > USB2PHY driver with a lot of if and switch statements inside most of
> > functions, which is not only ugly but makes any further extension hard.
> 
> Probably we shouldn't try to over design and just convert the old exynos 
> usb2 phy driver to the generic phy framework to begin with?

The old exynos USB2 PHY driver is incomplete and has very limited
functionality. It needs a complete redesign to support remaining features
and this is the reason we decided to develop a new driver from scratch.

I believe the way Kamil's driver is designed is definitely the way to go
with Samsung's USB2 PHY drivers, especially considering that support for
more SoCs using the same framework will be added - S3C64xx, S5PV210,
and Exynos5250.

Best regards.
Tomasz
