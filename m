Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16858332EBA
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260952; cv=pass; b=V8som/J60PXQAst07uRw9yKUUtSO+QOG8TcMmhJT0fj/hafhqWhQFOPDEOchdvViwM1i3vG+dZmEPaCFeZMJIi9KtuWbsPOyYaZ8kjwEbRgXCRaARORpmhXZACPC6laKleZnOJaaN8V2Tax4VPak8B1gO5H46lXjdKyahTItyZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260952; c=relaxed/simple;
	bh=bhjgliOCQpf3UnZBKOdagDkW2QpmCx/wb7qbG6lkCT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoSQdHT1OXzgrH0izfjtb8UjJphKiPUszQEH2iaJD+LMARO/YHN5YQ9CGQXvNjPKh5/UXpfXVDFZTlr9HREWHZaALu0wmH65AXC0QngVDesYD2UNc5pl08ahfLd07inxN/WSkBHrmwnjQ16blAqT2rSRewG1i3NKsrzV/vKwqks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G2necLGa; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G2necLGa"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-651d692e833so2579316d50.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2026 10:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778260950; cv=none;
        d=google.com; s=arc-20240605;
        b=OKBCBJhU71eDN4xW+TG1fZuNZMPXspGpL9gTUzGX0KfP0B77IctwFBblPXgWV5gJDV
         nUgnWWf7d2w47NjesU0WnjYcss5Pvo93lC7ccKuCje+8O6kWPc4P94yjgbW2FDkX/hFQ
         qZ7wdDI7pQppGVIyJNm98iqjQMunSCju2Qs1r7Vm+II7N6CMpSJxxG1w2BcybE5qgH/S
         gJqbgLNL75CamelgoSMOQy6EDzXKojltQhyE7DGOfAjwJtRr6UcTi+Tjb7HQq69HuM58
         TSxMyvXJoOEn14rHd60e08Zn/v8S7XBxMpIPudkxk0WYq+vQqFIFCRXLJQlOReNjbZsm
         sTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4TwIRY2nZA1VjJMy/1brhO0GpNrd8SUOXjsMr4w1IXQ=;
        fh=vuAMQFUxo4XS7y3jJ7Q+IAtB8P9iI2Y7qWjvHaMUj6Q=;
        b=T2iXjwgzrDUXsLn6qr0pRmDm8Erw726mG4JY+npmWxC99rbAHQCwt4NI3ynFFeWHKP
         GBoSZrczHEqFaRPiQg9MhQ2Gzf+weioUKVb5gNCRpnldl1SGjXVYvjPG/b0DY3iOVEs8
         Q6EJP321AnLkXD40nCLdsmArOdKmcBHwpmdS+At5riLLifjG6xwmu2d46aHUSL2OfT51
         0my+9yGfyR9m4vXGHUeHEPUuBtDN3Qs2wDGRZDzeuJtj2zeabim53nBRJwcSfuYrQ920
         Gk1iBzAVT2K0Ig207wy+zINOlFbgxQlz9mUKE9DLK1oJDSTXJ9v4HGLcrfR6yHfMeHBm
         cPjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778260950; x=1778865750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TwIRY2nZA1VjJMy/1brhO0GpNrd8SUOXjsMr4w1IXQ=;
        b=G2necLGa2+hUMZePBrI5kC3vDBQ5SUBwer/Rl/tag4v6yKEcqfdrlA4thyZm9PB1Lg
         ME7lIN+WWxkVDiGErKSU8oapaFV/fJSvD5ErrBzJQfWtj5tz+yPU7b4GtGQfFAvp7i/Z
         eJBVBscOqRA0eM3ua4/uGhbgMc5PGMdzKF/KMTSUOqPkTTVz8N7biYYJPYfTkVSvpkbh
         C3pzG9nJ4z/H+BZaD1/sOEd0kBmAym0qC0R6CdV1jNTppJwhgCu5k1j9sAKqbWT6AUeQ
         zWoZW3ilOcmpOgPIn86vj48csVwPlWhTo2yUod/1pry+MERbUcH7N3w/NsKnUCI5S70V
         21xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260950; x=1778865750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4TwIRY2nZA1VjJMy/1brhO0GpNrd8SUOXjsMr4w1IXQ=;
        b=aenVVdolFZG99QDohT5MSDERhLAAJ/RJUdiKfnAVj/Ni0jC24tvZ+VGhHtNbQGntYN
         ZunhPkCFsfaSnYICXddeQs1mFXfuyee5AkBQwQd/evWUfutilZL+RyVc6DpyVMwJNWf6
         o1QZaldnPJNI8Xw19lD6I3Fh2yElN3jiC0zVR5AIELJ+Fr5O789fa6oYBJCHm+UGU1mi
         FC+qjBMHs3DwBFbtAmjMOBpLABwVHZIBjns/Yi5Ybvjhb/un/97M+56rwt1DhsVeGxA2
         TEqFqU+67oUXcXfOxjup8cMMRKkvRis8f5lP8XLHTBFr3uvspqaJjzIfZCa6iZ7cWpPn
         4oGA==
X-Forwarded-Encrypted: i=1; AFNElJ8UJh/59w/v46TOYJrUdhv+EarcQl4Aia1n5LxwYMvdyQqL22a/iIjf5WEXfRSXIWOdFru1wgYkErL47A5/6ObguQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJh1NIjA+pEH37K8sLiov004Olra7LGRbww/sG+rcR5gwTCAfR
	bSfBJleYDkmJ0GXerCKNChuEQwnseSZNrMWvt0NWpNGt7NqhyKBH/puMPxxeT7B7M2yMGNGLVr1
	XErDsxuFyOY+yZN6tVHhBcmFVHKYd8MVlt1GfpZCPgQ==
X-Gm-Gg: Acq92OGDbfR8NWgJuhofwyYXURUlpQh7lQO4vzZPltgXyAo+fYnE7ULGvdhAmhbdwHa
	eb5wqIzQoBN1F/hTiCuNfnxgRsdGMI4dnDsJTX3Xq1iuior0TZnRgts8zEgVjPS+bTNDDXpJmL3
	h1G/bR28R5nsWamxT+ix5yzkPUsDG+sgGamtfXHkXCOzPYXCEnWaTUQJgyZXrTN2fwH3nHpXYMs
	igA2TPuIOOuzvVOVxjB+I18iL1ouj9wPzMdQ0jvrQx8r3lfyf5qTsIyQjai4z8oBk7Sgr20YjNs
	5RG5qRZX5Jyzo2mo5pDtEeyhyQr4Zk+pU7rFcPh6Lw==
X-Received: by 2002:a05:690e:400f:b0:651:bcb6:888f with SMTP id
 956f58d0204a3-65d94b499damr3535814d50.15.1778260949925; Fri, 08 May 2026
 10:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
In-Reply-To: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 8 May 2026 12:22:21 -0500
X-Gm-Features: AVHnY4I2OawrzI6xYvjWNwRGdaLspFjoHiDADtZnKv7uMu1NzvUcqwurZTLYMoM
Message-ID: <CAPLW+4kLyzUv-tstDezbqJetOLuPkzQ_Kt8EGBPy9U861q=7uQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos850: mark APM I3C clocks as critical
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Brian Masney <bmasney@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 6:53=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 APM co-processor relies on the I3C bus to communicate with
> the PMIC. Currently, there is no dedicated PMIC consumer driver managing
> these clocks, so the clock subsystem automatically gates them during the
> initialisation. Once gated, any subsequent ACPM communication with APM
> results in timeouts.
>
> As a temporary workaround (and let's hope it doesn't become permanent),
> mark both `gout_i3c_pclk` and `gout_i3c_sclk` as CLK_IS_CRITICAL ones to
> prevent the clock subsystem from disabling them. This makes the ACPM
> communication functional. This workaround should be reverted once a
> proper ACPM PMIC driver is implemented to manage these clocks.
>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-exynos850.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/cl=
k-exynos850.c
> index eb9c80b60225efa33d85f5f3c284eb8a63a48015..b143a42293f5a154f53a86d4e=
97e17a3e61164f3 100644
> --- a/drivers/clk/samsung/clk-exynos850.c
> +++ b/drivers/clk/samsung/clk-exynos850.c
> @@ -686,10 +686,11 @@ static const struct samsung_gate_clock apm_gate_clk=
s[] __initconst =3D {
>              CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK, 21, 0, 0),
>         GATE(CLK_GOUT_TOP_RTC_PCLK, "gout_top_rtc_pclk", "dout_apm_bus",
>              CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK, 21, 0, 0),
> +       /* TODO: Should be dealt with or enabled in PMIC ACPM driver */
>         GATE(CLK_GOUT_I3C_PCLK, "gout_i3c_pclk", "dout_apm_bus",
> -            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, 0, 0),
> +            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, CLK_IS_CRITICA=
L, 0),
>         GATE(CLK_GOUT_I3C_SCLK, "gout_i3c_sclk", "mout_apm_i3c",
> -            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, 0, 0),
> +            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, CLK_IS_CRITICA=
L, 0),
>         GATE(CLK_GOUT_SPEEDY_PCLK, "gout_speedy_pclk", "dout_apm_bus",
>              CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK, 21, 0, 0),
>         /* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICA=
L) */
>
> ---
> base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
> change-id: 20260430-exynos850-i3c-criticalclocks-dcabb78bf154
>
> Best regards,
> --
> Alexey Klimov <alexey.klimov@linaro.org>
>
