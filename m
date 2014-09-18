From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Remove PCM support for WM8580 on SMDK
Date: Thu, 18 Sep 2014 10:59:32 -0700
Message-ID: <20140918175932.GD7960@sirena.org.uk>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com>
 <53C675E4.4020502@samsung.com> <1409825105.5546.91.camel@x220>
 <201409041802.36466.arnd@arndb.de> <1411036935.2017.30.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1638933185712496618=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411036935.2017.30.camel@x220>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============1638933185712496618==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2cZ01xMxx5MYbKUa"
Content-Disposition: inline


--2cZ01xMxx5MYbKUa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2014 at 12:42:16PM +0200, Paul Bolle wrote:
> On Thu, 2014-09-04 at 18:02 +0200, Arnd Bergmann wrote:

> > I think it would be nice if you could submit a patch to remove the
> > drivers from ASoC, then we can see if anybody complains.

> Also the same thing for v3.17-rc5 and next-20140918. So let's see if we
> can remove this driver too.

> Done on top of next-20140918. Again untested.
> -------->8--------
> From: Paul Bolle <pebolle@tiscali.nl>

Again, please follow the patch submission process in SubmittingPatches.

--2cZ01xMxx5MYbKUa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUGx2DAAoJECTWi3JdVIfQxgkH/2HKuI2DcgnSFgzoOcDbLz2A
RWJ1gjVUGiU/Ljgezk3hUJgMAhSG8DPL+J38RfS38sWiHd6VvZfXV11q9GU3NRuS
CLEl4t2f12iVWW+MXpv1YMCRZrMuRPRQNj4DJQiNLEuUcjhulzXaWPzT+0D62YBS
OlZmieJYLHVMsLd80jLmDLSRKTOifWXkVliJ5dmk7hPRhnh8jJy7lS6ZzlLbhdaE
nW70n+IZz07/LIBCTANmYAHxkdspJr8HY5j1nTaH1rEqd+jI11eBbpxuPkzTTGwf
/GWqoDr/420rhYsV31xjr4uNEXEUXqf3xJ1eRFaFbHNYKX61PTRbZhwuEnEB2lU=
=uRSf
-----END PGP SIGNATURE-----

--2cZ01xMxx5MYbKUa--


--===============1638933185712496618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1638933185712496618==--
