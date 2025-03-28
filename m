Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD1B211A1D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 07:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148208; cv=none; b=eGJC0HqAfxSWphpxh+MZ+LOxckpoV4pulQfc/ZY2I1x4Fm849te6BwXi7VyR8sAevRj+tB0KXkMvMxflOSfBS5S6pvODZNt51wjOwb9nMt1MZ7+LDhEAWcg0F424JMFvnQybVNnX+I886pYBVZPt/EGa9R+k60/yD3zf9k+H5yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148208; c=relaxed/simple;
	bh=ZXbXxoTpkZ9XQjuSpddhUTrOU+MP7VY35ts0qEXgmq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsunkxiCRw2Hh4nm8zs1CMba1CK7TxlVk2q6xmLPtVnBqm8LWxihq7FBu1bBhjj3lVQKyyscntJg/E7RZ11s5fDza4dFFuRuo5AMoCxCLr8MkUySiZ57y6LNX6ThiKK6OSNK8csLlMPoRd+gwsEXRlSIJuzTZJoqTQrgYr9hOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PtmUakYA; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtmUakYA"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so30982741fa.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743148205; x=1743753005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXbXxoTpkZ9XQjuSpddhUTrOU+MP7VY35ts0qEXgmq4=;
        b=PtmUakYArS0KPCpfzf5YC9gcaIxQYberTRweQwhCZ1dEBu/d1NI+bH7lhnL8p9jPpK
         ezz53NtMAJ0HYiNLvecJ/Y8oBbNaK1bCWXChmhQhTwRi4jhAXEcFqdYKUJe3gUT+Xo4D
         eUn3QAMpzDLtwIVL71w6U420GfGzZjFLLo0/fLKxbskf+M1EJUvmpazXKJe8KORea8dy
         FYQVkVIDlgIU6KZx4l5dr3O7iS96VQFcWcqreri5OPleuRYwZxHO5smA2B4t9ROHAkRy
         gQTxWQS53/vuQ9eKoXJfYjtfimxei6v8KpPJywUHVhm49TKxZu+eNll12WB5vhyM94Cs
         rjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148205; x=1743753005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXbXxoTpkZ9XQjuSpddhUTrOU+MP7VY35ts0qEXgmq4=;
        b=rK1xyR7FiT8lzLXLQRJTZX6gQyN5osBwkqlKdUc+dal8zSmIJKqdipFZy/BzUsj0ZY
         g6l0l4HeRqlwDFiJhokPMts6H+6aQn4XyuQIsFxPCMCrzFAyGMkFWYVgdnjdRWRsNCb5
         u8LGHbjDkcm5qhbQ1FEkdIhGPiLUiDRqffNgUKf9XTs2GeiYiLNibr5xRdqjqxsR8PcQ
         vLU1NYsxQPzBSlrl2l7mzVKXuHrt70OKaa5GTogQtr6Bdc+yiU7es/KBudCvTNxkXt05
         48gL1b3P8CKYoYTes4+ZoMY2rvSlXLvHtk35GFh/t5gKn2sMTv57SrHsukvRTomS5ufF
         evFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZVv6nA6yUWDgk4nwsdbgbbbeqlZX68QkYkNqdkVBDX/nh9FP3ZOen2fMlYAojvZWptSvOviJ07fTIYewKYZWeFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYKjlGSvB8YLBuoreJjlI89Lj2wK3tx81403xv3QYwC0kKAaZ
	FFbRP1ezZXWSn5wCuz3I9t56ey/9JwLe324MIjSN49R/OSl7dm29i7TUDZlqNGudi1hpfyUf7nE
	TPJgs0OTgQjy0vMcVpVcAHunWYQ9sEzo+C/IzzA==
X-Gm-Gg: ASbGncv0dKvqE7cjysGi0En3QMhzCPJ/CCZ9hWSwMtzmClEI4b8sncgBS0cw/ZpRyLW
	UHBzvZmXStpK3UHX+nyTBM9k38H++D6vEOZ6rysA3lSNFic9apUn3I5KuftcVaWXEQ8nQmsOjBm
	1bnwT1Z/DysJOaKUW/Jl/mW/E=
X-Google-Smtp-Source: AGHT+IHnFW4Gf7w0WUxCzWgZrqEcIzapkxQXNY8Xq6/ejIm3eX3Z4HHEGCQZkHosMPCG+e1OmbhNxMtF+vYCyFmrwM8=
X-Received: by 2002:a2e:9e4f:0:b0:30c:433a:2886 with SMTP id
 38308e7fff4ca-30dd3fd73c4mr5854391fa.8.1743148204932; Fri, 28 Mar 2025
 00:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327004945.563765-1-peng.fan@oss.nxp.com> <20250327004945.563765-2-peng.fan@oss.nxp.com>
In-Reply-To: <20250327004945.563765-2-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:49:53 +0100
X-Gm-Features: AQ5f1JpLnpUy1enl9HLnS4Wp1zTe11w0UEroaaZ478cBUi3nUM67Bkq1pYEN9vw
Message-ID: <CACRpkdaR_muqL9W=-=vHeuA10R7yPqe4+ib3qb6daqZh1PUU9A@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] regulator: s5m8767: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: brgl@bgdev.pl, krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andriy.shevchenko@intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 1:51=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Update the driver to fetch buck_gpio and buck_ds as GPIO descriptors.
> Then drop the usage of 'of_gpio.h' which should be deprecated.
> Based on commit 84618d5e31cf ("regulator: max8997:
> Convert to GPIO descriptors") as a reference to make the changes.
>
> With the quirk fix for s5m8767 in of_gpio_try_fixup_polarity,
> the polarity will be active-high, even if exynos5250 spring DTS
> wrongly use active-low polarity. So using GPIO descriptors,
> it should work as before.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
