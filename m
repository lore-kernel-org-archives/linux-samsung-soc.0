Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2096117BA3
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 16:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877474; cv=none; b=fZj7LuinwH6Q1ZnhfJDrjBuVdwLNKwlnn7mQ8RnVIuio+xPahnFyWZXelTPfrs0MA5kfOVLiYetVCMt5pMRxpqmNX6kNEwB49dMCXKf9d5YADsCcjPbYX+xE8lg/xrlQruMMZeeXuJLZT5Utswo9nhxx7+Bk2wrSpTu+/umO8Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877474; c=relaxed/simple;
	bh=u8Qpi5YiOy9kRaDr0ChX2/pXA1mqNLtMkVDkNl61WfQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y9Pt7Hprc7ZCaYnATip7XbIQ047xb5rCF+YBW5oxLC9irMo54b2mij7DkO2G7OzRAVJZbFB9AgJhlpB+HukCyXRQXO5xjAnBxJCRP3e0mFgR6DOnvBz1X2kX0vnafYToaFevC3kmYn9aSfBKJxnJBhpsgKL5YZaNuAEyghK7e2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtA5/lQG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtA5/lQG"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d28387db09so7692121fa.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877470; x=1709482270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REeTwuyBteq5+THLDDm+N0sqW9JR2kC2T9JOUPzqTZQ=;
        b=TtA5/lQGRL/UROVJ/pSLyqTWZi8F3bCyMVnVhz0pnCGV0BUoPx/ggCNfqn8pXwM7jb
         dxUTXzK/LD3lammTvA+qWT1h4m8gKZ+rlQQVZ+4HRMMIbgkbbKZTn/k/ECxI1FMFHYdt
         gzKPLI9brf9nH0wzc/HgWlVte7iXafghvuYVikVjJ48MNleEcBGpLBEg4xy/A6VFbua6
         FZV35UhnmwMZDj757//pwHTUcynXcO6oGYhA33GMj3kX3eqk5/btyzuNixEKXO1WFSlc
         dhTk7fqPGQrDMEVaRvdmTr3MTAmo+jylzAwRRk4D4N1+0bTC3Ca8mcGrlz8nzatVRKVB
         TT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877470; x=1709482270;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REeTwuyBteq5+THLDDm+N0sqW9JR2kC2T9JOUPzqTZQ=;
        b=kDU4jVkRhp/Rx/OgXyoYLB/pRgPigir2rb4FxKI2kpvVEWGlO6UiGnmOKqLMVqgQtM
         VsrBS5iByH8sBjIyK9xRIebNtIFT5b2U7YMAzOCDsuQvZ6cEq4W+pSaoBjXrFm51ZMvq
         njI+Iy8ZDFLI+LIoXEKtva6+NjV2gF77VoMw2emsJo5pLp2f+zKe++09bsjD9uJon6Wl
         TJR8MF1xNULCeVcbYBuuSjoibf8pjEmjiQbHSWCnDCrCzsZMtyZ6F6pvECWI/wZ/roOb
         WqBhciiP324uKIukAEUmS35QgrT2f7eyDMvU/k/ElHdiE4nlz8idI87TVVIpj7BdLAmt
         OJsA==
X-Forwarded-Encrypted: i=1; AJvYcCWHAKiwtIBKn5UDjEyIfPVxrrF/vQrfO+ozz+juLy3ZAj2yBooi3g3O/XX89O5AvwCAX2JsW8PEajMQOdLSPu9N8RjdP22onSLRVgshpy52dz4=
X-Gm-Message-State: AOJu0Yx2dsPEGPEHCAajHT6NA2XyD0s32RnwzgbpRRdFitG/87bUGiv9
	hRFrsSPArPn2Y1Va+JCQG+968fU7kc2sKdpf8SRPev8+BX6bQm6lgqPTl4Rngjc=
X-Google-Smtp-Source: AGHT+IH5ysbPnEAR4gSNi9Y8xJXQNzwoFma6m8b1/S0CcoLGSmBaXXI9IRTtAoynqulT2fdbH///4g==
X-Received: by 2002:a2e:b170:0:b0:2d2:4cb2:59e4 with SMTP id a16-20020a2eb170000000b002d24cb259e4mr2790327ljm.31.1708877470466;
        Sun, 25 Feb 2024 08:11:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:11:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240224202053.25313-11-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-11-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 10/15] clk: samsung: Keep register offsets
 in chip specific structure
Message-Id: <170887746854.215710.5270227845876951742.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:11:08 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:48 -0600, Sam Protsenko wrote:
> Abstract CPU clock registers by keeping their offsets in a dedicated
> chip specific structure to accommodate for oncoming Exynos850 support,
> which has different offsets for cluster 0 and cluster 1. This rework
> also makes it possible to use exynos_set_safe_div() for all chips, so
> exynos5433_set_safe_div() is removed here to reduce the code
> duplication. The ".regs" field has to be (void *) as different Exynos
> chips can have very different register layout, so this way it's possible
> for ".regs" to point to different structures, each representing its own
> chip's layout.
> 
> [...]

Applied, thanks!

[10/15] clk: samsung: Keep register offsets in chip specific structure
        https://git.kernel.org/krzk/linux/c/78bc2312ef9cea4af1073dfab4c71d91b2015b5d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

