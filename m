From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCHv4 0/2] dwc3 on XU3
Date: Wed, 18 Oct 2017 18:17:26 +0530
Message-ID: <01b6deb8-21a7-7315-546a-d8a462326789@ti.com>
References: <6de8a17a-745b-0fa2-c39d-cdeb28fc9489@ti.com>
 <CGME20171009120100eucas1p2400a1ee4a7c70eed37c653de780b715d@eucas1p2.samsung.com>
 <1507550451-21324-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:18666 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965715AbdJRMsO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 08:48:14 -0400
In-Reply-To: <1507550451-21324-1-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>



On Monday 09 October 2017 05:30 PM, Andrzej Pietrasiewicz wrote:
> Hi all,
> 
> This is the fourth version of patches in this thread.
> 
> The series fixes problems with enumerating of SuperSpeed devices
> on an Odroid XU3. There was a patch series from Vivek Gautam in
> circulation, but it got lost somehow. Please see:
> 
> https://lkml.org/lkml/2014/9/2/166
> https://lkml.org/lkml/2015/2/2/257
> 
> I adapted his patch so that it does not use a hacky solution to force
> additional initialization in order for calibration to happen.
> With this patch enumeration happens correctly and a super speed device
> is recognized as such.
> 
> Changes since v3:
> 
> - improved the commit message in phy_calibrate() commit
>   (as suggested by Kishon)
> - rebased onto v4.14-rc4

merged, thanks!

-Kishon
> 
> Changes since v2:
> 
> - exported the "calibrate_phy" symbol
> 
> Changes since v1:
> 
> - added calibrate() callback to phy
> - used calibrate() instead of reset() to trigger the calibration
> 
> Andrzej Pietrasiewicz (1):
>   drivers: phy: add calibrate method
> 
> Vivek Gautam (1):
>   phy: exynos5-usbdrd: Calibrate LOS levels for exynos5420/5800
> 
>  drivers/phy/phy-core.c                   |  15 +++
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 183 +++++++++++++++++++++++++++++++
>  drivers/usb/dwc3/core.c                  |   7 +-
>  include/linux/phy/phy.h                  |  10 ++
>  4 files changed, 213 insertions(+), 2 deletions(-)
> 
