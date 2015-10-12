From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v6 05/17] drm: bridge: analogix/dp: dynamic parse sync_pol
 & interlace & dynamic_range
Date: Mon, 12 Oct 2015 10:43:49 +0800
Message-ID: <561B1E65.1040806@rock-chips.com>
References: <1444491357-26095-1-git-send-email-ykk@rock-chips.com> <1444491961-26799-1-git-send-email-ykk@rock-chips.com> <561B00D4.9060302@rock-chips.com> <561B0385.1070704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:57062 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752722AbbJLCo0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Oct 2015 22:44:26 -0400
In-Reply-To: <561B0385.1070704@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Rob Herring <robh+dt@kernel.org>, joe@perches.com, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org



On 10/12/2015 08:49 AM, Krzysztof Kozlowski wrote:
> On 12.10.2015 09:37, Yakir Yang wrote:
>> Hi Krzysztof,
>>
>> On 10/10/2015 11:46 PM, Yakir Yang wrote:
>>> Both hsync/vsync polarity and interlace mode can be parsed from
>>> drm display mode, and dynamic_range and ycbcr_coeff can be judge
>>> by the video code.
>>>
>>> But presumably Exynos still relies on the DT properties, so take
>>> good use of mode_fixup() in to achieve the compatibility hacks.
>>>
>>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>>> ---
>>> Changes in v6: None
>> +    of_property_read_u32(dp_node, "hsync-active-high",
>> +                 &video->h_sync_polarity);
>> +    of_property_read_u32(dp_node, "vsync-active-high",
>> +                 &video->v_sync_polarity);
>> +    of_property_read_u32(dp_node, "interlaced",
>> +                 &video->interlaced);
>> +}
>>
>>
>> Sorry, forget to fix your previous comment here, would
>> remember to fix it to v7 version, wish v6 would collect
>> more comment/reviewed/ack.  :)
> Right.
>
> You can send a v7 of only this patch.
>
> In the same time I would prefer not to chain-reply next version of
> entire patchset to cover letter of previous version. It confuses me
> because v6 appears UNDER v4 so I can't really find v6. I see v4 at the
> top of my email list.

Okay, I wish this chain-reply would make people easy to find the
previous comments, but actually it is little mess now. I would give
up this way to send patchset  :)

> In the same time the patchset is quite big. Put the latest version (with
> this issue above fixed!) on some repo and link it in cover letter.

Yeah, it's quite big now, I would like to back the patchset to previous
format, like:

---> [PATCH v6 00/17] Cover letter
   |----> [PATCH v6 01/17]
   |----> [PATCH ......]
   |----> [PATCH v6 05/17]
      |----> [PATCH v7 05/17]
   |----> [PATCH ......]
   |----> [PATCH v6 17/17]

Is it right, and can resend the v6 to fix this chain-reply issue with
RESEND flag ([PATCH RESEND v6 ...]) ?

---> [PATCH RESEND v6 00/17] Cover letter
   |----> [PATCH RESEND v6 01/17]
   |----> [PATCH ......]
   |----> [PATCH RESEND v6 05/17]
      |----> [PATCH v7 05/17]
   |----> [PATCH ......]
   |----> [PATCH RESEND v6 17/17]


Thanks :-)
- Yakir

>
> Best regards,
> Krzysztof
>
>> Best regards,
>> - Yakir
>>
>>> Changes in v5:
>>> - Switch video timing type to "u32", so driver could use
>>> "of_property_read_u32"
>>>     to get the backword timing values. Krzysztof suggest me that driver
>>> could use
>>>     the "of_property_read_bool" to get backword timing values, but that
>>> interfacs
>>>     would modify the original drm_display_mode timing directly (whether
>>> those
>>>     properties exists or not).
>>>
>>> Changes in v4:
>>> - Provide backword compatibility with samsung. (Krzysztof)
>>>
>>> Changes in v3:
>>> - Dynamic parse video timing info from struct drm_display_mode and
>>>     struct drm_display_info. (Thierry)
>>>
>>> Changes in v2: None
>
>
>
