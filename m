From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 17:37:06 +0800
Message-ID: <55DC3742.2070308@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <20150825091534.GB14034@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150825091534.GB14034@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>, Rob Herring <robherring2@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.i
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thierry,

=E5=9C=A8 2015/8/25 17:15, Thierry Reding =E5=86=99=E9=81=93:
> On Sun, Aug 23, 2015 at 06:23:14PM -0500, Rob Herring wrote:
>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com> wro=
te:
> [...]
>>> +       -analogix,link-rate:
>>> +               max link rate supported by the eDP controller.
>>> +                       LINK_RATE_1_62GBPS =3D 0x6, LINK_RATE_2_70G=
BPS =3D 0x0A,
>>> +                       LINK_RATE_5_40GBPS =3D 0x14
>> Same here. I'd rather see something like "link-rate-mbps" and use th=
e
>> actual rate.
> There is no need whatsoever to hard-code this in DT. (e)DP provides t=
he
> means to detect what rate the link supports and the specification
> provides guidance on how to select an appropriate one.

Hmm... could you share more about this :-)

I only find that drm_dp_link_probe() could get the panel link-rate and
num-lanes by reading the DP_DPCD_REV messag.

I don't found there are some guidance to help select the approriate one=
=2E
Beside this DT prop just indicate the max eDP controller link-rate & la=
nes
support, how could eDP detect them automatically?

- Yakir

>>> +       -analogix,lane-count:
>>> +               max number of lanes supported by the eDP contoller.
>>> +                       LANE_COUNT1 =3D 1, LANE_COUNT2 =3D 2, LANE_=
COUNT4 =3D 4
>> And drop the vendor prefix here.
> Same as for the link rate.
>
> Thierry
