Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625065336B
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Aug 2024 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723379600; cv=none; b=DdTlF+ms6Hc3Nljn5IK9VQBwxWK4KW6S5c9yTvpOzMCIESF79buspVmTdRSn9tyi4KBiHtbgbGBzVoRL9c3Kl3Zs33s+N1MayL3SwRMt8zOmKRd7LQHhKIlWD97tnQYzpxqAjbolg6CMaxi9mfKB1Z1XL6THs6MmmwYA0tI1/z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723379600; c=relaxed/simple;
	bh=H+R/OmjOZMGBgdB1sUh7zyOJvKewZSh/I07BEcIL2LM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pI4IDIvJP6RmXU+ccindFBvx++gwBD+3SAdaenJKUyxGIy7EHRfJLnLqNhDS7aYtq6uLx151Jalqr4DjezdRGjMcUvaDhp9o9DO/yqQPLR4w1qw9o87KBRmBLhdGI5Zg6PXV75cMBAtyalaHK/6FO3PoXzaNgjPCcev01SJ+CeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sAlbUJGi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sAlbUJGi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428e1915e18so23496845e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Aug 2024 05:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723379597; x=1723984397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kt1hLgivy8d0ZroiWVINLl4zitCmU47ZCc3ffQBmI38=;
        b=sAlbUJGi22xg3oAbpTKAltoYYnZr7G84jhQieUQBLahAOpUWSFrTg//dLuxO+shALk
         AkTuIOrKbnFjR6tuiZF4M9Q9l3k3uIX37hx0CZ4iNQzFJPXHtFMN6TBSkjSyAyEZ86Sx
         e85o3ch1k6aZbCB65Ko4hScYPhP1CK5iiHQu899bQzucLpMrdrjB+ZuQuaDkRkm4621M
         FKAm27F/slkWCbbDuHu1U4x0ihHfv09s15pJ70NBda2jCYH+Ie/uFzObbaRqlWebPzWH
         n1bVZyNU5pojdDYkQaSXD3XiVz1UxqKCCYVY5hp4/HPesSyaomGbGxwYWiItjvjzu5+W
         bisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723379597; x=1723984397;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kt1hLgivy8d0ZroiWVINLl4zitCmU47ZCc3ffQBmI38=;
        b=tlVIAxFRQlpT3vol1ISj5aFT018/lqrtyfG1itrzh8dwh2ruz1opaEqTrbnVP4jZuj
         IA5v3+dsYziL+tVtrz+T90gVM4zk/VrBYLeJwSjtg3tHb8BfEgce8WSV8C+U6wzF45yZ
         nphcK0zMpTBo1ZJ/QcvMIWxQyG94DbhfVQNXy2XOr732Vmm6s6hHQSo806HP+2kKAmSk
         DPhgSujsQOHoYI8k7+LYkQOkJHXnQyWwH2XUO7fRbBXpfTZDosELUqEJuq6nSxiKgBhO
         IBPA0Ma+sdNcsJAyJbeZ7H/qgstjeGccJYY9yJonp03nkANjt6YSpfrEt/JiUp3cs203
         AmHA==
X-Gm-Message-State: AOJu0Yxi7XRYE2cRBXPktEtfIy8W424fsiMGZLoKmMeZ+tYS5WoOKoMH
	VRZKrsKISmO+rAZtsvqsyK71rkNeziDyqS+vA27JTyZwMfDhFuxt1C7y+GL5ju8=
X-Google-Smtp-Source: AGHT+IFq2LPBmSvGRCeZCydCnnAu8AxMgVrN9EiqvYpbrAorrsapRaJIkZ+sMbUiaGxYFDtBvfBkag==
X-Received: by 2002:a05:600c:a0b:b0:426:5416:67d7 with SMTP id 5b1f17b1804b1-429c3a52143mr47763835e9.27.1723379596600;
        Sun, 11 Aug 2024 05:33:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c79f345sm148055605e9.39.2024.08.11.05.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 05:33:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanho Park <chanho61.park@samsung.com>, 
 Tomasz Figa <tomasz.figa@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kwanghoon Son <k.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240809-clk_dpum-v3-2-359decc30fe2@samsung.com>
References: <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
 <CGME20240809115500epcas1p34ab112e1a0da7247257b9cb8f7eafbe9@epcas1p3.samsung.com>
 <20240809-clk_dpum-v3-2-359decc30fe2@samsung.com>
Subject: Re: (subset) [PATCH v3 2/3] arm64: dts: exynosautov9: add dpum
 clock DT nodes
Message-Id: <172337959515.7186.17124909105014310373.b4-ty@linaro.org>
Date: Sun, 11 Aug 2024 14:33:15 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Fri, 09 Aug 2024 20:54:13 +0900, Kwanghoon Son wrote:
> Add dpum clock for sysmmu, dpu.
> 
> 

Applied, thanks!

[2/3] arm64: dts: exynosautov9: add dpum clock DT nodes
      https://git.kernel.org/krzk/linux/c/2cc6b908f800bd6440cc57c1c692449fab49168b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

