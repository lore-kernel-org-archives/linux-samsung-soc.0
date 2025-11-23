Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461BA1BBBE5;
	Sun, 23 Nov 2025 20:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763930044; cv=none; b=EzCy3Y9KBVE1fc1EMotggrVHzGn8smAoFyEGtghvL/nJ7GcpcNtfRtGhPjrQqj0uxYrEEktihbNLmkvu91D9t4wng3uM3ZkebKd8iZZXW25R6bQnjMUIyW5f2dlTuJzs2Lkp3Q39qlXEUbIP+n9WHahrWeEW6/+bOaT+9hjCYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763930044; c=relaxed/simple;
	bh=DsPcWInfZ6GVQ99m1bNCsnMq1TkaF+RzApr7FO+cajs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFnirH26rDwJjJBjifmFCWSc0QcbAmn4xvxgMrXY/ONYGscIPyDkP5nroX0mZPQUvk4UqL1CKV5VKsTTFdoQ9zb9v6p/EVv6Zq7zGvMAOCtsOMMo2OGY3lAj67QT51DeZL8oF67QbOMHvdY5hBzA8NP87MqrPYj6fmf8RZDICqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=EUxLKgZv; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="EUxLKgZv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CSgH1ZaYBrxKmSAB6ChlLxpJ6NUOOuEnqqcyJnSbdbw=; b=EUxLKgZvejQzA83OMk/dgKzdez
	DtjkRGcx3Abo0/ozjfZ8XDtFsuqAclp5UUdY0DkSZ9jO0CXZZVgfDiVTfdLoZZMjREIJZr2qZWKaq
	2c6Ll4p5qKdlEPyekY4XaJ7aDjx1wX3q7O6i5UMewlYPLPk/LelEW4njYFka7R5MX+GqfUWJgi79H
	4J5bhbELxKUXt2CGBSv262saQhAXhF2PRV0uPwuVu8ciyq09Py9qM1ZZIcg1JN9L5SIolg76UWeBc
	F4NCsDmZWODHMum0v8i+R/qBTIA8WVe/vKH+yBrgx+0KgnaoRMM1bA35UBRajWdcY/nalc/zSDXg5
	SCrh9MNQ==;
Received: from authenticated user
	by stravinsky.debian.org with utf8esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <jspricke@debian.org>)
	id 1vNGmL-0022dN-Vb; Sun, 23 Nov 2025 20:33:50 +0000
Date: Sun, 23 Nov 2025 21:33:47 +0100
From: Jochen Sprickerhof <jspricke@debian.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Salvatore Bonaccorso <carnil@debian.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, 1121211@bugs.debian.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: Bug#1121211: UBSAN: array-index-out-of-bounds in
 /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:178:18
Message-ID: <aSNvq-YjABITPQV5@vis>
References: <176383554642.17713.6408785381758213911.reportbug@vis>
 <aSIYDN5eyKFKoXKL@eldamar.lan>
 <20251122203856.GA1099833@ax162>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="//E4p0t+s0jrCbp/"
Content-Disposition: inline
In-Reply-To: <20251122203856.GA1099833@ax162>
Organization: The Debian Project
X-Debian-User: jspricke


--//E4p0t+s0jrCbp/
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Nathan,

* Nathan Chancellor <nathan@kernel.org> [2025-11-22 13:38]:
>I bet it is the same problem as the ones I fixed in
>
>  6dc445c19050 ("clk: bcm: rpi: Assign ->num before accessing ->hws")
>  9368cdf90f52 ("clk: bcm: dvp: Assign ->num before accessing ->hws")
>
>So something like this?
>
>Cheers,
>Nathan
>
>diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
>index 5f1a4f5e2e59..5b21025338bd 100644
>--- a/drivers/clk/samsung/clk-exynos-clkout.c
>+++ b/drivers/clk/samsung/clk-exynos-clkout.c
>@@ -175,6 +175,7 @@ static int exynos_clkout_probe(struct platform_device *pdev)
> 	clkout->mux.shift = EXYNOS_CLKOUT_MUX_SHIFT;
> 	clkout->mux.lock = &clkout->slock;
>
>+	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
> 	clkout->data.hws[0] = clk_hw_register_composite(NULL, "clkout",
> 				parent_names, parent_count, &clkout->mux.hw,
> 				&clk_mux_ops, NULL, NULL, &clkout->gate.hw,
>@@ -185,7 +186,6 @@ static int exynos_clkout_probe(struct platform_device *pdev)
> 		goto err_unmap;
> 	}
>
>-	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
> 	ret = of_clk_add_hw_provider(clkout->np, of_clk_hw_onecell_get, &clkout->data);
> 	if (ret)
> 		goto err_clk_unreg;
>

This fixes it for me, feel free to add a

Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>

Thanks!

Jochen

--//E4p0t+s0jrCbp/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEc7KZy9TurdzAF+h6W//cwljmlDMFAmkjb6cACgkQW//cwljm
lDMoDg//WSStBBpXj6C9bzA/OXvHMMCtdAs1iFeSvljh/6z+MJLvZ1b4Vo5zok1/
lbQHn5aM/rYeSKlCM4vEiIJdMEaDD8tYD0TLgGAwDirnB/GStWYVRClBiEyLlhmf
0/9at7smuicoYDM6/5AMglwznd4Dqx8WzNjDfBFe5PzkDd41+/vQ+M9uc8ql9F0A
KI4YpGrwXCo86y213ke/9EALuafdzI0iY3+/DVypdB5sp5dtwhvfY3T0B1Is4Ldh
wBhZqz3f5eOn5U87MHEFmcRDr01z37Oyj8kRFwMPWy7WJ9wn5Xc8o4wC36oRgwBY
5FpvRXTcoZL4V6fnL+9243yz2BOV6ZUtQ5PQEvtHcwGDn/COlU4Ibn6XO1pryRxO
lEksJbWGN5c6wd+NwxaXdb+U3wABQY8r12RwhZHEXAgIdBBHnmJ5NVNQDR+OF/kX
iSpW2QokVWpi/D6U5gjuSC+bkce0XLoKHawDV8eNDnLpW9hQU/1mhhbNZZGzp2Ur
YBul0za2dSfSklh/bH/7PsIiQrKJvYD+14u6ZWOuF2bZLZ/mMr6bjYr6k/x4iC0J
njfvrmxBMq0c8kYBaS+g7mOTGEON7vbnP0JK6BW/MfQjYZO/jKmu1MCUhIgKhwsq
EcGRUeH+NeSuA1DUbVd4t/NbxzzQjhTH1jQFxj8jCHEFdtB/oMM=
=txjC
-----END PGP SIGNATURE-----

--//E4p0t+s0jrCbp/--
