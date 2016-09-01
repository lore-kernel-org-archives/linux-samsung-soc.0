From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: dts: exynos: Remove skeleton.dtsi usage and fix
 memory node DTC warnings
Date: Thu, 1 Sep 2016 10:35:15 +0200
Message-ID: <21e643af-bff7-2563-0254-d2b6e4a9a385@osg.samsung.com>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
 <5366f8a4-b4fb-ec2d-eb1e-5534f24c4a07@kernel.org>
 <0da13ae1-90a8-912b-227e-0e94439953d5@osg.samsung.com>
 <12377780.GCreFUiXAa@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <12377780.GCreFUiXAa@amdc1976>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Bartlomiej,

On 08/31/2016 07:40 PM, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On Wednesday, August 31, 2016 03:45:24 PM Javier Martinez Canillas wrote:
>> Hello Krzysztof,
>>
>> On 08/31/2016 02:55 PM, Krzysztof Kozlowski wrote:
>>> On 08/31/2016 02:14 PM, Javier Martinez Canillas wrote:
>>>> Hello Krzysztof,
>>>>
>>>> This series removes the usage of the skeleton.dtsi in all the Exynos dts,
>>>> which allows to get rid of the DTC warnings about a mismatch between the
>>>> memory nodes' unit names and reg properties.
>>>>
>>>> Patches are pretty trivial and shouldn't cause functional changes AFAIK,
>>>> but only the Exynos5 changes have been tested. The others patches were
>>>> just built tested.
>>>
>>> I think this is a common problem, not only Exynos-specific, so I would
>>
>> That's correct.
>>
>>> prefer to stick to common pattern. Either all DTS/DTSI include skeleton
>>> or none of them.
>>>
>>
>> The idea is to get rid of skeleton.dtsi [0], but that will of course take
>> time until the dtsi is removed from all the files. So this patch is a step
>> in the right direction so at least Exynos is not a blocker to remove it.
> 
> Krzysztof's point is valid.  If you are going to convert all DTS/DTSI
> then it is okay to apply Exynos specific changes, otherwise the code
> should stay as it is currently.
> 
> Exynos won't be a blocker since we have your patches now and they can
> be applied when/if needed ;)..
>

Sorry but I disagree. I see no reasons to need this to be an atomic, rather
than incremental change. Deprecated things are usually handled by removing
the usage and once there are no users, finally removing them.

Also, each subsystem maintainer should carry the patches for their platform
so it can't be a kernel wide change anyways and most likely split by kernel
releases.
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
