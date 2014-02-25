From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: Exynos: Add generic compatible string
Date: Mon, 24 Feb 2014 20:42:03 -0800
Message-ID: <CAOesGMiZXKRbrbmvKs4pF7HiXM1hsGjzbFUQmJ-n5-nar5uMBw@mail.gmail.com>
References: <1392809645-631-1-git-send-email-sachin.kamat@linaro.org>
	<CAK9yfHyWG1ac6isTRSB3VWfxER9cSuDJHwY3b7svyEk9EozpWQ@mail.gmail.com>
	<53075239.4010603@samsung.com>
	<2200834.G3JJLYQl5i@wuerfel>
	<53076F00.7000001@samsung.com>
	<53077160.5030202@samsung.com>
	<CAK9yfHxiHkrf1xmSFbfoKqFFSCU6w4QqwPnQNdv1m1PGtrwsLQ@mail.gmail.com>
	<530BE557.20106@samsung.com>
	<530BE93F.2070904@gmail.com>
	<CAK9yfHxXTbNmgTYqFH1Mm-X_sN2GpfLPp0MKixU=g2bKxz8e=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK9yfHxXTbNmgTYqFH1Mm-X_sN2GpfLPp0MKixU=g2bKxz8e=g@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 24, 2014 at 7:03 PM, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 25 February 2014 06:22, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 25.02.2014 01:35, Kukjin Kim wrote:
>>>
>>> On 02/24/14 21:03, Sachin Kamat wrote:
>>>>
>>>> On 21 February 2014 21:01, Tomasz Figa<t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>  wrote:
>>>>>
>>>>> On 21.02.2014 16:21, Tomasz Figa wrote:
>>>>>>
>>>>>>
>>>>>> On 21.02.2014 15:48, Arnd Bergmann wrote:
>>>>>>>
>>>>>>>
>>>>>>> On Friday 21 February 2014 14:18:49 Tomasz Figa wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>> Now that we have a broader agreement on this, I think we can go
>>>>>>>>> ahead with the
>>>>>>>>> following steps as an initial approach:
>>>>>>>>> 1. Have a common machine file for both exynos4 and 5 files,
>>>>>>>>> mach-exynos-dt.c.
>>>>>>>>> 2. Introduce a generic compatible string "samsung,exynos".
>>>
>>>
>>> Well, I think, we need to consider to use compatible string
>>> "samsung,exynos" again because "exynos" name can be used on ARMv8 as
>>> well and I don't want to say that generic/common something is always
>>> good. So IMHO still using exynos4 and exynos5 would be better.
>>
>>
>> You can create a new compatible string (e.g. "samsung,exynos-armv8") for
>> ARMv8 Exynos if support for one in mainline shows up and/or simply use
>> another name for ARMv7 Exynos (e.g. "samsung,exynos-armv7").
>
> I think "samsung,exynos-armv7" would be better in case we need to
> distinguish between
> v7 and v8.

I disagree. I don't know what Samsung has in mind, but the revision of
the CPU doesn't have all that much to do with the rest of the SoC.
It's quite likely that some vendors (maybe not Samsung, but the same
concept applies) will ship 64-bit SoCs that are very similar to their
preceding 32-bit ones, same IP, similar busses, etc. I'm pretty sure
at least some vendors will do very close to that.

So, if EXYNOS4 and EXYNOS5 can share a compatible value when they use
different CPUs, then there's no reason that whatever future 64-bit
ones can also share it.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
