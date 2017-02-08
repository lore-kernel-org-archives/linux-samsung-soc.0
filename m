From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64: dts: exynos: Move the clock-frequency property
Date: Wed, 8 Feb 2017 12:29:06 +0200
Message-ID: <CAJKOXPeq2fXfM9PvOu7TsxhjHpZpH-sNYP_QuxwLzhfMjuD79g@mail.gmail.com>
References: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170206021951epcas1p365db9f08f22cc223ca45538b0dbc86d6@epcas1p3.samsung.com>
 <1486347584-6762-3-git-send-email-hoegeun.kwon@samsung.com>
 <20170207201335.lyc7yvwed7cm25nj@kozik-lap> <8c4f2a21-152d-eb41-3f26-44bb69f831c7@samsung.com>
 <CAJKOXPe9Bjpobw1chuhG3vdt6sWZ69AcQbqYD9rRoMRyO1-cMA@mail.gmail.com> <dceb0f53-9737-744b-db44-b2105e13816d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dceb0f53-9737-744b-db44-b2105e13816d-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Feb 8, 2017 at 12:09 PM, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On 02/08/2017 04:32 PM, Krzysztof Kozlowski wrote:
>>
>> On Wed, Feb 8, 2017 at 9:24 AM, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> wrote:
>>>>
>>>> "Remove the ports node abd move burst and esc clock frequency properties
>>>> to the parent (DSI node)."
>>>>
>>>> The information which is missing is the answer for WHY? Why are you
>>>> doing this?
>>>
>>>
>>> The current mipi-dsi must have at least one OF graph.
>>> However, for example, dsi and panel are parent-child relationships,
>>> so OF graph is not needed, and fimd and dsi are not connected to the OF
>>> graph.
>>> In this case, an error occurred in dsi_parse in the code before patch
>>> (1/5).
>>
>> The error occurred in case of DSI + FIMD? I do not get it whether you
>> are removing the something which is not needed or fixing something.
>>
>>> So I modified dsi_parse_dt.
>>>
>>>> Does the patch depends on 1/5?
>>>
>>>
>>> Yes, it is.
>>> The 2/5 to 5/5 patches depend on the 1/5 patch.
>>
>> So that's a break of DT ABI for no clear (yet) reasons. Please mention
>> this in 1/5 patch and explain what is really fixed.
>
>
> I would like to post the s6e63j0x03 panel driver for exynos3250.
> However, as Rob Herring noted, dsi + panel is a parental relationship,
> so OF grpah is not needed.
> Therefore, the current dsi_parse_dt function will throw an error,
> because there is no linked OF graph for case such as fimd + dsi + panel.
> I think that the OF graph of dsi should be deleted even if it is not
> the purpose of the s6e63j0x03 panel driver.
>
> So the 1/5 patch parse the Pll, burst and esc clock frequency properties
> in dsi_parse_dt and modified to create a bridge_node only if there is
> an OF graph associated with dsi.
>

Thanks, now it makes sense. Such clear explanation should be part of
commit 1/5 as a proof that ABI breakage is needed.

BR,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
