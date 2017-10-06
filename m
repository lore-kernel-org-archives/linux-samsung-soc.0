From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 2/2] phy: exynos5-usbdrd: remove disable and enable of phy clk
Date: Fri, 6 Oct 2017 08:42:22 +0200
Message-ID: <CAJKOXPe9FCKqrvsgdohTAN9tXXwbMOuyaDiHPxZ1Ym1LLPD41w@mail.gmail.com>
References: <1507264595-3565-1-git-send-email-linux.amoon@gmail.com> <1507264595-3565-2-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507264595-3565-2-git-send-email-linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 6, 2017 at 6:36 AM, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> remove the disable and enable of phy clk.
> phy clk is needed to tune the phy controller.

Drivers should in general enable and disable the clocks they use. Just
like in patch #1 please describe why you are doing this, what kind of
problem are you trying to solve and what exactly are you trying to do
here.

BR,
Krzysztof

>
> Before:
>     mout_usbd300                          1            1 24000000          0 0
>        dout_usbd300                       0            0    24000000          0 0
>           sclk_usbd300                    0            0    24000000          0 0
>        dout_usbphy300                     1            1    24000000          0 0
>           sclk_usbphy300                  3            3    24000000          0 0
>     mout_usbd301                          1            1    24000000          0 0
>        dout_usbd301                       0            0    24000000          0 0
>           sclk_usbd301                    0            0    24000000          0 0
>        dout_usbphy301                     1            1    24000000          0 0
>           sclk_usbphy301                  2            2    24000000          0 0
> After:
>     mout_usbd300                          2            2    24000000          0 0
>        dout_usbd300                       1            1    24000000          0 0
>           sclk_usbd300                    2            2    24000000          0 0
>        dout_usbphy300                     1            1    24000000          0 0
>           sclk_usbphy300                  3            3    24000000          0 0
>     mout_usbd301                          2            2    24000000          0 0
>        dout_usbd301                       1            1    24000000          0 0
>           sclk_usbd301                    2            2    24000000          0 0
>        dout_usbphy301                     1            1    24000000          0 0
>           sclk_usbphy301                  2            2    24000000          0 0
>
> Signed-off-by: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 22c68f5..5e8054c 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -409,22 +409,15 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
>         reg &= ~PHYCLKRST_PORTRESET;
>         writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
>
> -       clk_disable_unprepare(phy_drd->clk);
> -
>         return 0;
>  }
>
>  static int exynos5_usbdrd_phy_exit(struct phy *phy)
>  {
> -       int ret;
>         u32 reg;
>         struct phy_usb_instance *inst = phy_get_drvdata(phy);
>         struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
>
> -       ret = clk_prepare_enable(phy_drd->clk);
> -       if (ret)
> -               return ret;
> -
>         reg =   PHYUTMI_OTGDISABLE |
>                 PHYUTMI_FORCESUSPEND |
>                 PHYUTMI_FORCESLEEP;
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
