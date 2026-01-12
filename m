Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2152E261B9C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227774; cv=none; b=u/1o6yUVuOeSDZgmudbcm+zJIL5G34WcWnVTtnVcOJu9+ZUATszhF44My7r3aLtYdiRK1leURjdFB3aohuJjEvIP/zYpfHbggO4wz2qlhCr2nRX6Qjo7ngmWQaM8hYqZ/oR5FZo/+z19f+g7ACBTqkUdqdNUmPUkKZ5eTUCYiAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227774; c=relaxed/simple;
	bh=/R2fMo2K7fslFxoihMBkpzJzSmjn8g0vMl/pHIiNkKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9tdRfMVXjwFmp0A9rmpBHmDsy7cBFJ3ED5BQv4XCFnyTkhsdw2CeMePgXmD+Z6F6DPSsQPjsvuviz2tujS6kChSKiW/KJDl0pEFEKpN66ZUteJkZczGKmZ5bonFVkkU5eMdlMZWGgYdf3vZbKieC/0GjfwojXZ8TLJkbYxdzj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvkZwNu4; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvkZwNu4"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5eef115c781so1572217137.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227772; x=1768832572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R2fMo2K7fslFxoihMBkpzJzSmjn8g0vMl/pHIiNkKQ=;
        b=YvkZwNu4cY9uOPmaGckFZv8jb6K4FWVAN54/tfRlOEGGwMIPvX6oNd+1JV0Nnafto8
         3pUN0Dn7e6mkEmXw97xuNY2seLqn5dvimiZK6iUDzyAgWWHzZMGJvhi4l6P/SpfIxkW3
         qjN3ZnYqTs/P0jKgM93xgp6pQ+T2dvKTpMm/XJ6F2H6ZokqhziQJQrMGPrCbH9vlVgVb
         UO6PGvOoKmnm7LZK7Y1Nw6TujSLslmBYclpI7xCtKDktONPSspUk50CWqLpJxg9s7xyN
         +kCgCl22gS4GloB0PuMToi5miEOzaYhI1nw+ptBn2MNILxekscOUV0o+8IdpUaFqaw99
         Mi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227772; x=1768832572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/R2fMo2K7fslFxoihMBkpzJzSmjn8g0vMl/pHIiNkKQ=;
        b=gKRqPdD7dvcXPponPiUsznQUumuyE2t6yPX/S0WfIUqj8QS0IX0b249G4O5azoddsG
         2YJXQi6s2HoLPtWgdLkgFMJlnqHBpKPBhtGYbuFaBW+wr9LNdRGxV45adWAo+16znNpd
         cVZJwRdtPjNQjZeND5IgL5S9Ge0wgufwqlwMY7Ie0/wUSS8GvgmGNLM8+jsoDh0wjmUS
         Bs0sDcRkpISt6H/l97YQNzIa6JJus7n0t4iCSS6YPMBqR7z+/8f1BVIu8F/bnr2SohXQ
         71Tr2HS6F8mlFvNW05rvyifLtGMy/BJ1RhUGImOvMtkfb6Ad5ah/pSAIa9PyHP1+9va7
         6wqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8OsGDXiwgas/IFp7Vc5lYvc1Xuk3MSFgTwdQvpExeYn6YedMvK61UWLXJwb4LI2kvuijA8/UYwNO6V8M3CCqUag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMcLgt64pdL6urbWvJgRVt/C73uqzF4qaFo1SkBrd2nwqaXvWi
	nmM2pO58eAkIvt/IzGfBpwyczkf/trnDuogshZ2irc8Qxd0IaihoyZ/rRnNLPXXZUpeYt75KOaj
	F4hp6v55MRF2ru99NN39Vq6iL3kb9Y1/69awDa457Vg==
X-Gm-Gg: AY/fxX5c6K2fsqM71hZG2YvfOHBkjMQv8tY8IhWgC/lcnQMsjAIe7rY3bSOJW6ajND+
	hEDEIcsmC1HQNpTmhnIjzB87GnF/c/mkCvuii+N//6JV066jFhZzmYzlfkstiPv15PJRL+dEfs4
	RHzGl+X9jqQQQRC13swh/vA5uwNvgIq8zVFgnWXUk3mbhXaBzbizLQD7ZojkJdTiniBVA1LRMrT
	abR7oeJVLQn42SR/Lnf3bJmoQUSfGqZi6O62+G2HLlug/IGmiVSIEOOGn8A7z7WVB36ffRQsUmz
	ZY73rl4qvom/TSlM29sZmblr0yXOlQ==
X-Google-Smtp-Source: AGHT+IFa3uP73sKTwXvKWrh65KpYYLhONepO2yhtiz6R2pvhmfRlUTjI4ifsl0y8t5/reFgRMiV/Pdv5o+0tykFNm7Y=
X-Received: by 2002:a67:e704:0:b0:5ea:62ee:1b5b with SMTP id
 ada2fe7eead31-5ecb1e924a9mr6520896137.10.1768227770485; Mon, 12 Jan 2026
 06:22:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
 <20260109-clk-samsung-autoclk-updates-v1-1-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-1-2394dcf242a9@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:22:36 +0000
X-Gm-Features: AZwV_QhvEXr6GUxPXZ8zhrOsq2grsq3qSCluicx7SScTHv37UQRTS1YD7I721QA
Message-ID: <CADrjBPq5R25QDzqzeJ274DTCpAPfjBFQ=c1szVzYj7rBOC=y7Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: samsung: avoid warning message on legacy Exynos
 (auto clock gating)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Juan Yescas <jyescas@google.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jan 2026 at 17:27, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> We currently print a warning message that the IO memory size is not
> compatible with automatic clock gating for many Exynos-based boards,
> including legacy ones, even if not requested to enable automatic clock
> gating in the first place.
>
> Change the test in question to avoid that warning.
>
> Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode=
 for CMUs")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@=
samsung.com/
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
