From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 08:49:36 +0900
Message-ID: <55DBAD90.3040901@samsung.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <CAJKOXPeEm8exg_UG0tDnaEGO40ejBKZ-ok=bKbVrwYvXnDaMdg@mail.gmail.com>
 <55DA8486.1000803@rock-chips.com> <55DA9B72.1030804@samsung.com>
 <55DB1281.9070502@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56695 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751060AbbHXXtx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 19:49:53 -0400
In-reply-to: <55DB1281.9070502@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Rob Herring <robherring2@gmail.com>
Cc: heiko@sntech.de, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, Doug Anderson <dianders@google.com>, Inki Dae <inki.dae@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>M

On 24.08.2015 21:48, Yakir Yang wrote:
> Hi Krzysztof,
>=20
> =E5=9C=A8 08/24/2015 12:20 PM, Krzysztof Kozlowski =E5=86=99=E9=81=93=
:
>> On 24.08.2015 11:42, Yakir Yang wrote:
>>> Hi Krzysztof,
>>>
>>> =E5=9C=A8 08/23/2015 07:43 PM, Krzysztof Kozlowski =E5=86=99=E9=81=93=
:
>>>> 2015-08-24 8:23 GMT+09:00 Rob Herring <robherring2@gmail.com>:
>>>>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com>
>>>>> wrote:
>>>>>> Analogix dp driver is split from exynos dp driver, so we just
>>>>>> make an copy of exynos_dp.txt, and then simplify exynos_dp.txt
>>>>>>
>>>>>> Beside update some exynos dtsi file with the latest change
>>>>>> according to the devicetree binding documents.
>>>>> You can't just change the exynos bindings and break compatibility=
=2E Is
>>>>> there some agreement with exynos folks to do this?
>>>> No, there is no agreement. This wasn't even sent to Exynos maintai=
ners.
>>> Sorry about this one, actually I have add Exynos maintainers in ver=
sion
>>> 1 & version 2,
>>> but lose some maintainers in version 3, I would fix it in bellow
>>> versions.
>>>
>>>> Additionally the patchset did not look interesting to me because o=
f
>>>> misleading subject - Documentation instead of "ARM: dts:".
>>>>
>>>> Yakir, please:
>>>> 1. Provide backward compatibility. Mark old properties as deprecat=
ed
>>>> but still support them.
>>> Do you mean that I should keep the old properties declare in
>>> exynos-dp.txt,
>>> but just mark them as deprecated flag.
>> That is one of ways how to do this. However more important is that
>> driver should still support old bindings so such code:
>> -       if (of_property_read_u32(dp_node, "samsung,color-space",
>> +       if (of_property_read_u32(dp_node, "analogix,color-space",
>>
>> is probably wrong. Will the driver support old DTB in the same way a=
s it
>> was supporting before the change?
>=20
> Okay, I got your means. So document is not the focus, the most import=
ant
> is that
> driver should support the old dts prop.

Right, the focus is on the driver.

> If so the new analogix dp driver
> should keep
> the "samsung,color-space", rather then just mark it with [DEPRECATED]=
 flag.

If you are replacing a binding/property then it should be marked
deprecated. This means that the old property is still working but new
users of it should not be added.

>=20
> But from your follow suggest, I think you agree to update driver code=
,
> and just mark
> old prop with deprecated flag. If so I think such code would not be w=
rong
>=20
> -       if (of_property_read_u32(dp_node, "samsung,color-space",
> +      if (of_property_read_u32(dp_node, "analogix,color-space",

It looks wrong because it breaks backward compatibility with existing
DTB. As I said before:
>>> 1. Provide backward compatibility. Mark old properties
>>> as deprecated but still support them.


> And actually @Rob have suggest me to remove the prefix, just use
> "color-space" here.

=46or new bindings I don't mind. But please remember about existing use=
rs,
existing DTB and bisectability.

>=20
>>
>>> Let me show same examples, make
>>> me understand your suggest rightly.
>> exynos-dp already contains deprecated properties. Other ways of doin=
g
>> this would be:
>> Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>> Documentation/devicetree/bindings/rtc/s3c-rtc.txt
>>
>> It depends up to you. The "touchscreen" looks good because it organi=
zes
>> old properties in a common section. In case of exynos-dp.txt you can=
 add
>> at beginning of file information about new bindings and mark everyth=
ing
>> deprecated.
>=20
> Whoops, thanks for your remind, I prefer the "touchscreen" style.
>=20
>>> 1. "samsung,ycbcr-coeff" is abandoned in latest analogix-dp driver,
>>> absolutely
>>>      I should not carry this to analogix-dp.txt document. But I sho=
uld
>>> keep this in
>>>      exynos-dp.txt document, and mark them with an little
>>> "deprecated" flag.
>>>
>>> [Documentation/devicetree/bindings/video/exynos_dp.txt]
>>> Required properties for dp-controller:
>>>     [...]
>>>      -samsung,ycbcr-coeff (DEPRECATED):
>>>          YCbCr co-efficients for input video.
>>>              COLOR_YCBCR601 =3D 0, COLOR_YCBCR709 =3D 1
>>>
>>> Is it right ?
>> Yes, this is right.
>>
>>>> 2. Separate all DTS changes to a separate patch, unless bisectabil=
ity
>>>> would be hurt. Anyway you should prepare it in a such way that
>>>> separation would be possible without breaking bisectability.
>>> So I should separate this patch into two parts, one is name "Docume=
nt:",
>>> the other is "ARM: dts: ".
>> Yes.
>>
>>> Honestly, I don't understand what the "bisectability" means in this
>>> case.
>> I was referring to bisectability in general. The patchset should be
>> fully bisectable which means that it does not introduce any issues
>> during "git bisect". This effectively means that at each intermediat=
e
>> step (after applying each patch, one by one) every existing stuff wo=
rks
>> the same as previously without any regression. Including booting wit=
h
>> old DTB.
>=20
> Oh, thanks for your careful explain, so I guess your first comment is
> talking about
> the "bisectability" that if I only apply the 01 - 05 patches, kernel
> could not bootup
> normally, cause driver need "analogix,color-space" but DTB only have
> "samsung,color-space".

Right. In the same time please remember that kernel may be booted with
old DTB.

Best regards,
Krzysztof
