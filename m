From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Wed, 27 Nov 2013 15:05:34 +0000
Message-ID: <20131127150534.GW14725@sirena.org.uk>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
 <1384264120-24750-2-git-send-email-broonie@kernel.org>
 <CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
 <20131126102311.GW14725@sirena.org.uk>
 <CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
 <20131126122031.GA14725@sirena.org.uk>
 <CAAgF-Bc5mEmOBFZak2rSuCqs+xjcrNqnVNZc=zno8F3VOCuuwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3836422542178709929=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAAgF-Bc5mEmOBFZak2rSuCqs+xjcrNqnVNZc=zno8F3VOCuuwA@mail.gmail.com>
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


--===============3836422542178709929==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HRz4dlJa0zmFsB3a"
Content-Disposition: inline


--HRz4dlJa0zmFsB3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2013 at 06:08:47PM +0530, Padma Venkat wrote:
> On Tue, Nov 26, 2013 at 5:50 PM, Mark Brown <broonie@kernel.org> wrote:

> > So this is 16 bit stereo or something, and did it work beforehand?  Like
> > I say I suspect the DMA is ending up being configured with the wrong
> > transfer size, can you check what actually happens there please - what's
> > different about the configuration that the DMA controller gets?  I don't
> > have any Exynos systems with mainline audio support so I can't test
> > anything myself.

> This stream was working before. dma_size in i2s_hw_params not getting
> effected as dma_data is getting initialized only at dai probe time. So
> by default the dma_size is always 4 which is initialized at driver
> probe time. The fifo_size of dai is also always 0. It is not getting
> passed from dai driver. I just hard coded the dma_size to 2 and

But if it's initialised at probe time then when is it getting
overwritten?  This must be something triggered by DT which unfortunately
I can't test.  It's a bit of a shame that the flows are different
between the DT and non-DT cases.

The FIFO size looks like a difference between the pl330 and pl080, it
doesn't seem to matter for pl080.  We just need to set it though.

> fifo_size to 32 then I can hear the audio only on right ear phone.
> Still underrun error message appears.

Are you sure that dma_size should be 2?  The i2s DAI driver seems to be
hard coding it to 4.

--HRz4dlJa0zmFsB3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlgo7AAoJELSic+t+oim9Zx4P/13EyND/WVeCdcaA2K0xUeEc
Eu9QdSHVpHGIOaMqabe6t77GOcdnRAFhr9VVPAeZj/L8lpyMLerhy8rf1uUMicnI
torF+fKs8VMiq3mPVUY/kRi19JryGyLzMWozYPlgg2LtNMZQfeyWw6uyVKnwUed5
p/pJFJvvXZMGg08395fcJVit7//A5Ijhuv8Wd1dcVNcQwJ1IlswYCmp7znW1zpr6
qOy87RU9KeCdxK4SzULKdHxNlg7LNiH2o5tKIRZBYr5REIa8K7whxgXhFe8lbugP
Ps9Xq/QZS+etvSPRtgpa2yiFxZgqbu2roV28rSQkFPpr9LWMYV21YPygP1J6eWCB
K7+rSmAduAYtCx3c1wFZqTllHQJG5EXS+JrVgXC0yYSzBcqjyVwasA+lg3Zyulbr
faDpXLVEyHEFYMfKSRQ4rafTunPVShyZ8h/t8zCelIfEyWDp2KEOXegiBBIG8W7i
tCI5+CShkFdlheQD9bvq3z/aO6yQvhQhUIET/4CMBPlfcFjDrse7CtoyT1+W/kZI
kVCnHTriAO1N+MronT0gxRiUGQ+lqyPbQdyQG1akaZ0IneuWl6tIW9lLvmyxNerZ
6dnwF2RZcSsGcAWsPELMv2q+dKJfNwyjyRP1mvvV8LAv2cJdqLfQ77w3gj/dwP8o
j1Q6aUBdSXaTNNZcK8LM
=DtKw
-----END PGP SIGNATURE-----

--HRz4dlJa0zmFsB3a--

--===============3836422542178709929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3836422542178709929==--
