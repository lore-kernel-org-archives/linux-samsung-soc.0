From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v12 6/9] ARM: dts: exynos: add chipid label and syscon
 compatible
Date: Wed, 24 Jul 2019 19:10:49 +0200
Message-ID: <20190724171049.GA11333@kozik-lap>
References: <20190722094646.13342-1-l.luba@partner.samsung.com>
 <CGME20190722094730eucas1p2f3f8298c43c8bf0d96135bca9a9e753b@eucas1p2.samsung.com>
 <20190722094646.13342-7-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190722094646.13342-7-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jul 22, 2019 at 11:46:43AM +0200, Lukasz Luba wrote:
> Add the chipid label which allows to use it in phandle from other device.
> Use syscon in compatible to get the regmap of the device register set.
> The chipid is used in DMC during initialization to compare compatibility.
> 

I cannot find its usage in DMC driver.

Best regards,
Krzysztof


> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index 67f9b4504a42..4801ca759feb 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -35,8 +35,8 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> -		chipid@10000000 {
> -			compatible = "samsung,exynos4210-chipid";
> +		chipid: chipid@10000000 {
> +			compatible = "samsung,exynos4210-chipid", "syscon";
>  			reg = <0x10000000 0x100>;
>  		};
>  
> -- 
> 2.17.1
> 
