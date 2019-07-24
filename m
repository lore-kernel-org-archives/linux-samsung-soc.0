From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC/RFT 4/5] phy: exynos5-usbdrd: PIPE3 tune signal
Date: Wed, 24 Jul 2019 13:13:21 +0200
Message-ID: <CAJKOXPeiKP-MfaO4LpQ=iXZn14gM3vwR8U18yLGfhHt6pjvvCA@mail.gmail.com>
References: <20190722185938.9043-1-linux.amoon@gmail.com>
 <20190722185938.9043-5-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722185938.9043-5-linux.amoon@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 22 Jul 2019 at 20:59, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Tune USB3.0 (PIPE3) PHY TX signal for high and supper
> speed data transfer.
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 54a513ca15e4..4f16c4f82ae5 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -124,8 +124,10 @@
>
>  #define EXYNOS5_DRD_PHYPARAM1                  0x20
>
> -#define PHYPARAM1_PCS_TXDEEMPH_MASK            (0x1f << 0)
> -#define PHYPARAM1_PCS_TXDEEMPH                 (0x1c)
> +#define PHYPARAM1_TX0_TERM_OFFSET(x)           __set(x, 30, 26)
> +#define PHYPARAM1_TX_SWING_FULL(x)             __set(x, 18, 12)
> +#define PHYPRAAM1_PCS_TX_DEEMPH_6DB(x)         __set(x, 11, 6)
> +#define PHYPRAAM1_PCS_TX_DEEMPH_3P5DB(x)       __set(x, 5, 0)
>
>  #define EXYNOS5_DRD_PHYTERM                    0x24
>
> @@ -360,10 +362,16 @@ static void exynos5_usbdrd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
>  {
>         u32 reg;
>
> -       reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
>         /* Set Tx De-Emphasis level */
> -       reg &= ~PHYPARAM1_PCS_TXDEEMPH_MASK;
> -       reg |=  PHYPARAM1_PCS_TXDEEMPH;
> +       reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
> +               /* Transmitter Termination Offset */
> +       reg |=  PHYPARAM1_TX0_TERM_OFFSET(0x5) |
> +               /* Tx Amplitude (Full Swing mode) */
> +               PHYPARAM1_TX_SWING_FULL(0x3F) |
> +               /* Tx De-Emphasis at 6 dB */
> +               PHYPRAAM1_PCS_TX_DEEMPH_6DB(0x20) |
> +               /* Tx De-Emphasis at 3.5 dB */
> +               PHYPRAAM1_PCS_TX_DEEMPH_3P5DB(0x15);

How did you get the value? Why you are changing existing values to default ones?

Best regards,
Krzysztof

>         writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
>
>         reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
> --
> 2.22.0
>
