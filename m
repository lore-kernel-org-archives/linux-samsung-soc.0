From: ayaka <ayaka@soulik.info>
Subject: Re: [PATCH RFC] ARM: dts: samsung: add rga-lvds panel in itop elite
Date: Thu, 1 Sep 2016 01:53:33 +0800
Message-ID: <30e64895-34da-68ba-3616-f537e4196e9a@soulik.info>
References: <1472511002-9019-1-git-send-email-ayaka@soulik.info>
 <dee989f5-17b0-7445-514b-559e98d77acd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kozue.soulik.info ([108.61.200.231]:56080 "EHLO
        kozue.soulik.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753070AbcHaRxt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 13:53:49 -0400
In-Reply-To: <dee989f5-17b0-7445-514b-559e98d77acd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, devicetree <devicetree@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc@vger.kernel.org, linux@armlinux.org.uk, krzk@kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, thierry.reding@gmail.com



On 08/31/2016 08:30 PM, Andrzej Hajda wrote:
> Hi,
>
>
> On 08/30/2016 12:50 AM, Randy Li wrote:
>> It is actually a lvds panel connected through a rga-lvds bridge.
>> But I really have no idea about what does a port mean in fimd node.
>>
>> Also how should I configure this panel size? I think the i2c found
>> on the panel schematic, but it more likely to be used a touch screen
>> touth. Also the touch screen is not supported in currently driver.
>>
>> Signed-off-by: Randy Li <ayaka@soulik.info>
>> ---
>>   arch/arm/boot/dts/exynos4412-itop-elite.dts | 35 ++++++++++++++++++++++++++---
>>   1 file changed, 32 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
>> index e1cda54..2d67385 100644
>> --- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
>> +++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
>> @@ -139,6 +139,20 @@
>>   		assigned-clocks = <&clock CLK_MOUT_CAM0>;
>>   		assigned-clock-parents = <&clock CLK_XUSBXTI>;
>>   	};
>> +	
>> +	vcc_sys_lcd: sys-lcd {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc_5v";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	panel: panel {
>> +		ddc-i2c-bus = <&i2c_3>;
>> +		power-supply = <&vcc_sys_lcd>;
>> +		enable-gpios = <&gpl0 2 GPIO_ACTIVE_HIGH>;
>> +	};
> Panel has no compatible string, which driver will handle this node?
The problem is that, it is panel not supported by kernel. Is it possible 
to support without adding a new driver for it ? I know there is a 
simple-dpi for MIPI, but what is for parallel video or lvds?
> Regards
> Andrzej
The other problem is that I don't how to configure the display-times, 
the datasheet for CLAA070WP03XG should talk about total time, active 
time and blank time for both Horizontal an Vertical time. Does it mean 
the front-porch and sync-len for horizontal and vertical are zero ?

+       ports {
+               #address-cells = <1>;
+               #size-cells = <0>;
+               port@3 {
+                       reg = <3>;
+                       rga_lvds: endpoint {
+                               remote-endpoint = <&panel>;
+                       };
+               };
+       };
+
+       panel: panel@0 {
+               compatible = "panel-simple";
+
+               power-supply = <&vcc_sys_lcd>;
+               enable-gpios = <&gpl0 2 GPIO_ACTIVE_HIGH>;
+               display-timings {
+                       timing-0 {
+                               clock-frequency = <66770000>;
+                               hactive = <800>;
+                               vactive = <1280>;
+                               hfront-porch = <0>;
+                               hback-porch = <64>;
+                               hsync-len = <0>;
+                               vfront-porch = <0>;
+                               vback-porch = <8>;
+                               vsync-len = <0>;
+                       };
