Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3641AACF
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877464; cv=none; b=bsS3SX3A5lL4qk319IDHM9vAcM98yRD5geNDnABJiQD/I7hl+7F4h1yd4et7m9yxza/CDCnJ2pz2mal3KGCbm1cUL78XAkl/JOqVYdRloreaxa+OfZOjaSWUzVyZIGqXnpkgfUwVj4F0Y6xQw0kZ7bjNG/HyE2472CKMEaY9MTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877464; c=relaxed/simple;
	bh=TXaocwDZwWC94dxCxgh1lD1LjbtYnVPhJX4H4hTuSkY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZNEXGJuoPoCvvX9F9m2ghkGJGsBtqMoAcaCc146as31xpeB2ntOpJnIHuSKSyph0z8u7PJGh6Q+MkdQtWyjnY2KjtO20d16vMgpjK6Xz0A5nWI/iQb/genTzE87JcAwg6cJ6O6jcWPRXQEIfwDvcS7sAH8eqyxaalcVBNYLqzLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sH0/TJ9J; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sH0/TJ9J"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d28464c554so8833211fa.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 08:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877461; x=1709482261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txzUoVNp86IgACLI+fWKJm3IORGCynctjjPSZgxX3Og=;
        b=sH0/TJ9JsrREP6EbQdMkaINAN1EwNOtU1n4g00tpUArKKgWsEgfNm85N9X1B5SReRY
         FkBB3k9Jfg0HwnlvqvKmknSQKUSUgjwXPy448josCPAthfpPBuLZq8JYfV5o2jJah1Ek
         KvLdJpu9uJtpcVw5CIktrlDt2cvPfmX6u7s2MulyhpNFxyZO/HH1gv1/VnB0QMpda50u
         MVqFMBX09qTwYnEWiGQrFm8N+w4+yyHMx68touG8KrMz4pdPCTeCOovVNdI0lhrYxFqn
         f7vqwO6bFvnFMWknswOMl2xU9tCyN46/0UvCiKWTh+hmoY8PHIhCuQTvSPo57wTpcHbc
         dtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877461; x=1709482261;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txzUoVNp86IgACLI+fWKJm3IORGCynctjjPSZgxX3Og=;
        b=eUI2mMh/C1NdtkYWXAn432nR8rZRdBlG5hdky4cR+cYh6nUVG7aXLDPfPW4RfDorR7
         /a4CIMnVGeSFPnPwZD0dpv3FwWNElALZRzufdOnJsYD8SqPUgcGMOb/Evc7G0Hy0kpEW
         6gqvW84j/VftFrIZM5+hja0yoR24fgA1VuH7DcLMQwUJ+4Mc9zo3pRPDDN4ur3VremZ3
         D5g7wqCtTxJC2RpNRun/ZOM3BzQ3Nc9mWn7ai++DHvZ/YNtfIMGBPevlDuv2s/Kt2lDd
         odS5Znk9VeKoAJXLoOsWykN9HU3DGKkwxkuoUEJggNY24vwjWetezKoJukk2cQ8UTxLJ
         6dVg==
X-Forwarded-Encrypted: i=1; AJvYcCUL/dqYlzRzZn8gFbc5fIZ66J45/PJCzOQiofITual/vLINXnD2N0OhePSkq5IGZfxrQZAQpcAQ/AwQ3aruiA2l5lfXeO65HM3vjMxDJnmhkX8=
X-Gm-Message-State: AOJu0YxalPF8ayS0xl6Qj6VazARrqaCsqRXKG83qZT+omH4SSOTiHuva
	2QmAUipLztHBeWO5p4XKAilz63Fg1cSE5PH8dWHXtAld4D/7VEqYldM8hJ3cUXg=
X-Google-Smtp-Source: AGHT+IGZUf06Jp1TAh+C+FZ9U0O5PY7DChQElQBeFj7nMxhUWpuHesCcwBoTIsNce2oxSMdZ8UvS0A==
X-Received: by 2002:a2e:86d7:0:b0:2d2:64e5:8447 with SMTP id n23-20020a2e86d7000000b002d264e58447mr2408560ljj.42.1708877461341;
        Sun, 25 Feb 2024 08:11:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:11:00 -0800 (PST)
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
In-Reply-To: <20240224202053.25313-7-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-7-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 06/15] clk: samsung: Group CPU clock
 functions by chip
Message-Id: <170887745923.215710.8750487017286129944.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:10:59 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:44 -0600, Sam Protsenko wrote:
> clk-cpu.c is going to get messy as new chips support is added.
> Restructure the code by pulling related functions and definitions
> together, grouping those by their relation to a particular chip or other
> categories, to simplify the code navigation.
> 
> No functional change.
> 
> [...]

Applied, thanks!

[06/15] clk: samsung: Group CPU clock functions by chip
        https://git.kernel.org/krzk/linux/c/be20ccc17f41240b52106bf3dad01734a7f11080

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

