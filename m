Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FA421B9F7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2025 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741357792; cv=none; b=PJx8n2kPfhA/i3Zx4q7xlzLHUUY7IyTohpQ3sdrv+yVnPf5g6+6WMmEKvVv8cNrb3OOJMOMUWcMl3C6eC/SHI/quYgOrPDpgxavLF7ziF5qVaAWURKqfZPW6p7BZiuyM5oheQNe43VouE8jAleaBKhVqVkK54L1eLqfPjWv5XmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741357792; c=relaxed/simple;
	bh=YIOMNLEjH69nnT403tSpw0NEiiWDGz/NjC6xURZwUgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2NOCfa5d92ClBmHu8/UIapkThn2+SEK+p++HbXADV+E36VYQzBJAnV8WfrNaU4laEO/LAh0FxVSmJ6u5XPnXgkSyThqhqShX6/dKKgc06zrYbVP4hDFt1CXKqEutSX6DRX/X+r2/kioYTqiz+kwqhcROYsV5o+ThBfnhbODyig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z17HDPYr; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z17HDPYr"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-60029342c98so1102215eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Mar 2025 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741357789; x=1741962589; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YIOMNLEjH69nnT403tSpw0NEiiWDGz/NjC6xURZwUgE=;
        b=Z17HDPYrBl1PNdX/ewmZy6IdED9fcVJZ2LQkj6dpDn9tW2uD2Ow9fF++eoNxZo84Vh
         ZGaC9ww8Wqn3pyxx6TTVirYuSUp2kPjY7V2aWQGSuhh5/k65CGGE4ueojhqEI488Jm6Z
         PlneGRRs8jGrjY8aCmwdeLUSuQZqWATgYzLEFjpqrjhP0xFOf4mfD3CDa6OH22x6n8mB
         z8Id0jYHdeHZ3Y0iIWD17y0+tOyu0xxZ6P1AOuzDbGQ8fMSs7NwBQZc/cMBrbO769u3k
         tygQ0wFkeO/I/nqpMzZXxcrnw8xPaqZImG2litFL9HhkY6MY+KDy2SZf3Mzu4fkIQTM9
         Uwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741357789; x=1741962589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIOMNLEjH69nnT403tSpw0NEiiWDGz/NjC6xURZwUgE=;
        b=jGKbWAe0ZoaTdkfYb6BZJQblo1q6msLyGjnsBdmahcqqsgmtLgnkaHHS3cwuBQm0Ys
         NFQieOtGscMAGwmZg26rtgNnVdy5g9tHj3HLFJWsnqRqWOajPYTB3kOa1lJqPpPVCs4i
         halR1D4I90QpVetH8TfbU3ihTgMaIsKkp3R1L5BKLbO1fBlQkRTm4V1+03u+dnpW67lF
         Vy3A1BmXh98GdnHkRFqvplBdeM6aa62A1DM8Dhd0jhRz9okYte38S25F2vNMgUC5wi+/
         g2Uhn2YpODYKIta8GVJG61WpjxD6oaqC/NOXM6qBO5TMjF7p8AvfKoEj6JLDfDQDLWGw
         2DBg==
X-Forwarded-Encrypted: i=1; AJvYcCVZvSc6UuHuLOd/PiVIQjbqNBxv1df3+ejy7BrBRks5EFTOgJrYaf1dp061ggPlzZKrKFSykbcU/7mgcuPylAhC7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXDsklfKE0F/c+y1M4TX+ZRHEBvKqbPj5kfw73p+oemdP+Kp3S
	K66qiAfTmj9LLsMc6+CRJ164OKsWz5T8zbk9GaMCGMPRqlW6fRmWt6en/n33m9Cjdt62rt2DbvD
	yIdQOxOUfruyqRnoBzGNHa95O/Iiml2aL6QezEQ==
X-Gm-Gg: ASbGncukBXwB76D/HWcooVg50hGDN1VxuSnX9g1TFyTWpwStzXPID3rMMfRltOxcbmv
	Jv+YoJJlWwIoIWnmcQKgZoUi+kBOw4tWDWpVzlO9Rdi0N8TjJVP6iW0QaH1FHihwEGWSuo6X7Jq
	0TEUkwgyRPj3juX/xTOosUhRb+mYU=
X-Google-Smtp-Source: AGHT+IGGmn8xLMWajxv8ICMHuaMrPUNcMWpzQrq5wZQhGe8IYs0letUmBAshmOVmzeAwyTeMZx2VSjL3a/o/8GUoJQw=
X-Received: by 2002:a05:6820:2709:b0:5fe:9fed:f391 with SMTP id
 006d021491bc7-6004a78b8f1mr1708857eaf.1.1741357789463; Fri, 07 Mar 2025
 06:29:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
 <20250305-clk-samsung-headers-cleanup-v2-2-ea1ae8e9e2bf@linaro.org>
In-Reply-To: <20250305-clk-samsung-headers-cleanup-v2-2-ea1ae8e9e2bf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Mar 2025 14:29:38 +0000
X-Gm-Features: AQ5f1JpUppE0sfHDV86NNTwKvteo5ZV6XyAd9bvAyX6uA7UR9Otm7vbstJwPknw
Message-ID: <CADrjBPq3CA97cGopuCFD5BrPH8KnM-rsi7vMC3w285ihNDm40Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: samsung: Drop unused clk.h and of.h headers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 20:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> <clk.h> header is for clock consumers, so drop its include from the
> Samsung clock controller drivers which do not use the consumer API
> (there are few which do, so leave it there).
>
> Drop including of <of.h> and <of_address.h> headers for all drivers
> which do not use anything from generic OF API or of_iomap().
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
