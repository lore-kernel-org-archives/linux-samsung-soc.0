From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v6 00/10] ARM: dts: exynos: Prepare Spring
Date: Sat, 02 Aug 2014 15:13:51 +0200
Message-ID: <53DCE40F.10809@gmail.com>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de>	<53DC4E41.4050200@collabora.co.uk> <CAD=FV=V_vXZLMaTMFdgr62=zRXucZA6D3PvS0Mb40he0ShHTfA@mail.gmail.com> <53DCBC84.8080600@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:58691 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754489AbaHBNN4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 09:13:56 -0400
In-Reply-To: <53DCBC84.8080600@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Tomasz Figa <t.figa@samsung.com>

On 02.08.2014 12:25, Andreas F=C3=A4rber wrote:

[snip]

> One thing I've wondered is whether we should put status =3D "disabled=
" on
> the dp node with some comment, since it's known not to work as is (bu=
t
> better having the data here than leaving it out, I believe).

Does the DP node itself need more data to work or just some external
things are missing? If the former then probably status =3D "disabled"
should be set, otherwise "okay" is fine if provided data are enough to
probe the Exynos DP driver.

>=20
> Of course if either of you has input on the discussions on the drm
> bridge/panel series V6 [1] for how to enable non-simplefb display and
> iommus, that would be valuable.

Support for Exynos IOMMU is being worked on right now and patches addin=
g
DT support from Marek Szyprowski should show up on the lists in very
near future. However I think you don't strictly need IOMMU to get
non-simplefb display, as CMA can be used to allocate contiguous memory.

>=20
> [1] http://www.spinics.net/lists/linux-samsung-soc/msg35274.html
>=20

[snip]

> For the touchpad it seems DT support has landed in the input tree as
> "atmel,maxtouch". Backporting just that patch does not make it work
> though. (Tried the rejected pinctrl approach to be on the safe side.)
> https://code.google.com/p/chromium/issues/detail?id=3D371114
> https://patchwork.kernel.org/patch/3976801/

Looking at what we already have in mainline and the discussion in
Chromium issue tracker, current driver should be already in shape to
handle the Chromebooks. Apparently it even supports recovery from
bootloader mode without the need to parse bootloader address from DT (i=
t
somehow calculates possible addresses from main address).

Best regards,
Tomasz
