From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3 v6] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Mon, 14 Jul 2014 20:15:33 +0100
Message-ID: <20140714191533.GH6800@sirena.org.uk>
References: <1405316506-27855-1-git-send-email-ch.naveen@samsung.com>
 <1405316506-27855-2-git-send-email-ch.naveen@samsung.com>
 <20140714172524.GH6800@sirena.org.uk>
 <CAHfPSqAzab931yurSs+3zj=uoFj93FuAdd24AQKm1fZm07Nq8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ihETVmeDfwOC2qSl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHfPSqAzab931yurSs+3zj=uoFj93FuAdd24AQKm1fZm07Nq8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--ihETVmeDfwOC2qSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 15, 2014 at 12:31:32AM +0530, Naveen Krishna Ch wrote:

> in this case spi-s3c64xx.c will continue to ignore the generic SPI "cs-gpios"
> implementation.

> I'm willing to implement any suggestion to fix this issue.

The problem isn't what you're trying to do, the problem is verifying
that it has been done correctly - making sure that everything has been
accounted for in the change itself.

--ihETVmeDfwOC2qSl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxCxSAAoJELSic+t+oim9130P/iP6/+ZTARJ8xRg5CUub6ZHF
85DbYmOwNfrYaZE0p9VF5NfJhsyuqb4viSGzHCh4vSYEFhM86s8nEE3kwgYnx5fJ
zSBxdWhLPp1j/uA2Vbath8fkTebfiAreQ+cWx4GWf/iuNvkYd1Tqar7PdmudFLoA
Om4QYO8kUlE0oreS6skEahEPuRAJTnSRAFGpzELw/JnMhkszAXk9biYnBV9PN6mF
TBQnvNZCmBnkzkuTPzD/09WAsSY/Ny3r3mbUnBqYaL0WzK2cTvg4Ist2gwcRVQSh
HHDidrKdt01w6e7CL36RN4GCEUWZaQnxu+nZVCvSUm3z0iqv7X7GuafC2I0O6abI
XYgM3lEBGWtGLPR1+7o5R88CMaCUJrq6LygsY8Ow1HRtjigw+iw10HKDWOlu5Ctm
51/R5a1DnY+nX4M6Z34DGPwvkqDBokDiPS46mQ+Wm8cW57W1urYglnfyG6VVU9yL
yhdfkYoRNDG08igWnOV1+u+lhn25H/cZ8TS7KJKZIUuuwV+QZrsu1mI/hZJnu2TB
efOo8YNVqbsl4d81mkq1YgmY4dpkYbaGPFKUe4KkJMxeMKDfW8C/aCtPz2zGWDMV
rr3oBlXQy5Q/fZuoy0JcTH/LLmwrJrRqgKYqLpnRtIbdlyzIjlHB6cKa/5Q6dgse
BJFBp+ay63rTQ6A7Sbyt
=9v4Q
-----END PGP SIGNATURE-----

--ihETVmeDfwOC2qSl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
