From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 09/10] dt-bindings: video: exynos5433-decon: add bindings
 for DECON-TV
Date: Tue, 20 Oct 2015 14:53:32 +0200
Message-ID: <5626394C.5040202@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
 <1445332961-25419-10-git-send-email-a.hajda@samsung.com>
 <56263400.6010200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:54864 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752407AbbJTMxw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 08:53:52 -0400
In-reply-to: <56263400.6010200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: k.kozlowski.k@gmail.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

On 10/20/2015 02:30 PM, Krzysztof Kozlowski wrote:
> W dniu 20.10.2015 o 18:22, Andrzej Hajda pisze:
>> DECON-TV(Display and Enhancement Controller for TV) is a variation
>> of DECON IP. Its main purpose is to produce video stream for HDMI IP.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  .../devicetree/bindings/video/exynos5433-decon.txt  | 21 ++++++++++++---------
>>  1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> index 3dff78b..2a88c8d 100644
>> --- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> +++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> @@ -5,24 +5,27 @@ Exynos series of SoCs which transfers the image data from a video memory
>>  buffer to an external LCD interface.
>>  
>>  Required properties:
>> -- compatible: value should be "samsung,exynos5433-decon";
>> +- compatible: value should be one of:
>> +	"samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
> Until this point it looked good.
>
>>  - reg: physical base address and length of the DECON registers set.
>> -- interrupts: should contain a list of all DECON IP block interrupts in the
>> -	      order: VSYNC, LCD_SYSTEM. The interrupt specifier format
>> -	      depends on the interrupt controller used.
>> -- interrupt-names: should contain the interrupt names: "vsync", "lcd_sys"
>> -		   in the same order as they were listed in the interrupts
>> -		   property.
>> +- interrupts: should contain interrupt specifier of VSYNC and optionally
>> +	      LCD_SYSTEM. The interrupt specifier format depends on
>> +	      the interrupt controller used.
>> +- interrupt-names: should contain the interrupt name "vsync" and optionally
>> +		   "lcd_sys" in the same order as they were listed in
>> +		   the interrupts property.
> The driver already did not require both interrupts, right? Only one of them?

Right. More precisely it did not require since beginning.

>
>>  - clocks: must include clock specifiers corresponding to entries in the
>>  	  clock-names property.
>>  - clock-names: list of clock names sorted in the same order as the clocks
>>  	       property. Must contain "pclk", "aclk_decon", "aclk_smmu_decon0x",
>>  	       "aclk_xiu_decon0x", "pclk_smmu_decon0x", clk_decon_vclk",
>>  	       "sclk_decon_eclk"
>> +
>> +Optional properties:
>>  - ports: contains a port which is connected to mic node. address-cells and
>> -	 size-cells must 1 and 0, respectively.
>> +	 size-cells must be 1 and 0, respectively.
>>  - port: contains an endpoint node which is connected to the endpoint in the mic
>> -	node. The reg value muset be 0.
>> +	node. The reg value must be 0.
>>  - i80-if-timings: specify whether the panel which is connected to decon uses
>>  		  i80 lcd interface or mipi video interface. This node contains
>>  		  no timing information as that of fimd does. Because there is
>>
> This is cleanup, please split it.

Ok. I will split it into cleanup/fix patch, and 2nd one adding compatible.

Regards
Andrzej
>
> Best regards,
> Krzysztof
>
