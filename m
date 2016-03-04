From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC PATCH] watchdog: s3c2410_wdt: Add max and min timeout values
Date: Thu, 3 Mar 2016 21:32:03 -0800
Message-ID: <56D91DD3.9010604@roeck-us.net>
References: <1456850717-3670-1-git-send-email-javier@osg.samsung.com>
 <56D62979.5040009@samsung.com> <56D7233B.50907@osg.samsung.com>
 <56D7838D.4060602@samsung.com> <56D79E1D.3030302@osg.samsung.com>
 <56D7C2A5.1050304@roeck-us.net> <56D82643.1090105@osg.samsung.com>
 <CAJKOXPe2GAkMGgZJR3FCRONMgb3AcrySczuzm_BehekrMnEbrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPe2GAkMGgZJR3FCRONMgb3AcrySczuzm_BehekrMnEbrw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/03/2016 04:26 AM, Krzysztof Kozlowski wrote:
> 2016-03-03 20:55 GMT+09:00 Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>:
>> Hello Guenter,
>>
>>
>> On 03/03/2016 01:50 AM, Guenter Roeck wrote:
>>> A watchdog driver using a non-static clock must register a clock change
>>> notifier
>>> to handle the clock rate change and update its settings accordingly.
>>>
>>> I would also argue that the maximum timeout should be set to the minimum
>>> possible value (probably associated with the highest possible frequency).
>>> All other cases might end up causing trouble if a clock frequency
>>> chance results in an enforced timeout change, since there is currently
>>> no mechanism to inform user space about such a change.
>>>
>>> Example: maximum possible timeout changes from 1 minute to 30 seconds.
>>> The timeout was set to 1 minute, and has to be reduced to 30 seconds.
>>> Very likely result is that the watchdog will reset the system because
>>> user space still believes that the timeout is 60 seconds and doesn't
>>> ping the watchdog often enough to prevent it.
>>>
>>
>> Agreed.
>>
>> In any case this discussion is not related to this patch since currently
>> in mainline the watchdog source clock is fixed and does not change.
>>
>> So, $SUBJECT solves the issue of not having the fixed .{min,max}_timeout
>> defined to allow the watchdog_timeout_invalid() function to check values
>> set by WDIOC_SETTIMEOUT and avoid calling the .set_timeout callback.
>>
>> If later someone tries to scale a parent clock used by many drivers, then
>> the submitter should make sure that no regressions are added by the patch.
>
> Sounds good. For this patch then:
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Agreed.

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Thanks,
Guenter

>
> Best regards,
> Krzysztof
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
