From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Wed, 19 Dec 2012 11:07:37 +0530
Message-ID: <CAFp+6iEWPQH2f8zeR734U8Sy_tA3gguROYpvQa2nudNwxXyuRQ@mail.gmail.com>
References: <1355841786-13307-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355841786-13307-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

CC: Doug Anderson


On Tue, Dec 18, 2012 at 8:13 PM, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Changes from v4:
>  - Moved architecture side changes out of this patch-set.
>  - Added support for multiple usbphy phandle parsing and
>    doing all pmu_isolation() and phy_cfg_sel() related changes
>    in samsung-usbphy driver only instead of architecture
>    as in v4 patch-set.
>  - Removed unnecessary multi line definitions for macros.
>
> Changes from v3:
>  - Moved enums S5P_USB_PHY_DEVICE, S5P_USB_PHY_HOST from machine to file
>    include/linux/usb/samsung_usb_phy.h as USB_PHY_TYPE_DEVICE and
>    USB_PHY_TYPE_HOST to make it more generic. Further resolve its
>    dependencies.
>  - Introduced a function 'samsung_usbphy_set_type()' which takes
>    care of setting up the phy_type: HOST/DEVICE. This function
>    can be called by host/otg drivers to setup phy_type prior to
>    handling the respective PHYs.
>  - Added an error-path for HOST type phy in s5p_usb_phy_pmu_isolation()
>    for 'mach-s3c64xx'.
>  - Moving to PHY driver as default for ehci-s5p and ohci-exynos, and only
>    when failed fall back to plat-data.
>  - Added samsung_usbphy_set_type() prior to doing usb_phy_init() or
>    usb_phy_shutdown() so that appropriate PHY gets init or shutdown.
>
> Based on patches for samsung-usbphy driver:
>  1)http://lists.infradead.org/pipermail/linux-arm-kernel/2012-November/134476.html
>  2)https://lkml.org/lkml/2012/12/18/187
>
> Vivek Gautam (4):
>   ARM: EXYNOS: Update & move usb-phy types to generic include layer
>   usb: phy: samsung: Add host phy support to samsung-phy driver
>   USB: ehci-s5p: Add phy driver support
>   USB: ohci-exynos: Add phy driver support
>
>  .../devicetree/bindings/usb/samsung-usbphy.txt     |   25 +-
>  drivers/usb/host/ehci-s5p.c                        |   71 +++-
>  drivers/usb/host/ohci-exynos.c                     |   71 +++-
>  drivers/usb/phy/Kconfig                            |    2 +-
>  drivers/usb/phy/samsung-usbphy.c                   |  465 ++++++++++++++++++--
>  include/linux/usb/samsung_usb_phy.h                |   29 ++
>  6 files changed, 570 insertions(+), 93 deletions(-)
>  create mode 100644 include/linux/usb/samsung_usb_phy.h
>
> --
> 1.7.6.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks & Regards
Vivek
