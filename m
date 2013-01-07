From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: exynos5: Add gate clocks for HS-I2C
Date: Mon, 7 Jan 2013 17:36:17 +0530
Message-ID: <CAHfPSqCgYz8r05gBxOwCbi3a4_R0Kaatps8aOEmp_Ck=fakoFg@mail.gmail.com>
References: <1356694851-1345-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1356694851-1345-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 28 December 2012 17:10, Naveen Krishna Chatradhi
<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Adds clock gating bits for High Speed I2C channels 0, 1, 2 and 3.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c |   24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index 0208c3a..f9fa0c7 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -753,6 +753,30 @@ static struct clk exynos5_init_clocks_off[] = {
>                 .enable         = exynos5_clk_ip_peric_ctrl,
>                 .ctrlbit        = (1 << 27),
>         }, {
> +               .name           = "hsi2c",
> +               .devname        = "exynos5-hsi2c.0",
> +               .enable         = exynos5_clk_ip_peric_ctrl,
> +               .parent         = &exynos5_clk_aclk_66.clk,
> +               .ctrlbit        = (1 << 28),
> +       }, {
> +               .name           = "hsi2c",
> +               .devname        = "exynos5-hsi2c.1",
> +               .enable         = exynos5_clk_ip_peric_ctrl,
> +               .parent         = &exynos5_clk_aclk_66.clk,
> +               .ctrlbit        = (1 << 29),
> +       }, {
> +               .name           = "hsi2c",
> +               .devname        = "exynos5-hsi2c.2",
> +               .enable         = exynos5_clk_ip_peric_ctrl,
> +               .parent         = &exynos5_clk_aclk_66.clk,
> +               .ctrlbit        = (1 << 30),
> +       }, {
> +               .name           = "hsi2c",
> +               .devname        = "exynos5-hsi2c.3",
> +               .enable         = exynos5_clk_ip_peric_ctrl,
> +               .parent         = &exynos5_clk_aclk_66.clk,
> +               .ctrlbit        = (1 << 31),
> +       }, {
>                 .name           = "usbhost",
>                 .enable         = exynos5_clk_ip_fsys_ctrl ,
>                 .ctrlbit        = (1 << 18),
> --
> 1.7.9.5

Any comments on this patch please.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Shine bright,
(: Nav :)
