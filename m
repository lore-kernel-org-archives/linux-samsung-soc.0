Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA74D3B9618
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jul 2026 10:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334379; cv=none; b=KP9/+TsTFeA44tu3BzNEHvHoSUE5L3CEuhGN2A8gQKTpqhPY/YqMBmTiHOCWTNxTNWXCxCJ+Ua346vrh0EJWkkQRfOQgx8Lgi7+i/GOOm04tKsrPtlGteSQu/tO9ZdHbEbq+oD0Mkdh/dqThSiS6zzY2UJhOL1wA+cZVy1c8zD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334379; c=relaxed/simple;
	bh=3NqyvZK6r61fTF0y4rbK6dX7OLUGCMSqOwp3B7dW+hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvW24YVTO8pWfi0Vtemnb955e7y6mlWPLo71stQO/EQvnQ1IyU5+sjJ8JE5nZ6/5vEprEPNWdbf4Edga4fKjuRrTtif1X0LJUw1ldUg4Qr5DEqzfsmYnTlkjcaIwxMvMv3TGlEePTxOXtycg/13/EO3aeWRWLje/eOEGoDLzvzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=luQZ0p8N; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="luQZ0p8N"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-474303f3c72so1665533f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2026 03:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783334376; x=1783939176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Go7lNGQE+yUmjPgVI2sZRhO3/S4lEXiftKalvVFj+z0=;
        b=luQZ0p8NTauewf+aSngxbrXRtTh855g1JE3Q7xVyTLOGrKSoZi/OE8dgP6akPCrxcl
         w7LsaKo1FEbNORHcJQtdm+KyWqn44tbf831ewTvNOkykaWOxY6EvMb2PG0fJchLhEk+q
         KBP8Oj9Z0uDjAiBCBS4aqaDRNx8g3Z0GA+T8xwh/USsOaYWN8iqoyHIFXNcXLbmsaMaw
         ncU/PMt3zaQdM/aPf4AtDRJZIqb0FRgUxx0j5YebvVABAiyKO6Ce5AvVPfLJrbu8hafD
         9rQMLO8J/nuNt4qxd0D3m0mioezezAufGb5Fh3pSLxOrOy0rtHC4oyA9ihPX6+Z73+qz
         sk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334376; x=1783939176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Go7lNGQE+yUmjPgVI2sZRhO3/S4lEXiftKalvVFj+z0=;
        b=eo7H22JYZ1KfGwnEXzrSVEgR83DlNA0VoR4QeAMhqLg1+TGXlSR9VUy6raNSluZWTR
         1ioY8pXJq7iNW7JkaKqP7yajJmytQQPIM4sprlbPerKkUswebL+TcpPsUUY9UrkE6lr0
         bln4Rj2dwyz/ze2lk5wqSN7GwzjrIVam75ZyN6bHcuBK7ywkpmd91FEWeeLka1ULIzZT
         cLDfPHS3ocSmUrpXZfQUb1/BSCZfbEMpTF63l63hQGEVG2e1InBSCvSHBZveLcsiKjlM
         W2wG9foKSCQJfvoI0swbIXuVOTenCRc8I88DgNoMlQqTnbh5iOX+TTAiI29Fvr2NdoOB
         9a6w==
X-Forwarded-Encrypted: i=1; AHgh+RqyTbJ7sRuoGLAJpY2UXp98ecX4PWzS7mDnYFJcLhYAsZOvMgtkasAynlZA7HA5jY+qhQL/5kH4rNP5pqT0l9izbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBuurj19DbeG0Qtrv+Z9fs6Ruc3UihkqiSNm/3SbIBvETJt27T
	zA7dkTFmUFAg0pSwF62lF2Cp5DzTZdV4QBNzvMTpSR+9vVchh4WryqNjsonFSkXa1/I=
X-Gm-Gg: AfdE7cmSFvzVx7i69yEytjflyPfY7G2VMa9fYFZI7LVbE6Z16IKSf99UKFKb0fhNl1m
	kGdVqzuMXAxLw1SO1fh7SYiaeAbOHfxS3iaTJ3nntguyhbvjzU7day8LsVt16Aqult5TPdDv1r4
	+bT78eLXlKZsuN9PnickMVtNHKVBxPa3deLYxLoeHbeazggRBFAzWzJcwMY/aaaZtZdXAaKeyBv
	UCrynoYTm2pqCAZMsswK1zuYywS4cfXSa095BW+iIZ3ZLlgtwZ2i1q5NJ+Wr2vpEDyFVbSQlNBg
	u1y8UZuguN+vf33z4PyRi3ykEpBRVKotCvGhrxd59dAKcVZ6zOuc1OXXhyLPHHv0EeKZpGmiPBp
	PmXq7LmgphSgDGKxJOMDxz97c595l+x3rN7aoEHfg7BQlgfbnabpsqT5SMqvPYtGA9/5jCWTzBB
	7zE8cQXFZAyBmIHxuu3rm6ozX6GQzQMpMV94ZGkcDe26sacvXCqhEuuP8iRcc2uNF7MEEbj/9iW
	q1l
X-Received: by 2002:a05:6000:4698:b0:475:36a:8c97 with SMTP id ffacd0b85a97d-47aab76f017mr8079359f8f.45.1783334376207;
        Mon, 06 Jul 2026 03:39:36 -0700 (PDT)
Received: from localhost (p200300f65f47db0426af56a07ec3b32d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:26af:56a0:7ec3:b32d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d8cdsm25702223f8f.1.2026.07.06.03.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:39:35 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:39:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Chen Wang <chen.wang@linux.dev>, linux-pwm@vger.kernel.org, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Michael Walle <mwalle@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Message-ID: <akuFirxGTqu_gt4O@monoceros>
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
 <aktWoIfY_DdO6gb4@monoceros>
 <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vyrf5kfcddz5uoeo"
Content-Disposition: inline
In-Reply-To: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>


--vyrf5kfcddz5uoeo
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 10:28:16AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Uwe,
>=20
> On 6/7/26 09:19, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:
> > Hello Chen,
> >=20
> > On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
> > > On 7/5/2026 11:14 PM, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > > >    - Use a single space in a of_device_id array terminator; A singl=
e space
> > > >      after the opening { and before the closing } in non-empty
> > > >      initializers;
> > > >    - No comma after an array terminator;
> > > >    - Also no trailing comma after a named initializer iff the
> > > iff -> if
> >=20
> > This is actually intended. iff =3D "if and only if", see e.g.
> > https://en.wikipedia.org/wiki/If_and_only_if .
>=20
> I agree this scientific idiomatic expression is not well known
> by non-native English speakers, and using the expanded form is
> just simpler to review (thinking at non-native English speaker
> reading your commit in the future).

fine for me, I'll fixup to=20

 - Also no trailing comma after a named initializer if (and only if) the
   closing } is on the same line;

when applying.

Best regards
Uwe

--vyrf5kfcddz5uoeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpLheQACgkQj4D7WH0S
/k6DEQf+JKDZ+NcR412RMDPBxcWuk831SswOfJipQJVDxTsFWtpZIrZIbOu0ZlBp
IEWpfB5nRfHwTSxF6Ceuf2jTc+wkwcRBKeH4MQsZFpGxBjGa4k7YEEfMSDU9S1vU
39G1FIVXnf0sDkUOUGf5zIomYewh4gdCoWRwDnCHsV4QnZKAaKCCEpX0U6QdW2OP
diy3iqasYf6KZyXnUyj0HBQRGjBYY4jBvVutXt4KtCqAKW+AcCANOtubadJgydWD
xXNkFLpscFQ9aVdyKZK19UP9yKdOwzkjR9pul+TqXDviO0c5UoAZEwMZYDbB1YPi
AJloqZ9/3vBcnEjZo3eWYk8zkrQifQ==
=vnC0
-----END PGP SIGNATURE-----

--vyrf5kfcddz5uoeo--
