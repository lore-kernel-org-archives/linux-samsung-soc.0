From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: samsung-i2s: Add 192kHz config option
Date: Mon, 17 Nov 2014 14:57:17 +0000
Message-ID: <20141117145717.GE2722@sirena.org.uk>
References: <1416221874-22092-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1C2QhcYtVTlNtC1j"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416221874-22092-1-git-send-email-rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--1C2QhcYtVTlNtC1j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 17, 2014 at 10:57:54AM +0000, Richard Fitzgerald wrote:
> Adds QUIRK_SUPPORTS_192KHZ to allow 192kHz rate
> to be selected for hardware that supports it.

> +- samsung,supports-192khz: specify this (without a value) if you want to allow
> +    192000 sample rate over the I2S link.

Two things here.  One is that the first half is a funny way of saying
"boolean property" (the other standard idiom is "present if...").  The
other is that "if you want to allow" suggests that this is a bit of
runtime configuration (which shouldn't be in device tree at all).  If
there's a quirk here it should be a fixed property of the hardware, if
this is a system integration choice then it should at most be specified
in the machine driver and the I2S controller should just advertise
whatever it's physically capable of.

--1C2QhcYtVTlNtC1j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUagzMAAoJECTWi3JdVIfQDl4H/0sMrAOagfVTHzLUgaXfmG1L
wtZnJo0MuhJW3QBKEh9W4vSsebAWBtFfBfGtaCElwBskwQo3Ty8Y6IxkauZRXx9y
DEMDI1x65RX7zQtYHbJhVvQi3vP/OxbFBu6KpGlChHRhQV/QDHOzq5AE5fqLzzPv
32ZrmB3h/6UsI58gx04MShrJQf4nUDEugadH7RS5nstb8sEi4/fadi1oT00vIltW
rtTjAU0sJd7YKGmrPUy2g7fjlvr8I8MpyCI1UGI1brTbnvceWqCQfL9oS2XOR/54
aPv4CdCsddblAEXj53Itac/N713LB/2kbYWF8+iPVXXYHJ511uRTwp2mRMTsre0=
=5YU/
-----END PGP SIGNATURE-----

--1C2QhcYtVTlNtC1j--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
