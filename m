From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] make samsung interface entries explicitly
Date: Mon, 19 Sep 2016 09:33:01 +0100
Message-ID: <20160919083301.GD10189@sirena.org.uk>
References: <1474207751-9804-1-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8178512804345380994=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1474207751-9804-1-git-send-email-ayaka@soulik.info>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Randy Li <ayaka@soulik.info>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, linux-kernel@vger.kernel.org, tiwai@suse.com, krzk@kernel.org, lgirdwood@gmail.com, s.nawrocki@samsung.com, perex@perex.cz, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============8178512804345380994==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Content-Disposition: inline


--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 10:09:10PM +0800, Randy Li wrote:
> I found those modules should be selected directly, as I
> only use the simple sound card.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX36KxAAoJECTWi3JdVIfQiK4H/RdoYt/i8SIImzxTgBRi4T+p
ldfiAH5f9tlHCsshS3KtDLhqpBJ+1mzZ2IkaNb8oBbrMgOsIC3QRV7pc4KzzdpMC
2IPLLzmxfpzWf0aA7CxBA57nsgfe8sj9mYTVliRci1MSkb3Qau4WTLmkXhCa+hZ/
I+sMfp2I5tnIZgovBNh5IBro67b/nJdd4tjytTo62W8TrCrO1u9BApSYr8/xNzLS
K5zAWljHfegzjYPUXDTiTYLmJwR3aXxj2Ch9NsGckKFgCOt5NUBLbcmPWGocgQgv
Z6SDD+w+2UrLiAkCL+KzCVSi4M/lZ+VX6abTfhnAafDroMVMhZe5zW7IwQB4z9Q=
=YJcx
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--


--===============8178512804345380994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8178512804345380994==--
