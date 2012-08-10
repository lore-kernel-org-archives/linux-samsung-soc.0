From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v3 0/5] usb: phy: samsung: Introducing usb phy driver for
 samsung SoCs
Date: Fri, 10 Aug 2012 10:33:50 +0900
Message-ID: <502464FE.3000908@samsung.com>
References: <1344411661-17821-1-git-send-email-p.paneri@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47698 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755782Ab2HJBdj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Aug 2012 21:33:39 -0400
In-reply-to: <1344411661-17821-1-git-send-email-p.paneri@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: linux-usb@vger.kernel.org, l.majewski@samsung.com, kgene.kim@samsung.com, heiko@sntech.de, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, balbi@ti.com, grant.likely@secretlab.ca, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Hi, Praveen.

On 08/08/2012 04:40 PM, Praveen Paneri wrote:
> Changes from v2:
> Changed the driver filenames to samsung-usbphy
> Changed 's3c' to 'samsung' for platform device as well as platform data
> Moved platform data structure to a separate file
> Rectified coding style related errors
>
> Changes from v1:
> Rebased patches to latest usb-next branch
> Changed the name 'sec_usbphy' to 'samsung_usbphy'
>
> This patch set introduces a phy driver for samsung SoCs. It uses the existing
> transceiver infrastructure to provide phy control functions. Use of this driver
> can be extended for usb host phy as well.

How can you support usb host phy? I cannot choose to use which phy when
call init or shutdown of phy at current phy framework.

Thanks.

> Over the period of time all the phy
> related code for most of the samsung SoCs can be integrated here.
> Removing the existing phy code from mach-s3c64xx. Same can be done for other SoCs
> when they start supporting this phy driver.
> This driver is tested with smdk6410 and Exynos4210(with DT).
>
> Praveen Paneri (5):
>    usb: phy: samsung: Introducing usb phy driver for hsotg
>    usb: s3c-hsotg: Adding phy driver support
>    ARM: S3C64XX: Removing old phy setup code
>    ARM: S3C64XX: Enabling samsung-usbphy driver
>    ARM: Exynos4210: Enabling samsung-usbphy driver
>
>   .../devicetree/bindings/usb/samsung-usbphy.txt     |    9 +
>   arch/arm/boot/dts/exynos4210.dtsi                  |    5 +
>   arch/arm/mach-exynos/include/mach/map.h            |    1 +
>   arch/arm/mach-exynos/mach-exynos4-dt.c             |    8 +
>   arch/arm/mach-exynos/setup-usb-phy.c               |   13 +
>   arch/arm/mach-s3c64xx/include/mach/map.h           |    2 +
>   arch/arm/mach-s3c64xx/mach-crag6410.c              |    7 +-
>   arch/arm/mach-s3c64xx/mach-smartq.c                |    8 +-
>   arch/arm/mach-s3c64xx/mach-smdk6410.c              |    7 +-
>   arch/arm/mach-s3c64xx/setup-usb-phy.c              |   79 +----
>   arch/arm/plat-samsung/devs.c                       |   33 ++
>   arch/arm/plat-samsung/include/plat/devs.h          |    1 +
>   arch/arm/plat-samsung/include/plat/usb-phy.h       |    1 +
>   drivers/usb/gadget/s3c-hsotg.c                     |   40 ++-
>   drivers/usb/phy/Kconfig                            |    8 +
>   drivers/usb/phy/Makefile                           |    1 +
>   drivers/usb/phy/samsung-usbphy.c                   |  355 ++++++++++++++++++++
>   drivers/usb/phy/samsung-usbphy.h                   |   48 +++
>   include/linux/platform_data/samsung-usbphy.h       |   27 ++
>   19 files changed, 562 insertions(+), 91 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>   create mode 100644 drivers/usb/phy/samsung-usbphy.c
>   create mode 100644 drivers/usb/phy/samsung-usbphy.h
>   create mode 100644 include/linux/platform_data/samsung-usbphy.h
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
