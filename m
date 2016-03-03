From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] ARM: dts: add "simple-bus" to "arm,amba-bus" compatible nodes
Date: Thu, 3 Mar 2016 14:44:22 -0600
Message-ID: <CAL_Jsq+sYG3UNvQ0k4cZQ0JcenObsmo7R=0qgLtUqdOJXWO-nQ@mail.gmail.com>
References: <1456804620-8750-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1456804620-8750-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "arm@kernel.org" <arm@kernel.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, David Brown <david.brown@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Wei Xu <xuwei5@hisilicon.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org"linux-arm-kernel@lists.infradead.org" <linux-ar>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 29, 2016 at 9:57 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The "arm,amba-bus" string in the of_default_bus_match_table is
> ambiguous.  This prepares for killing it off in a long run.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/arm/boot/dts/axm55xx.dtsi             | 2 +-
>  arch/arm/boot/dts/exynos3250.dtsi          | 2 +-
>  arch/arm/boot/dts/exynos4.dtsi             | 2 +-
>  arch/arm/boot/dts/exynos4415.dtsi          | 2 +-
>  arch/arm/boot/dts/exynos5250.dtsi          | 2 +-
>  arch/arm/boot/dts/exynos5420.dtsi          | 2 +-
>  arch/arm/boot/dts/exynos5440.dtsi          | 2 +-
>  arch/arm/boot/dts/hi3620.dtsi              | 2 +-
>  arch/arm/boot/dts/hip01.dtsi               | 2 +-
>  arch/arm/boot/dts/hisi-x5hd2.dtsi          | 2 +-
>  arch/arm/boot/dts/qcom-apq8064.dtsi        | 2 +-
>  arch/arm/boot/dts/qcom-msm8660.dtsi        | 2 +-
>  arch/arm/boot/dts/qcom-msm8960.dtsi        | 2 +-
>  arch/arm/boot/dts/rk3036.dtsi              | 2 +-
>  arch/arm/boot/dts/rk3228.dtsi              | 2 +-
>  arch/arm/boot/dts/rk3288.dtsi              | 2 +-
>  arch/arm/boot/dts/rk3xxx.dtsi              | 2 +-
>  arch/arm/boot/dts/s5pv210.dtsi             | 2 +-
>  arch/arm/boot/dts/socfpga.dtsi             | 2 +-
>  arch/arm/boot/dts/socfpga_arria10.dtsi     | 2 +-
>  arch/arm/boot/dts/ste-nomadik-stn8815.dtsi | 2 +-
>  arch/arm/boot/dts/ste-u300.dts             | 2 +-
>  arch/arm/boot/dts/versatile-ab.dts         | 2 +-
>  23 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm/boot/dts/axm55xx.dtsi b/arch/arm/boot/dts/axm55xx.dtsi
> index ea288f0..8da4582 100644
> --- a/arch/arm/boot/dts/axm55xx.dtsi
> +++ b/arch/arm/boot/dts/axm55xx.dtsi
> @@ -107,7 +107,7 @@
>                 };
>
>                 amba {
> -                       compatible = "arm,amba-bus";
> +                       compatible = "arm,amba-bus", "simple-bus";

Actually, I would remove arm,amba-bus completely to prevent its
spread. Both have been matched since ARM DT support began in the
kernel. AFAICT, FreeBSD only uses simple-bus. If so, then this patch
fixes FreeBSD on these systems (if that was the only issue).

Rob
