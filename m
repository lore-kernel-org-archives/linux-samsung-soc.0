From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 09:33:53 +0800
Message-ID: <55DBC601.5090107@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <CAJKOXPeEm8exg_UG0tDnaEGO40ejBKZ-ok=bKbVrwYvXnDaMdg@mail.gmail.com>
 <55DA8486.1000803@rock-chips.com> <55DA9B72.1030804@samsung.com>
 <55DB1281.9070502@rock-chips.com> <55DBAD90.3040901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.138]:54226 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751580AbbHYBeP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 21:34:15 -0400
In-Reply-To: <55DBAD90.3040901@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robherring2@gmail.com>
Cc: heiko@sntech.de, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, Doug Anderson <dianders@google.com>, Inki Dae <inki.dae@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>M

Hi Krzysztof,

=E5=9C=A8 2015/8/25 7:49, Krzysztof Kozlowski =E5=86=99=E9=81=93:
> On 24.08.2015 21:48, Yakir Yang wrote:
>> Hi Krzysztof,
>>
>> =E5=9C=A8 08/24/2015 12:20 PM, Krzysztof Kozlowski =E5=86=99=E9=81=93=
:
>>> On 24.08.2015 11:42, Yakir Yang wrote:
>>>> Hi Krzysztof,
>>>>
>>>> =E5=9C=A8 08/23/2015 07:43 PM, Krzysztof Kozlowski =E5=86=99=E9=81=
=93:
>>>>> 2015-08-24 8:23 GMT+09:00 Rob Herring <robherring2@gmail.com>:
>>>>>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com>
>>>>>> wrote:
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
>> driver should support the old dts prop.
> Right, the focus is on the driver.
>
>> If so the new analogix dp driver
>> should keep
>> the "samsung,color-space", rather then just mark it with [DEPRECATED=
] flag.
> If you are replacing a binding/property then it should be marked
> deprecated. This means that the old property is still working but new
> users of it should not be added.

Okay, so just quote Heiko's reply, such code would be need in analogix=20
dp driver.

        if (of_property_read_u32(dp_node, "analogix,color-space",
                                  &dp_video_config->color_space))
	       if (of_property_read_u32(dp_node, "samsung,color-space",
                 	                 &dp_video_config->color_space)) {

                 	dev_err(dev, "failed to get color-space\n");
                 	return ERR_PTR(-EINVAL);
         	}


>> But from your follow suggest, I think you agree to update driver cod=
e,
>> and just mark
>> old prop with deprecated flag. If so I think such code would not be =
wrong
>>
>> -       if (of_property_read_u32(dp_node, "samsung,color-space",
>> +      if (of_property_read_u32(dp_node, "analogix,color-space",
> It looks wrong because it breaks backward compatibility with existing
> DTB. As I said before:
>>>> 1. Provide backward compatibility. Mark old properties
>>>> as deprecated but still support them.
>
>> And actually @Rob have suggest me to remove the prefix, just use
>> "color-space" here.
> For new bindings I don't mind. But please remember about existing use=
rs,
> existing DTB and bisectability.
>
>>>> Let me show same examples, make
>>>> me understand your suggest rightly.
>>> exynos-dp already contains deprecated properties. Other ways of doi=
ng
>>> this would be:
>>> Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>>> Documentation/devicetree/bindings/rtc/s3c-rtc.txt
>>>
>>> It depends up to you. The "touchscreen" looks good because it organ=
izes
>>> old properties in a common section. In case of exynos-dp.txt you ca=
n add
>>> at beginning of file information about new bindings and mark everyt=
hing
>>> deprecated.
>> Whoops, thanks for your remind, I prefer the "touchscreen" style.
>>
>>>> 1. "samsung,ycbcr-coeff" is abandoned in latest analogix-dp driver=
,
>>>> absolutely
>>>>       I should not carry this to analogix-dp.txt document. But I s=
hould
>>>> keep this in
>>>>       exynos-dp.txt document, and mark them with an little
>>>> "deprecated" flag.
>>>>
>>>> [Documentation/devicetree/bindings/video/exynos_dp.txt]
>>>> Required properties for dp-controller:
>>>>      [...]
>>>>       -samsung,ycbcr-coeff (DEPRECATED):
>>>>           YCbCr co-efficients for input video.
>>>>               COLOR_YCBCR601 =3D 0, COLOR_YCBCR709 =3D 1
>>>>
>>>> Is it right ?
>>> Yes, this is right.
>>>
>>>>> 2. Separate all DTS changes to a separate patch, unless bisectabi=
lity
>>>>> would be hurt. Anyway you should prepare it in a such way that
>>>>> separation would be possible without breaking bisectability.
>>>> So I should separate this patch into two parts, one is name "Docum=
ent:",
>>>> the other is "ARM: dts: ".
>>> Yes.
>>>
>>>> Honestly, I don't understand what the "bisectability" means in thi=
s
>>>> case.
>>> I was referring to bisectability in general. The patchset should be
>>> fully bisectable which means that it does not introduce any issues
>>> during "git bisect". This effectively means that at each intermedia=
te
>>> step (after applying each patch, one by one) every existing stuff w=
orks
>>> the same as previously without any regression. Including booting wi=
th
>>> old DTB.
>> Oh, thanks for your careful explain, so I guess your first comment i=
s
>> talking about
>> the "bisectability" that if I only apply the 01 - 05 patches, kernel
>> could not bootup
>> normally, cause driver need "analogix,color-space" but DTB only have
>> "samsung,color-space".
> Right. In the same time please remember that kernel may be booted wit=
h
> old DTB.

Okay, thanks a lot  ;)

- Yakir

> Best regards,
> Krzysztof
>
>
>
