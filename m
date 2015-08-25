From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 09:37:13 +0800
Message-ID: <55DBC6C9.8030705@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <55DA9B72.1030804@samsung.com> <55DB1281.9070502@rock-chips.com>
 <18468783.Lfl8UEMQ1s@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.131]:38192 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754177AbbHYBh7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 21:37:59 -0400
In-Reply-To: <18468783.Lfl8UEMQ1s@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robherring2@gmail.com>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, Doug Anderson <dianders@google.com>, Inki Dae <inki.dae@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kern

Hi Heiko,

=E5=9C=A8 2015/8/24 21:03, Heiko Stuebner =E5=86=99=E9=81=93:
> Hi Yakir,
>
> Am Montag, 24. August 2015, 20:48:01 schrieb Yakir Yang:
>> =E5=9C=A8 08/24/2015 12:20 PM, Krzysztof Kozlowski =E5=86=99=E9=81=93=
:
>>> On 24.08.2015 11:42, Yakir Yang wrote:
>>>> Hi Krzysztof,
>>>>
>>>> =E5=9C=A8 08/23/2015 07:43 PM, Krzysztof Kozlowski =E5=86=99=E9=81=
=93:
>>>>> 2015-08-24 8:23 GMT+09:00 Rob Herring <robherring2@gmail.com>:
>>>>>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com>=
 wrote:
>>>>>>> Analogix dp driver is split from exynos dp driver, so we just
>>>>>>> make an copy of exynos_dp.txt, and then simplify exynos_dp.txt
>>>>>>>
>>>>>>> Beside update some exynos dtsi file with the latest change
>>>>>>> according to the devicetree binding documents.
>>>>>> You can't just change the exynos bindings and break compatibilit=
y. Is
>>>>>> there some agreement with exynos folks to do this?
>>>>> No, there is no agreement. This wasn't even sent to Exynos mainta=
iners.
>>>> Sorry about this one, actually I have add Exynos maintainers in ve=
rsion
>>>> 1 & version 2,
>>>> but lose some maintainers in version 3, I would fix it in bellow
>>>> versions.
>>>>
>>>>> Additionally the patchset did not look interesting to me because =
of
>>>>> misleading subject - Documentation instead of "ARM: dts:".
>>>>>
>>>>> Yakir, please:
>>>>> 1. Provide backward compatibility. Mark old properties as depreca=
ted
>>>>> but still support them.
>>>> Do you mean that I should keep the old properties declare in
>>>> exynos-dp.txt,
>>>> but just mark them as deprecated flag.
>>> That is one of ways how to do this. However more important is that
>>> driver should still support old bindings so such code:
>>> -       if (of_property_read_u32(dp_node, "samsung,color-space",
>>> +       if (of_property_read_u32(dp_node, "analogix,color-space",
>>>
>>> is probably wrong. Will the driver support old DTB in the same way =
as it
>>> was supporting before the change?
>> Okay, I got your means. So document is not the focus, the most impor=
tant
>> is that
>> driver should support the old dts prop. If so the new analogix dp dr=
iver
>> should keep
>> the "samsung,color-space", rather then just mark it with [DEPRECATED=
] flag.
>>
>> But from your follow suggest, I think you agree to update driver cod=
e,
>> and just mark
>> old prop with deprecated flag. If so I think such code would not be =
wrong
>>
>> -       if (of_property_read_u32(dp_node, "samsung,color-space",
>> +      if (of_property_read_u32(dp_node, "analogix,color-space",
> In a generic driver, the property should have either none, or the ana=
logix
> prefix. But DT-properties need to be backwards compatible, meaning an=
 older
> Exynos devicetree should run unmodified with a newer kernel.
>
> So the common course of action is to mark the old one as deprecated b=
ut still
> test for both, so something like:
>
>         if (of_property_read_u32(dp_node, "analogix,color-space",
>                                   &dp_video_config->color_space))
> 	       if (of_property_read_u32(dp_node, "samsung,color-space",
>                  	                 &dp_video_config->color_space)) {
>
>                  	dev_err(dev, "failed to get color-space\n");
>                  	return ERR_PTR(-EINVAL);
>          	}
>

Wow, thanks a lot for your explain and code, it do help me to understan=
d
this suggest rightly  :-)

Thanks,
- Yakir

>
>
>
>
>
