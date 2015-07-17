From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH v2 4/4] mfd: max77686: Split out regulator part from the
 DT binding
Date: Fri, 17 Jul 2015 08:59:46 +0200
Message-ID: <55A8A7E2.7020201@osg.samsung.com>
References: <1437114567-17629-1-git-send-email-javier@osg.samsung.com>
 <1437114567-17629-5-git-send-email-javier@osg.samsung.com>
 <CAJKOXPe8rDLCt+Za+Qzkkd4JnFoyKtsFTmMbJL6+3Ark8qFYiQ@mail.gmail.com>
 <55A8A4BE.1030904@osg.samsung.com>
 <CAJKOXPdih+qqGnEZub-hqeVF6POSuSGN-OWnLCgN9cW_5sYb+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPdih+qqGnEZub-hqeVF6POSuSGN-OWnLCgN9cW_5sYb+A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 07/17/2015 08:49 AM, Krzysztof Kozlowski wrote:
> 2015-07-17 15:46 GMT+09:00 Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>:
>> Hello Krzysztof,
>>
>> On 07/17/2015 08:42 AM, Krzysztof Kozlowski wrote:
>>> 2015-07-17 15:29 GMT+09:00 Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>:
>>>> The Maxim MAX77686 PMIC is a multi-function device with regulators,
>>>> clocks and a RTC. The DT bindings for the clocks are in a separate
>>>> file but the bindings for the regulators are inside the mfd part.
>>>>
>>>> To make it consistent with the clocks portion of the binding and
>>>> because is more natural to look for regulator bindings under the
>>>> bindings/regulator sub-directory, split the regulator portion of
>>>> the DT binding and add it as a separate file.
>>>>
>>>> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - Use a generic name for the max77686 node in the regulator example.
>>>>
>>>>  Documentation/devicetree/bindings/mfd/max77686.txt | 58 +-----------------
>>>>  .../devicetree/bindings/regulator/max77686.txt     | 71 ++++++++++++++++++++++
>>>>  2 files changed, 74 insertions(+), 55 deletions(-)
>>>>  create mode 100644 Documentation/devicetree/bindings/regulator/max77686.txt
>>>
>>> Putting regulator bindings under regulator directory seems logical so
>>> I am fine with it.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>
>>
>> Thanks a lot for your review. For completeness, I talked with Lee Jones
>> over IRC yesterday asking him his opinion on whether MFD DT binding doc
>> should contain all the info or if it should be split across different
>> subsystems and he prefers the later. That's why I re-spun this series.
> 
> Okay, this sounds good.
> 
> One more thing - can you update the maintainers file? The bindings
> documentation is mentioned there for max77686.
>

Sure, I see that also the max77802 files are missing in that section.
I'll included that as well. But I'll wait to see if Lee pick this
series before posting the patch for MAINTAINERS.
 
> Best regards,
> Krzysztof
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
