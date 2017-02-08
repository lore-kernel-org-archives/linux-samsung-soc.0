From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH 2/5] arm64: dts: exynos: Move the clock-frequency property
Date: Wed, 08 Feb 2017 16:24:50 +0900
Message-ID: <8c4f2a21-152d-eb41-3f26-44bb69f831c7@samsung.com>
References: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170206021951epcas1p365db9f08f22cc223ca45538b0dbc86d6@epcas1p3.samsung.com>
 <1486347584-6762-3-git-send-email-hoegeun.kwon@samsung.com>
 <20170207201335.lyc7yvwed7cm25nj@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50125 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753418AbdBHHZa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 02:25:30 -0500
In-reply-to: <20170207201335.lyc7yvwed7cm25nj@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: inki.dae@samsung.com, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Hi krzysztof,



On 02/08/2017 05:13 AM, Krzysztof Kozlowski wrote:
> Hi,
>
> I think the subject is not really matching the real work. You are rather
> removing the OF graph from DSI node.
>
> On Mon, Feb 06, 2017 at 11:19:41AM +0900, Hoegeun Kwon wrote:
>> The OF graph is not needed because the panel is a child of dsi. So
>> removed the ports and moved burst, esc clock-frequency property to the
>> top.
> Keep the commit style and tense - imperative mode (see
> submitting-patches.rstsubmitting-patches.rst), so last sentence could
> look like:

Hi Krzysztof,

Thanks for your review.
I will write a clear subject on the next version.

>
> "Remove the ports node abd move burst and esc clock frequency properties
> to the parent (DSI node)."
>
> The information which is missing is the answer for WHY? Why are you
> doing this?

The current mipi-dsi must have at least one OF graph.
However, for example, dsi and panel are parent-child relationships,
so OF graph is not needed, and fimd and dsi are not connected to the OF 
graph.
In this case, an error occurred in dsi_parse in the code before patch (1/5).
So I modified dsi_parse_dt.

>
> Does the patch depends on 1/5?

Yes, it is.
The 2/5 to 5/5 patches depend on the 1/5 patch.

Best regards,
Hoegeun

>
> Best regards,
> Krzysztof
>
>> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 16 ++--------------
>>   1 file changed, 2 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> index 6ce93a3..77ba238 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> @@ -298,23 +298,11 @@
>>   	status = "okay";
>>   	vddcore-supply = <&ldo6_reg>;
>>   	vddio-supply = <&ldo7_reg>;
>> +	samsung,burst-clock-frequency = <512000000>;
>> +	samsung,esc-clock-frequency = <16000000>;
>>   	samsung,pll-clock-frequency = <24000000>;
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&te_irq>;
>> -
>> -	ports {
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -
>> -		port@1 {
>> -			reg = <1>;
>> -
>> -			dsi_out: endpoint {
>> -				samsung,burst-clock-frequency = <512000000>;
>> -				samsung,esc-clock-frequency = <16000000>;
>> -			};
>> -		};
>> -	};
>>   };
>>   
>>   &hdmi {
>> -- 
>> 1.9.1
>>
>
>
