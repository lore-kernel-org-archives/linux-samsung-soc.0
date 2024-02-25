Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5B2175A1
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877456; cv=none; b=HGD5hgfjIxHX1VXo9bZW6TSvZOuPtSBh7AdVufC0flcLM+jKG6wnj2HusJZHU9p0f7bBF3aCAkNuwPKWxABz9AqdO1BVS6ikpzDY+g4sO4F3PWFv8rmxc+O7RXqGwxxLj76yXVTdfo+sdgZUB/W7L/t9n2pD66AorKTibSNfrnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877456; c=relaxed/simple;
	bh=YzRRKfqAKlmcDVCvJx2kYkiRDNxsbq+K4cM4aaj2sd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HtJhkaRjPGOlv6DTP/OUpgpyTAW7RW564BYFL1h1HKILCyUsvRle3IH7oEORFSqty1u5bwGZQMjFHNr92AWmir3RJYXjStuJtAOe79JDDwpZF7pOaFOoQEtD4kELwXXATLbfBKcB0Pt0pCrYcfYMzWluIvxW99LFhg4n35oRk5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g15VIONH; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g15VIONH"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d220e39907so39829051fa.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 08:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877452; x=1709482252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeIrigf/o/54acxHXD6tnRhSt0qc1LJXEqpXg7y7FtY=;
        b=g15VIONHeNP7V8chU+NbuViNXFc4UwRU8vlJFTphM8UiQ5GJXh7q2U/UERV96M4hFd
         MovBhHTC+csXbDxY60XQ9xgMfc/+l+DeyrHcFG5s4BAggltw6CrkZUVbs4zWwe6JLVnh
         dw/s9fMrMmqlw4SRbJlpKoUcBU0K07xUPFRAdZ5qsXdvg1rbT6J+0Y0Am/oJctjDZF6O
         HMVrgXuOp5j4xPoPaqZigrgtE3uqV9/58CRObv+kWVlcRsrbdxvdjMbvi07plyINW5LB
         2EqXjnGyPBf04+rJ3rEFrdFp1ZIWKXSPEY/Kbi5/dxV4QdEFb0W9jzU7dWWxtOMYLprE
         AMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877452; x=1709482252;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeIrigf/o/54acxHXD6tnRhSt0qc1LJXEqpXg7y7FtY=;
        b=qDPuhQlNEG0mc7DDZR0P6pI7rH4HynQEZCpwRwkvB3VwT9Ac58NdI76RWPGXXgkUyY
         2VfpZH/D+/yGZAehXuePhraGw9BkYR/zlqzXm3ZrnIe/FFAIwOLdyDqWHlpv+PKcuB9M
         3GbUnVx6XbDitlP2ByzemJx8y+OrMirDAtNDVeXmEPMOIQqyw152ew+0Dpd9uxoCAoyR
         yqb6dKcZuPYc45rL6wzjxuXC5+uD0KLy2eAVMvs47qsH6XdM1lBQUyDVIkcJ7HYsUr9p
         oxa7mVHSGPRD93IfpMJZzl9ceb1FoBJhi3gUx/I/By3UtPUmh3kj/dK5uRpvFSZUikeB
         8pQA==
X-Forwarded-Encrypted: i=1; AJvYcCW0wtqIdMY60immMWVGhDK4V5YaLfHOpqRxnq3v0Ubq8fmoOMoDFWcJzzP/9iOmBHzcnSwu0LTGYl5rwAmcK1k3kqdqQ4+Uc5h+RiS5CZh1Vzw=
X-Gm-Message-State: AOJu0YybKDPj6N72upl3QFNYHVkji5xCKmKk+mU3my9yd3Etl29xkQVm
	uyoa8ogF2riPyvhEym3iux97y/7C2XDTs44+qQeAuRCDJdhvZR+C7aB97oufWNOcR3gJ92agSYh
	O
X-Google-Smtp-Source: AGHT+IFQjFH3XmD6x+ccMkBsm7sC6QgfjLLX8gJsM7oMFx5eKmvZFkjAXFz/GXSviKhar6bJhAtUFw==
X-Received: by 2002:a2e:a227:0:b0:2d2:63bc:952 with SMTP id i7-20020a2ea227000000b002d263bc0952mr2399001ljm.35.1708877452737;
        Sun, 25 Feb 2024 08:10:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:10:52 -0800 (PST)
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
In-Reply-To: <20240224202053.25313-3-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-3-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 02/15] clk: samsung: Improve clk-cpu.c
 style
Message-Id: <170887745089.215710.13953112422812922615.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:10:50 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:40 -0600, Sam Protsenko wrote:
> clk-cpu.c has numerous style issues reported by checkpatch and easily
> identified otherwise. Give it some love and fix those warnings where it
> makes sense. Also make stabilization time a named constant to get rid of
> the magic number in clk-cpu.c.
> 
> No functional change.
> 
> [...]

Applied, thanks!

[02/15] clk: samsung: Improve clk-cpu.c style
        https://git.kernel.org/krzk/linux/c/f707e891eb8b655aec1b74c2171e8d529ed9c455

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

