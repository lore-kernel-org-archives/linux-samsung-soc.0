From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARM: dts: exynos: Use stdout non-deprecated property and
 add serial options to Odroid XU/XU3/XU4
Date: Wed, 17 Aug 2016 11:25:06 +0100
Message-ID: <20160817102506.GD30900@leverpostej>
References: <1471419298-10414-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1471419298-10414-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 17, 2016 at 09:34:58AM +0200, Krzysztof Kozlowski wrote:
> The "linux,stdout-path" is deprecated.
> 
> Add serial options so the console can be properly configured when
> bootloader does not pass "console" parameter to command line.  Without
> options and lack of "console", the serial output dies during boot (just
> after probing sound).

I'm confused. Is this just a cleanup (given "linux,stdout-path" is
deprecated but still supported), or a bug fix?

I guess that prior to this patch Linux might change the rate of the
console, but otherwise it should work.

Mark.

> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5410-odroidxu.dts          | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
> index f6d135245a4b..a5ae76c1838f 100644
> --- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
> +++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
> @@ -26,7 +26,7 @@
>  	};
>  
>  	chosen {
> -		linux,stdout-path = &serial_2;
> +		stdout-path = "serial2:115200n8";
>  	};
>  
>  	emmc_pwrseq: pwrseq {
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index d56253049ccb..d04490d40b07 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -26,7 +26,7 @@
>  	};
>  
>  	chosen {
> -		linux,stdout-path = &serial_2;
> +		stdout-path = "serial2:115200n8";
>  	};
>  
>  	firmware@02073000 {
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
