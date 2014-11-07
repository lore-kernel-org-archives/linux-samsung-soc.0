From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 5/5] regulator: of: Add support for parsing initial
 and suspend modes
Date: Fri, 7 Nov 2014 16:21:24 +0000
Message-ID: <20141107162124.GW8509@sirena.org.uk>
References: <1415365205-27630-1-git-send-email-javier.martinez@collabora.co.uk>
 <1415365205-27630-6-git-send-email-javier.martinez@collabora.co.uk>
 <20141107154743.GT8509@sirena.org.uk>
 <545CF02A.9060500@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GkKDMoQVTmdw7ke1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <545CF02A.9060500-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--GkKDMoQVTmdw7ke1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 07, 2014 at 05:15:38PM +0100, Javier Martinez Canillas wrote:
> On 11/07/2014 04:47 PM, Mark Brown wrote:

> >> +	if (!of_property_read_u32(np, "regulator-initial-mode", &pval)) {
> >> +		if (desc && desc->map_modes)
> >> +			constraints->initial_mode = desc->map_modes(pval);
> >> +		else
> >> +			pr_warn("%s: failed to parse regulator-initial-mode\n",
> >> +				np->name);
> >> +	}

> > This is ignoring any error return from map_modes(), it's possible the DT
> > might have an invalid value.  The error message could also use some
> > improvement, it's more that the kernel doesn't understand how to parse
> > it even if it is valid.

> Right, as I mentioned to Krzysztof in a previous email, I'll remove the
> warning message and add an error message instead if the map mode callback
> function fails and also show the error code as you suggest.

It seems reasonable to at least warn if there's a mode specified and
there's no way of understanding it...

--GkKDMoQVTmdw7ke1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUXPGEAAoJECTWi3JdVIfQtYsH+wS9ZlUP9VNA1H9gUNKilG7B
7t2uD43wjK81z4NB2HDYBrOVfL1busZpxv4I+ngPgwVGY4ijEOC+nmhU05i/tHUJ
VDl2plQe/8fX5tQ1Mi1gZ7ufNlA9XA/hQ85huoffE/dOvP4161ayPsLnQ6n561BT
Qe10u42zipIVC/BzJ3xxOspX79uBz0kaw8YTmaNEiUwV+tCKsaYr69bPBzFcR3Ls
xWc6s8oHicZW76tsih0LAFZRn9uj5NdDnuvKhKdUOocorEs4Nkwj0nt09vRomSus
T5MXMLCoPrLUsELNr13Kxz82BMEMniHo+8M8myVG8ep0l8YaBJYkmF62MXvBUcE=
=hr5M
-----END PGP SIGNATURE-----

--GkKDMoQVTmdw7ke1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
