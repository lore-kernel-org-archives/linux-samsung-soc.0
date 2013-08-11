From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 17/18] spi: s3c64xx: Always select
 S3C64XX_PL080 when ARCH_S3C64XX is enabled
Date: Sun, 11 Aug 2013 20:11:40 +0100
Message-ID: <20130811191140.GI6427@sirena.org.uk>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
 <1376243970-6489-18-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8856684857399187515=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1376243970-6489-18-git-send-email-tomasz.figa@gmail.com>
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


--===============8856684857399187515==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9LzbfKVJ2kwORFXX"
Content-Disposition: inline


--9LzbfKVJ2kwORFXX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 11, 2013 at 07:59:29PM +0200, Tomasz Figa wrote:

> @@ -366,7 +366,7 @@ config SPI_S3C24XX_FIQ
>  config SPI_S3C64XX
>  	tristate "Samsung S3C64XX series type SPI"
>  	depends on (ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_EXYNOS)
> -	select S3C64XX_DMA if ARCH_S3C64XX && !S3C64XX_PL080
> +	select S3C64XX_PL080 if ARCH_S3C64XX
>  	help
>  	  SPI driver for Samsung S3C64XX and newer SoCs.

Do we need the select here (or should we have other selects for the
Exynos SoCs)?

--9LzbfKVJ2kwORFXX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSB+HoAAoJELSic+t+oim9AfoP/2P8URy5sIDCmqf1TOgeSMZr
soLanB71RJUnJ/XhqRkJT4fyNExwv/fpmD8KtTNWyFvZWItCKJCba1JxWY07X4PF
gLgaB4AjW9TxqnG9tvHmnjLnoxjeyHUiwYwPBKb0ye7/2moFrGc2kmY29wLePzL4
iDEKpI5jSIxQe0uBSaHhje4nUDu5zHkzCVSXGfw6nSWOcZkmv5PLKyCSH7gI0KbX
oYYznHGTPt2DHjq6t5GVKZ6dWS+v6cF6SHF4FgP6qHlq8NYgujN5H+dxK7Kst3n9
nOObUiaS7ym96ft+x+UIVkhqaLIU4DpIwJGfVJ7Tmx9zyGGRIIMVRqIPrZZ+Zrd2
brDmSs/+ErB+lZd1fpyNbVD9iOLfAw/Q+L+ZfEfSBwK4+YOKwmZ4HeEnVp3mHLYC
dcREWYdCO5wKkJEi4Uw+BQgS+OzZFo1T57kubWUejHLSYTkpY3II3HP4biuTbnrt
VYgXB7lU70sfE3EN47hTDlpfnzWXe7BwiDyhIfZ7Ofb0mv++IjhGEpNgkglezxBb
Hguw7/pdcLkOKBxbXqcDwc/1jhRuPUb7WrSZCXK4p0mjHXl/laky2/oP26KlES9M
VGvpqDjhqNWMuiIikukU9xBTY2uHA9o1Ydx2ThF5jiXy47Gf89gxRCiKUXKR+F6y
/E0b0IFZ8cuB8y5onPl9
=D9G+
-----END PGP SIGNATURE-----

--9LzbfKVJ2kwORFXX--

--===============8856684857399187515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8856684857399187515==--
