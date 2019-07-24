From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC/RFT 1/5] phy: exynos5-usbdrd: read from correct offset of
 xhci linksystem
Date: Wed, 24 Jul 2019 12:59:30 +0200
Message-ID: <CAJKOXPch9i0GBLLTQFNF=jPSJ++ZUJeE+Y5MCA7zFLFYO79R4Q@mail.gmail.com>
References: <20190722185938.9043-1-linux.amoon@gmail.com> <20190722185938.9043-2-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722185938.9043-2-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 22 Jul 2019 at 20:59, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Read from linksystem offset to update the xhci version.

But why? As many times before, you do not specify why you are doing
things. What problem are you solving? What feature are you adding?

Best regards,
Krzysztof

>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 646259bee909..3c14bf7718c1 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -397,7 +397,8 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
>          * Setting the Frame length Adj value[6:1] to default 0x20
>          * See xHCI 1.0 spec, 5.2.4
>          */
> -       reg =   LINKSYSTEM_XHCI_VERSION_CONTROL |
> +       reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
> +       reg |=  LINKSYSTEM_XHCI_VERSION_CONTROL |
>                 LINKSYSTEM_FLADJ(0x20);
>         writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
>
> --
> 2.22.0
>
