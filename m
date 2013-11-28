From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Thu, 28 Nov 2013 11:53:51 +0000
Message-ID: <20131128115351.GC27568@sirena.org.uk>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
 <1384264120-24750-2-git-send-email-broonie@kernel.org>
 <CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
 <20131126102311.GW14725@sirena.org.uk>
 <CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
 <20131126122031.GA14725@sirena.org.uk>
 <CAAgF-Bc5mEmOBFZak2rSuCqs+xjcrNqnVNZc=zno8F3VOCuuwA@mail.gmail.com>
 <20131127150534.GW14725@sirena.org.uk>
 <CAAgF-BcoKDt=u51tqiWyxveb4iJSXKuV49X1VmOsWiRsSGKKpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3445045470172597962=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAAgF-BcoKDt=u51tqiWyxveb4iJSXKuV49X1VmOsWiRsSGKKpg@mail.gmail.com>
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


--===============3445045470172597962==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2013 at 03:29:31PM +0530, Padma Venkat wrote:
> On Wed, Nov 27, 2013 at 8:35 PM, Mark Brown <broonie@kernel.org> wrote:

> > But if it's initialised at probe time then when is it getting
> > overwritten?  This must be something triggered by DT which unfortunately
> > I can't test.  It's a bit of a shame that the flows are different
> > between the DT and non-DT cases.

> it's getting overwritten in i2s_hw_params which is happening after
> dma_data got initialized in dai probe. Based on mono or stereo channel
> this value getting initialized to 2 or 4 respectively in
> i2s_hw_params. This value is not triggered by DT now.

OK, so we can probably just reinitialise the dmaengine data after we
reset it?  Like below

> > Are you sure that dma_size should be 2?  The i2s DAI driver seems to be
> > hard coding it to 4.

> I think for mono files the dma_size should be 2 only. Right now based
> on mono or stereo this value getting overwritten in i2s_hw_params.
> Initially it is hardcoded to 4. Due to this commit "ASoC: samsung:
> Allow mono in i2s driver" which was not there earlier, I got confused.
> Now it seems clear except that underrun message which I am still
> debugging.

Yeah, that's now confusing - I'll send a patch to remove the
initialisation on probe() since it's getting overwritten later.

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 67d9fa91fdb9..ba24a954b9e4 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -702,6 +702,8 @@ static int i2s_hw_params(struct snd_pcm_substream *subs=
tream,
 	}
 	writel(mod, i2s->addr + I2SMOD);
=20
+	samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
+
 	i2s->frmclk =3D params_rate(params);
=20
 	return 0;

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSly7MAAoJELSic+t+oim9+b0QAIJ1DfvT7uvXyF1xnfo+Pl7P
KppMNIEj0V7qr4VYak0M8i1Ed7+9VUvL1C0Lkj+l914cBYVLZD711PnKkrX34h7I
LbAB51PxZfit9qbAtn00NxFniXry/kvCpbi8dwJNFk/bu1d7UX60T/gwaS9DIN+X
/pewriPcPSrpo1LT2QSXnFtgXSeyt39SqRWVlhFajD5qDt9wP9IXmIbJlJGdczg1
IFLkGNc6z8047YPa0uRMaAB4nibyegBn4PCbWCipZrEHKWQGAlbGbddW7s3WyD5V
5MXRMIS8iTDWDN9V8rJTCBZ8do491ucajslJbJ4IuwkEhxU2M1dVXFLDgucZqlSY
5W81pmQgrg1MSVRQSAvI815NIdvB0gggrfXFZKkscDGprzq6Ye6Hdw5kdufgZRmr
z8/PHM4r+7Al9kSilJpX0t9PEWdasd/WI1sM6XDdy9QSM3pDt7ZWOaiZTX4ZSIjp
UtuYkqtEMFW5Wi5pVhNj12S1YsuGkqtD4Lj08rbMgrHS3F9C8FI4/E2ePnRIC3bp
mWNUt670thLH7v6swFPtzLQMw6UR+ycDlI1HhSyQnc5NqUxzUVCnDggwSk5vlGgG
vYrsxMVrXlAO5szUbKpManfVqVjQgXfgFrg1j+pGksQSW1Gvsf2owG3cEOlcW/0M
epqXzPalWV7c6KbdUioE
=bwgJ
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--

--===============3445045470172597962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3445045470172597962==--
