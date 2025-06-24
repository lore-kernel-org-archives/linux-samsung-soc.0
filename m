Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BCB2EBDF0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 19:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794100; cv=none; b=iv9Pqk3+DYfQMoIbwZ0IGWELj2yrfuJstQopkANDCgGln4QXIuCUknH+0ygMrnr6bpbbR5kW8/sdHtoQ8Nks/IRH0FHgjDmODDXsTN6rAkvIlEh4tfhjUMztpCCNrGZENojjZsF54HtCVzMPy3+BVtSdhyTz1wd+/UV71UgR6fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794100; c=relaxed/simple;
	bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIfuZvkaW9iH0GaCxQbGilzl0axK5qHM/4lodOU2dDn9W3zou1TD7QQNk2sDxOvOyu0/BBpGpGDX9AlUf91Sf5QCCCRa/QqyLqhwRXF+aWvEG+57MvEMcrqRbfJyx4ol5+vB56IEydfAtCxNHS1dlP0pWG340tEYiioNx21Gico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TYt+v66u; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYt+v66u"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-310447fe59aso72183981fa.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794095; x=1751398895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
        b=TYt+v66uVRtdBCH9H4QW6IdRV6c/mtAgiEKCU2v/jOAZP1gJ1A/c5/GLBlLxt7rdiO
         AutgSujhqabyUhE2uifVgFIZ9/6zpUAsIgUXgUYKRh/sB90YlempQGeq00/4ERqNCBWr
         enb9QwoEC4r8SDamuq3aZh5kZJnzN3Vu3SnDdg//2EOu55sw/6ZzlBXOq6L34r0/CzQt
         Lv9Q5KSzOLsg8gqwiXQEFcdOKmo8oMNjAsZGm7FaPRXrCBFtm8dnTvqkyIbaemVY1wlQ
         Gr/7OuTfpPuCldYQIYA7fCZuXCHbgWuHfTXem+gfFHKDcvoGCqQgjMOnonWNsxP6epzB
         oaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794095; x=1751398895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
        b=XmeVWe67eco05WrFtE9RXmp70s8LBr7eNE2mqmkw0M5F5Oq8pKp4OHUdC+lCyEJIGB
         iAB5WvFt5+J5BWhPeA5YBptyncYPfe82Jgw2mJF9v8F4BPJtfdwDXoi3meUk8bRKjNs9
         JCRVtG468t4/XupX13PDF3aP2pz9kGbfU4VZWLJHSO0KhEPDBNMXfRsUI93FW1nxPwLt
         hO5LLlFLS7KIWZMGy+eY3htSpIwNjwHv8JX4c1QHx25nE7gpFCT+LjJlroj2NWc7UHbU
         avSb2eLFOkLRh2+IJDftSlDb3G90WQ/PSPAZc/AAlid6JATBA7uaMjk0DUXgUZg2dX10
         5v0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPGvqbit/wy2KcEsh/UvJjunIFBTXUR6J2Sam2VaF2qQAmUG8Sg+ZuBTm1ty/csCZMoPHM85n8baTAt//ogIkjWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8WKg4vUmYSIvFxdQOg9epMgdb21Sn1vDUo9c7hVfdOYypX9a
	BsNooZxgDgAkiMNBXvXjZdsGTlEFmB4Sc0AKVwlnzJFnGgfRzoCgwQvWMQO5wdvMDU0BMV7tdnM
	INw7y6wWm4eE1yv1VO0ALLX6u6s2hyo/4xVOfOzDZcg==
X-Gm-Gg: ASbGncs16aVgko2nnydwNOD8UgaYams2eyMzGbbRgB30/IxtCz3GjuO2QFFk6+oybuz
	JEkDFruiqxWb7DHlimhQCjByw/9BpdJWo59+tw4+gKnOE+VO69tvSWd2n6UaefxhfwmipOpNUGU
	3ANYQsI6HVMax1eEVGZ+irVbY3SgU5GjQZQEvneQKzHt4=
X-Google-Smtp-Source: AGHT+IGgAuc3iJtRYb+OK2rDM3TlkSrDgGEbgeVIFtkTDVdAbZ8WB/KP/SQ/rIDTOfAZi97Vwex02jPn22o+QO9h4sI=
X-Received: by 2002:a2e:a4b6:0:b0:32b:8778:6f06 with SMTP id
 38308e7fff4ca-32cc64fe7edmr63161fa.18.1750794094847; Tue, 24 Jun 2025
 12:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:41:23 +0200
X-Gm-Features: AX0GCFu-CBprmbPmDb8uoIG_yV6pNxQGi2vFucZMy5qL34U2BG3ecQIKj4_p--o
Message-ID: <CACRpkdbG9WSuErEvcNGnt6bSqMVk31PuLGykaLw8XToVFnAc-Q@mail.gmail.com>
Subject: Re: [PATCH RFT 1/6] gpio: mmio: drop the big-endian platform device variant
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are no more users of the "basic-mmio-gpio-be" platform device ID
> in the kernel. We can safely drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
