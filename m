From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v10 00/17] drm/exynos: atomic modesetting support
Date: Tue, 16 Jun 2015 17:35:49 -0300
Message-ID: <20150616203549.GA1598@joana>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
 <557E6C19.7070103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f44.google.com ([209.85.192.44]:32910 "EHLO
	mail-qg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755518AbbFPUfz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Jun 2015 16:35:55 -0400
Received: by qged89 with SMTP id d89so9109014qge.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jun 2015 13:35:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <557E6C19.7070103@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

HI Inki,

2015-06-15 Inki Dae <inki.dae@samsung.com>:

> Hi Gustavo,
>=20
> On 2015=EB=85=84 06=EC=9B=94 02=EC=9D=BC 00:04, Gustavo Padovan wrote=
:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >=20
> > Hi,
> >=20
> > Here goes the full support for atomic modesetting on exynos. I've
> > split the patches in the various phases of atomic support.
> >=20
> > v2: fixes comments by Joonyoung
> >         - remove unused var in patch 09
> >         - use ->disable instead of outdated ->dpms in hdmi code
> >         - remove WARN_ON from crtc enable/disable
> >=20
> > v3: fixes comment by Joonyoung
> >         - move the removal of drm_helper_disable_unused_functions()=
 to
> >         separated patch
> >=20
> > v4: add patches that remove unnecessary calls to disable_plane()
> >=20
> > v5: fixes NULL CRTC crash on planes updates (reported by Inki and T=
obias)
> >=20
> > v6: rebase on latest exynos_drm_next
> >=20
> > v7: fix comments by Joonyoung
> >         - fix two checkpatch errors
> >         - remove extra crtc->commit() call
> >         - check for null fb on exynos_check_plane()
> >=20
> > v8: fix comments by Joonyoung
> >         - fix merge error
> >         - move drm_crtc_vblank_get to the commit that introduces at=
omic pageflip
> >         - remove .prepare() in the apropiated patch
> >         - add a new patch to move exynos_drm_crtc_disable()
> >=20
> > v9:  * fix comments by Joonyoung
> >         - also remove encoder .prepare()
> >         - do not shift exynos_update_plane() parameters
> >         - remove unused .mode_set() and .mode_set_base()
> >      * add specific exynos .atomic_commit()
> >      * add split of exynos_crtc->ops->dpms() into enable() and disa=
ble()
> >      * add other atomic clean ups
> >=20
> > v10: * fix comments by Joonyoung
> > 	- add more comments on exynos_atomic_commit()
> > 	- make exynos_crtc's .enable and .disable void
>=20
> I found out one issue that refresh rate gets low with display extensi=
on
> mode test.
>=20
> I tested it with two crtc drivers - vidi and fimd on Trats2 board. He=
re
> is how to test it,
>=20
> #echo 1 > /sys/devices/platform/exynos-drm-vidi/connection
> # modetest -M exynos -v -s 31@29:720x1280 -s 23@21:640x480
> setting mode 720x1280-60Hz@XR24 on connectors 31, crtc 29
> setting mode 640x480-75Hz@XR24 on connectors 23, crtc 21
> freq: 20.00Hz
> freq: 20.00Hz
>=20
> As you can see, refresh rate is 20.
>=20
> Below is the result without atomic patch series,
> # modetest -M exynos -v -s 31@29:720x1280 -s 23@21:640x480
> setting mode 720x1280-60Hz@XR24 on connectors 31, crtc 29
> setting mode 640x480-75Hz@XR24 on connectors 23, crtc 21
> freq: 60.18Hz
> freq: 49.09Hz
>=20
> I can see 60Hz for FIMD and 49Hz for vidi.

I gave this a try and figured out that this might be a vidi specific
problem. If I try VIDI and FIMD I get the same results as you but with
Mixer and FIMD(the setup I actually use to test) everything works fine.
So somehow my patches caused a regression on vidi that I'm still
ivestigating.

	Gustavo
