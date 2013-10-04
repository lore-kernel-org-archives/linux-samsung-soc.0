From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 2/5] ARM: dts: Add dp-controller node to exynos5250-snow
Date: Fri, 04 Oct 2013 11:24:35 +0900
Message-ID: <000501cec0a8$de4b5240$9ae1f6c0$%han@samsung.com>
References: <1380670860-17621-1-git-send-email-seanpaul@chromium.org>
 <1380839303-4834-1-git-send-email-seanpaul@chromium.org>
 <1380839303-4834-3-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1380839303-4834-3-git-send-email-seanpaul@chromium.org>
Content-language: ko
Sender: linux-doc-owner@vger.kernel.org
To: 'Sean Paul' <seanpaul@chromium.org>
Cc: airlied@linux.ie, kgene.kim@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Friday, October 04, 2013 7:28 AM, Sean Paul wrote:
> 
> This patch adds the dp-controller node to the exynos5250-snow board dts
> file.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
> 
> v2: Added dp-controller address to node (rebased on linux-next)
> 
>  arch/arm/boot/dts/exynos5250-snow.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 2a0f0de..f1cf68e 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -186,6 +186,18 @@
>  		samsung,vbus-gpio = <&gpx1 1 0>;
>  	};
> 
> +	dp-controller@145B0000 {
> +		samsung,color-space = <0>;
> +		samsung,dynamic-range = <0>;
> +		samsung,ycbcr-coeff = <0>;
> +		samsung,color-depth = <1>;
> +		samsung,link-rate = <0x0a>;
> +		samsung,lane-count = <2>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dp_hpd>;

How about adding 'status = "okay" as below?

		pinctrl-names = "default";
		pinctrl-0 = <&dp_hpd>;
		status = "okay";

status of dp node was disabled by exynos5.dtsi.

./arch/arm/boot/dts/exynos5.dtsi
dp-controller@145B0000 {
	status = "disabled";

Best regards,
Jingoo Han

