From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCHv4 2/2] phy: exynos5-usbdrd: Calibrate LOS levels for
 exynos5420/5800
Date: Wed, 25 Oct 2017 16:50:46 +0530
Message-ID: <fca01b97-eea1-cc6f-9c12-fa8d9e55d980@ti.com>
References: <6de8a17a-745b-0fa2-c39d-cdeb28fc9489@ti.com>
 <1507550451-21324-1-git-send-email-andrzej.p@samsung.com>
 <CGME20171009120101eucas1p1066709725b5c6ca66961b85268480702@eucas1p1.samsung.com>
 <1507550451-21324-3-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:21682 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750855AbdJYLW6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Oct 2017 07:22:58 -0400
In-Reply-To: <1507550451-21324-3-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Felipe,

On Monday 09 October 2017 05:30 PM, Andrzej Pietrasiewicz wrote:
> From: Vivek Gautam <gautam.vivek@samsung.com>
> 
> Adding phy calibration sequence for USB 3.0 DRD PHY present on
> Exynos5420/5800 systems.
> This calibration facilitates setting certain PHY parameters viz.
> the Loss-of-Signal (LOS) Detector Threshold Level, as well as
> Tx-Vboost-Level for Super-Speed operations.
> Additionally we also set proper time to wait for RxDetect measurement,
> for desired PHY reference clock, so as to solve issue with enumeration
> of few USB 3.0 devices, like Samsung SUM-TSB16S 3.0 USB drive
> on the controller.
> 
> We are using CR_port for this purpose to send required data
> to override the LOS values.
> 
> On testing with USB 3.0 devices on USB 3.0 port present on
> SMDK5420, and peach-pit boards should see following message:
> usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
> 
> and without this patch, should see below shown message:
> usb 1-1: new high-speed USB device number 2 using xhci-hcd
> 
> [Also removed unnecessary extra lines in the register macro definitions]
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> [adapted to use phy_calibrate as entry point]
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 183 +++++++++++++++++++++++++++++++
>  drivers/usb/dwc3/core.c                  |   7 +-

are you okay with this patch?

Thanks
Kishon
