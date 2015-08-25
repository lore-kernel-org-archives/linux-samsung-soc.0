From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 09:21:51 +0800
Message-ID: <55DBC32F.4040607@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <20150824125758.GA7557@n2100.arm.linux.org.uk>
 <CAL_JsqKZYMMzV9Sc2r3K_rnM0FNuyb1TyJEhjGq1Hf7dTiWFKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKZYMMzV9Sc2r3K_rnM0FNuyb1TyJEhjGq1Hf7dTiWFKQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradea
List-Id: linux-samsung-soc@vger.kernel.org



=E5=9C=A8 2015/8/24 22:48, Rob Herring =E5=86=99=E9=81=93:
> On Mon, Aug 24, 2015 at 7:57 AM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
>> On Sun, Aug 23, 2015 at 06:23:14PM -0500, Rob Herring wrote:
>>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com> wr=
ote:
>>>> +       -analogix,color-depth:
>>>> +               number of bits per colour component.
>>>> +                       COLOR_6 =3D 0, COLOR_8 =3D 1, COLOR_10 =3D=
 2, COLOR_12 =3D 3
>>> This seems pretty generic. Just use 6, 8, 10, or 12 for values. And
>>> drop the vendor prefix.
>> Please think about this some more.  What does "color-depth" mean?  D=
oes it
>> mean the number of bits per colour _component_, or does it mean the =
total
>> number of bits to represent a particular colour.  It's confusing as =
it
>> stands.
> Then "component-color-bpp" perhaps?

Actually this "color-bpp" should come from crtc driver, maybe should=20
come from
"struct drm_crtc {".

Like rockchip stuffs, analogix_dp-rockchip call an mode_config from=20
rockchip_drm_vop
driver and set output mode to RGB[10:10:10], then vop driver just store=
=20
the output mode
type to the private struct "vop->connecot_out_mode". do think that this=
=20
outmode should
store into crtc, not just come from DT prop.

- Yakir
