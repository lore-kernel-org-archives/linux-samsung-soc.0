From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Subject: Re: [PATCH 0/7] drm/exynos: clean ups
Date: Thu, 12 Mar 2015 15:45:43 -0300
Message-ID: <20150312184543.GB1708@joana>
References: <1424352158-728-1-git-send-email-gustavo@padovan.org>
 <5501A5DD.1040707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:47031 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751295AbbCLSpw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Mar 2015 14:45:52 -0400
Content-Disposition: inline
In-Reply-To: <5501A5DD.1040707@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com

2015-03-12 Inki Dae <inki.dae@samsung.com>:

> On 2015=EB=85=84 02=EC=9B=94 19=EC=9D=BC 22:22, Gustavo Padovan wrote=
:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >
> > Hi,
> >
> > Here goes some clean ups to the exynos drivers. The main clean ups =
is
> > the presetting and zpos making the property immutable and the remov=
al
> > of *_win_data structures.
>=20
> With your cleanup patch set, the plane test doesn't work. Have you ev=
er
> tested plane feature with modetest application?
>=20
> I typed like below and it looks like no problem but I cannot see
> anything on Panel except for cute four penguins.
>=20
> # modetest -P 29:100x100+0+0
> trying to open device 'i915'...failed.
> trying to open device 'radeon'...failed.
> trying to open device 'nouveau'...failed.
> trying to open device 'vmwgfx'...failed.
> trying to open device 'omapdrm'...failed.
> trying to open device 'exynos'...success.
> testing 100x100@XR24 overlay plane 25
>=20
> And for two plane test,
>=20
> # modetest -P 29:100x100+0+0 -P 29:100x100+0+100
> trying to open device 'i915'...failed.
> trying to open device 'radeon'...failed.
> trying to open device 'nouveau'...failed.
> trying to open device 'vmwgfx'...failed.
> trying to open device 'omapdrm'...failed.
> trying to open device 'exynos'...success.
> testing 100x100@XR24 overlay plane 25
> testing 100x100@XR24 overlay plane 26
>=20
> Still no screen.

Well, I did some more testing and even without my patches I can't see a=
 plane
on the screen. Running only on exynos-drm-next also doesn't work so it =
is not
something that my patches introduced, it is already a bug upstream.
I'm using a snow for testing.

	Gustavo
