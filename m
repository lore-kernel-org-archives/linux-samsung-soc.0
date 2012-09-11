From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 0/5] usb: phy: samsung: Introducing usb phy driver for
 samsung SoCs
Date: Tue, 11 Sep 2012 10:47:38 +0200
Message-ID: <k2mtra$7jj$3@ger.gmane.org>
References: <1344582631-13658-1-git-send-email-p.paneri@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Praveen,

Praveen Paneri wrote:
> Changes from v3:
> Replaced susbsys_initcall()/module_exit() by module_platform_driver().
> Accordingly in the hsotg driver returned -EPROBE_DEFER until phy driver
> is registered
> Removed unnecessary devm_usb_put_phy() call from the hsotg driver remove.
> 
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
> This patch set introduces a phy driver for samsung SoCs. It uses the
> existing transceiver infrastructure to provide phy control functions. Use
> of this driver can be extended for usb host phy as well. Over the period
> of time all the phy related code for most of the samsung SoCs can be
> integrated here. Removing the existing phy code from mach-s3c64xx. Same
> can be done for other SoCs when they start supporting this phy driver.
> This driver is tested with smdk6410 and Exynos4210(with DT).
> 
> Praveen Paneri (5):
>   usb: phy: samsung: Introducing usb phy driver for hsotg
>   usb: s3c-hsotg: Adding phy driver support
>   ARM: S3C64XX: Removing old phy setup code
>   ARM: S3C64XX: Enabling samsung-usbphy driver
>   ARM: Exynos4210: Enabling samsung-usbphy driver
> 
>  .../devicetree/bindings/usb/samsung-usbphy.txt     |    9 +
>  arch/arm/boot/dts/exynos4210.dtsi                  |    5 +
>  arch/arm/mach-exynos/include/mach/map.h            |    1 +
>  arch/arm/mach-exynos/mach-exynos4-dt.c             |    8 +
>  arch/arm/mach-exynos/setup-usb-phy.c               |   13 +
>  arch/arm/mach-s3c64xx/include/mach/map.h           |    2 +
>  arch/arm/mach-s3c64xx/mach-crag6410.c              |    7 +-
>  arch/arm/mach-s3c64xx/mach-smartq.c                |    8 +-
>  arch/arm/mach-s3c64xx/mach-smdk6410.c              |    7 +-
>  arch/arm/mach-s3c64xx/setup-usb-phy.c              |   79 +----
>  arch/arm/plat-samsung/devs.c                       |   33 ++
>  arch/arm/plat-samsung/include/plat/devs.h          |    1 +
>  arch/arm/plat-samsung/include/plat/usb-phy.h       |    1 +
>  drivers/usb/gadget/s3c-hsotg.c                     |   37 ++-
>  drivers/usb/phy/Kconfig                            |    8 +
>  drivers/usb/phy/Makefile                           |    1 +
>  drivers/usb/phy/samsung-usbphy.c                   |  345
>  ++++++++++++++++++++
>  drivers/usb/phy/samsung-usbphy.h                   |   48 +++
>  include/linux/platform_data/samsung-usbphy.h       |   27 ++
>  19 files changed, 549 insertions(+), 91 deletions(-)
>  create mode 100644
>  Documentation/devicetree/bindings/usb/samsung-usbphy.txt create mode
>  100644 drivers/usb/phy/samsung-usbphy.c create mode 100644
>  drivers/usb/phy/samsung-usbphy.h create mode 100644
>  include/linux/platform_data/samsung-usbphy.h
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Any news on this patchset?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
