Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3215F86632
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 23:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708558928; cv=none; b=trqD+W8RWqs7EPIUBJjNxtsI64Whzr0pwgeqnMel84JPlB4BUpIWmsjShBHtvQdw03r/x8U+54TY7GD8JUxL3z9ASv415sFRhyFtayjcfUUeFrq7jtvDAw+skFrjMfsp8jhsmAkouMx3LXpURhtyxjjYlkmcGyjuHvj3IYB3NoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708558928; c=relaxed/simple;
	bh=9YvOp898aubJjbKRrUpp3NGfhZc4uwca3cNw/pQSCCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0mpZpIzBiFusghGVqVFiV3WMBy0c2qWrjf4B4nAc+modAGZ2jRg3keIMJC/gvHryf1LX5Fgignw+0J7IG7h+EMKCpkWoA0BwQh0NREpmvHUT5CwjFR4HN/S/gcP5w+Qb7XW2NAP9dyKWyswUwEt02XUCEtYsy9PAkkJtHXoWsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gpoc5m5K; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gpoc5m5K"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29951f5c2e7so2713226a91.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 15:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708558926; x=1709163726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YvOp898aubJjbKRrUpp3NGfhZc4uwca3cNw/pQSCCE=;
        b=Gpoc5m5Kc5bLAw2+IU2Q/jS+p/RPMO/v5zgCEr9aVPZUAijTgXQRJXy7Q3yuvbNsyo
         Lz+Jld4aKpv5BERlqctWnKNcmkCsDp4lekVoW5N2pnUHofKl4o0dZrj20hJhsl6ORo/H
         ncherQYtm26tHMU7HsIIeR2KzQDijNh1DDaaeiChvp+PDO3RB91Z9jb7i6MnHfLqNKag
         G1T40S/YchXvNjYkdaUPiZMtuldbiyLS2fDFEkxIUmFs8wxlhq0uuI7gX3sL28oD/Hlf
         qHmsy4NWqdmzGndKgVMe1mMBMP5Rg7Wp3y8N52zAEtaFMkUJZ+EuICxWt6GKJHJR9nvY
         TrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708558926; x=1709163726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YvOp898aubJjbKRrUpp3NGfhZc4uwca3cNw/pQSCCE=;
        b=KQx1fsFEMBQ2WKtObJJmpBpU/Bx18SoyWTvIHDiS1MyMAjNICadcD3lp2u+BbGcYm6
         2L7b7OzYFOUBJxBemrFSriKs6kCKMicvKkn9WPtSe4nS6hZ6xTUAhG/etK39/xvlPGqE
         wM/m8ZzpO8m0OqeAg2Ty5pjqoW1AfG9if33slwLJUx+ImFybQfqecvrxSuAkUlFE8Gxq
         imz5EmLvdoSBIpevrQHnNb1pVGab9PWmcwNMKWdDM+RmMWsLCpLlbBbkwt1+lBZ1qfc5
         cUOA7hnGQCj4QRgejuHaHkgGRmxJwlUhiuh9ISLq8LadsfVP7yvbLp2FhX2zh57ToYeQ
         Ky8A==
X-Forwarded-Encrypted: i=1; AJvYcCXlGGH319Uf+TDp+YWjaA6YNT9ApXTD0jFYBqzEYA3cCiaRVFjU6CkiRCXHXS9z2BttMWRJ4vn/7+IMqQqSIVy74ZdVNjqRuiqQxOmMaltJ/3U=
X-Gm-Message-State: AOJu0YxbyerEBzJeqtzKjsfOfiMsWkA77Np2yceEQGga9AS7D4+PeClv
	urujFuc8fg+seCYuCZ97Uj1tFAgfUHB+TMQn2cakaMy1rcm7EtRvp2ay8qEQdJvvZuxGMACoTZa
	HLZXFcNMpEYz51gEqwOZrTRaiOwCg26oamPHpRqBEMRZ7jxWW
X-Google-Smtp-Source: AGHT+IE7g3qCDVff+W/CzfLEO8l+1aNVMFbNxg2BUH5qBAPDXU0ZojYsMYxoP7Sq3tZtsKEdt3zrgeBOx0yZNKS1nfE=
X-Received: by 2002:a81:a103:0:b0:607:85b3:b52f with SMTP id
 y3-20020a81a103000000b0060785b3b52fmr20920543ywg.22.1708558905505; Wed, 21
 Feb 2024 15:41:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
 <20240216223245.12273-8-semen.protsenko@linaro.org> <8c1f0a4f-8a8b-41e7-b7f1-4c5a38ec7c1a@linaro.org>
In-Reply-To: <8c1f0a4f-8a8b-41e7-b7f1-4c5a38ec7c1a@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 21 Feb 2024 17:41:34 -0600
Message-ID: <CAPLW+4n6zA9=1ZswySPE7MmpbV_f99bi8OM9zawgST=XRDSyZQ@mail.gmail.com>
Subject: Re: [PATCH 07/16] clk: samsung: Pass actual clock controller base
 address to CPU_CLK()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 4:53=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/02/2024 23:32, Sam Protsenko wrote:
> > The documentation for struct exynos_cpuclk says .ctrl_base field should
> > contain the controller base address. But in reality all Exynos clock
> > drivers are passing CPU_SRC register address via CPU_CLK() macro, which
> > in turn gets assigned to mentioned .ctrl_base field. Because CPU_SRC
> > address usually already has 0x200 offset from controller's base, all
> > other register offsets in clk-cpu.c (like DIVs and MUXes) are specified
> > as offsets from CPU_SRC offset, and not from controller's base. That
> > makes things confusing and not consistent with register offsets provide=
d
> > in Exynis clock drivers, also breaking the contract for .ctrl_base fiel=
d
>
> Typo: Exynos
>

Will fix in v2.

> > as described in struct exynos_cpuclk doc. Rework all register offsets i=
n
> > clk-cpu.c to be actual offsets from controller's base, and fix offsets
> > provided to CPU_CLK() macro in all Exynos clock drivers.
>
> Change is fine and makes sense on devices having separate CPU clock
> controller. That's not the case for:
> 1. Exynos3250: dedicated CPU clock controller space, but we merged it
> into one driver/binding.
> 2. Exynos4 and 5250: no obvious dedicated CPU clock controller, but
> register layout suggests that there is such, just not explicit.
>
> In all these cases you provide not the correct offset against explicit
> or implicit CPU base, but from main clock controller base.
>
> Mention it briefly in above commit msg.
>

Thanks, you are right. That also means the .ctrl_base field (and its
documentation) is incorrect. I'll rework the commit message and the
field naming to the best of my abilities in v2.

>
> Best regards,
> Krzysztof
>
