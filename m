Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D222138493
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 May 2024 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801619; cv=none; b=Y6PSfn7Z3b+0hqnKItCxkxnI0/5910gEVzfHm3+kqEszptc85cqN7YC/kNN1rAE7oA+TDZHcIF95UZKpJ87uHmoJJgr3PmNVJ0VjtVJS7XpDDbJxmey6j2Cc6MQQ/4CmwaDCgNKylqsj3EI8FReKF8bD0t3zwNCjYWsc2Llfi+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801619; c=relaxed/simple;
	bh=UH6XxpGrxgXHal2Dcg5rY4RFy7ZlpRqCbIL894fO9gM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s/228pDjgEOsy8Kx1CyimKPlFcEK/tC39U5S6N3w0weyRc9beAi865NrPOeKhmUgobERocBG6nNQIWWO3UnybiUTJ0qtIiAIqvIUgiF0gV2zf8MEZChuHF+koKH64sY46lEABHxNUKfjgzTwYWyfkTHB2wZUmJTL1Z7PqiKFPtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mFegiXOr; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mFegiXOr"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-578676a1b57so825962a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 May 2024 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716801616; x=1717406416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo3044s0QfZtv4pJle/cczhLo3E0k9R0oaHy3aD2XCI=;
        b=mFegiXOr72g0mSO/R8HR9BDvcALnJ13Jcp7PO4GIef2EApwVfiZDuyMsEEbp2X6glf
         wZ16PBjgMP7+K+Aq2LrqwtVtMy2cPzzCv/R6up78OFypZitQLLPRNPBLIdZFEl2KVYUG
         9cONY8Fg693zS3QRfxVkUfDOST5oDXSTIbs3VHRuluZIZSDHj6eTeIHKCpzHn4hD8El+
         2dERNDGTbYUBWm9k3Bo+4TzNiFuzo26yJ3Q2tUGkUUTkybvvlVfaA3UIOcDgAk1++Gtg
         BE53mMlmt6aSRt1PE3s/gL4ofmLPKu5wK4tAsmHdtyn+yQzhUcxToQQIh0vvaLiopy48
         n8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801616; x=1717406416;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo3044s0QfZtv4pJle/cczhLo3E0k9R0oaHy3aD2XCI=;
        b=YI7eHuqaIJNc47w47XmcqNPaN7WDEX0cA54SxHYBUbHRB0KQc9ngaLwKBdDR4Dx1KL
         H1gY7rpeRFltzZzatp8ASCFThM88zCt84W1DAXkJue0JLG7sXPr+ZvMbBu6ILBmr9NtH
         6w1z/mhhtaKKNigpqbFrPcIx0n03mqjjuvCL5fPL1qpZvgnRlB4Zia4ve8XqgrA8cSH/
         9DmWc5JdZQwuOjRlZsq2YOuD4t0HElD5u3VOosmiAuUhafNq3FlZYTRTdLxJsIxJ6yLu
         /OWOXje2Jy6XzRVqBvkjdM7EaK301HotYvk26XdGxHMYhmAHlz+eWAuHSiyruABdnFhm
         fucQ==
X-Gm-Message-State: AOJu0YwNlZh9cIQj6pIpOnjKGTVNkXy6+syohgnveRiXNAcvNyvDmZFA
	pTcM9RsqJ3KpRWO0Wxhr7gUpIF2jKaRGTeG7pFhOnUL1/rwFnEDut3lDFTseB4Q=
X-Google-Smtp-Source: AGHT+IE8Y/dnrGRfPs1DKdUvz4jGIEanU5alTAStlbm2f/zWJdgZdTIaYjWNwshSkYgy5WqbqKyy9w==
X-Received: by 2002:a50:d619:0:b0:578:5e84:87cb with SMTP id 4fb4d7f45d1cf-5785e848842mr7402597a12.27.1716801616261;
        Mon, 27 May 2024 02:20:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524bb5ddsm5503036a12.93.2024.05.27.02.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:20:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 David Lechner <david@lechnology.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 William McVicker <willmcvicker@google.com>
In-Reply-To: <20240510070653.537089-1-m.szyprowski@samsung.com>
References: <CGME20240510070700eucas1p10ed1c978c78366b412770fdae6d4f384@eucas1p1.samsung.com>
 <20240510070653.537089-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH v3] clk: samsung: exynos-clkout: Remove misleading
 of_match_table/MODULE_DEVICE_TABLE
Message-Id: <171680161481.21651.14564564565582283866.b4-ty@linaro.org>
Date: Mon, 27 May 2024 11:20:14 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 10 May 2024 09:06:53 +0200, Marek Szyprowski wrote:
> Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
> module driver") this driver is instantiated as MFD-cell (matched by
> platform device name) not as a real platform device created by OF code.
> Remove then of_match_table and change related MODULE_DEVICE_TABLE to
> simple MODULE_ALIAS to avoid further confusion.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: exynos-clkout: Remove misleading of_match_table/MODULE_DEVICE_TABLE
      https://git.kernel.org/krzk/linux/c/b363a45913d211990b9a42123690518dd3f499c4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

