From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: make audio interface/controller explicitly
Date: Mon, 19 Sep 2016 09:33:42 +0100
Message-ID: <20160919083342.GE10189@sirena.org.uk>
References: <1474207751-9804-1-git-send-email-ayaka@soulik.info>
 <1474207751-9804-2-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7840731993418887820=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1474207751-9804-2-git-send-email-ayaka@soulik.info>
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


--===============7840731993418887820==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Content-Disposition: inline


--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 18, 2016 at 10:09:11PM +0800, Randy Li wrote:

> It is simple sound card time, we could assign different codec
> to a interface without making a specific driver for it.

>  config SND_SAMSUNG_AC97
> -	tristate
> +	tristate "Samsung AC97 controller support"
>  	select SND_SOC_AC97_BUS

Are you *sure* simple-card works for AC'97?

--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX36LmAAoJECTWi3JdVIfQ8bsH/j5OQAtQh5koE3Hr79mMEhh3
3tR9Q0iLYiPc/RRb+zf0FmE5cymA+FVzTA1KARY5Wm5BRCw60ZFZ2X2WK0I8eBvL
TCHILJxxguHzip3MTVh7gsmc106qoWqoj5Iz+q/GHQC9aEa38mtaJVe9uNV81j5I
4L5vyLGcj581tFbwoGukjqbjFuw9K8cknsrTxTU6mvY4HFjJJLT+oeiz9vGo+SqM
NlmMpFVUhVmV7xPtsiCN9gpRXexpHFy6tJ+ptGZeALtzj8psMr6puUkg4nLRQ8Q2
ZEhtWJJaR4x8srHAMgsSxskGTaTHq2yMF8w/F9QC8UlPPxWS/XRy8HInUAjQbA0=
=KNL1
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--


--===============7840731993418887820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7840731993418887820==--
