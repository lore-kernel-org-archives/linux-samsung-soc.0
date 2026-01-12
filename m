Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB5624A06B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228213; cv=none; b=R3kTSJsWN9R0da+9NIPtAhjZwWD7rndJzzzRXR8r6tSgwMEckY5/uR/oWpUGsfj7gY4KP/6JeoVpAiSazYOU+DuQ3xoHqYbhhLhBq3+g0i+rumlfANiMgxTPrM+PauAUZTgwsi+HA6YYJt/qhXGSxJ9Wcm3PYEzCp9C8zt6sHkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228213; c=relaxed/simple;
	bh=DYJcZRRmdEMSPPmAFV4ygUc0KtR2ijewql1crILf5Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yd+1wfgBUMCjK4fyVJ226EbLGc7XHEJajwBycRZ/BLtvf3RpIzwjRaQuy29OemS9BtuBb8jWdDmQX7bDaRWKOceza1QcxUdd2WqNrlqXybmffmK6hmBupgNMIJIxkgYLQ9GSOLkjMeH+j76DH2DmdtlVTi3k0dIrR7t6eBzC6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUM29w91; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUM29w91"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ef5c04151dso1116306137.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768228211; x=1768833011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYJcZRRmdEMSPPmAFV4ygUc0KtR2ijewql1crILf5Fs=;
        b=HUM29w91GQeTA7yvCw+Q+BlMJL2b8+enc1dLVPnv8NTufBvlmcA3HGD4SntA9yaiRd
         t1uJPbYWIW6LEI3lgz4o7z78vu4Ml2gZ2R7vCyM3K+gRPzMoHYYcTDaE53Z4N4sqzJxG
         YjX836cs+uD1A2KEYvv1izhd/fPh9D6+hXrGDtnGNfj03vk6CVWYrTidXzs6LfgUSURm
         S//CjOw25USqcwLTS1yUYl/5Bq27KNT+iC1XrsNJcIatV1jQM6aO8BTXewiENdLLuUpl
         AecFxtbUZoNQzb3YhNVF2J/bqkoHLiL1xtCc0/5Rf4XMNrJZREeFd7odLaPuk2qnqcnN
         YOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228211; x=1768833011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYJcZRRmdEMSPPmAFV4ygUc0KtR2ijewql1crILf5Fs=;
        b=PxjSfLotq+6+BN1eoqvsbH0sP9Dm59ILDdm7+oCpPTLlXTpeosS8cKW137RhuqNy1M
         qjxUZd+jcqOecgQ8i4NMOVfzaOTTUvvXaviywStYzjRjfvaoc/QqPifXMAWRW5Hy1njM
         63lwHXdkKS+tJ3sDyjC3Uzc0DAIFcnlSZZeLHPfSGxNHfjFxwiVsFckTbZDN3aT8BaG7
         OpJe348pENqKpZ4dIJZOOgRgkagJM07qAFgxvWdNNi8q/VzUNfuG2auhYrjJKlJuGySn
         FCbrbto+FpNEAhUTcEmrOZF2HC6/y55ca/xibQssczjFpp81q/VXY04b47vgOufzRxRM
         MlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAPdQ+G0KVs1lAcxqeaI1+w9tWwmWqV4lMdRJHiRmc5pIsD1aPTMxJYV9kd/XCNDw2Eohsokr7akP8hqD3CVts5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv6wI/mcLLf91gMPlxuufv5I7Co8KLCpQVO7FA7Nw5FGImAESx
	BQh8d59U5us5zkgh5lMgmv9XGmgC9xMkISKTilynijLLDZg8CmyajmGnFo21dVgU/QsNexDGKNY
	oPWvOvyCMqpvVmIt13s53reJtdRfNJouekcul98aryQ==
X-Gm-Gg: AY/fxX7qiyNjWnSUKrztD9uuLlmUeOHtDAw0RID1bK2ZuQ2WFqlfw7uqurvkv93frcA
	gvz9xarbJm4rFVnd5u1FYX1dZytCWJThCXAjJ5Pf+UwLwQmgEJCqxmAJhNRzJnIDZPN2DGGo1yV
	5grvJscSA3xFNc6+qXpZfwTLC1eTIKVYJb5LepnP9lPyLlk0oh5KnKUI2QDmruaVKiLeJNd1Avp
	L73B9wAYDGxjLD3xcdY1MJUueXqr4bCRhndjTMrb+5KRWsQsfk67aMDL18JAMSX61pZXtW+CYZm
	Aap2Lx0P9K5uAGQGdBJmk0r8cjdGsA==
X-Google-Smtp-Source: AGHT+IH99W7nwLgEet5FdEP/u+i5jdZDgClsT+5CiMOQ1spY+a7QdU3aguNyWZv64H0AdvbI4admB5ccZbM6V9dJafg=
X-Received: by 2002:a05:6102:8088:b0:5dd:b2a1:a5a4 with SMTP id
 ada2fe7eead31-5ecb1e731d9mr6591509137.5.1768228209479; Mon, 12 Jan 2026
 06:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
 <20260109-clk-samsung-autoclk-updates-v1-2-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-2-2394dcf242a9@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:29:56 +0000
X-Gm-Features: AZwV_QiWt47PILn4o1sT2KySNxv4rOargBnbBbiIyWb62OAi4o7lAfW6acLnscA
Message-ID: <CADrjBPpiMxNsHMnV8StHvU7waW3QE7jtAPK3Gyq-j0mVRQrgnw@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: samsung: fix sysreg save/restore when PM is
 enabled for CMU
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Juan Yescas <jyescas@google.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jan 2026 at 17:27, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Currently, sysreg registers of a CMU that has PM and automatic clock
> gating enabled are not saved / restored during runtime PM (RPM) or
> s2idle. During normal suspend, they are accessed too late, after the
> CMU (and potentially power domain) have been shut down, causing an
> SError.
>
> The reason is that these registers are registered to be saved/restored
> via a syscore suspend handler which doesn't run during RPM or s2idle.
> During normal suspend, this handler runs after the CMU has been shut
> down. This registration happens as part of
> samsung_clk_extended_sleep_init() via samsung_en_dyn_root_clk_gating().
>
> When PM is enabled for a CMU, registers must be saved/restored via
> exynos_arm64_cmu_suspend() / exynos_arm64_cmu_resume() respectively
> instead. These use their own data structures and are unrelated to
> anything that samsung_clk_extended_sleep_init() does. Calling it
> unconditionally from samsung_en_dyn_root_clk_gating() therefore isn't
> useful.
>
> Update the code to prepare sysreg save / restore in a similar way to
> how it handles other clock registers in the PM case already.
> exynos_arm64_cmu_suspend() / exynos_arm64_cmu_resume() already handle
> sysreg save/restore, just the setup was incorrect.
>
> Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode=
 for CMUs")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
