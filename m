From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v6 05/17] drm: bridge: analogix/dp: dynamic parse sync_pol
 & interlace & dynamic_range
Date: Mon, 12 Oct 2015 12:09:25 +0800
Message-ID: <561B3275.8000500@rock-chips.com>
References: <1444491357-26095-1-git-send-email-ykk@rock-chips.com> <1444491961-26799-1-git-send-email-ykk@rock-chips.com> <561B00D4.9060302@rock-chips.com> <561B0385.1070704@samsung.com> <561B1E65.1040806@rock-chips.com> <561B2E56.5020102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561B2E56.5020102-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org



On 10/12/2015 11:51 AM, Krzysztof Kozlowski wrote:
> On 12.10.2015 11:43, Yakir Yang wrote:
>> On 10/12/2015 08:49 AM, Krzysztof Kozlowski wrote:
>>> On 12.10.2015 09:37, Yakir Yang wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On 10/10/2015 11:46 PM, Yakir Yang wrote:
>>>>> Both hsync/vsync polarity and interlace mode can be parsed from
>>>>> drm display mode, and dynamic_range and ycbcr_coeff can be judge
>>>>> by the video code.
>>>>>
>>>>> But presumably Exynos still relies on the DT properties, so take
>>>>> good use of mode_fixup() in to achieve the compatibility hacks.
>>>>>
>>>>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>> ---
>>>>> Changes in v6: None
>>>> +    of_property_read_u32(dp_node, "hsync-active-high",
>>>> +                 &video->h_sync_polarity);
>>>> +    of_property_read_u32(dp_node, "vsync-active-high",
>>>> +                 &video->v_sync_polarity);
>>>> +    of_property_read_u32(dp_node, "interlaced",
>>>> +                 &video->interlaced);
>>>> +}
>>>>
>>>>
>>>> Sorry, forget to fix your previous comment here, would
>>>> remember to fix it to v7 version, wish v6 would collect
>>>> more comment/reviewed/ack.  :)
>>> Right.
>>>
>>> You can send a v7 of only this patch.
>>>
>>> In the same time I would prefer not to chain-reply next version of
>>> entire patchset to cover letter of previous version. It confuses me
>>> because v6 appears UNDER v4 so I can't really find v6. I see v4 at the
>>> top of my email list.
>> Okay, I wish this chain-reply would make people easy to find the
>> previous comments, but actually it is little mess now. I would give
>> up this way to send patchset  :)
>>
>>> In the same time the patchset is quite big. Put the latest version (with
>>> this issue above fixed!) on some repo and link it in cover letter.
>> Yeah, it's quite big now, I would like to back the patchset to previous
>> format, like:
>>
>> ---> [PATCH v6 00/17] Cover letter
>>    |----> [PATCH v6 01/17]
>>    |----> [PATCH ......]
>>    |----> [PATCH v6 05/17]
>>       |----> [PATCH v7 05/17]
>>    |----> [PATCH ......]
>>    |----> [PATCH v6 17/17]
>>
>> Is it right, and can resend the v6 to fix this chain-reply issue with
>> RESEND flag ([PATCH RESEND v6 ...]) ?
>>
>> ---> [PATCH RESEND v6 00/17] Cover letter
>>    |----> [PATCH RESEND v6 01/17]
>>    |----> [PATCH ......]
>>    |----> [PATCH RESEND v6 05/17]
>>       |----> [PATCH v7 05/17]
>>    |----> [PATCH ......]
>>    |----> [PATCH RESEND v6 17/17]
>>
> No, don't resend everything. I mean in this case with such big patchset
> if you want to fix one patch just send one email [PATCH v7 05/17]
> chained to proper id (cover letter or v6-05/17). Add a short note that
> this is resend of only one patch from the set.

Oh, understand now, just keep this chain-reply no changes for now.

----> [PATCH v4 00/16] Cover letter
    |----> [PATCH v5 00/17] Covert letter
    |----> [PATCH ......]
    |
    |----> [PATCH v6 00/17] Covert letter
    |----> [PATCH v6 01/17]
    |----> [PATCH ......]
    |----> [PATCH v6 17/17]
    |----> [PATCH v7 05/17]


> Of course you can just wait for some more comments and then send v7 of
> everything.

I would choice to send it now :)

Thanks,
- Yakir

> Best regards,
> Krzysztof
>
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
