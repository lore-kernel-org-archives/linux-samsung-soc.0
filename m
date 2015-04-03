From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Get current parent clock for power
 domain on/off
Date: Fri, 3 Apr 2015 10:35:56 +0200
Message-ID: <CAJKOXPcqSk3oaqdsW3LLzQCmL09+pZa5qb9tSBMiJMq_ZLSByQ@mail.gmail.com>
References: <1427961979-29477-1-git-send-email-k.kozlowski@samsung.com>
	<551D362B.90901@collabora.co.uk>
	<CAJKOXPc1dfHAaUQd+3HDhNwQW8xYDeoYFgN6QMkmQPEnLGtG-A@mail.gmail.com>
	<551E4B85.1000903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <551E4B85.1000903-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

2015-04-03 10:12 GMT+02:00 Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
> On 04/02/2015 02:44 PM, Krzysztof Kozlowski wrote:
>> 2015-04-02 14:29 GMT+02:00 Javier Martinez Canillas
>> <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>:
>>> Hello Krzysztof,
>>>
>>> On 04/02/2015 10:06 AM, Krzysztof Kozlowski wrote:
>>>> Using a fixed (by DTS) parent for clocks when turning on the power domain
>>>> may introduce issues in other drivers. For example when such driver
>>>> changes the parent during runtime and expects that he is the only place
>>>> of such change.
>>>>
>>>> Do not rely entirely on DTS providing the fixed parent for such clocks.
>>>> Instead if "pclkN" clock name is missing, grab a current parent of clock
>>>> with clk_get_parent().
>
> Hi Krzysztof,
>
> I wonder if it wouldn't be better to drop entirely pclks. Power domains
> should save/restore its previous state, setting fixed parents on domain
> resume can fool drivers as you described earlier.

I wanted to preserve full backward compatibility (including behaviour
compatibility). However I can't find valid reason to switch to some
fixed clock after powering up domain so if there are not objections I
will drop pclk entirely.

Thanks!
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
