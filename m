From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v6 3/4] usb: ohci-exynos: Add facility to use phy provided
 by the generic phy framework
Date: Fri, 09 May 2014 10:20:08 +0200
Message-ID: <536C8FB8.7020806@samsung.com>
References: <5363D835.7010804@gmail.com>
 <1399266177-31765-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1399266177-31765-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vivek,

On 05.05.2014 07:02, Vivek Gautam wrote:
> Add support to consume phy provided by Generic phy framework.
> Keeping the support for older usb-phy intact right now, in order
> to prevent any functionality break in absence of relevant
> device tree side change for ohci-exynos.
> Once we move to new phy in the device nodes for ohci, we can
> remove the support for older phys.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> Acked-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> 
> Changes from v5:
>  - Removed setting phy explicitly to error pointer.
>  - Changed error check to '-ENOSYS' instead of '-ENXIO' in failure case of
>    devm_of_phy_get().
> 
> Changes from v4:
>  - Removed 'phy-names' property from the bindings since we don't need it.
>  - Restructured exynos_ohci_get_phy() function to handle error codes as
>    well as return relevant error codes effectively.
>  - Added IS_ERR() check for PHYs in exynos_ohci_phy_enable()/disable().
> 
> Changes from v3:
>  - Calling usb_phy_shutdown() when exynos_ohci_phy_enable() is failing.
>  - Made exynos_ohci_phy_disable() return void, since its return value
>    did not serve any purpose.
>  - Calling clk_disable_unprepare() in exynos_ohci_resume() when
>    exynos_ohci_phy_enable() is failed.
> 
>  .../devicetree/bindings/usb/exynos-usb.txt         |   16 +++
>  drivers/usb/host/ohci-exynos.c                     |  118 +++++++++++++++++---
>  2 files changed, 118 insertions(+), 16 deletions(-)

Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

--
Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
