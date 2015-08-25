From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for analogix_dp
Date: Tue, 25 Aug 2015 08:27:10 -0500
Message-ID: <CAL_Jsq++RLZo4gvEUTKO8MfEPwSqT2R+bqG22Jsgb2qLgDQFpw@mail.gmail.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com> <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <20150825091534.GB14034@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:33033 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754619AbbHYN1a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 09:27:30 -0400
In-Reply-To: <20150825091534.GB14034@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Yakir Yang <ykk@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@kernel>

On Tue, Aug 25, 2015 at 4:15 AM, Thierry Reding <treding@nvidia.com> wrote:
> On Sun, Aug 23, 2015 at 06:23:14PM -0500, Rob Herring wrote:
>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> [...]
>> > +       -analogix,link-rate:
>> > +               max link rate supported by the eDP controller.
>> > +                       LINK_RATE_1_62GBPS = 0x6, LINK_RATE_2_70GBPS = 0x0A,
>> > +                       LINK_RATE_5_40GBPS = 0x14
>>
>> Same here. I'd rather see something like "link-rate-mbps" and use the
>> actual rate.
>
> There is no need whatsoever to hard-code this in DT. (e)DP provides the
> means to detect what rate the link supports and the specification
> provides guidance on how to select an appropriate one.

Good, even better.

Rob
