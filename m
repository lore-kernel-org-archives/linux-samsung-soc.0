From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 09/18] ASoC: Samsung: Do not queue cyclic
 buffers multiple times
Date: Thu, 29 Aug 2013 17:36:11 +0100
Message-ID: <20130829163611.GL10783@sirena.org.uk>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
 <1376243970-6489-10-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8358694098668859798=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1376243970-6489-10-git-send-email-tomasz.figa@gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, linux-samsung-soc@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Dan Williams <djbw@fb.com>, Russell King <linux@arm.linux.org.uk>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============8358694098668859798==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j8X1oABZtE0u0BVD"
Content-Disposition: inline


--j8X1oABZtE0u0BVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 11, 2013 at 07:59:21PM +0200, Tomasz Figa wrote:
> The legacy S3C-DMA API required every period of a cyclic buffer to be
> queued separately. After conversion of Samsung ASoC to Samsung DMA
> wrappers somebody made an assumption that the same is needed for DMA
> engine API, which is not true.

Applied, thanks.

--j8X1oABZtE0u0BVD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSH3h4AAoJELSic+t+oim91XkP+wVD1IcG19LLuX4SKyqU4rPe
L7wAhoOTTAUcYDeBY7znOAh3HLPfJKrgXGOHab2Y/wXuvvtawRkUMoBN0WtoQagQ
POco7loWmyF8oEbBiB9MVS2DDemwh8xQ3oMkYssF86wJuB4QCowfT6GHTtMhGS7T
s3hc0TKgZphYiHCmwHpsTaRTCokL2YG6edDlFj4ai6CZldxqrUfs6NJDExE+UMth
/Rundd3MKoosN8LVG5rn3DdYq4rmoeaqaLtgQ58b0mWP4Nyue141DqmN8KI+cqz3
wGHtEhdUzeKn/qI73AYZW3q6YOatWtCY/UOwlBPh+xjHw9Vi6VbGEcFz18Ad/n3K
VlPefNWJ1zR44NCNTPC1pvdI9OpO5CnDQ7dp1m2Yu0lH7J6rIqr9TXBYe/Zp21f3
Zg0YHrp4GNYVTyhvD46y7XiMcIpil0AkYzpRI3grrAn7tp+KnYJfLinCOn9q2rPX
kkL41hK5rWoFF4udRtbTXkVWEv0mC6DKVae/FoQfQmaxaQ01m0WoqLNwKYrPn8Vq
Cfph8ZRGP56wQwi7rx4BBS43mVP6mTL+fG9dEOLqhSoUx4OKdQyxL3UBBYhkJHnt
uvDY7WYo3rQ38vdonL6+jIyAd0z+BosNYUz/3bk5OTXh6doR0TxWbtkcjnghFDTf
jZC542NjvCkrNgTH6Z0v
=4cig
-----END PGP SIGNATURE-----

--j8X1oABZtE0u0BVD--

--===============8358694098668859798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8358694098668859798==--
