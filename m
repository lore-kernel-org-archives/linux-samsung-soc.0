From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC/RFT 3/5] phy: exynos5-usbdrd: UTMI tune signal
Date: Wed, 24 Jul 2019 13:10:43 +0200
Message-ID: <CAJKOXPcc_tvKnMEqmEozcEn64EPBmeC6gGOp4XMQqTTmHcXwUA@mail.gmail.com>
References: <20190722185938.9043-1-linux.amoon@gmail.com> <20190722185938.9043-4-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722185938.9043-4-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 22 Jul 2019 at 20:59, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Tune USB2.0 (UTMI+) TX signal for high speed data transfer.

What is the visible effect? What does this tuning bring?

>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 42 +++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 135114d51bc1..54a513ca15e4 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -33,6 +33,8 @@
>  #define EXYNOS5_FSEL_24MHZ             0x5
>  #define EXYNOS5_FSEL_50MHZ             0x7
>
> +#define __set(v, a, b)  (((v) << (b)) & GENMASK(a, b))
> +
>  /* EXYNOS5: USB 3.0 DRD PHY registers */
>  #define EXYNOS5_DRD_LINKSYSTEM                 0x04
>
> @@ -108,8 +110,17 @@
>  #define EXYNOS5_DRD_PHYPARAM0                  0x1c
>
>  #define PHYPARAM0_REF_USE_PAD                  BIT(31)
> -#define PHYPARAM0_REF_LOSLEVEL_MASK            (0x1f << 26)
> -#define PHYPARAM0_REF_LOSLEVEL                 (0x9 << 26)
> +#define PHYPARAM0_REF_LOSLEVEL(x)              __set(x, 30, 26)
> +#define PHYPARAM0_TXVREFTUNE(x)                        __set(x, 25, 22)
> +#define PHYPARAM0_TXISETUNE(x)                 __set(x, 21, 20)
> +#define PHYPARAM0_TXRESTUNE(x)                 __set(x, 19, 18)
> +#define PHYPARAM0_TXPREEMPPULSETUNE            BIT(17)
> +#define PHYPARAM0_TXPREEMPAMPTUNE(x)           __set(x, 16, 15)
> +#define PHYPARAM0_TXHSXVTUNE(x)                        __set(x, 14, 13)
> +#define PHYPARAM0_TXFSLSTUNE(x)                        __set(x, 12, 9)
> +#define PHYPARAM0_SQRXTUNE(x)                  __set(x, 8, 6)
> +#define PHYPARAM0_OTGTUNE(x)                   __set(x, 5, 3)
> +#define PHYPARAM0_COMPDISTUNE(x)               __set(x, 2, 0)
>
>  #define EXYNOS5_DRD_PHYPARAM1                  0x20
>
> @@ -365,9 +376,30 @@ static void exynos5_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
>         u32 reg;
>
>         reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
> -       /* Set Loss-of-Signal Detector sensitivity */
> -       reg &= ~PHYPARAM0_REF_LOSLEVEL_MASK;
> -       reg |=  PHYPARAM0_REF_LOSLEVEL;
> +               /* Set Loss-of-Signal Detector sensitivity */
> +       reg |= (PHYPARAM0_REF_USE_PAD |
> +               /* Sets the sensitivity level for the Loss-of-Signal detector */
> +               PHYPARAM0_REF_LOSLEVEL(0x9) |
> +               /* Adjusts the high-speed DC level voltage */
> +               PHYPARAM0_TXVREFTUNE(0x3) |
> +               /* Adjust the rise/fal timie of the high-speed waveform */
> +               PHYPARAM0_TXISETUNE(0x1) |
> +               /* Adjusts the driver source impedance */
> +               PHYPARAM0_TXRESTUNE(0x1) |
> +               /* HS Transmitter Pre-Emphasis Duration Control */
> +               PHYPARAM0_TXPREEMPPULSETUNE |
> +               /* HS Transmitter Pre-Emphasis Current Control */
> +               PHYPARAM0_TXPREEMPAMPTUNE(0x0) |
> +               /* Transmitter High-Speed Crossover Adjustment */
> +               PHYPARAM0_TXHSXVTUNE(0x3) |
> +               /* FS/LS Source Impedance Adjustment */
> +               PHYPARAM0_TXFSLSTUNE(0x3) |
> +               /* Squelch Threshold Adjustment */
> +               PHYPARAM0_SQRXTUNE(0x3) |
> +               /* VBUS Valid Threshold Adjustment */
> +               PHYPARAM0_OTGTUNE(0x6) |
> +               /* Disconnect Threshold Adjustment */
> +               PHYPARAM0_COMPDISTUNE(0x6));

You set a bunch of parameters but I am not sure how did you get the values...

Best regards,
Krzysztof

>         writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
>
>         reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
> --
> 2.22.0
>
