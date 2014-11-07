From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/5] regulator: Document binding for initial and
 suspend modes
Date: Fri, 7 Nov 2014 14:58:06 +0000
Message-ID: <20141107145806.GQ8509@sirena.org.uk>
References: <1415365205-27630-1-git-send-email-javier.martinez@collabora.co.uk>
 <1415365205-27630-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6yp3DxVbLZXge6e"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415365205-27630-2-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--d6yp3DxVbLZXge6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 07, 2014 at 02:00:01PM +0100, Javier Martinez Canillas wrote:

> +	  The "regulator-mode" property only takes effect if the regulator is
> +	  enabled for the given suspend state using "regulator-on-in-suspend".

Why?

> +	  If the regulator has not been explicitly disabled for the given state
> +	  with "regulator-off-in-suspend", then setting the operating mode
> +	  will also have no effect.

This seems surprising, I'd expect mode setting to be paid attention to
even if the regulator is off - we may add other ways to control the
enable state in suspend for example.

> +- regulator-initial-mode: initial operating mode. The set of possible operating
> +  modes is the same used for the regulator-mode property and the device binding
> +  documentation explains which property each regulator supports.
> +If no mode is defined, then the OS will not manage the modes and the hardware
> +default values will be used instead.

Again that seems surprising, it precludes any future changes and isn't
going to be true for devices where we can't read the current state.

--d6yp3DxVbLZXge6e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUXN3+AAoJECTWi3JdVIfQ1CEH+wVIAHIeDVtR3iEK1BH1GdzP
K6IqQUcMQ2z6/OZgW3FNSArPj6AoGGsWPwlGDYbI/j0pbuo4ufYcZqKLeJmo9iOX
ohGmkmAjqb68EtLlsDghOm1110JXBwr0qqmkFAlawvKT6eZYWnlJs1nyGoyakO/2
isq7C3qxYVzMP1hgOhs2A8LL804kACmd/K7t4eoZJk12KwGi6m/NLM6LOrGunMnF
BUaSZGih9SeqXwxnVcQiHhOUJU8ikcS4p2c8305Qdmmmd9fU/ElLLYbfiU12IEOj
Yzpm9d2v/RqVslJC0bBf14HXAPJzxVngS3ZS3cVWhDcsJFVaAWXRuNsmmUZjueo=
=jVnK
-----END PGP SIGNATURE-----

--d6yp3DxVbLZXge6e--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
