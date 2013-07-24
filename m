From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add USBPHY nodes to Exynos4x12
Date: Wed, 24 Jul 2013 10:42:51 +0530
Message-ID: <CAK9yfHw98L-FUtX7v32FyE4UN308uYpJXx8oxDuYgYZk1uUp_A@mail.gmail.com>
References: <1374600682-19376-1-git-send-email-tobetter@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374600682-19376-1-git-send-email-tobetter@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dongjin Kim <tobetter@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Dongjin,

On 23 July 2013 23:01, Dongjin Kim <tobetter@gmail.com> wrote:
> This patch adds device nodes for USBPHY to Exynos4x12.
>
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4x12.dtsi |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
> index 01da194..9c3335b 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -73,4 +73,22 @@
>                 clock-names = "sclk_fimg2d", "fimg2d";
>                 status = "disabled";
>         };
> +
> +       usbphy@125B00000 {

Extra 0 above.

> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "samsung,exynos4x12-usb2phy";
> +               reg = <0x125B0000 0x100>;
> +               ranges;
> +
> +               clocks = <&clock 2>, <&clock 305>;
> +               clock-names = "xusbxti", "otg";
> +               status = "disabled";
> +
> +               usbphy-sys {
> +                       /* USB device and host PHY_CONTROL registers */
> +                       reg = <0x10020704 0xc>,
> +                             <0x1001021c 0x4>;
> +               };
> +       };
>  };

Please add this node after tmu node (satisfies alphabetical order as
well as increasing address value)


-- 
With warm regards,
Sachin
