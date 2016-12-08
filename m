From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Fix initial clocks configuration on
 Odroid X/X2/U3 boards
Date: Thu, 08 Dec 2016 18:07:02 +0100
Message-ID: <864877de-a14b-093a-4127-4ad710299fc2@samsung.com>
References: <1481194914-20490-1-git-send-email-m.szyprowski@samsung.com>
 <1481194914-20490-2-git-send-email-m.szyprowski@samsung.com>
 <CGME20161208164434epcas4p4a7c6c5045d38140b0dca501276206a2c@epcas4p4.samsung.com>
 <20161208164421.GC5238@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20161208164421.GC5238@kozik-lap>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 12/08/2016 05:44 PM, Krzysztof Kozlowski wrote:
> On Thu, Dec 08, 2016 at 12:01:54PM +0100, Marek Szyprowski wrote:
>> Move assigned clocks properties from sound node to audio subsystem clock
>> controller node. This way clocks topology and rates are set just after
>> probing audio clocks controller. Leaving those properties under sound
>> node doesn't guarantee to configure them before they are being used
>> (for example i2s hardware module can be probed in parallel and it also
>> require proper audio clocks configuration).
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> Looks correct, for the reference:
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Does this fixes any encountered issue (real one)? I wonder whether this
> should go to fixes or not.

With current code there is no issues, and in fact there should be no
such timing dependencies in DT to rely on.  However, the binding convention
is to put assigned-clock* properties in a node of a device they belong
to and in this case the 'clock_audss' is more appropriate than the 'sound'
node.  This patch doesn't fix any bug with current code but it might save
us some trouble with future changes.

-- 
Thanks,
Sylwester

> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 7815efd..b6b0f50 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -43,16 +43,6 @@
>
>  	sound: sound {
>  		compatible = "simple-audio-card";
> -		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
> -				<&clock_audss EXYNOS_MOUT_I2S>,
> -				<&clock_audss EXYNOS_DOUT_SRP>,
> -				<&clock_audss EXYNOS_DOUT_AUD_BUS>;
> -		assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
> -				<&clock_audss EXYNOS_MOUT_AUDSS>;
> -		assigned-clock-rates = <0>,
> -				<0>,
> -				<192000000>,
> -				<19200000>;
>
>  		simple-audio-card,format = "i2s";
>  		simple-audio-card,bitclock-master = <&link0_codec>;
> @@ -157,6 +147,16 @@
>  	status = "okay";
>  };
>
> +&clock_audss {
> +	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
> +			<&clock_audss EXYNOS_MOUT_I2S>,
> +			<&clock_audss EXYNOS_DOUT_SRP>,
> +			<&clock_audss EXYNOS_DOUT_AUD_BUS>;
> +	assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
> +			<&clock_audss EXYNOS_MOUT_AUDSS>;
> +	assigned-clock-rates = <0>, <0>, <192000000>, <19200000>;
> +};
> +
>  &cpu0 {
>  	cpu0-supply = <&buck2_reg>;
>  };
>
