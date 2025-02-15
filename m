Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FAE1A83F8
	for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Feb 2025 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739626976; cv=none; b=g4oo9PNZ+2ZSgEdBkhJQ6d+KP5wOT3NrBpfIkj85jL2UK6mILbdk1HCAg4GzcEuGfiNUAIKzUxUL2alpgca0ETJlKbq/f/U7UY/9QRENytWA88fn+Xxvr7nw1mvLduFjrv6lk0xM7E3+7u8D9o5y+Mg07jq2a07HU1XFUT5ynb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739626976; c=relaxed/simple;
	bh=8u9nr5FRgOHoWSar9IPoRBpRxyWBfCzeKcQuS3h5YJs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VKjQtQdO9T55jKTPZSQfm7Y537NitReAgaFIXouG3cI8uEYgi18d9we/fj8pQcKK2KsafgwIZ+QcaBa41LI4nk6gzhF3evKQw4YRkEDu7aZP3/9VAbYX6jJ/7r6sGoOG38Kl4up9IFKCHkmHryMgjmtAjJT7ku+6+wo+ymp4/p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yqEEbsgy; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yqEEbsgy"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38e1cad9e27so366579f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Feb 2025 05:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739626973; x=1740231773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9bUNgNxjXLAmLIe9VuTDeyH0e/ktEVFp6QB6bUy4rI=;
        b=yqEEbsgypFkVVrazq9FXVjbu26sme3nDfzG7mcuXa0NhZfMcUqYKDvPg/B/tX79y48
         m6wA6EOMQgm5c0LsMBj+nKtgV2M/WOwm8j7NB8ZkRIWYQYoMUVwp/K0uOE44PLqA+bvY
         nGkx1pYFFnljRwHNNFBVH4H0amMTIvClk69VWsFpT4V1K1neqjhK7CBwFOP0VCBO0U9N
         QZOU0h4t5JNnQHBeTPf+QrXOwFGWFVOoJEVj7imsbidfp7+gMCW1tYLTfnL9hX0/fs4+
         bDq86aB4boTwfPQfNLdTeMEtyQU9JeDvA5B0OxQCFfJ4hIWfHZlr6WTR1vBGhld1sxfa
         1Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739626973; x=1740231773;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9bUNgNxjXLAmLIe9VuTDeyH0e/ktEVFp6QB6bUy4rI=;
        b=GTTI++6wadzIH0CuL1p97r5PEcxdTBvZX+PjAN6HFMleb6nM2qTKXJX2V8qhqvLi33
         GJxQbanDwOV5x2Y5jP8QMk6zMLbAndKqLqryjB1s8KaO1mCFNgVsobLYD8f35xlAsaVz
         4ovNvgKtpBCCCJSAaPILwDSW6VNz0VKtvYwhgSwEkoWZbB66AXjgumeF+MHBKU1D5FqT
         ET7bg4Z/tSwP4sTI3wf2htjzAsPFSAzMIgg3s44LEBdx/07xWvpMse5fRUimdOnlbJYh
         zYb8NZ8yX1rRLm5rmUCBG9RysvDQVYv73/H1xieNZHFG1uIaqOe3clsXvgP1qFsrolyH
         YqBw==
X-Forwarded-Encrypted: i=1; AJvYcCUgMlEFgkw/8XfyeYGp0Tmh8vygzAGDbCJEXbkZUmB8Iuu1JGqcfwNuvllyXkoJs33w+U+egWyCi9nP6zobAerxnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1BtDcWJhPlUuSCzFo9ASePk8fi/DMfpvGeJkV9OfaKPcRUJkW
	/L3gsbTn9y4UvhF4h3aq/Zy1uCO5rVLABzQhd5AuSMos0V91Q6JD3cewI+SRSfc=
X-Gm-Gg: ASbGncsD0ATWUvHl2qfxncymAYv5I9GFZj/u4kiYqXD7UyRdUctQUuYyevIAx//okAU
	9C0a1WW7iN6WmnoTKC+TT+zw7TFdvQVrzQ+nj9fngQIjiJXBEf3wAcscR+Mtw8+Pub7+HRsvbnK
	B2fkLJvfyWF3LB+vNh+PKZGjjDOq9PoidgFFDO5zP4RcVkFeIwMAR4fBtoGmD1G3I/uG+7+jsvg
	b3ykMHhfdfG+ZFF1mMtRxb0WWfpCIHAtoazzfW80AFaUbdzNJiFBZFe9+tGqegEf+GQdJChNJlK
	BVuCrOi10nK5dapcZ5qjwZqXOkytfBM=
X-Google-Smtp-Source: AGHT+IHMxDo2wTuV3RGHOn8oJ+HNcqupAs51y/sqm5Bh1EezBPlgRPt7QMuWXQaOwvAdxUJsc4b5fA==
X-Received: by 2002:a05:600c:4711:b0:439:614a:8bee with SMTP id 5b1f17b1804b1-4396e730a4emr14755285e9.5.1739626973256;
        Sat, 15 Feb 2025 05:42:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396181026fsm69929005e9.18.2025.02.15.05.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:42:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Stephen Kitt <steve@sk2.org>, 
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
 Will McVicker <willmcvicker@google.com>
Cc: kernel-team@android.com, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250212183253.509771-1-willmcvicker@google.com>
References: <20250212183253.509771-1-willmcvicker@google.com>
Subject: Re: [PATCH] clk: samsung: Fix UBSAN panic in samsung_clk_init()
Message-Id: <173962697098.235665.12602558292611832915.b4-ty@linaro.org>
Date: Sat, 15 Feb 2025 14:42:50 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 12 Feb 2025 10:32:52 -0800, Will McVicker wrote:
> With UBSAN_ARRAY_BOUNDS=y, I'm hitting the below panic due to
> dereferencing `ctx->clk_data.hws` before setting
> `ctx->clk_data.num = nr_clks`. Move that up to fix the crash.
> 
>   UBSAN: array index out of bounds: 00000000f2005512 [#1] PREEMPT SMP
>   <snip>
>   Call trace:
>    samsung_clk_init+0x110/0x124 (P)
>    samsung_clk_init+0x48/0x124 (L)
>    samsung_cmu_register_one+0x3c/0xa0
>    exynos_arm64_register_cmu+0x54/0x64
>    __gs101_cmu_top_of_clk_init_declare+0x28/0x60
>    ...
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: Fix UBSAN panic in samsung_clk_init()
      https://git.kernel.org/krzk/linux/c/d19d7345a7bcdb083b65568a11b11adffe0687af

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

