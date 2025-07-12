Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9647E28D8CD
	for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Jul 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752348432; cv=none; b=dRh/IwQWzti2oQmD71quYQNyimMUn760I95KP/mbew97mhKozLZX5GOmCOwT268QuKxLAAcBPhOXYqMj73toBCkd39+NI6zuEjJnLVA6AhZFxy3bXz7W33XX4A+NtOwTmym2U6B1LjhnfSlY7I3wq9bxA6zDcoxyZCjvHUaAGgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752348432; c=relaxed/simple;
	bh=/hOKuusE5jMFtwzQjB1VDvpOrtRiFiTDNJiNJFK2Dmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGyQRM6tJpzXe4y7IfcmfSEh2uwvMr4O43EYOtjASRVaCW6HeQVr91uncrpJ+4AZ6QAu906o9PZ3/h/CgIXWZIErf/eDudE0YeWct2/WowsKTHLtaBgaHrKzAVqt5wlNOz3pVJZhqoVtBsKUOzbeRuwkk8/MIBC8jqjAaPT7YbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WhaAgGSX; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WhaAgGSX"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b5931037eso23539371fa.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Jul 2025 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752348429; x=1752953229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmdrDokSvSEbkPXVz0WTUYECUUDrY3dIue4l79myHLA=;
        b=WhaAgGSXAZ2GkhcFDEsP6qj+RKcZn8+l/TjHOEB0rc5PFabu3pbbhJKkKcGNOjN/XS
         x58mToAJHF0fTCi79Km1iUhMdQ+WUraWoGTrV6zDdtnYEbpGEWWOFfyT6KxCX6fc0kJj
         rX/Et2DH8vPoHqnQNHUQf8PRakWhKpNMuI0W5PH3cU4JgL5REt1UEcWVvEgPMZyS6E6n
         Msv1LhhXTSFkn3sCAJ0GXDhVH2/g0xUEaEFG2qcVjCBhSEe1a3qQ08SrV6vv0obAIEvt
         J9SY5jzLcS1zzrg+9ZvcX6/Vq9e5o8fJoRMTDoldYcsHjtlBjezR2yapWFfJHIc4wUtH
         a2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752348429; x=1752953229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmdrDokSvSEbkPXVz0WTUYECUUDrY3dIue4l79myHLA=;
        b=XM4ZnaCt7Woa1THog88iD8gDtLBGe5KfUrszZmrtte9HT7ZGawbzfvDMFhKM8Hd+/J
         ufy1l+Rvocs+nuGY+VBHnCRd07vhPBr442D580rT+ewH90T/FVEtJgipaf7CLzbVOxnv
         hlNHyyy9uyPrUJ6Q+UWlMPD7RPNu+se0lloi0fHJcPWobXHvtLzQnMGvJ6Bv+P1XKQD5
         fxP7bJ78ffmooip52J55LUTUf//ukvy3URMXwjZwqB9cTbr1SeZhF/kViif+HPtibheG
         5duDchRH1L6Lt/0MU156dfx2Bl55dK2C6effG5aQGzBQOXeXHl5mBUmSEUmY38Zl5/yu
         nucA==
X-Forwarded-Encrypted: i=1; AJvYcCXRVewyQiyon2uSZugJ28kTWLS/01ooNNEBlseWPO1oTcFy80FdPrkLGg+7Dj5pTYN58h9apwcuQEpx7D12htIYUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLC8i9/XJML/PzzY4lnJxlz612vN8Q4t4QYENbrpUcJf6Bnnmy
	pNtyYhTPu9UT0Sh4elLogo5pH/86uKuK5ct8dfNgaQGym4Q5T/7vdi8M503gfleTFV1aOUDPatU
	9F17Zksjfx38jH1J6nBjhh/upxxLJwdM76m8ZhYf+ig==
X-Gm-Gg: ASbGncvZj24DTU63xl8dKPULYqDB6/CFHdseoRI6tm1bWplaxzOoca5WfLezaynzRlG
	TSHqXMB+FJJWQBCf8McrnuW/SOedhb+OtTqeU200ym0REBGQBej1k81xduB6H/6fay4PUq+8IBE
	TmrrRSIxLVP73N+5kJUJvvRTg6RQ1fZr62cL/hnz1tkehk946RPubcdi1PcBxwmryBEENGg36bV
	7y06a4=
X-Google-Smtp-Source: AGHT+IEg/39vWPjh633ZUj8UqZLuNkeQ4zJb+DeEXqhdOGqkb2UzJv4loDelR2kMaTSHX23IkdKGCBQxVkP3ySeashA=
X-Received: by 2002:a05:651c:4ca:b0:32b:755e:6cd7 with SMTP id
 38308e7fff4ca-3305509f9c8mr19310751fa.32.1752348428638; Sat, 12 Jul 2025
 12:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710002047.1573841-1-ksk4725@coasia.com>
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Jul 2025 21:26:57 +0200
X-Gm-Features: Ac12FXwfRBs5js5oSquCaRb4DKz10a2pVgF5CqiS_5Na7OWkjOlWh-jR8X6bLJY
Message-ID: <CACRpkdaxAr8i-AByUsxnBmoSNtEDvik3VFvxAzk525GD=pH97Q@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
To: ksk4725@coasia.com
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, kenkim <kenkim@coasia.com>, 
	Jongshin Park <pjsin865@coasia.com>, GunWoo Kim <gwk1013@coasia.com>, 
	HaGyeong Kim <hgkim05@coasia.com>, GyoungBo Min <mingyoungbo@coasia.com>, 
	SungMin Park <smn1196@coasia.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, 
	Shradha Todi <shradha.t@samsung.com>, Ravi Patel <ravi.patel@samsung.com>, 
	Inbaraj E <inbaraj.e@samsung.com>, Swathi K S <swathi.ks@samsung.com>, 
	Hrishikesh <hrishikesh.d@samsung.com>, Dongjin Yang <dj76.yang@samsung.com>, 
	Sang Min Kim <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hakyeong,

thanks for your patch!

On Thu, Jul 10, 2025 at 2:20=E2=80=AFAM <ksk4725@coasia.com> wrote:

> Add basic support for the Axis ARTPEC-8 SoC.
> This SoC contains four Cortex-A53 CPUs and other several IPs.
>
> Patches 1 to 10 provide the support for the clock controller,
> which is similar to other Samsung SoCs.
>
> The remaining patches provide pinctrl support and
> initial device tree support.
>
> Hakyeong Kim (9):
>   dt-bindings: clock: Add ARTPEC-8 CMU bindings
>   clk: samsung: Add clock PLL support for ARTPEC-8 SoC
>   clk: samsung: artpec-8: Add initial clock support
>   clk: samsung: artpec-8: Add clock support for CMU_CMU block
>   clk: samsung: artpec-8: Add clock support for CMU_BUS block
>   clk: samsung: artpec-8: Add clock support for CMU_CORE block
>   clk: samsung: artpec-8: Add clock support for CMU_CPUCL block
>   clk: samsung: artpec-8: Add clock support for CMU_FSYS block
>   clk: samsung: artpec-8: Add clock support for CMU_PERI block

Out of the 9 patches there are 7 patches related to "CMU" without
any explanation or even expansion of this acronym.

Camera Management Unit? I think I'm not supposed to
guess. Is is an Axis-custom piece of hardware? (Would make
sense.)

Please expand this acronym and state clearly that (if this
is a correct assumption) that you are not supplying any
bindings and even less a driver for the "CMU" thing, just the
clocks. (That's fine the actual CMU can come later, but
it should be clear *what* it is.)

Yours,
Linus Walleij
