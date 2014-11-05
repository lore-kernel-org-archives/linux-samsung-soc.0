From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Add MODULE_DEVICE_TABLE for
	Snow
Date: Wed, 5 Nov 2014 18:44:38 +0000
Message-ID: <20141105184438.GI8509@sirena.org.uk>
References: <1415205892-5553-1-git-send-email-afaerber@suse.de>
 <20141105170957.GE8509@sirena.org.uk> <545A683A.9010301@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7744786725278573915=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <545A683A.9010301@suse.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============7744786725278573915==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a7XSrSxqzVsaECgU"
Content-Disposition: inline


--a7XSrSxqzVsaECgU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2014 at 07:11:06PM +0100, Andreas F=E4rber wrote:
> Am 05.11.2014 um 18:09 schrieb Mark Brown:
> > On Wed, Nov 05, 2014 at 05:44:52PM +0100, Andreas F=E4rber wrote:
> >> This enables the snd_soc_snow module to be auto-loaded.

> > Applied, thanks.

> Thanks. I notice you dropped my Fixes: line that SubmittingPatches asks
> for. When do I need it and when should I leave it out? I thought it
> tells GregKH more precisely which stable branches are affected for
> backports than just a CC.

It's not really adding anything if it's just identifying the patch that
created the file in the first place and what actually happened here is
that I applied it without the tag then later went back and decided to
add a stable Cc since it was probably worth that.

--a7XSrSxqzVsaECgU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUWnAVAAoJECTWi3JdVIfQzDcH/iyWEAs3xvkRXU8qDtNuEgPr
kay9p+HJ/dRc20hw7bqjxnjCzEefu0kgLMjzSwqIX7QcUiTn9XmqoNfkEEz+DvLO
lGgpPai53oHZPSjSwC0AQmYeTnZzDw8xJJW64K4CbKj+8pTSK3rUyToCyGh962C+
kJE5iRqIUaiVmzutEw5oIcQYNbXOQ6rKltb8VDK1SF/YKfum7wPkBmmktB7SkfPZ
3qaFq0PEsn2SbzYFqaJU7r4HhPp8WsO+l91PWnole2Gc6t40t1vgEHQikip6T8RW
TGr5JsCXcRgKMRbv+UXvAU67BKQ/dDSX4kHFybzEy2XwYf9L3iJHDz0vOwPJRhY=
=xYy6
-----END PGP SIGNATURE-----

--a7XSrSxqzVsaECgU--

--===============7744786725278573915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7744786725278573915==--
