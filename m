From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] doc: dt bindings: Document Odroid X2/U3 audio
 subsystem bindings
Date: Thu, 22 May 2014 19:46:56 +0100
Message-ID: <20140522184656.GS12304@sirena.org.uk>
References: <1400759708-25831-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tP+Q+DmL2Hx0hmlt"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39363 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbaEVSrL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 14:47:11 -0400
Content-Disposition: inline
In-Reply-To: <1400759708-25831-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--tP+Q+DmL2Hx0hmlt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 22, 2014 at 01:55:07PM +0200, Sylwester Nawrocki wrote:

> +	sound {
> +		compatible = "samsung,odroidx2-audio";
> +		samsung,i2s-controller = <&i2s0>;
> +		samsung,audio-codec = <&max98090>;
> +	};

Can this not use simple-card?

--tP+Q+DmL2Hx0hmlt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfkYcAAoJELSic+t+oim9QBwP/iHC4sNNhsLrlAqpltJ5WM1n
gWdxCWDSfMVj44ZUWemiNE1u2KCWDA6lGPefw3DJoSjrNJesNxFn09+Uu23Bp0oh
aHoyBYyyBgEwKnrGHecVGRw/5hQ+tbvERaQ1B/yl01wr30lUiS+omAR8bTN0Y87r
E7XIiChwRQFn/Lq1NrfPd5rNNNGu+HTwABUxaMm4fMLI4VpcGiaGUInR11I3+89n
wYisqtxC+20Q/Fe0KpZuEQL2pywBKO81qI+HRSBpUu0Bkqo4hc0yl2GAYAykJbpm
kgFrZ4gnaB760QlrEyA6YZD4Dec6X8kJOuvg9afVCpfSmmtsK7WlU4OqOKAm4iuv
nGjc+GRDmMCWTs3fCjr1DQt/Dal8LeKd1s2i6cOGK+rdCSC6uIFyqLuEjmmdx1V6
lglAY+zXshe98Ahs1Y0TMaCQzC1II9si7nT6oYGyWNFvWTOFlkNAPei0RdLj5D+H
Y3FtZWFg6DvogtVpyuVZqceZK60DJXIjtX7hpiVVmvdwu2bGTqOL9CsPqGZUq7L2
tdJ0u18HcTNyP4F+JFdgrLasQmD3QQIIylyhbEXgg1ie2KFcivmo35kH4il3bIWq
Tiz6VUNwIswYtYidsk/8etOpXx3CZSq2am+NG0lWd+GxJNRMDuy/Jt21KwqrdF1K
qpE1qquqmYIiVAgsRE2B
=HW+q
-----END PGP SIGNATURE-----

--tP+Q+DmL2Hx0hmlt--
