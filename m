From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: samsung: Provide helper for DMA
 init
Date: Tue, 26 Nov 2013 10:15:02 +0000
Message-ID: <20131126101502.GV14725@sirena.org.uk>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
 <CAAgF-BdUWGun6m2+zxMhUU1_DpZviHg-REnsGvh+bWgpm2NuLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5900015828737594014=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAAgF-BdUWGun6m2+zxMhUU1_DpZviHg-REnsGvh+bWgpm2NuLg@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Padmavathi Venna <padma.v@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linaro-kernel@lists.linaro.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============5900015828737594014==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yV94raM4eJLN8srE"
Content-Disposition: inline


--yV94raM4eJLN8srE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2013 at 10:54:57AM +0530, Padma Venkat wrote:

> > -       snd_soc_dai_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
> > +       samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);

> we have to initialize the dma data for i2s secondary dai also
> otherwise there is a crash in dmaengine_pcm_new during probe.

This should be called when both DAIs are probed...  in any case, if this
is broken presumably the driver is already broken given that this is
just a substitution?  I've no systems capable of actually running audio
with the later DAIs.

--yV94raM4eJLN8srE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlHSjAAoJELSic+t+oim9FEsP/A/c0QoNFecJurNdd57geL6w
tBPAuX6B3niaefpxpMdnuf7FwU59HxXPYR6fydJLko1hN91MyvDppuDW0kbHw2sN
g1QHI/+eN28hBrLwpvpQz08FjlwuWxHHrfytiJdaj/EE9zeEwKXrDpdNTsrxOWWY
FiF8XR4D/BLZdqfLBRoD7oVfxw8nYQ3QucfYgtSv/XsK40KFS2nGk2yJpSa/oGF3
9zj33vGVojPDBJNs3z4FnDCKHefZ9xX2GksuvkDa/NMBMhm4FwjtWIo66WWJ8Fgm
0BCOKLv01RiLWxDjYkzqbOiAwspJloGU98cvDtsFS4h2wmKXrqzhD2qhSeO2wFWd
bOqyKriJDLvU0lrWi0AdhHpjOHTGqwdA7+23RvtYrAaBRyISnmUXQw3xvsWcoGJb
t5iQcuDeeKTVenjKXY5J/HUakH4i0/ezU/iQEq9ONZM/u8s6e9YxwwmguWF9ljho
Rlfp1TS7my58AfavRQEvL3GSe+hK6sCdSKzYh8ZnSkSb+oZbt3hJTK9YtzNMcg1U
KbHthhWuujb0zL3hh0/hVxHBp3slPRERuvJN4NaPLM+y1DVdR5w7SLC3UJRmbLvm
jAwO2uX7Cl8tOMyVC4C2/6RGVuaFboKB1ZLRlCc7E9VOrTM4/bD+M0RCd0Wy4MZ0
B6qb5yTAFleDJlfKzLy4
=VKlc
-----END PGP SIGNATURE-----

--yV94raM4eJLN8srE--

--===============5900015828737594014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============5900015828737594014==--
