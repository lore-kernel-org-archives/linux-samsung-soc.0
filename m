From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos7: Fix wrong base address of i2c7 bus
Date: Fri, 9 Jan 2015 16:34:17 +0530
Message-ID: <CAFp+6iHKdZ6uGKRcVYs1kAEQs5R4bWVuHKy8KdmUHJDo9Gd8nA@mail.gmail.com>
References: <1418996000-15735-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1418996000-15735-1-git-send-email-padma.v@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: robh+dt <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Padma,


On Fri, Dec 19, 2014 at 7:03 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
> I2C7 base address corrected.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---

Verified from Exynos7 datasheet. LGTM.

Reviewed-by: Vivek Gautam <gautam.vivek@samsung.com>

>  arch/arm64/boot/dts/exynos/exynos7.dtsi |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> index db7058a..84a57c8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> @@ -386,9 +386,9 @@
>                         status = "disabled";
>                 };
>
> -               hsi2c_7: hsi2c@13e10000 {
> +               hsi2c_7: hsi2c@14e10000 {
>                         compatible = "samsung,exynos7-hsi2c";
> -                       reg = <0x13e10000 0x1000>;
> +                       reg = <0x14e10000 0x1000>;
>                         interrupts = <0 462 0>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> --
> 1.7.4.4



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
