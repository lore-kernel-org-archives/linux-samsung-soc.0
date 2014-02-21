From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: Exynos: Add generic compatible string
Date: Fri, 21 Feb 2014 16:31:44 +0100
Message-ID: <53077160.5030202@samsung.com>
References: <1392809645-631-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHyWG1ac6isTRSB3VWfxER9cSuDJHwY3b7svyEk9EozpWQ@mail.gmail.com>
 <53075239.4010603@samsung.com> <2200834.G3JJLYQl5i@wuerfel>
 <53076F00.7000001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <53076F00.7000001-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 21.02.2014 16:21, Tomasz Figa wrote:
> On 21.02.2014 15:48, Arnd Bergmann wrote:
>> On Friday 21 February 2014 14:18:49 Tomasz Figa wrote:
>>>
>>>> Now that we have a broader agreement on this, I think we can go
>>>> ahead with the
>>>> following steps as an initial approach:
>>>> 1. Have a common machine file for both exynos4 and 5 files,
>>>> mach-exynos-dt.c.
>>>> 2. Introduce a generic compatible string "samsung,exynos".
>>>> 3. Append this to the compatible property list for existing boards.
>>>>
>>>> If this plan looks OK, I can send across patches doing this.
>>>>
>>>
>>> Looks good. I would also merge common.c with this resulting
>>> mach-exynos-dt.c, as it would be the only user of the code there.
>>
>> Sounds good. While the naming is not important, I would just call the
>> file 'exynos.c', in line with some of the other platforms we have.
>> Both the 'mach-' and the '-dt' part of the file name are redundant.
>>
>> Alternatively, you could merge it all into common.c.
>
> exynos.c sounds good to me.

One minor thing. It might be a good idea to base on top of my PM 
consolidation part 2 series, to avoid merge conflicts:

http://thread.gmane.org/gmane.linux.ports.arm.kernel/299340

It should hit Kgene's tree this weekend.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
