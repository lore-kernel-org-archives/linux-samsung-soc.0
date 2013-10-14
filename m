From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND 0/3] ARM: S3C24XX: add missing dma-devices and
 warning fix
Date: Mon, 14 Oct 2013 15:19:14 +0100
Message-ID: <20131014141914.GB2443@sirena.org.uk>
References: <201310111059.19791.heiko@sntech.de> <15184009.9QsSDOGPSA@amdn883>
 <20131012123329.GL2443@sirena.org.uk> <4125349.GMtWWSIflF@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0288180124727502185=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4125349.GMtWWSIflF@flatron>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============0288180124727502185==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bqPh76xD3yWylqqJ"
Content-Disposition: inline


--bqPh76xD3yWylqqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2013 at 08:29:47PM +0200, Tomasz Figa wrote:
> On Saturday 12 of October 2013 13:33:29 Mark Brown wrote:

> > Did the s3c64xx pl08x stuff get merged?

> Most of. All the patches for the amba-pl08x driver got merged. Just the=
=20
> platform glue remains. I will rebase and send respective patches this=20
> week.

Ah, excellent - I hadn't noticed that!

--bqPh76xD3yWylqqJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSW/1eAAoJELSic+t+oim9OhQP/jlOjGwHL2eLRGFE9jWF9z7W
uLoo14IxqfWFZECh7q00lmqvODRks3g6xg9b/TJhECAic0eJrYUHofQqGEyQk6YE
BJtoRJp3pZDbNS3amUdrXR0cRogzLeuYKIP7l9WSRY66kJdBD26XBpmpZFyqaSz7
ltPxFoPo7oY9xOZzYAmEEzuxFg94t+9tMe3czOyJ6Ra0DAfRGDlEjDdEMylAsl0K
EEi75xcxnykaDhzl7KBBQjdjhdeOPuY/4dP/v5H+zwdDDooqLpTwiIRZ6qKmJfr6
l6DEbkblgFXeWMCj8/ugptDeiibBDbQAReFtPKHkqL25Fxcn8Akn7JivzFAPvBQO
slEU/PYWwudUKC6oAobMKWliY4DdZ7isjOgt8J9Iuv0lruF6LuZluFt2pRLbQToQ
OKR6IWOO8FDaaS6dclyomoB7mY9iOgPBA8yPeTmO5/UK/WhucrbSfRPd0N2QWqmQ
SzYx4pr/Jmhxp+fXVSevHSI2wxPeNQyIhYNw9ouS7N2H1sNcLA4PV5Bx7RnbeaoZ
CQjyaFZfrwx59AGWLGIi1Y+Q/QkF81HwnWUOyMwK9IBAH4mQdqwFNKmr0gplfjj7
TWrdCzCFQrZfglwss7CqXiIs3CfyjeKm5e2a+zUgysBtDr5oJwJBOvkbAk9BNZ5h
WHg/hyS+1YoAWGJwfGEw
=1E3J
-----END PGP SIGNATURE-----

--bqPh76xD3yWylqqJ--


--===============0288180124727502185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0288180124727502185==--
