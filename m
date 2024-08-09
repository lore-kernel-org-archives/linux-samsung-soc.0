Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF4518E055
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2024 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723194152; cv=none; b=GLYakWrYfhjqOW4kfbMrXK0hOH7+dR4OOIoRf6lx6b2Gi5RkhoHDXMaVhwqUhN7ZIuLSFRazxNOzWJ4Uu45iauMjHYaTluOZZ4zvDxc1eWwqkcWO/DAiVAiFvID2BSLf0V1oj9OPVICZlLaTmjgkwVnHq4aqCNx6YTNSSu7n0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723194152; c=relaxed/simple;
	bh=61+YerNr40rG38/skuZDeKHRHRiswDc0IDxWm456RR4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nDtk25DBQaOePyyvk3yyP+JeDYI03DKYLlXCXNXZLbF7SHX2MDkk2cKDbEHIlPTyn+wC/WIufAabxYl93qQ+kC308rT5j3PeeTrAuu+EFaSYe3KzPNHxy2bXMZiI673RiFBArACMvSqBsKvG13V5ET7uGLCxBCj8TNF4glyh+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kMG2FUiU; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kMG2FUiU"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f136e23229so19234941fa.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Aug 2024 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723194148; x=1723798948; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C4sB1jBakmic5gXzkcPURg/zXitSQXBATJUqHwQaNOo=;
        b=kMG2FUiUwtoqDF+s7SUbLUFrS0msTVb3qj934rmNaTroqnvuZs2JJyfZAUZcZQE7zK
         Su2+ctSz3PjDrMX02vslJWnyCev7Y2vAq7Inmg1qCroNsmGjOiwGVpRlOXJRqF2BNAa3
         2rfXsJ6ianE3jkaHvKK7K75hCvhzmmbY7pL9/QJsjaK5LFYzq0lkqVvGMBiszcOvaTMl
         eeOBN3XlMR67YRCo2w58XhyPkbHalVRHFu7Rz4oajoC+saxRQfyz3Hr5MHQPr9a5eelE
         g5GHE5Xw31oTj0c7DBVjNg7JuSAlmw8ft8kqkGiXqR0F0FUrrEj5jB16wGrbgjmueqDA
         FwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723194148; x=1723798948;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4sB1jBakmic5gXzkcPURg/zXitSQXBATJUqHwQaNOo=;
        b=wrK+hlivGqLYpSrh9PlPATO9ZcrEWac97nj54WDWjJvyHQz2a61ZR5hMwwj17pyiwx
         7x8Z12MOM9IM45DZt3Ozy/QZPiM1HmGxTvZvIm3vdpO0ii1d7U8Z/IWwRnBQx7R0CjGm
         eZRObYpyMc2PR9XgEetDBu25yQ9FAGFLv6Y2/O+MU92yBpL3mVlhp0pFZe/MWgzdGnBj
         WMXyIkGdkhFDVZkvgy+tHAhwptT2xISOdY8ibRIlewkYX3Aezm8XoAp8NwGUgaxNwHH+
         9WqBjJ/6Bf28TM7PISPI7s4pKCsSTsEFi1PlnvdcuCzIiLa2CRhStFHHEybnuoNg4H3a
         u0pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLWiLlJoZ8Q1DyU1RKqNLWNGRg0tuJh7Egd1FMoPCul+nFwi/CF1HWYmOdf+sb+yImCqQA6+RL/kFhzquAqxL6c27n5uBn0AxWeDdCkVBosWs=
X-Gm-Message-State: AOJu0Ywe9i3+iTYgr2WKOPDJKP5XaQdJpaSPwfsHgeSsDQ+HJTRLkVl8
	6+vKyJhxYUhVyFItvVMN2YM3Gu/FUDs2UXTPDB1YQWFqBzOrJLPP2UUJez91seQ=
X-Google-Smtp-Source: AGHT+IGeGFXXuvPAjIkHzQmIkO6X4SywGLII/Ry1Ydn95Xg+XUJJ3c8Q4r60X9kJEr+GYBOUR1kJsQ==
X-Received: by 2002:a2e:be1a:0:b0:2f1:8622:9b1c with SMTP id 38308e7fff4ca-2f1a6d00377mr8301121fa.5.1723194148125;
        Fri, 09 Aug 2024 02:02:28 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059621d1sm114657595e9.10.2024.08.09.02.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 02:02:27 -0700 (PDT)
Message-ID: <d4580b33c195dcf1c3a0054b29555383d2e1606b.camel@linaro.org>
Subject: Re: [PATCH v6 01/20] clk: bump stdout clock usage for earlycon
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peng Fan <peng.fan@nxp.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Sam
 Protsenko <semen.protsenko@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, "kernel-team@android.com"
 <kernel-team@android.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
 <linux-samsung-soc@vger.kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>
Date: Fri, 09 Aug 2024 10:02:25 +0100
In-Reply-To: <PAXPR04MB8459F99475C289A827987AF588BA2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: 
	<20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
	 <20240808-gs101-non-essential-clocks-2-v6-1-e91c537acedc@linaro.org>
	 <PAXPR04MB8459F99475C289A827987AF588BA2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Peng,

On Fri, 2024-08-09 at 07:16 +0000, Peng Fan wrote:
> > +static int __init of_clk_drop_stdout_clocks(void) {
> > +	for (size_t i =3D 0; i < of_clk_stdout_clks.n_clks; ++i) {
> > +		clk_disable_unprepare(of_clk_stdout_clks.clks[i]);
> > +		clk_put(of_clk_stdout_clks.clks[i]);
> > +	}
> > +
> > +	kfree(of_clk_stdout_clks.clks);
> > +
> > +	/*
> > +	 * Do not try to acquire stdout clocks after late initcalls, e.g.
> > +	 * during further module loading, as we then wouldn't have a
> > way to
> > +	 * drop the references (and associated allocations) ever again.
> > +	 */
> > +	of_clk_stdout_clks.bump_refs =3D false;
> > +
> > +	return 0;
> > +}
> > +late_initcall_sync(of_clk_drop_stdout_clocks);
>=20
> If the uart driver is built as module, this might break earlycon.
> Before uart driver loaded, clk disabled per my understanding.

You're right.

With this in mind, I'm not sure then if a generic solution is possible...

I guess it has to be duplicated into the platforms after all and platforms
can enable this if they opt to disallow uart as module?

Any other suggestions?

> > +
> > =C2=A0/**
> > =C2=A0 * struct of_clk_provider - Clock provider registration structure
> > =C2=A0 * @link: Entry in global list of clock providers @@ -5031,6 +515=
6,8
> > @@ int of_clk_add_provider(struct device_node *np,
> >=20
> > =C2=A0	fwnode_dev_initialized(&np->fwnode, true);
> >=20
> > +	of_clk_bump_stdout_clocks();
> > +
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(of_clk_add_provider);
> > @@ -5073,6 +5200,8 @@ int of_clk_add_hw_provider(struct
> > device_node *np,
> >=20
> > =C2=A0	fwnode_dev_initialized(&np->fwnode, true);
> >=20
> > +	of_clk_bump_stdout_clocks();
>=20
> If clock driver is built as module,=C2=A0 the will make the
> clocks will be always enabled, if my understanding is correct.

until late_initcall_sync(), at which point it'll be disabled before the uar=
t
driver has probed, yes :-(

Cheers,
Andre'

