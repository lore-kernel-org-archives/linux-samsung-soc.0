From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 4/4] ARM: dts: Fix wrong compatible string for Exynos3250
 ADC
Date: Wed, 18 Jun 2014 10:37:00 +0200
Message-ID: <53A14FAC.3050700@gmail.com>
References: <1403058061-24271-1-git-send-email-cw00.choi@samsung.com> <1403058061-24271-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403058061-24271-5-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On 18.06.2014 04:21, Chanwoo Choi wrote:
> This patchset fix wrong compatible string for Exynos3250 ADC. Exynos3250 SoC
> need to control only special clock for ADC. Exynos SoC except for Exynos3250
> has not included special clock for ADC. The exynos ADC driver can control
> special clock if compatible string is 'exynos3250-adc-v2'.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 6c1fb67..107dc44 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -414,10 +414,10 @@
>  		};
>  
>  		adc: adc@126C0000 {
> -			compatible = "samsung,exynos-adc-v3";
> +			compatible = "samsung,exynos3250-adc-v2";
>  			reg = <0x126C0000 0x100>, <0x10020718 0x4>;
>  			interrupts = <0 137 0>;
> -			clock-names = "adc", "sclk_tsadc";
> +			clock-names = "adc", "sclk_adc";

So, is it "sclk_adc" or "sclk_tsadc"? The code uses the former, while
the documentation mentions the latter. Please fix this.

Best regards,
Tomasz
