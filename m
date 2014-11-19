From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm: dts: Exynos5: Use pmu_system_controller
 phandle for dp phy
Date: Wed, 19 Nov 2014 17:33:56 +0530
Message-ID: <CAFp+6iEnTbXAUUYMU-bP27f4=X0pEtgmURAwKfRrqDQE4tRpKQ@mail.gmail.com>
References: <1414675442-3471-1-git-send-email-gautam.vivek@samsung.com>
	<1414675442-3471-2-git-send-email-gautam.vivek@samsung.com>
	<000101cffe30$155793a0$4006bae0$%han@samsung.com>
	<CABxcv=mams-iVBvACLZ-=Ozcs3KcHSEvxAsRSSV-eKaSnrcXSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABxcv=mams-iVBvACLZ-=Ozcs3KcHSEvxAsRSSV-eKaSnrcXSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sean Paul <seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Javier,


On Wed, Nov 19, 2014 at 5:06 PM, Javier Martinez Canillas
<javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org> wrote:
> [adding Kukjin to cc list]
>
> Hello Vivek,
>
> On Wed, Nov 12, 2014 at 5:21 AM, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> On Thursday, October 30, 2014 10:24 PM, Vivek Gautam wrote:
>>>
>>> DP PHY now require pmu-system-controller to handle PMU register
>>> to control PHY's power isolation. Adding the same to dp-phy
>>> node.
>>>
>>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> Reviewed-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>
> Tested-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

Thanks for testing.

>
> Kukjin,

Sorry for not adding Kukjin to the list and thereby for the delay
about this patch.

>
> This patch is -rc material and is needed to have display working in
> 3.18 again since commit a5ec598 ("phy: exynos-dp-video: Use syscon
> support to control pmu register") landed in 3.18 and broke the Exynos
> Display Port PHY:
>
> exynos-dp-video-phy 10040728.video-phy: Failed to lookup PMU regmap

Yes, we should pick this up and merge it since the driver patch is merged now.



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
