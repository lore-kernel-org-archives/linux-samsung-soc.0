From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Add SPI CS on exynos5250-snow
Date: Tue, 28 Jul 2015 09:36:58 +0900
Message-ID: <55B6CEAA.7050904@samsung.com>
References: <a5054dfad3d48c582b062b0536125c9bcff41f31.1438027526.git.hramrach@gmail.com>
 <CABxcv=kHgvXgVSzLj=bABqO26r3w7T7ezAUfdh0n4S_N3ZM-Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:12862 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754525AbbG1AhI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 20:37:08 -0400
In-reply-to: <CABxcv=kHgvXgVSzLj=bABqO26r3w7T7ezAUfdh0n4S_N3ZM-Mw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>, Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On 28.07.2015 06:24, Javier Martinez Canillas wrote:
> Hello Michal,
> 
> The patch looks good to me, just one small comment below.
> 
> On Mon, Jul 27, 2015 at 10:11 PM, Michal Suchanek <hramrach@gmail.com> wrote:
>> Although there is only one choice of chipselect it is necessary to
>> specify it. The driver cannot claim the gpio otherwise.
>>
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>>
>> --
>> v2
>>  - don't move unrelated line
>> ---
>>  arch/arm/boot/dts/exynos5250-snow.dts | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
>> index b7f4122..62be08a 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -688,6 +688,7 @@
>>         status = "okay";
>>         samsung,spi-src-clk = <0>;
>>         num-cs = <1>;
>> +       cs-gpios = <&gpa2 5 0>;
> 
> NIT: this should be GPIO_ACTIVE_HIGH instead of 0 but maybe Kukjin or
> Krzysztof can fixup when applying it?
> 
>>  };
>>
>>  &usbdrd_dwc3 {
>> --
> 
> Acked-by: Javier Martinez Canillas <javier@osg.samsung.com>

Yes, the GPIO_ACTIVE_HIGH would be better. Can you re-spin the patch
with this change and respective Acks? Including mine ack:
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
