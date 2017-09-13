From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 4/6] [media] exynos-gsc: Add hardware rotation limits
Date: Wed, 13 Sep 2017 11:11:23 +0200
Message-ID: <a915a1f7-2c01-472b-b9ee-5367c488a89f@samsung.com>
References: <1504850560-27950-1-git-send-email-hoegeun.kwon@samsung.com>
        <CGME20170908060309epcas1p3d48dd0871d3fde02ba3c9921bbe5a7a6@epcas1p3.samsung.com>
        <1504850560-27950-5-git-send-email-hoegeun.kwon@samsung.com>
        <27b46679-e6c7-2471-f10e-3f0634178ebf@samsung.com>
        <bb025fcb-e316-dfe9-a8eb-8a9535f35b93@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <bb025fcb-e316-dfe9-a8eb-8a9535f35b93-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Hoegeun,

On 09/13/2017 04:33 AM, Hoegeun Kwon wrote:
>>> @@ -1017,8 +1083,12 @@ static irqreturn_t gsc_irq_handler(int irq,
>>> void *priv)
>>>      static const struct of_device_id exynos_gsc_match[] = {
>>>        {
>>> -        .compatible = "samsung,exynos5-gsc",
>>> -        .data = &gsc_v_100_drvdata,
>> Can you keep the "samsung,exynos5-gsc" entry with the gsc_v_5250_variant
>> data, so that it can work with "samsung,exynos5-gsc" compatible in DT
>> on both exynos5250 and exynos5420 SoCs?
>>
> Thank you for your question.
> 
> Exynos 5250 and 5420 have different hardware rotation limits.
> Exynos 5250 is '.real_rot_en_w/h = 2016' and 5420 is '.real_rot_en_w/h =
> 2048'.
> 
> So my opinion they must have different compatible.

I think there is some misunderstanding, mu suggestion was to keep the 
"samsung,exynos5-gsc" compatible entry in addition to the new introduced 
ones: "samsung,exynos5250-gsc" and "samsung,exynos5420-gsc". That's in
order to make your changes possibly backward compatible, in theory 
the updated driver should still work without changes in dts.

-- 
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
