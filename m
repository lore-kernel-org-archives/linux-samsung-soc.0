From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PULL] drm-exynos-next 2014-12-22
Date: Mon, 22 Dec 2014 11:04:18 -0200
Message-ID: <20141222130418.GJ16419@joana>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:54992 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753978AbaLVNEX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Dec 2014 08:04:23 -0500
Received: by mail-yk0-f169.google.com with SMTP id 79so2228302ykr.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2014 05:04:22 -0800 (PST)
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Here goes a bunch of clean up for the exynos driver. I've posted this work =
in
the mailing list twice but never got a review on it, first time was about a
month ago. This work is the first building block for the atomic modesetting=
 on
exynos.

In the pull request we have:
=20
- removal of struct exynos_drm_overlay and struct exynos_drm_manager.=20
exynos_drm_overlay was merged with exynos_drm_plane and exynos_drm_manager
with exynos_drm_crtc removing two extra and unnecessary abstractions levels=
=20
=66rom the exynos code. It also makes understanding of the code easier since
now we talk using known names like CRTC and Planes instead of manager and=
=20
overlay.

- removal of DPMS operations from places where it is not need, e.g., updati=
ng=20
planes.

- unification of plane update on exynos_update_plane(). Now all pieces of c=
ode
that wants to update a plane should be using this function.

There are also some smalls fixes and clean ups.
=20
	Gustavo=20
=20
---=20
The following changes since commit 4e0cd68115620bc3236ff4e58e4c073948629b41:

  drm: sti: fix module compilation issue (2014-12-15 17:07:57 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/padovan/drm-exynos-next.git=
 master

for you to fetch changes up to 31dd160f42138fff62a7c9ba71cd0f47b678fe4d:

  drm/exynos: create exynos_check_plane() (2014-12-19 15:41:05 -0200)

----------------------------------------------------------------
Gustavo Padovan (21):
      drm/exynos: move to_exynos_crtc() macro to main header
      drm/exynos: expose struct exynos_drm_crtc
      drm/exynos: remove exynos_drm_crtc_plane_* wrappers
      drm/exynos: remove struct exynos_drm_overlay
      drm/exynos/fimd: don't initialize 'ret' variable in fimd_probe()
      drm/exynos/vidi: remove useless ops->commit()
      drm/exynos: Don't touch DPMS when updating overlay planes
      drm/exynos: don't do any DPMS operation while updating planes
      drm/exynos: remove exynos_plane_commit() wrapper
      drm/exynos: unify plane update on exynos_update_plane()
      drm/exynos: call exynos_update_plane() directly on page flips
      drm/exynos: remove exynos_drm_crtc_mode_set_commit()
      drm/exynos: rename base object of struct exynos_drm_crtc to 'base'
      drm/exynos: add pipe param to exynos_drm_crtc_create()
      drm/exynos: remove pipe member of struct exynos_drm_manager
      drm/exynos: move 'type' from manager to crtc struct
      drm/exynos: remove drm_dev from struct exynos_drm_manager
      drm/exynos: remove struct exynos_drm_manager
      drm/exynos: don't duplicate drm_display_mode in fimd context
      drm/exynos: remove mode_set() ops from exynos_crtc
      drm/exynos: create exynos_check_plane()

 drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 185 +++++++++++++++++---------=
-----------------------------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h  |   8 ++-
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  83 +++++++++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 181 +++++++++++++++++++++++++-=
---------------------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 138 +++++++++++++++++++++-----=
---------------
 drivers/gpu/drm/exynos/exynos_drm_plane.h |  17 +++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c  | 135 +++++++++++++++++---------=
--------------
 drivers/gpu/drm/exynos/exynos_mixer.c     | 159 +++++++++++++++++++++++---=
---------------------
 8 files changed, 412 insertions(+), 494 deletions(-)


--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUmBbSAAoJEPs3PUX4s20orUEQAIAJ6XzeYwLM6UGCnjt4B3eR
v4gYZru1EJ3mwXhxTh6mQqSGZChbxMJ7LjI1Pcm05iuf/B1PSnBPWz03IdTBJAt+
3puYsFLdR0Ei8lqNsj16CPLxHwJSxd7l1hy6ezRlY7lPc+gwIRXnXL+6tM0y0lMP
kudxVhAy7qn99v3Fs+KyGim7Qf0Yfl4beS8Tz1Q+T35b+ydXAAi/BzmZHpshfx9w
08a0WlXIXK86sB1scg2JZ/NDO+N+XWHlnlBXYVVti4I2fzfPy3Fv1D22Jl/l/9Qp
3n47cRhMEJbk4WFVrPbS8csul6FKuF5O8rZPGzh5z+6r/GSCNEBR8iBDl6ACdClv
2Vck6Wo6reKAlF1FpaoStqrsgWOahIS8ouHHFQ+3DJrTtCp/Dn7QJr0NCRX1dWR4
V5OcpjW8xSJe8cy8BOxbMyACyX9KLSp79OUnBL/TqxAOPOfdoN0L1EjOMTalir09
U1J336gmpXnPdXBnqq9u88rfwR7FKUobzq+irVOgRzbsXGpbespxzOq5+UasV4SY
qSEtigzfcV0+27nKbmLbnzc2yGcsP/OgyB7sKNkafrlX+knUd/wQujyhsLCEsBxs
MQtbnvFaZLdRtL7hkhCZ8DNt4V9q6xXxGDHrFCN1TWnmdnR4o7VMr/cnW4JT06Hz
lDnI8EUyoOZJ2nNiX4vx
=FApH
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
