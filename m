From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 5/6] ASoC: samsung: Extend Snow driver to support max98089
Date: Sat, 21 Feb 2015 11:40:25 +0900
Message-ID: <20150221024025.GB6236@finisterre.sirena.org.uk>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>
 <1424283959-16289-6-git-send-email-afaerber@suse.de>
 <20150219094425.GB3198@finisterre.sirena.org.uk>
 <CAD=FV=WkieDSSB_-a6DtH1hmq6SyZk4NAR-eXQ11hxUDMTvRfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WkieDSSB_-a6DtH1hmq6SyZk4NAR-eXQ11hxUDMTvRfg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Olof Johansson <olof@lixom.net>
List-Id: linux-samsung-soc@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 19, 2015 at 09:44:08AM -0800, Doug Anderson wrote:
> On Thu, Feb 19, 2015 at 1:44 AM, Mark Brown <broonie@kernel.org> wrote:

> I think what you're suggesting is that here we should add a new
> compatible string "google,snow-audio" instead of adding
> "google,snow-audio-max98089" here.  Then the sound node in the spring
> DTS would look like:

>   compatible = "google,snow-audio-max98089", "google,snow-audio";

Yes.

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU5/AYAAoJECTWi3JdVIfQ2uEH/ji13tl3wMeBeylmEMkTfB0w
PX75Whi9IvG0iu4deHgZY8n1AVWjGff2jRgtL9ESwvudME8WOPC2NJvXeH4XGVdo
zyMvLgyY46T/9fvJjQcYd8ducE6ofsLf+B/AqEw1iCBKkBVbzYnBLetZFGUI+S2m
B2Ib6tjSllapIRmPyO0v0ocYigP0ef/EI3LgYqyvkmDbmuWx0wf684W2Y8lvXimk
8WiTfJ5DABTZYj2LFnXnccfgEKsbomhiTogU7Kvdk4cX47wzJGR2LBjYvWOP+0Dw
POBpON1VZD9uSXjjYOM4ecpyMFMWD/K/bFcea2j9Zccx4YILYlhkSOHIFLwGmjU=
=C0V4
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
