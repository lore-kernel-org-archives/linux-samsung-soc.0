From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/2] ASoC: samsung: Add machine driver for Exynos5433
 based TM2 board
Date: Tue, 9 Aug 2016 17:02:09 +0100
Message-ID: <20160809160209.GB9347@sirena.org.uk>
References: <1470752514-11409-1-git-send-email-s.nawrocki@samsung.com>
 <1470752514-11409-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470752514-11409-2-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 09, 2016 at 04:21:54PM +0200, Sylwester Nawrocki wrote:

> +		card->dai_link[i].codec_of_node = codec_dai_node;
> +		card->dai_link[i].cpu_of_node = cpu_dai_node;
> +		card->dai_link[i].platform_of_node = cpu_dai_node;
> +	}
> +
> +	priv->codec_mclk1 = of_clk_get_by_name(codec_dai_node, "mclk1");
> +	if (IS_ERR(priv->codec_mclk1)) {

So, all this of_clk_get_by_name() stuff is messy and is going to need to
be duplicated for any cards using this CODEC which isn't excellent.  It
would be a lot nicer if we just did some regular clk_get() calls in the
MFD and then provided an interface for other drivers to get at those
clocks (or just had the CODEC driver DTRT internally).

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXqf6AAAoJECTWi3JdVIfQK/MH/0v5XN/TZNh0pMlbnveM6sWZ
uy1ZBAR64pgqYFHLtLsM7VCniWccX3qwEbNI1MFZHzDjyMRcGZkaLwIquT/VDLKX
mYae6sgotAjjaNNvnStwQUf5ksfw2tfJV+0z1Zr9yVnT6stZDASEGVY3J20k7iB4
TOyR2+nRAu3GEEXoy8jERNkfX77nEFYv4EDeOzITORAK2FmfqFdTAZGO1Qf+ba3s
djUWeKZEvkmDp5Ob83778N+n3uMPNYQ+Ln8Cpg1yRgMu4mxMQwdPcz2BYsU9BgaM
4WY0J+Lir64CkL7xemErF0jIF+1foK/hf0aUQNuO5rznnkZb5IdEmxj0vHm4hEU=
=aCgc
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
