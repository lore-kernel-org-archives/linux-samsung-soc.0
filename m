From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 22:23:24 +0800
Message-ID: <55DC7A5C.1010108@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <20150825091534.GB14034@ulmo.nvidia.com>
 <CAL_Jsq++RLZo4gvEUTKO8MfEPwSqT2R+bqG22Jsgb2qLgDQFpw@mail.gmail.com>
 <55DC7211.9080601@rock-chips.com> <20150825141642.GA3820@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150825141642.GA3820@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Rob Herring <robherring2@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@k>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thierry,

=E5=9C=A8 2015/8/25 22:16, Thierry Reding =E5=86=99=E9=81=93:
> On Tue, Aug 25, 2015 at 09:48:01PM +0800, Yakir Yang wrote:
>> Hi Thierry & Rob,
>>
>> =E5=9C=A8 2015/8/25 21:27, Rob Herring =E5=86=99=E9=81=93:
>>> On Tue, Aug 25, 2015 at 4:15 AM, Thierry Reding <treding@nvidia.com=
> wrote:
>>>> On Sun, Aug 23, 2015 at 06:23:14PM -0500, Rob Herring wrote:
>>>>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com> =
wrote:
>>>> [...]
>>>>>> +       -analogix,link-rate:
>>>>>> +               max link rate supported by the eDP controller.
>>>>>> +                       LINK_RATE_1_62GBPS =3D 0x6, LINK_RATE_2_=
70GBPS =3D 0x0A,
>>>>>> +                       LINK_RATE_5_40GBPS =3D 0x14
>>>>> Same here. I'd rather see something like "link-rate-mbps" and use=
 the
>>>>> actual rate.
>>>> There is no need whatsoever to hard-code this in DT. (e)DP provide=
s the
>>>> means to detect what rate the link supports and the specification
>>>> provides guidance on how to select an appropriate one.
>>> Good, even better.
>> I do think we still need keep this DT prop yet.
>>
>> I think drm_dp_help.c could get the "panel" max link-rate and lane-c=
ount,
>> but it's not enough, we still need knew the "eDP controller" max lin=
k-rate
>> and lane-count.
>>
>> Let me show the exact example that happened in my side. When I conne=
ct
>> my board to my 2K DP-1.2 TV. Analogix dp driver would get the max li=
nk-rate
>> from dpcd, and the max link-rate is 5.4Gbps. So if I just set eDP co=
ntroller
>> link-rate
>> to 5.4Gbps, the DP TV just broken, do not light up normally.
>>
>> This reason why TV broken is the max link-rate which support by RK32=
88 eDP
>> controller is 2.7Gbps. Here are the exact words that RK3288 eDP TRM =
said:
>>
>> *=EF=81=AC=EF=80=A0Compliant with DisplayPortTM Specification, Versi=
on 1.2.
>> =EF=81=AC=EF=80=A0Compliant with eDPTM Specification, Version 1.3.
>> =EF=81=AC=EF=80=A0HDCP v1.3 amendment for DisplayPortTM Revision 1.0=
=2E
>> =EF=81=AC=EF=80=A0Main link containing 4 physical lanes of 2.7/1.62 =
Gbps/lane
>> *
>> **
>>
>>
>> Beside I haven't found there are some registers would indicate the e=
DP
>> controller
>> max link-rate and lane-count, so this is why I still instance that w=
e need
>> this DT
>> prop to indicata "Max rate controller support".
>>
>> So, I wish you could agree with me on this point.
> Your driver should know what link rates it supports and restrict itse=
lf
> to use those. This is implied by the compatible string and doesn't ne=
ed
> to be duplicated into device tree.

Oh, yeah, good idea   :-D
Thanks for your point out.

- Yakir

> Thierry
