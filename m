From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCHv2] ARM: dts: exynos: update the usbdrd_phy suspend clk
Date: Thu, 22 Nov 2018 08:54:18 +0100
Message-ID: <CAJKOXPcphirR=+25evzVxHGv1g_4xNfPv3gazXWOes1G6iBt5g@mail.gmail.com>
References: <20181120185536.1159-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181120185536.1159-1-linux.amoon@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux.amoon@gmail.com
Cc: devicetree@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 20 Nov 2018 at 19:55, Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per FSYS usbdrd_phy clk setting CLK_SCLK_USBD300/1 binds
> to SUSPEND_CLK so correct update the suspend clk.
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> [0] https://lkml.org/lkml/2017/10/6/12
> changes from previous patch
> fix the order of clk and update the commit message
>
> FSYS block show in user manual
>
> CLKMUX_USBDRD300/1----CLKDIV_USBDRD300/1----SCLK_USBDRD300/1-----SUSPEND_CLK
>                    |
>                    |--CLKDIV_USBPHY300/1----SCLK_USBPHY300/1-----USBDRD30_PHY_0/1

Your new clock - SCLK_USBD301 - is not mentioned here. I don't get the
reason behind this change.

Best regards,
Krzysztof

> ---
>  arch/arm/boot/dts/exynos5410.dtsi | 4 ++--
>  arch/arm/boot/dts/exynos5420.dtsi | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> index 57fc9c949e54..a92c765a7a84 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -395,7 +395,7 @@
>  };
>
>  &usbdrd_phy0 {
> -       clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
> +       clocks = <&clock CLK_SCLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
>         clock-names = "phy", "ref";
>         samsung,pmu-syscon = <&pmu_system_controller>;
>  };
> @@ -410,7 +410,7 @@
>  };
>
>  &usbdrd_phy1 {
> -       clocks = <&clock CLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
> +       clocks = <&clock CLK_SCLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
>         clock-names = "phy", "ref";
>         samsung,pmu-syscon = <&pmu_system_controller>;
>  };
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index aaff15880761..b84b44556efc 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -1509,7 +1509,7 @@
>  };
>
>  &usbdrd_phy0 {
> -       clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
> +       clocks = <&clock CLK_SCLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
>         clock-names = "phy", "ref";
>         samsung,pmu-syscon = <&pmu_system_controller>;
>  };
> @@ -1524,7 +1524,7 @@
>  };
>
>  &usbdrd_phy1 {
> -       clocks = <&clock CLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
> +       clocks = <&clock CLK_SCLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
>         clock-names = "phy", "ref";
>         samsung,pmu-syscon = <&pmu_system_controller>;
>  };
> --
> 2.17.1
>
