From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC/RFT 2/5] phy: exynos5-usbdrd: add missing tuning of the
 phyutmi signal
Date: Wed, 24 Jul 2019 13:07:46 +0200
Message-ID: <CAJKOXPc_3ZPB5F9gvnLTZOkry=acyo9_TBq62D6rjk=gYDZaNw@mail.gmail.com>
References: <20190722185938.9043-1-linux.amoon@gmail.com> <20190722185938.9043-3-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722185938.9043-3-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 22 Jul 2019 at 20:59, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add missing tuning of phyutmi controls to enter suspend and
> resume state.
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 32 ++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 3c14bf7718c1..135114d51bc1 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -42,7 +42,13 @@
>
>  #define EXYNOS5_DRD_PHYUTMI                    0x08
>
> +#define PHYUTMI_TXBITSTUFFENH                  BIT(8)
> +#define PHYUTMI_TXBITSTUFFEN                   BIT(7)
>  #define PHYUTMI_OTGDISABLE                     BIT(6)
> +#define PHYUTMI_IDPULLUP                       BIT(5)
> +#define PHYUTMI_DRVVBUS                                BIT(4)
> +#define PHYUTMI_DPPULLDOWN                      BIT(3)
> +#define PHYUTMI_DMPULLDOWN                      BIT(2)
>  #define PHYUTMI_FORCESUSPEND                   BIT(1)
>  #define PHYUTMI_FORCESLEEP                     BIT(0)
>
> @@ -402,6 +408,23 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
>                 LINKSYSTEM_FLADJ(0x20);
>         writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
>
> +       reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
> +       /* High-Byte Transmit Bit-Stuffing Enable */
> +       reg |= PHYUTMI_TXBITSTUFFENH;

How this is related with suspend and resume?

> +       /* Low-Byte Transmit Bit-Stuffing Enable */
> +       reg |= PHYUTMI_TXBITSTUFFEN;

The same.

> +       /* release force_sleep & force_suspend */
> +       reg &= ~(PHYUTMI_FORCESLEEP | PHYUTMI_FORCESUSPEND);

Really, why?

> +       /* DP/DM Pull Down Disable */
> +       reg &= ~(PHYUTMI_DMPULLDOWN | PHYUTMI_DPPULLDOWN);

Care to explain why?

> +       /* drvvbus controller signal controls the VBUS valid comparator */
> +       reg &= ~PHYUTMI_OTGDISABLE;

Makes sense, but how is it connected with suspend and resume? It's the
default, BTW...

> +       /* controller signal controls the VBUS Valid comparator */
> +       reg |= PHYUTMI_DRVVBUS;

Again, you are setting the defaults...

> +       /* Enable ID Sampling */
> +       reg |= PHYUTMI_IDPULLUP;

The same...

> +       writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);

Does not look good. For UTMI Phy, this will be overwritten few lines
later with exynos5_usbdrd_utmi_init().

> +
>         reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
>         /* Select PHY CLK source */
>         reg &= ~PHYPARAM0_REF_USE_PAD;
> @@ -452,9 +475,14 @@ static int exynos5_usbdrd_phy_exit(struct phy *phy)
>         if (ret)
>                 return ret;
>
> -       reg =   PHYUTMI_OTGDISABLE |
> +       reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
> +       reg |=  PHYUTMI_OTGDISABLE |
>                 PHYUTMI_FORCESUSPEND |
> -               PHYUTMI_FORCESLEEP;
> +               PHYUTMI_FORCESLEEP |
> +               PHYUTMI_DMPULLDOWN |
> +               PHYUTMI_DPPULLDOWN;
> +       reg &= ~(PHYUTMI_DRVVBUS | PHYUTMI_IDPULLUP |
> +               PHYUTMI_TXBITSTUFFENH | PHYUTMI_TXBITSTUFFEN);

No, it looks like random code... why you want to update the register
instead of overwrite it?

Best regards,
Krzysztof

>         writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
>
>         /* Resetting the PHYCLKRST enable bits to reduce leakage current */
> --
> 2.22.0
>
