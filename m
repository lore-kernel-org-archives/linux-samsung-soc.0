Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B765199
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532864; cv=none; b=k54YqFyuCfp8z+QNgkSSPslAz8HmZoCv7o7Y4uJ+5+O/sGsu+jzAjb4W/3x9PozcMc1RDxGakBFQ0CAm10zQtPn/2AhtSaiWxSrA0We6YO/4xKmWn174K2FuOzfpX+Bm3AxXTFAoJCIGhcnpoiLQiJiHEgKjCKws8/Eq3BbXdfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532864; c=relaxed/simple;
	bh=9fhnjxZ/Z3eDiIl/YeEMnJ3S6KNDkcBYjFwOq1E+8ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVMWybXHTIH3QDbT5oHjRvx0eNiTrPlBhLR9eeC6W6B2xIDojXmdNcfziQE2UwD7c9PIaN9ik4thZSonhjc0Ro1N/mc4jl31EfcTwlbh6pXBFEIPRI9LmERjWCYZojC1QTEjiLujMgMS5WV+GQh56Lv9QEy3hLVryGcvZ7mVvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yo0ueFqH; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yo0ueFqH"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d2a67daa25so1243097241.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 04:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706532861; x=1707137661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fhnjxZ/Z3eDiIl/YeEMnJ3S6KNDkcBYjFwOq1E+8ic=;
        b=Yo0ueFqHRTYnDfScc9XqOUMKIcve+GHSNAzBIaRpd52Hx64rGuutlG/0eOm92u5Ykl
         w5kvcRd5CkalsJEiHMvXO38tuZsK5ExSv9U+84eltOVthjzZZBg+a0ax8J3gvXrKUzo6
         5trF+Y3vklfuuB9ujtasvkP4Y3cijekQNdEZYLiHDd3voWxLyGhKD9CSBb9gUOw29Vuk
         1nXrnFsYJU+Gq7L3F6tOH6qKI73QgCYz3Qz7cTPnVkPmpfm8Rw92XpYoueRw5lbLg1ja
         +9jcXdSoFzzOWCSG+bw49VIErFndeAdOfV5ocdu6LmsZCd4VlrPc/Zcpq3DzY0Sk7dw9
         TPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706532861; x=1707137661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fhnjxZ/Z3eDiIl/YeEMnJ3S6KNDkcBYjFwOq1E+8ic=;
        b=oUlvs5dt1to+A+KzKgNVDWWIrQDiJss5uf/2XpNd1AtUQcpgPLzY88Lu6DKm1MqhuT
         e240/jBvfMxDD8cLLRR7IH1lg5yJgceOP8p1vLET3rX+dbpGFpbBaxWv+901YeV6e9vi
         8z6oJyaSc4hQ75g58Ayq91MGDQrCSkkXEHTs6beWjRa5LWmGVPKwjsvYprw8Y53CeaNb
         BZP/X9TxnApb/yEaD46d+6Ae+4pLKOLlSt5flZOn/TVL+8fSxFOfmALPQYfVYy1Sn9xr
         2ygWKHR/bzeC4vY4E7lcAX1ZZm3Bk4gLEAVM9yHgdIKryACSWp2maxt83S8JrfBJcRDC
         MEyw==
X-Gm-Message-State: AOJu0YwsDEeIU3tPJ5ZbQ/nGIocwWwkxV4ClA8ZV/bhbfXojUK/EG6Wb
	hlJUzQzWZp8BcP32YbAnV/zBBdtEq/6vOePRZ/TaHcAahka2YElGlj6M+UHQeE+Z8YPg295pSCM
	oyBIhJT/5woWn9lyasR2YAe3R2ViEZ/YFbDCzpQ==
X-Google-Smtp-Source: AGHT+IGPu8IxPwCZdmDI+aLgUZ/+xyElq1oXto8vc6/h7JrJnAJ8UG3qkg/uKgc6/g7pLgSpiTY7msPMtetgCHtV67U=
X-Received: by 2002:a05:6122:2525:b0:4b7:8199:5d11 with SMTP id
 cl37-20020a056122252500b004b781995d11mr1970096vkb.8.1706532861322; Mon, 29
 Jan 2024 04:54:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127003607.501086-1-andre.draszik@linaro.org> <20240127003607.501086-2-andre.draszik@linaro.org>
In-Reply-To: <20240127003607.501086-2-andre.draszik@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jan 2024 12:54:10 +0000
Message-ID: <CADrjBPpabnoOUBcq=wyaWZdiJr9jmHadvqvtj0Thvo8qQzWD=g@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: samsung: gs101: gpio_peric0_pclk needs to be
 kept on
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jan 2024 at 00:37, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> This pclk clock is required any time we access the pinctrl registers of
> this block.
>
> Since pinctrl-samsung doesn't support a clock at the moment, we just
> keep the kernel from disabling it at boot, until we have an update for
> pinctrl-samsung to handle this required clock, at which point we'll be
> able to drop the flag again.
>
> Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
