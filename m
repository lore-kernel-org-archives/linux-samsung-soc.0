From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v6 00/10] ARM: dts: exynos: Prepare Spring
Date: Sat, 02 Aug 2014 12:25:08 +0200
Message-ID: <53DCBC84.8080600@suse.de>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de>	<53DC4E41.4050200@collabora.co.uk> <CAD=FV=V_vXZLMaTMFdgr62=zRXucZA6D3PvS0Mb40he0ShHTfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36721 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751533AbaHBKZR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 06:25:17 -0400
In-Reply-To: <CAD=FV=V_vXZLMaTMFdgr62=zRXucZA6D3PvS0Mb40he0ShHTfA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Hi,

Am 02.08.2014 06:57, schrieb Doug Anderson:
> On Fri, Aug 1, 2014 at 7:34 PM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
>> On 08/02/2014 02:52 AM, Andreas F=C3=A4rber wrote:
>>>
>>> Based on the preinstalled 3.8 based ChromeOS kernel and previous 3.=
15
>>> based attempts by Stephan and me that broke for 3.16, I've prepared=
 a
>>> device tree for the HP Chromebook 11 aka Google Spring.
>>>
>>> v6 renames a node and reverts dp_hpd.
>>>
>>> Not yet enabled are trackpad, Wifi and sound.
>>
>> I made a comment on patch 05/10 but the rest of the series looks goo=
d to me. So
>> for the remaining patches:
>>
>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.=
uk>
>>
>> NOTE: I thought that Tomasz Figa gave you his Reviewed-by on v5 for =
the whole
>> series as well but I didn't see his tag on the v6 patches.
>=20
> Yes, I thought that too.  I assume he's OK with the small changes you
> made between v5 and v6.  In the very least his Reviewed-by could be
> present on the patches that didn't change between the last two revs.

I did add it to the bootargs, GPIO, USB3503 patches. All other patches
were either split off or slightly changed due to dp_hpd[_gpio], so I
didn't carry it over.

> Given Javier's review and Tomasz's review and Vincent's comments, I'l=
l
> probably skip all the work of reviewing the rest of the series unless
> someone really wants me to.  ;)

Could you maybe give an Rb or Ab for the actual Spring patch to have th=
e
Cc: updated? :)

Note that if there's some problem that can't be resolved by selectively
dropping patches, I won't be available next week, so you'll either have
to provide fixups for Kukjin to squash or wait till I've returned.

One thing I've wondered is whether we should put status =3D "disabled" =
on
the dp node with some comment, since it's known not to work as is (but
better having the data here than leaving it out, I believe).

Of course if either of you has input on the discussions on the drm
bridge/panel series V6 [1] for how to enable non-simplefb display and
iommus, that would be valuable.

[1] http://www.spinics.net/lists/linux-samsung-soc/msg35274.html


And when one thing is accomplished, I am always quick to look forward:

I've taken a quick look at sound nodes: According to 3.8 DT, Spring use=
s
max98089 whereas Snow has 98091, so different codec driver and still
lacking DT binding support. I might look into trivially enabling
sound/soc/codecs/max98089.c through a "maxim,max98089" OF match table
once this series lands in linux-next. As for the driver, can we reuse
http://git.kernel.org/cgit/linux/kernel/git/broonie/sound.git/tree/soun=
d/soc/samsung/snow.c?h=3Dfor-next
with a "google,spring-audio-max98089", or are code changes needed?

Both of you mentioned limitations of cros_ec i2c passthrough leading to
a forked tps65090 driver downstream - I don't think I can be of help
there, as I guess simply copying a driver will not be an option. ;)
https://code.google.com/p/chromium/issues/detail?id=3D391797

=46or the touchpad it seems DT support has landed in the input tree as
"atmel,maxtouch". Backporting just that patch does not make it work
though. (Tried the rejected pinctrl approach to be on the safe side.)
https://code.google.com/p/chromium/issues/detail?id=3D371114
https://patchwork.kernel.org/patch/3976801/

I thought the internal xhci would have the webcam on it, but I don't se=
e
it in lsusb. Does that need some pinctrl or tps65090 regulator? Once
appearing on a bus, which driver config option will it need?

Many thanks for your support,

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
