From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 10:35:19 +0900
Message-ID: <55DBC657.6060409@samsung.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <CAJKOXPeEm8exg_UG0tDnaEGO40ejBKZ-ok=bKbVrwYvXnDaMdg@mail.gmail.com>
 <55DA8486.1000803@rock-chips.com> <55DA9B72.1030804@samsung.com>
 <55DB1281.9070502@rock-chips.com> <55DBAD90.3040901@samsung.com>
 <55DBC601.5090107@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <55DBC601.5090107@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Rob Herring <robherring2@gmail.com>
Cc: heiko@sntech.de, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, Doug Anderson <dianders@google.com>, Inki Dae <inki.dae@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>M
List-Id: linux-samsung-soc@vger.kernel.org

On 25.08.2015 10:33, Yakir Yang wrote:
> Hi Krzysztof,
>=20
> =E5=9C=A8 2015/8/25 7:49, Krzysztof Kozlowski =E5=86=99=E9=81=93:
>> On 24.08.2015 21:48, Yakir Yang wrote:
>>> Hi Krzysztof,
>>>
>>> =E5=9C=A8 08/24/2015 12:20 PM, Krzysztof Kozlowski =E5=86=99=E9=81=93=
:
>>>> On 24.08.2015 11:42, Yakir Yang wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> =E5=9C=A8 08/23/2015 07:43 PM, Krzysztof Kozlowski =E5=86=99=E9=81=
=93:
>>>>>> 2015-08-24 8:23 GMT+09:00 Rob Herring <robherring2@gmail.com>:
>>>>>>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com=
>
>>>>>>> wrote:
>>>>>>>> Analogix dp driver is split from exynos dp driver, so we just
>>>>>>>> make an copy of exynos_dp.txt, and then simplify exynos_dp.txt
>>>>>>>>
>>>>>>>> Beside update some exynos dtsi file with the latest change
>>>>>>>> according to the devicetree binding documents.
>>>>>>> You can't just change the exynos bindings and break
>>>>>>> compatibility. Is
>>>>>>> there some agreement with exynos folks to do this?
>>>>>> No, there is no agreement. This wasn't even sent to Exynos
>>>>>> maintainers.
>>>>> Sorry about this one, actually I have add Exynos maintainers in
>>>>> version
>>>>> 1 & version 2,
>>>>> but lose some maintainers in version 3, I would fix it in bellow
>>>>> versions.
>>>>>
>>>>>> Additionally the patchset did not look interesting to me because=
 of
>>>>>> misleading subject - Documentation instead of "ARM: dts:".
>>>>>>
>>>>>> Yakir, please:
>>>>>> 1. Provide backward compatibility. Mark old properties as deprec=
ated
>>>>>> but still support them.
>>>>> Do you mean that I should keep the old properties declare in
>>>>> exynos-dp.txt,
>>>>> but just mark them as deprecated flag.
>>>> That is one of ways how to do this. However more important is that
>>>> driver should still support old bindings so such code:
>>>> -       if (of_property_read_u32(dp_node, "samsung,color-space",
>>>> +       if (of_property_read_u32(dp_node, "analogix,color-space",
>>>>
>>>> is probably wrong. Will the driver support old DTB in the same way
>>>> as it
>>>> was supporting before the change?
>>> Okay, I got your means. So document is not the focus, the most impo=
rtant
>>> is that
>>> driver should support the old dts prop.
>> Right, the focus is on the driver.
>>
>>> If so the new analogix dp driver
>>> should keep
>>> the "samsung,color-space", rather then just mark it with [DEPRECATE=
D]
>>> flag.
>> If you are replacing a binding/property then it should be marked
>> deprecated. This means that the old property is still working but ne=
w
>> users of it should not be added.
>=20
> Okay, so just quote Heiko's reply, such code would be need in analogi=
x
> dp driver.
>=20
>        if (of_property_read_u32(dp_node, "analogix,color-space",
>                                  &dp_video_config->color_space))
>            if (of_property_read_u32(dp_node, "samsung,color-space",
>                                      &dp_video_config->color_space)) =
{
>=20
>                     dev_err(dev, "failed to get color-space\n");
>                     return ERR_PTR(-EINVAL);
>             }

Yes. It does not look pretty but something like this is needed.

Best regards,
Krzysztof
