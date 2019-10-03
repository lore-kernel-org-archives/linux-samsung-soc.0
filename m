From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH] dt-bindings: memory-controllers: exynos5422-dmc:
 Correct example syntax and memory region
Date: Thu, 3 Oct 2019 07:20:06 +0200
Message-ID: <d0955b23-2111-7dbb-92ce-0a81ac417bb8@partner.samsung.com>
References: <CGME20191002174416epcas4p15c507d0c8cacfafce9b538d0b08e277f@epcas4p1.samsung.com>
        <20191002174401.17590-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002174401.17590-1-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 10/2/19 7:44 PM, Krzysztof Kozlowski wrote:
> After adding the interrupt properties to Exynos5422 DMC bindings
> example, the mapped memory region must be big enough to access
> performance counters registers.
> 
> Fix also syntax errors (semicolons) and adjust indentation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Rebased on top of my for-next branch as exynos5422-dmc.txt bindings were
> applied by me.
> ---
>   .../bindings/memory-controllers/exynos5422-dmc.txt        | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt b/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
> index e2434cac4858..02e4a1f862f1 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
> @@ -55,7 +55,7 @@ Example:
>   
>   	dmc: memory-controller@10c20000 {
>   		compatible = "samsung,exynos5422-dmc";
> -		reg = <0x10c20000 0x100>, <0x10c30000 0x100>,
> +		reg = <0x10c20000 0x10000>, <0x10c30000 0x10000>;
>   		clocks = <&clock CLK_FOUT_SPLL>,
>   			 <&clock CLK_MOUT_SCLK_SPLL>,
>   			 <&clock CLK_FF_DOUT_SPLL2>,
> @@ -63,7 +63,7 @@ Example:
>   			 <&clock CLK_MOUT_BPLL>,
>   			 <&clock CLK_SCLK_BPLL>,
>   			 <&clock CLK_MOUT_MX_MSPLL_CCORE>,
> -			 <&clock CLK_MOUT_MCLK_CDREX>,
> +			 <&clock CLK_MOUT_MCLK_CDREX>;
>   		clock-names = "fout_spll",
>   			      "mout_sclk_spll",
>   			      "ff_dout_spll2",
> @@ -71,10 +71,10 @@ Example:
>   			      "mout_bpll",
>   			      "sclk_bpll",
>   			      "mout_mx_mspll_ccore",
> -			      "mout_mclk_cdrex",
> +			      "mout_mclk_cdrex";
>   		operating-points-v2 = <&dmc_opp_table>;
>   		devfreq-events = <&ppmu_event3_dmc0_0>,	<&ppmu_event3_dmc0_1>,
> -				<&ppmu_event3_dmc1_0>, <&ppmu_event3_dmc1_1>;
> +				 <&ppmu_event3_dmc1_0>, <&ppmu_event3_dmc1_1>;
>   		device-handle = <&samsung_K3QF2F20DB>;
>   		vdd-supply = <&buck1_reg>;
>   		samsung,syscon-clk = <&clock>;
> 

Thank you for the patch. Indeed it must also be updated.

Reviewed-by: Lukasz Luba <l.luba@partner.samsung.com>

Regards,
Lukasz
