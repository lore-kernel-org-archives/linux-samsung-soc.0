From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: dts: exynos4412-trats2: Add ADC's dt data to get
 temperature of SoC/battery
Date: Wed, 12 Mar 2014 15:01:54 +0900
Message-ID: <531FF852.8090502@samsung.com>
References: <1394524494-30641-1-git-send-email-cw00.choi@samsung.com>
 <1394524494-30641-6-git-send-email-cw00.choi@samsung.com>
 <531F0AEC.7010606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <531F0AEC.7010606-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

On 03/11/2014 10:09 PM, Tomasz Figa wrote:
> Hi Chanwoo,
> 
> On 11.03.2014 08:54, Chanwoo Choi wrote:
>> This patch use ADC to get the temperature of SoC/battery by using NTC thermistor
>> driver in hwmon. NTC thermistor driver covnvert ADC's raw data to temperature
>> by using following variables:
>>
>> - pullup-uv    : Voltage
>> - pullup-ohm   : Pull-up resistance
>> - pulldown-ohm : Pull-down resistance
>> - io-channels  : It means ADC channel.
>>
> 
> Those properties are well-defined in "ntc,ncp15wb473" DT bindings documentation. There is no need to repeat them here.
> 
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/exynos4412-trats2.dts | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
>> index 4f851cc..fc517c3 100644
>> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
>> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
>> @@ -106,6 +106,27 @@
>>           };
>>       };
>>
>> +    adc: adc@126C0000 {
>> +        vdd-supply = <&ldo3_reg>;
>> +        status = "okay";
>> +
>> +        ncp15wb473@0 {
> 
> style: Nodes should have generic names, e.g. thermistor@0.
> 
> Also if node name is suffixed with @unit-address, then the node should have a reg property with its first entry corresponding to the unit-address. Now there is no physical unit-address definition for those thermistors, so they shouldn't use this naming pattern, but rather something like "thermistor-0" or "thermistor-ap".

OK I'll rename thermistor dt name.
> 
>> +            compatible = "ntc,ncp15wb473";
>> +            pullup-uv = <1800000>;     /* VCC_1.8V_AP */
>> +            pullup-ohm = <100000>;     /* 100K */
>> +            pulldown-ohm = <100000>; /* 100K */
>> +            io-channels = <&adc 1>;  /* AP temperature */
>> +        };
>> +
>> +        ncp15wb473@1 {
>> +            compatible = "ntc,ncp15wb473";
>> +            pullup-uv = <1800000>;     /* VCC_1.8V_AP */
>> +            pullup-ohm = <100000>;     /* 100K */
>> +            pulldown-ohm = <100000>; /* 100K */
>> +            io-channels = <&adc 2>;  /* Battery temperature */
>> +        };
> 
> Anyway, I don't think it is correct to place IIO consumers under IIO provider node, because IIO is not a control bus, but rather a resource provider, like GPIO, clock, etc. So both thermistor nodes should be placed outside the adc node. (They might be grouped in a simple-bus subnode, though, to improve readability.)

OK, I'll move ntc_thermistor node outside of ADC dt node.

Best Regards,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
