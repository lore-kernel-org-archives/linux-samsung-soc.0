From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos
 EHCI/OHCI
Date: Thu, 26 Jun 2014 14:19:20 +0530
Message-ID: <53ABDE90.2010103@ti.com>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403761178-5371-1-git-send-email-sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sachin,

On Thursday 26 June 2014 11:09 AM, Sachin Kamat wrote:
> EHCI and OHCI drivers on Exynos platforms do not work without their
> corresponding SoC specific phy drivers. Hence it makes no sense to
> keep these phy drivers as user selectable. Instead select them from
> the respective USB configs to make things easier for the end user.
> While at it enable 5250 phy for Exynos 5420 SoC too.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/phy/Kconfig      |   37 +++++++------------------------------
>  drivers/usb/host/Kconfig |   10 ++++++----
>  2 files changed, 13 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 16a2f067c242..7fe7ef5f1322 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig

<snip>

>  
>  config USB_EHCI_EXYNOS
> -       tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
> -       depends on PLAT_S5P || ARCH_EXYNOS
> -       help
> -	Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
> +	tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
> +	depends on PLAT_S5P || ARCH_EXYNOS
> +	select PHY_SAMSUNG_USB2 if ARCH_EXYNOS

I am skeptical to add select after the problems it created during previous
releases.
Maybe use 'default y if ARCH_EXYNOS' in PHY_SAMSUNG_USB2 Kconfig?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
