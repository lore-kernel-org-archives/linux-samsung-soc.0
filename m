From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: s3c2416: Use macros for pinctrl configuration
Date: Thu, 01 Sep 2016 13:12:18 +0200
Message-ID: <e37fbfa0-f30c-ab34-3428-fb9a66182089@samsung.com>
References: <1472721715-2833-1-git-send-email-k.kozlowski@samsung.com>
 <1472721715-2833-6-git-send-email-k.kozlowski@samsung.com>
 <1608454.1ZuTJsprje@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1608454.1ZuTJsprje@amdc1976>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 09/01/2016 12:59 PM, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On Thursday, September 01, 2016 11:21:54 AM Krzysztof Kozlowski wrote:
>> Usage of DTS macros instead of hard-coded numbers makes code easier
>> to read.  One does not have to remember which value means pull-up/down
>> or specific driver strength.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/s3c2416-pinctrl.dtsi | 38 ++++++++++++++++++----------------
>>  1 file changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/s3c2416-pinctrl.dtsi b/arch/arm/boot/dts/s3c2416-pinctrl.dtsi
>> index 527e3193817f..6274359fb323 100644
>> --- a/arch/arm/boot/dts/s3c2416-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/s3c2416-pinctrl.dtsi
>> @@ -8,6 +8,8 @@
>>   * published by the Free Software Foundation.
>>   */
>>  
>> +#include <dt-bindings/pinctrl/samsung.h>
>> +
>>  &pinctrl_0 {
>>  	/*
>>  	 * Pin banks
>> @@ -83,91 +85,91 @@
>>  
>>  	uart0_data: uart0-data {
>>  		samsung,pins = "gph-0", "gph-1";
>> -		samsung,pin-function = <2>;
>> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> 
> Shouldn't macros that are also used by s3c* be named as
> SAMSUNG_PIN_FUNC_2 etc. (s3c* SoCs are not Exynos)?

Right, this is the inconsistency. The problem with "samsung" prefix is
that there is no guarantee it will be like that for newer SoCs. How
about one of:
1. using the oldest prefix (S3C24XX in this case),
2. duplicating them per SoC family (so S3C24XX, S3C64XX, EXYNOS).
?

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
