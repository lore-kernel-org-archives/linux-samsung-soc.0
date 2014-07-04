From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drivers: phy: exynos-usb2: add support for Exynos 3250
Date: Sat, 05 Jul 2014 00:21:17 +0200
Message-ID: <53B728DD.1000703@gmail.com>
References: <1404475989-30588-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404475989-30588-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marek,

Please see my comments inline.

On 04.07.2014 14:13, Marek Szyprowski wrote:
> This patch adds support for Exynos3250 SoC to Exynos2USB PHY driver.
> Although Exynos3250 has only one device phy interface, the register
> layout and all operations that are required to get it enabled are almost
> same as on Exynos4x12. The only different is one more register
> (REFCLKSEL) which need to be set.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/phy/Kconfig               | 12 ++++++------
>  drivers/phy/phy-exynos4x12-usb2.c | 18 ++++++++++++++++++
>  drivers/phy/phy-samsung-usb2.c    |  6 ++++++
>  drivers/phy/phy-samsung-usb2.h    |  2 ++

This patch adds new compatible string, but there is no respective change
to the documentation. Please add it.

>  4 files changed, 32 insertions(+), 6 deletions(-)
> 

[snip]

> diff --git a/drivers/phy/phy-exynos4x12-usb2.c b/drivers/phy/phy-exynos4x12-usb2.c
> index 59d8dd3ff390..b29bbfacd4b5 100644
> --- a/drivers/phy/phy-exynos4x12-usb2.c
> +++ b/drivers/phy/phy-exynos4x12-usb2.c
> @@ -67,6 +67,12 @@
>  #define EXYNOS_4x12_UPHYCLK_PHYFSEL_24MHZ	(0x5 << 0)
>  #define EXYNOS_4x12_UPHYCLK_PHYFSEL_50MHZ	(0x7 << 0)
>  
> +#define EXYNOS_4212_UPHYCLK_PHY0_ID_PULLUP	(0x1 << 3)
> +#define EXYNOS_4212_UPHYCLK_PHY0_COMMON_ON	(0x1 << 4)
> +#define EXYNOS_4212_UPHYCLK_PHY1_COMMON_ON	(0x1 << 7)

The 3 macros above don't seem to be used anywhere in this patch.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
