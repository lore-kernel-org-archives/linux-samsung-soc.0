From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/7] regulator: max77802: Document regulator opmode DT
 properties
Date: Fri, 17 Oct 2014 15:54:41 +0200
Message-ID: <20141017135441.GR1820@sirena.org.uk>
References: <1413478133-2577-1-git-send-email-javier.martinez@collabora.co.uk>
 <1413478133-2577-6-git-send-email-javier.martinez@collabora.co.uk>
 <20141017115701.GE1820@sirena.org.uk>
 <54410DF3.5020005@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MI2pJyvBeFc4alSb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54410DF3.5020005-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--MI2pJyvBeFc4alSb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 17, 2014 at 02:39:15PM +0200, Javier Martinez Canillas wrote:

> Just to be sure I understood correctly, are you suggesting something like this?

> 	ldo1_reg: LDO1 {
> 		regulator-name = "vdd_1v0";
> 		regulator-min-microvolt = <1000000>;
> 		regulator-max-microvolt = <1000000>;
> 		regulator-state-mem {
> 			regulator-on-in-suspend;
> 			regulator-mode = <MAX77802_OPMODE_LP>;
> 		};
> 	};

> In other words, extending Chanwoo Choi's original suspend state binding to add
> the regulator-mode property that was present in his v3 [0] but instead trying
> to use the standard REGULATOR_MODE_*, say that each regulator driver should
> define it's own device-specific set of modes and a do the translation to fill
> standard modes in the struct regulation_constraints {initial,disk,mem} mode?

> That way adding new suspend states, will only require changing the generic
> regulator binding but not the regulator driver specific bindings.

Something like that, yes.  Not sure if numbers or strings are the best
way of doing the mode but it probably doesn't matter too much now we
have preprocessor support for inclue files.

--MI2pJyvBeFc4alSb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUQR+gAAoJECTWi3JdVIfQoSQH/3lXRw4+iCyGgZClCg0e7a0W
xGCV3VR+AYf7e29nrWWnwkTQcRvvMYXN2DxeblRwhhv/iyvXqVODtHMDU1MGcKMH
Uki7sSfZDW9/9FYeDROkYC5cxcMBSaJ7Nyf3Y83nUBFAuwioxpzplOkKHL9loq9O
+atFDxJdWDWlOODtPc3W5i/JxDpkNd0CwQlqARMPJXXV6FMlnFdIS5yAswa8RnBA
tQCWzgPTw+7SLQrJosuckGlkS6kq/DQU3Y1UUZeM5Thnfv43oXSdiCRlE3QxX/tM
ExBfyLtxMUHL+ooY8IBoJJJHs2/Daqr3S+Dpu/JV3YqS56u7mBoskWwX0dxrr0A=
=oMc+
-----END PGP SIGNATURE-----

--MI2pJyvBeFc4alSb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
