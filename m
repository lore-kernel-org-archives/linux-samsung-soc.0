From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 10/18] spi: s3c64xx: Do not require legacy
 DMA API in case of S3C64XX
Date: Tue, 13 Aug 2013 13:02:03 +0100
Message-ID: <20130813120203.GW6427@sirena.org.uk>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
 <1376243970-6489-11-git-send-email-tomasz.figa@gmail.com>
 <20130812233641.GL6427@sirena.org.uk> <2472314.6b8DcBdcjO@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1711056094833517217=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <2472314.6b8DcBdcjO@flatron>
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <djbw@fb.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============1711056094833517217==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xQA5JmyoyfznAa64"
Content-Disposition: inline


--xQA5JmyoyfznAa64
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2013 at 01:49:53AM +0200, Tomasz Figa wrote:

> I've been testing this without any significant patches, like PWM, CCF or=
=20
> DT support, just everything from the branch I pointed to and some board-
> specific patches to help in debugging.

I retested with the SPI patches you sent separately yesterday which
didn't make a difference for the SPI issue.

> Anyway, this is the exact branch I've been using:

> git://github.com/tom3q/linux.git v3.12-pl080-devel

I can't test this directly as it has the DAPM bugs I fixed yesterday
in it (those patches will hit -next tomorrow), however it does look like
there's nothing else relevant in there...

--xQA5JmyoyfznAa64
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCiA4AAoJELSic+t+oim9ep0QAJWIMmIJR3Y9j/6Ui7SEUO2Z
WEf3zdq+jDqLw/rUkHYhCKKTxokUsDpuDwuFmc/oc9sMLIU3g7bXrEu1PTTu06HY
5Gm4aIJ05E9170oS+JsMwuBBAUoIh30v9M2/B3yglACIkHB2QRJB+gPVsWIF4EfU
xOvDBZ8oOiSAZ4JPichgaUf9IPOtuCic12IFR1Cr68SGNyKr3QvxOBjpvubXe+C8
yqVOXt6nlABHX8yzzwlqeAGztOmdWMiGpm3WFHM9DkK1PvJl15C4uSrBgBGs5Ptw
3j4f0qxEl6FDKiSlQ1BIg9HdFcpT+FQ8n60CB2MO78J25zAOeuWj9NGKArLAmdPS
AGkxAx/e/jASGTuk21Jo3PJfiF0g2dvw9HVdVi75TcT1erWW+gewgqqC6Hqzm4qL
f25qupR6d6OSHnpzGaBb11wayQjxX7W3IlS3IfddYAxNrSU6fM/+bjVcCgoKrYJ6
4A75fVv4XpRKY/zOVMjDFO77nZTWPh5Op2S7Ue9V/x1vFOTfa+Vpo7/9eDu5meJO
RlNkADdo5f9U9koY6PTRyIp7MfFTEx9GUD7oja+iIlwL5GXroSvGcYTYso1ymLqd
0B7kyMx5+zIEm9gJloP8QOofWQqvJwi2MYF5UCl3kBvyZgNcd4hs0wBzzWACltjY
/uQzui8buV6Rf5uf4LAI
=V8HO
-----END PGP SIGNATURE-----

--xQA5JmyoyfznAa64--

--===============1711056094833517217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1711056094833517217==--
