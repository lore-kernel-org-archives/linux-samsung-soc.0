From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: drm: exynos: mixer: fix using usleep() in atomic context
Date: Wed, 17 Dec 2014 08:54:36 +0100
Message-ID: <20141217075433.GA2814@ulmo>
References: <1417307725-5975-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1417307725-5975-2-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20141201155447.GE11943@ulmo.nvidia.com>
 <7454d0630d95195d41c3906637e223af@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:33793 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751602AbaLQHyj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Dec 2014 02:54:39 -0500
Received: by mail-wg0-f43.google.com with SMTP id l18so19591602wgh.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Dec 2014 23:54:38 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <7454d0630d95195d41c3906637e223af@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, dri-devel@lists.freedesktop.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2014 at 05:16:17PM +0100, Tobias Jakobi wrote:
> On 2014-12-01 16:54, Thierry Reding wrote:
> >On Sun, Nov 30, 2014 at 01:35:25AM +0100, tjakobi@math.uni-bielefeld.de
> >wrote:
> >>From: Tomasz Stanislawski <t.stanislaws@samsung.com>
> >>
> >>This patch fixes calling usleep_range() after taking reg_slock
> >>using spin_lock_irqsave(). The mdelay() is used instead.
> >>Waiting in atomic context is not the best idea in general.
> >>Hopefully, waiting occurs only when Video Processor fails
> >>to reset correctly.
> >>
> >>Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> >>---
> >> drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c
> >>b/drivers/gpu/drm/exynos/exynos_mixer.c
> >>index a41c84e..cc7cccc 100644
> >>--- a/drivers/gpu/drm/exynos/exynos_mixer.c
> >>+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> >>@@ -632,7 +632,7 @@ static void vp_win_reset(struct mixer_context *ctx)
> >> 		/* waiting until VP_SRESET_PROCESSING is 0 */
> >> 		if (~vp_reg_read(res, VP_SRESET) & VP_SRESET_PROCESSING)
> >> 			break;
> >>-		usleep_range(10000, 12000);
> >>+		mdelay(10);
> >> 	}
> >> 	WARN(tries =3D=3D 0, "failed to reset Video Processor\n");
> >> }
> >
> >I can't see a reason why you would need to hold the lock around this
> >code. Perhaps a better way to fix this would be to drop the lock before
> >calling vp_win_reset()?
> >
> >Thierry
>=20
> Hmm, I'm pretty new to spinlocks (only have worked with the usual mutex
> stuff in userspace), but wouldn't that mean that it is then possible for
> mixer_win_reset to execute while a (previous) vp_win_reset is still runni=
ng?

Indeed it would. I didn't look properly. Looking more closely it seems
the call stack for this looks something like:

	vp_win_reset()
	mixer_win_reset()
	mixer_poweron()
	mixer_dpms()
	exynos_drm_crtc_dpms()

Which can then be called from two places:

	exynos_drm_crtc_commit()
	drm_crtc_helper_set_mode()
	drm_crtc_helper_set_config()

	drm_helper_connector_dpms()
	drm_crtc_helper_set_config()

drm_crtc_helper_set_config() itself must be called with the all modeset
locks held, so I don't see a way how vp_win_reset() could be called
concurrently.

Anyway, even if you're still concerned about concurrent accesses to the
register you'd better lock this section with a mutex to avoid excessive
spinning. In fact I think a better option would be to extend the mutex
in mixer_poweron() to encompass the whole function. This currently looks
broken because one process could go to sleep in pm_runtime_get_sync() or
clk_prepare_enable() and another process start running mixer_poweron()
concurrently, getting to the second mutex_lock() sooner than the first
process. So the lock being dropped between checking for ctx->powered and
setting it doesn't actually prevent a race.

Then again, nobody seems to have cared so far...

Thierry

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUkTa5AAoJEN0jrNd/PrOhmuoP+QG6HoYQ2JvvavBMgEZRnVM5
M4fwU986KLkYzQkQ+EhR+qIIaCzntwr6kFb9EV0OdS2N3NssS4FYVGa7Bf6wEEWT
r2Vqm5KIObcFi5XpBIkCdB0hjjMO/rKbQjwUNgZdIm2dWpuMJ6d7nDTEqlu0Jlft
nUDMkZguVYkIGEYK1YEEkawjIDfs5b0B1L969runvncMHg/PN8uIviqDmURqnu+N
+NJh0X+I2/fMW4c+Z7sZjqakU00ID8aQ/douXVBkl8I3zq4Hi7w/Pn1ec6mhPbix
rgqaFMRQxWaAI0cM8cKeg/kd8CtaTFz1+AC55TTkaFika1afgEQqZcHFPLy/oC4H
gXnmmpF8H6Ukj6aypEMyNwZROiV+WyhB92F26bsiMH9nUavhvm6A3U86xtxHOs63
60PpkLLMVd4k1k3caYJoEu/psYAN/0LOq+kOUvKxXUKWMjyLG/U8OpencQ+z0Okr
ki9BBtf3Ur66hg3PtWHm+E1r5ZiPZmKVll2EHHb2/at/Mocv+mdQzgphQUXy22nL
WYZiy1KX2K5L4V80hcBHs2Vl7FY8Gbz0HhCebsPbi47Yo35S/2V1JAKGDDl5oBes
ZiI5YXaPg6nPuxdOpgONaMYJb89F+WRKQkb0avPpLT/TLl/DezmOan7FHSzQEOq6
wtbQ6AvkPV4UaGkSJIav
=qy0k
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
