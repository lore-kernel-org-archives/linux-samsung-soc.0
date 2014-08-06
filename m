From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Wed, 06 Aug 2014 16:11:54 +0900
Message-ID: <53E1D53A.9050703@samsung.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
 <53D675D6.2000309@samsung.com> <20140805111223.GA27340@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22847 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753704AbaHFHL5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Aug 2014 03:11:57 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9V00DCLINVHY80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Aug 2014 16:11:55 +0900 (KST)
In-reply-to: <20140805111223.GA27340@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, treding@nvidia.com


Thanks for comments.


On 2014=EB=85=84 08=EC=9B=94 05=EC=9D=BC 20:12, Thierry Reding wrote:
> On Mon, Jul 28, 2014 at 06:09:58PM +0200, Andrzej Hajda wrote:
>> On 07/28/2014 04:00 AM, Inki Dae wrote:
>>> This patch adds below two flags for LPM transfer, and it attaches L=
PM flags
>>> to a msg in accordance with master's mode_flags set by LCD Panel dr=
iver.
>>>
>>> MIPI_DSI_MODE_CMD_LPM
>>> - If this flag is set by Panel driver, MIPI-DSI controller will tra=
nfer
>>> command data to Panel device in Low Power Mode.
>>
>> What do you mean by command data? It could be:
>> - all transfer in command mode of operations,
>> - transfer initialized by the driver by writing to DSIM registers.
>>
>>>
>>> MIPI_DSI_MODE_VIDEO_LPM
>>> - If this flag is set by Panel driver, MIPI-DSI controller will tra=
nfer
>>> image data to Panel device in Low Power Mode.
>>
>> What is the meaning of this flag in case of command mode of operatio=
n?
>>
>> Maybe it would be better to create flags based on source of data/FIF=
Os:
>> - commands send by SFR registers,
>> - commands generated from data sent from Display Controller.
>=20
> I have no idea what SFR is. But it sounds like you're talking about t=
wo
> ways to generate command packets here. We have something similar on
> Tegra, where it's called "host-driven command mode" and "DC-driven
> command mode".
>=20
> In host-driven command mode the driver needs to explicitly program so=
me
> of the DSI controller registers to send command packets. This is
> essentially a FIFO register and a control register to trigger
> transmission and poll for completion.
>=20
> DC-driven command mode is typically used to update contents of a remo=
te
> framebuffer (what MIPI calls "Type 1 Display Architecture"). This is
> done by programming a different set of registers that cause the DSI
> controller to take data output by the display controller and wrap it
> into DCS commands (e.g. write_memory_start and write_memory_continue)=
=2E
>=20

Exynos also supports above two command mode but we have never used
DC-driven command mode.

> I think that low power mode is more often used for command transmissi=
on
> (in host-driven mode). I'm not sure how much sense it really makes to
> transmit video data in low power mode. It also seems like low power m=
ode
> is what all peripherals need to support (if they can do command mode)=
=2E
> Hence I'd like to propose the attached patch that makes all command
> messages use low power mode.

To use low power mode, I think SoC drivers should add more codes:
checking xxx_MSG_LPM, and maybe disabling HS clock. My patch does
exactly that,
http://www.spinics.net/lists/linux-samsung-soc/msg34866.html

And what I and Andrzej don't make sure is non-continuous clock mode. Do
you know how non-continuous clock mode is related to HS clock?

>=20
> The .transfer() function was really designed with initialization
> commands in mind, so it doesn't deal with mixing video data and comma=
nds
> anyway and for initialization low-power mode should be fast enough. T=
he
> downside is that it may not be optimal for some peripherals, but it
> gives us a good solution for the general case since it should support
> all devices.
>=20
> If we absolutely must have faster initialization, or if we come acros=
s a
> device that can only initialize in high speed mode, then I think we
> should introduce a new flag to allow DSI host controllers to optimize=
 in
> those cases.

Originally, mipi-dsi framework enforces implicitly using HS mode for
video and command data as default so I added LPM relevant flags - for
video and also command data
- for host driver can consider Low Power Mode. However, your patch make=
s
it use
Low Power Mode for command data as default. So your patch would mean
that default transfer mode for command data is Low Power Mode, but HS
mode for video data.

Do you intend to control transfer mode - HS or LPM - only for command
data? If so, we would need only one flag, i.e., MIPI_DSI_MODE_HS.

Thanks,
Inki Dae

>=20
> Note that this is based on some of my local patches, so it won't appl=
y
> as-is. But if anybody wants to give this a go it should be easy to ap=
ply
> manually as well.
>=20
> Thierry
>=20
