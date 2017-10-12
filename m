From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon: Add
 ti-max-expected-current-microamp property to ina2xx
Date: Thu, 12 Oct 2017 16:13:43 +0200
Message-ID: <855a8cd7-fa62-b606-cd27-a37753a2ff7b@samsung.com>
References: <CGME20171012123635eucas1p1ff9a982db9d541cd0475d44d114ff92a@eucas1p1.samsung.com>
        <1507811765-31005-1-git-send-email-m.purski@samsung.com>
        <1507811765-31005-4-git-send-email-m.purski@samsung.com>
        <CAJKOXPc1B1uqravtmHrh4eUK5JiQRiZLeoveSMk5qVyF-mK7Kw@mail.gmail.com>
        <4597b058-ecb1-59ef-8693-1a23f374eae0@samsung.com>
        <79da3a8b-e885-8a02-cbba-dfd1834450db@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <79da3a8b-e885-8a02-cbba-dfd1834450db-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org



On 10/12/2017 03:55 PM, Guenter Roeck wrote:
> On 10/12/2017 06:00 AM, Maciej Purski wrote:
>>
>>
>> On 10/12/2017 02:39 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Oct 12, 2017 at 2:36 PM, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>> Add optional max expected current property which allows calibrating
>>>> the ina sensor in order to achieve requested measure scale. Document
>>>> the changes in Documentation/hwmon/ina2xx.
>>>>
>>>> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>> ---
>>>>   Documentation/devicetree/bindings/hwmon/ina2xx.txt | 4 +++-
>>>>   Documentation/hwmon/ina2xx                         | 3 +++
>>>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/ina2xx.txt 
>>>> b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
>>>> index 02af0d9..49ef0be 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/ina2xx.txt
>>>> +++ b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
>>>> @@ -14,11 +14,13 @@ Optional properties:
>>>>
>>>>   - shunt-resistor
>>>>          Shunt resistor value in micro-Ohm
>>>> -
>>>> +- ti-max-expected-current-microamp
>>>> +       Max expected current value in mA
>>>>   Example:
>>>>
>>>>   ina220@44 {
>>>>          compatible = "ti,ina220";
>>>>          reg = <0x44>;
>>>>          shunt-resistor = <1000>;
>>>> +       ti-max-expected-current-microamp = <3000>;
>>>>   };
>>>> diff --git a/Documentation/hwmon/ina2xx b/Documentation/hwmon/ina2xx
>>>> index cfd31d9..30620e8 100644
>>>> --- a/Documentation/hwmon/ina2xx
>>>> +++ b/Documentation/hwmon/ina2xx
>>>> @@ -55,6 +55,9 @@ The shunt value in micro-ohms can be set via platform data 
>>>> or device tree at
>>>>   compile-time or via the shunt_resistor attribute in sysfs at run-time. Please
>>>>   refer to the Documentation/devicetree/bindings/i2c/ina2xx.txt for bindings
>>>>   if the device tree is used.
>>>> +The max expected current value in miliamp can be set via platform data
>>>
>>> mili or micro?
>>>
>>> BR,
>>> Krzysztof
>>
>> Sorry, these should be mili everywhere. I'll fix this.
>>
> 
> You sure ? I think DT usually uses micro.
> 
> Guenter

Yeah, you're right. I was intending to make it milli, but I haven't checked that
all DTS use micro. Sorry for confusion.

Best Regards,

Maciej

> 
>>>
>>>> +or device tree at compile-time or via currX_max attribute in sysfs
>>>> +at run-time.
>>>>
>>>>   Additionally ina226 supports update_interval attribute as described in
>>>>   Documentation/hwmon/sysfs-interface. Internally the interval is the sum of
>>>> -- 
>>>> 2.7.4
>>>>
>>>
>>>
>>>
>>
> 
> 
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
