From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/8] ARM: dts: Correct camera pinctrl nodes for Exynos4x12
 SoCs
Date: Mon, 24 Jun 2013 14:29:02 +0200
Message-ID: <51C83B8E.6030806@samsung.com>
References: <1371819024-12596-1-git-send-email-s.nawrocki@samsung.com>
 <1371819024-12596-2-git-send-email-s.nawrocki@samsung.com>
 <7538808.XQjIcFgyeQ@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:8852 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750858Ab3FXM3G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Jun 2013 08:29:06 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOW00HDCDA1WK10@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Jun 2013 13:29:03 +0100 (BST)
In-reply-to: <7538808.XQjIcFgyeQ@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, devicetree-discuss@lists.ozlabs.org

Hi Tomasz,

Thanks for the review.

On 06/23/2013 12:12 PM, Tomasz Figa wrote:
> On Friday 21 of June 2013 14:50:17 Sylwester Nawrocki wrote:
>> Add separate nodes for the CAMCLK pin and turn off pull-up on camera
>> ports A, B. The video bus pins and the clock output (CAMCLK) pin need
>> separate nodes since full camera port is not used in some
>> configurations, e.g. for MIPI CSI-2 bus only CAMCLK is required and
>> data/clock signal use separate dedicated pins.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   40
>> ++++++++++++++++++++++++----- 1 file changed, 33 insertions(+), 7
>> deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
>> b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi index 704290f..50eaa95
>> 100644
>> --- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
>> @@ -401,13 +401,26 @@
>>  			samsung,pin-drv = <0>;
>>  		};
>>
>> -		cam_port_a: cam-port-a {
>> +		cam_port_a_io: cam-port-a-io {
>>  			samsung,pins = "gpj0-0", "gpj0-1", "gpj0-2", 
> "gpj0-3",
>>  					"gpj0-4", "gpj0-5", "gpj0-6", 
> "gpj0-7",
>> -					"gpj1-0", "gpj1-1", "gpj1-2", 
> "gpj1-3",
>> -					"gpj1-4";
>> +					"gpj1-0", "gpj1-1", "gpj1-2", 
> "gpj1-4";
>>  			samsung,pin-function = <2>;
>> -			samsung,pin-pud = <3>;
>> +			samsung,pin-pud = <0>;
>> +			samsung,pin-drv = <0>;
>> +		};
>> +
>> +		cam_port_a_clk_active: cam-port-a-clk-active {
>> +			samsung,pins = "gpj1-3";
>> +			samsung,pin-function = <2>;
>> +			samsung,pin-pud = <0>;
>> +			samsung,pin-drv = <3>;
>> +		};
>> +
>> +		cam_port_a_clk_idle: cam-port-a-clk-idle {
>> +			samsung,pins = "gpj1-3";
>> +			samsung,pin-function = <0>;
>> +			samsung,pin-pud = <0>;
>>  			samsung,pin-drv = <0>;
> 
> Who is driving the clock line in this configuration? Idle would suggest 
> that neither the camera nor the camif, so I think some pull should be 
> enabled to avoid floating pin. (Or is there an external pulling resistor 
> for this line in most common setups?)

In normal operation it is the AP SoC that feeds the clock to an external
image sensor. And the 'idle' pinctrl state is meant for a state where
the sensor is powered down completely or is in a suspend state that does
not require the sensor's master clock to be provided.

I took this configuration directly from the SoC vendor kernels, but it
indeed seems more appropriate to enable pull down on these pins in idle
state to avoid floating pins. If anything else is needed relevant
pinctrl nodes could be overridden in a board dts file.

I will update this and resend with pull down enabled.

Thanks,
Sylwester
