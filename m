From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 17:41:19 +0800
Message-ID: <55DC383F.4000103@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <20150824125758.GA7557@n2100.arm.linux.org.uk>
 <CAL_JsqKZYMMzV9Sc2r3K_rnM0FNuyb1TyJEhjGq1Hf7dTiWFKQ@mail.gmail.com>
 <20150825091246.GA14034@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.133]:37183 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751087AbbHYJla (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 05:41:30 -0400
In-Reply-To: <20150825091246.GA14034@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>, Rob Herring <robherring2@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@

Hi Thierry,

=E5=9C=A8 2015/8/25 17:12, Thierry Reding =E5=86=99=E9=81=93:
> On Mon, Aug 24, 2015 at 09:48:27AM -0500, Rob Herring wrote:
>> On Mon, Aug 24, 2015 at 7:57 AM, Russell King - ARM Linux
>> <linux@arm.linux.org.uk> wrote:
>>> On Sun, Aug 23, 2015 at 06:23:14PM -0500, Rob Herring wrote:
>>>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com> w=
rote:
>>>>> +       -analogix,color-depth:
>>>>> +               number of bits per colour component.
>>>>> +                       COLOR_6 =3D 0, COLOR_8 =3D 1, COLOR_10 =3D=
 2, COLOR_12 =3D 3
>>>> This seems pretty generic. Just use 6, 8, 10, or 12 for values. An=
d
>>>> drop the vendor prefix.
>>> Please think about this some more.  What does "color-depth" mean?  =
Does it
>>> mean the number of bits per colour _component_, or does it mean the=
 total
>>> number of bits to represent a particular colour.  It's confusing as=
 it
>>> stands.
>> Then "component-color-bpp" perhaps?
> There should be no need to have this in DT at all. The BPC is a prope=
rty
> of the attached panel and it should come from the panel (either the
> panel driver or parsed from EDID if available).

Actually I have send an email about this one to you in version 2, just=20
past from that email:

"samsung,color_space" and "samsung,color-depth"

The drm_display_info's color_formats and bpc indicate the monitor=20
display ability, but
the edp driver could not take it as input video format directly.

=46or example, with my DP TV I would found "RGB444 & YCRCB422 & & YCRCB=
444"
support in drm_display_info.color_formats and 16bit bpc support, but=20
RK3288 crtc
driver could only output RGB & ITU formats, so finally=20
analogix_dp-rockchip driver
config crtc to RGBaaa 10bpc mode.

In this sutiation, the analogix_dp core driver would pazzled by the=20
drm_display_info,
can't chose the right color_space and bpc.

And this is the place that confused me, wish you could give some ideas=20
about this one :-)

- Yakir
>>> When we adopted the graph bindings for iMX DRM, I thought exactly a=
t that
>>> time "it would be nice if this could become the standard for bindin=
g DRM
>>> components together" but I don't have the authority from either the=
 DT
>>> perspective or the DRM perspective to mandate that.  Neither does a=
nyone
>>> else.  That's the _real_ problem here.
>>>
>>> I've seen several DRM bindings go by which don't use the of-graph s=
tuff,
>>> which means that they'll never be compatible with generic component=
s
>>> which do use the of-graph stuff.
>> It goes beyond bindings IMO. The use of the component framework or n=
ot
>> has been at the whim of driver writers as well. It is either used or
>> private APIs are created. I'm using components and my need for it
>> boils down to passing the struct drm_device pointer to the encoder.
>> Other components like panels and bridges have different ways to atta=
ch
>> to the DRM driver.
> I certainly support unification, but it needs to be reasonable. There
> are cases where a different structure for the binding work better tha=
n
> another and I think this always needs to be evaluated on a case by ca=
se
> basis.
>
> Because of that I think it makes sense to make all these framework bi=
ts
> opt-in, otherwise we could easily end up in a situation where drivers
> have to be rearchitected (or even DT bindings altered!) in order to b=
e
> able to reuse code.
>
> Thierry
