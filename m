From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v6 00/10] ARM: dts: exynos: Prepare Spring
Date: Sat, 02 Aug 2014 18:05:15 +0200
Message-ID: <53DD0C3B.1000506@suse.de>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de>	<53DC4E41.4050200@collabora.co.uk> <CAD=FV=V_vXZLMaTMFdgr62=zRXucZA6D3PvS0Mb40he0ShHTfA@mail.gmail.com> <53DCBC84.8080600@suse.de> <53DCE40F.10809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39654 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754547AbaHBQFV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 12:05:21 -0400
In-Reply-To: <53DCE40F.10809@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Am 02.08.2014 15:13, schrieb Tomasz Figa:
> On 02.08.2014 12:25, Andreas F=C3=A4rber wrote:
>> One thing I've wondered is whether we should put status =3D "disable=
d" on
>> the dp node with some comment, since it's known not to work as is (b=
ut
>> better having the data here than leaving it out, I believe).
>=20
> Does the DP node itself need more data to work or just some external
> things are missing? If the former then probably status =3D "disabled"
> should be set, otherwise "okay" is fine if provided data are enough t=
o
> probe the Exynos DP driver.

Support for ps8622 eDP/LVDS bridge has not yet landed in the drm tree.

The latest patch series V6 adds a "bridge" property to /dp-controller.
It further requires a simple-panel node and a node for the ps8622:

http://www.spinics.net/lists/linux-samsung-soc/msg35089.html

>> Of course if either of you has input on the discussions on the drm
>> bridge/panel series V6 [1] for how to enable non-simplefb display an=
d
>> iommus, that would be valuable.
>=20
> Support for Exynos IOMMU is being worked on right now and patches add=
ing
> DT support from Marek Szyprowski should show up on the lists in very
> near future.

Okay, good to hear.

> However I think you don't strictly need IOMMU to get
> non-simplefb display, as CMA can be used to allocate contiguous memor=
y.

I do have CMA enabled, but it wasn't working without iommu patches
either. Machine booted, and display had backlight but stayed black.

CONFIG_CMA=3Dy
# CONFIG_CMA_DEBUG is not set
CONFIG_DMA_CMA=3Dy
CONFIG_CMA_SIZE_MBYTES=3D64
CONFIG_CMA_SIZE_SEL_MBYTES=3Dy
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=3D8
CONFIG_CMA_AREAS=3D7

Ajay has reported the same patches working on his Skate.

Regards,
Andreas

>> [1] http://www.spinics.net/lists/linux-samsung-soc/msg35274.html

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
