From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 02/16] ASoC: samsung: i2s:
 samsung_i2s_get_driver_data() cleanup
Date: Tue, 6 Jan 2015 18:14:02 +0000
Message-ID: <20150106181402.GP2634@sirena.org.uk>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
 <1418997336-17777-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EvPGq5x6n2a0k3dQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418997336-17777-3-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--EvPGq5x6n2a0k3dQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 19, 2014 at 02:55:22PM +0100, Sylwester Nawrocki wrote:
> Tidy up the samsung_i2s_get_driver_data() function by using
> IS_ENABLE() instead of #ifdef and add missing braces for
> the 'else' part. Also ensure we are not dereferencing NULL
> 'match' pointer.

This doesn't apply against current code, can you please check and
resend?

--EvPGq5x6n2a0k3dQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUrCXpAAoJECTWi3JdVIfQqVIH/13FTVEMux2igBxu6PuIE47o
3QrqP0vioLblV2f6QjNXr73+pDueq2h0zAg0+mpjRGqKZMIAxmCSL0qBPWFgjYyu
JA5hPVaZTh+F1TX0IPsvkChEqvVXJErgBAzc3UaBkX07LyoR1XOLDCGGJo6iwaO/
qxR78WEN1db3xoirLLWHf2vB2zn9NMPJ30aJ42ib/FI/vvBLFwTPLIb2xdBBoB58
OpGK0c7lY0Ne9EWg4xJUqgdeNaHCNtOkDmZXyKcADnQPoaG7iasiDZWLiVW+Olgi
qi6oKlUY0Vl21/Wdts9nXN+FncVVkUie4L/+JEEsDUk55EujbtSM3OjsZuDiOY0=
=53O2
-----END PGP SIGNATURE-----

--EvPGq5x6n2a0k3dQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
