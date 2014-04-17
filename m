From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv3 2/2] iio: devicetree: Add DT binding documentation for
 Exynos3250 ADC
Date: Thu, 17 Apr 2014 20:52:17 +0900
Message-ID: <534FC071.9080502@samsung.com>
References: <1397643118-6934-1-git-send-email-cw00.choi@samsung.com>
 <1397643118-6934-3-git-send-email-cw00.choi@samsung.com>
 <534E6E4E.4020807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <534E6E4E.4020807-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

On 04/16/2014 08:49 PM, Tomasz Figa wrote:
> Hi Chanwoo,
> 
> On 16.04.2014 12:11, Chanwoo Choi wrote:
>> This patch add DT binding documentation for Exynos3250 ADC IP. Exynos3250 has
>> special clock ('sclk_tsadc') for ADC which provide clock to internal ADC.
>>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
>> Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   .../devicetree/bindings/arm/samsung/exynos-adc.txt   | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>> index 5d49f2b..7532ec3 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>> @@ -14,6 +14,8 @@ Required properties:
>>                   for exynos4412/5250 controllers.
>>               Must be "samsung,exynos-adc-v2" for
>>                   future controllers.
>> +            Must be "samsung,exynos-adc-v3" for
>> +                for exynos3250 controllers.
> 
> I don't think adc-v3 is correct here. It looks like a normal V2 with additional special clock input. Possibly "samsung,exynos3250-adc-v2" or "samsung,exynos-adc-v2-sclk" would be better choices.

OK, I'll fix it with following compatible
- "samsung,exynos-adc-v2-sclk"

> 
>>   - reg:            Contains ADC register address range (base address and
>>               length) and the address of the phy enable register.
>>   - interrupts:         Contains the interrupt information for the timer. The
>> @@ -21,7 +23,11 @@ Required properties:
>>               the Samsung device uses.
>>   - #io-channel-cells = <1>; As ADC has multiple outputs
>>   - clocks        From common clock binding: handle to adc clock.
>> +            From common clock binding: handle to sclk_tsadc clock
>> +            if using Exynos3250.
>>   - clock-names        From common clock binding: Shall be "adc".
>> +            From common clock binding: Shall be "sclk_tsadc"
>> +            if using Exynos3250.
>>   - vdd-supply        VDD input supply.
>>
>>   Note: child nodes can be added for auto probing from device tree.
>> @@ -41,6 +47,20 @@ adc: adc@12D10000 {
>>       vdd-supply = <&buck5_reg>;
>>   };
>>
>> +If Exynos3250 uses ADC,
> 
> Please keep proper formatting:
> 
> Example: Node for ADC of Exynos3250 with additional special clock

Thanks, I'll fix it.

Best regards,
Chanwoo Choi
