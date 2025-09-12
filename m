Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B5E311944
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689127; cv=none; b=iTNBkLMsvKGUbOw0j5MWwngsrF/PwY+Bm3BH27a7/CBowEO8EqLjwKmBi0aIbmXHaxrpxKz2D7eswR8cylMWqtuqfDTlgogqsliQToJxJeVGKzdnirgd+Z9IA4rgu/6RZoEwYFLM0IawlRqhdoc++d8j25nJ6hHF+puc8RI1OXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689127; c=relaxed/simple;
	bh=28JpikhNh6hlI5zzwVP1Kei7jvxlx3xsZ1bRu7uJFZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrQ/vflQvQRddUedZhDq4LRfA7HrsVnZhtTQdk0zssj0BJh/m7ze4aaTfFhw/uZUXQxw4T7U7g4uKTUvyL10Y2SCAw81AUPLFZ+p8SxwaicsCin2sfwLG7YIsUude3uKjt8qObtcpLVbhpB5Ouw60MHpGfjW5oZqjYkG83QqUP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vXURIzoL; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vXURIzoL"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-30ccea8a199so1521390fac.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689124; x=1758293924; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=28JpikhNh6hlI5zzwVP1Kei7jvxlx3xsZ1bRu7uJFZI=;
        b=vXURIzoL6WOeHy68epWap3ErmNrC29xtLmfmt/5OszeFvCcBTXd9+e7funIXOiH1WE
         jQUlydwxAqRRUSzjNPsX5gHuXQRClfjIzGBhA1yVFh8Wx4E/I2eHgAZNB8gnsJJlJLrg
         qpBiAAef9FKGxqxnPsIVZKvBhTOvvs8z3RgusIBTBMpSwtYTpf/8kKvzhTrifkGV7O4p
         9AHcCNNXS6KaIAkWvORPqfSTlRn1bEMfa6TjjUBZgHMd6weNK2Z3E1BXVucskAbhRmzp
         vShp0Ug9U0wvKqbVBEcUFK5PfpEtk3+tUyoDXK1MFVj+zJWQSu9R6TfhZ1BRbhdWdqog
         wv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689124; x=1758293924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28JpikhNh6hlI5zzwVP1Kei7jvxlx3xsZ1bRu7uJFZI=;
        b=Cb3D3ntKNJKXMvSSyr03D70ZrbxSKckjvThvsicUY/JlRcd+tXd1oAAsyjwRce1EbG
         JpYuAjjxWn901Uz+iOoFqbmPWt87KI6TGsKdVlMz7k1+rJDePBFAiSuL4kMKw/r11NXU
         H9+CrtUn1fmXdhGXg/H+DXlghtwP3NbY5XLd2lmWc3Gl4/KNOhd31lQn3T9XUt3RfP5q
         VQBhd2kvmgmnh/lpV7Rvs4b8tQLNLiZzWaG8ZpAqMZ6H1VU4c827Xo9+Zzxetm/Fjh7m
         uPVdMHqZzUP16i8CJzHZawAOEPRH4B/EXjOWfK3fv+a+I5//dP4DpIaQaqn13zI5kJ/C
         m0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX3HnFQkQc1Uqh2qhbFTXAjMWOIiZTWETrhCG8Zhj9rFB9C2jPcYqthUfLP8z2Z1c3WQHrfBl3Xap9sSNveOVbgrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBnuLXje6gT6a+8hqbwpVmLZ127GlD8Vvv7iHB305lR6kJEuIU
	tc9TMnPhwJDeh43CE+LsAAzAy1bhjZrYOlNX6HigKPWWwkFaUtByZpnZ8fzYC45A5mt5lQOiLhR
	8dq/dLVRrDNJcDdIv0AqDxgmfqjHCxYIMpQG/KRqpDQ==
X-Gm-Gg: ASbGnctfQTV9N9JQggf8UD2sLyzVFVWNOH0/AFnewz7sbKUflDg/CvG49ZsiYpLILmH
	EzntMJiQVV76BxJ6Os5EzfPJz+1+N07VKVKJet/jbLQqJpTdsAXuHW/HmiauJ/jyOvlLeyXsbgT
	c77UQzSh5BUQiLxP+4fRvV/ATTJJ+aBHzMhwKmqIrs7uvVCiMopnk7ShabjNM2qrSi3cTP4OnOs
	+DYEYXyt+42Xe/zIw==
X-Google-Smtp-Source: AGHT+IHAJ42BGc4DV3+A7HRXSgNpI4Ckz1R2zEcxWqCWvdlWoM2kBfvVDgKpueHQzqgzBraygif8YB0P1rDNI9gE4qo=
X-Received: by 2002:a05:6870:b907:b0:315:3ef4:eecd with SMTP id
 586e51a60fabf-32e553a280fmr1618278fac.17.1757689123738; Fri, 12 Sep 2025
 07:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 15:58:32 +0100
X-Gm-Features: Ac12FXwxoqn3zsYfC0T8IDf20S9zDpzsxcpDfKlZfpZdk1czNZgS3-vJNTlzLBQ
Message-ID: <CADrjBPo8L=P2bHKTFvYOj7i0u6pA7vs32d3y+4Ho+82Z1mRE_Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] exynos-acpm: add DVFS protocol and clock driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	willmcvicker@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 14:13, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Dependencies description:
> All patches should go through the Samsung SoC tree.
> The acpm-clk driver (#4) depends on the ACPM DVFS ops (#2).
> If the clock subsystem needs to merge the new clock driver, it will
> need an immutable tag with the 2 patches.
> No dependecies for #1, #3, #5.
>
> The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
> are variable and index based. These clocks don't provide an entire range
> of values between the limits but only discrete points within the range.
> The firmware also manages the voltage scaling appropriately with the
> clock scaling. Make the ACPM node a clock provider.
>
> Add support for the ACPM DVFS protocol. It translates clock frequency
> requests to messages that can be interpreted by the ACPM firmware.
> Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.
>
> Thanks,
> ta
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
