From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND 7/8] ASoC: samsung: s3c24xx_uda134x:
 debug/error trace cleanup
Date: Fri, 5 Aug 2016 11:45:25 +0100
Message-ID: <20160805104525.GQ10383@sirena.org.uk>
References: <1470390429-30902-1-git-send-email-s.nawrocki@samsung.com>
 <20160805100343.GO10383@sirena.org.uk>
 <3fcce0ec-0cbc-20f0-adc2-30ea53f83106@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7909652670458868577=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <3fcce0ec-0cbc-20f0-adc2-30ea53f83106@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============7909652670458868577==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/DkgDsqJFFamjKX0"
Content-Disposition: inline


--/DkgDsqJFFamjKX0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 05, 2016 at 12:20:58PM +0200, Sylwester Nawrocki wrote:

> > I've only got patch 7 here, what's the story with the other patches?

> I didn't resend them since I got notification they are already applied
> (1/8...6/8). Should I resend all patches as in this branch:
> https://git.linuxtv.org/snawrocki/samsung.git/log/?h=for-v4.9/asoc/s3c24xx_uda134x

No, don't resend already applied patches!  If you are posting a patch
series the patch series needs to be internally consistent.  The fact
that a patch may at some point have been included in some other series
is not relevant later.  The point with numbering things in a series is
so people can tell what order the series is in, it means nothing outside
of that.

--/DkgDsqJFFamjKX0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXpG5EAAoJECTWi3JdVIfQXR8H/iscu1OZoNLs1rrTrdcs8g+s
8+ueuTdVf85/IJsdu6hmDtHJEEJu5x98HU68ITn/L8B7/MiY/lzgX7KXgj6APyoF
9iyTs7pk3f4SKf8lT4ertRhFCsqY9fsx3spoP8os51tZdSOUILf0xZRHdj5MOqPE
OTYurHfg8GvI8bIZtSASZfcXuRmEB3AQkvXiOXCrulsUVduBKO8mrYJHOADOZ/U4
AoMMzYYi460yWmOjeuXEtbDrFxnT4k4hc8f1cNCUxC9/L0h+B3bnPtPjw1EdRKpw
VZDmoTTUelYT0gaLsS1yR8vfW+XRs1hdrbemRl5vEFwBFukVClmQYa81k6g7gLU=
=yQB/
-----END PGP SIGNATURE-----

--/DkgDsqJFFamjKX0--

--===============7909652670458868577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7909652670458868577==--
