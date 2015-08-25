From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 22:02:25 +0800
Message-ID: <55DC7571.6000204@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <20150824125758.GA7557@n2100.arm.linux.org.uk>
 <CAL_JsqKZYMMzV9Sc2r3K_rnM0FNuyb1TyJEhjGq1Hf7dTiWFKQ@mail.gmail.com>
 <20150825091246.GA14034@ulmo.nvidia.com> <55DC383F.4000103@rock-chips.com>
 <20150825100628.GD14034@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.139]:52221 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755172AbbHYOCj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 10:02:39 -0400
In-Reply-To: <20150825100628.GD14034@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Rob Herring <robherring2@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>Rob Herring <ro>

Hi Thierry,

=E5=9C=A8 2015/8/25 18:06, Thierry Reding =E5=86=99=E9=81=93:
> On Tue, Aug 25, 2015 at 05:41:19PM +0800, Yakir Yang wrote:
>> Hi Thierry,
>>
>> =E5=9C=A8 2015/8/25 17:12, Thierry Reding =E5=86=99=E9=81=93:
>>> On Mon, Aug 24, 2015 at 09:48:27AM -0500, Rob Herring wrote:
>>>> On Mon, Aug 24, 2015 at 7:57 AM, Russell King - ARM Linux
>>>> <linux@arm.linux.org.uk> wrote:
>>>>> On Sun, Aug 23, 2015 at 06:23:14PM -0500, Rob Herring wrote:
>>>>>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com>=
 wrote:
>>>>>>> +       -analogix,color-depth:
>>>>>>> +               number of bits per colour component.
>>>>>>> +                       COLOR_6 =3D 0, COLOR_8 =3D 1, COLOR_10 =
=3D 2, COLOR_12 =3D 3
>>>>>> This seems pretty generic. Just use 6, 8, 10, or 12 for values. =
And
>>>>>> drop the vendor prefix.
>>>>> Please think about this some more.  What does "color-depth" mean?=
  Does it
>>>>> mean the number of bits per colour _component_, or does it mean t=
he total
>>>>> number of bits to represent a particular colour.  It's confusing =
as it
>>>>> stands.
>>>> Then "component-color-bpp" perhaps?
>>> There should be no need to have this in DT at all. The BPC is a pro=
perty
>>> of the attached panel and it should come from the panel (either the
>>> panel driver or parsed from EDID if available).
>> Actually I have send an email about this one to you in version 2, ju=
st past
>> from that email:
>>
>> "samsung,color_space" and "samsung,color-depth"
>>
>> The drm_display_info's color_formats and bpc indicate the monitor di=
splay
>> ability, but
>> the edp driver could not take it as input video format directly.
>>
>> For example, with my DP TV I would found "RGB444 & YCRCB422 & & YCRC=
B444"
>> support in drm_display_info.color_formats and 16bit bpc support, but=
 RK3288
>> crtc
>> driver could only output RGB & ITU formats, so finally analogix_dp-r=
ockchip
>> driver
>> config crtc to RGBaaa 10bpc mode.
>>
>> In this sutiation, the analogix_dp core driver would pazzled by the
>> drm_display_info,
>> can't chose the right color_space and bpc.
>>
>> And this is the place that confused me, wish you could give some ide=
as about
>> this one :-)
> Your display driver should choose whatever it is capable of outputtin=
g.
> If the display reports that it can do 16 bits-per-color, but your
> display driver can't do it, then it should choose a configuration tha=
t
> it supports. Similarily for the color encodings. If you can't generat=
e
> YCrCb444 with your hardware, then it's the driver's job to know about
> that and select the next appropriate configuration.
>
> But hard-coding this is not the right solution because the value in D=
T
> may end up conflicting with what the display reports.

Yeah, thanks for your explain, you are right. It's the best way to get=20
"color-depth"
and "color-space" from display driver, not to hard-code in DT prop.

But if the common analogix-dp driver want to get those values, then=20
those values
should come from the common drm struct data. Personally I think "struct=
=20
drm_crtc"
is the best place that should indicate the output ability of SoC vop/lc=
dc.

But I haven't find out there are some place to store those message for=20
now (I don't
think it's good to modify the original color-space and color-bpc which=20
parsed from
monitor edid).

So could you share sme ideas about this, and I would rather to talk wit=
h=20
Mark (Author
of rockchip drm driver) to find out the better way to fix this one.

Besides, I would appreciate very much if you can share some ideas about=
=20
how Exynos
handler with this problem ;)

Thanks,
- Yakir
> Thierry
