Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A6122173F
	for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Sep 2025 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757236452; cv=none; b=JqK91NQlfhC6TrR9e0Jj8NFVuNo3/B4EpmHUi309cyOqDSWwrLRKUknqCSxZXuK/zZlFOgIYd/1s5z1LZrTbCxelmcxAwavisf4d2oCQU2f6wgfqHOS5WLAZLYD5/ji04aw4xJJeV+C9KWfC8fa78Lke4CV1uXgsW8gtX5eHy3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757236452; c=relaxed/simple;
	bh=nTtz/T80B1LFaBzGfFaobq1k9YIb/4LmaRP6eS9C8A8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RmEDGYvn3TbU00JVFzf8/Zf3qZ4KF86BreqGG2A0ElgoULi1z+0BXu9Hjk0AuZk6oUWJibwk2+2ES/RbK00re0FJAry4aNjqqOblSKMqZe5PbME0N7B/gtCsvNTtAXj+FoOj7aC+yL5uUF2jkyHrxRH0evzemWxdildR3BSStVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVJ+pxA8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVJ+pxA8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45ddfe0b66dso1583535e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Sep 2025 02:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236448; x=1757841248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCLQAsYpR6U6YXx5WXyyNz/et5qkwEIQ90qwDmcTRHU=;
        b=lVJ+pxA8WdsapeRIjC97ax0YT6KggfLwHY9NlqpaSJbTiyPfFs2m/jbADXLXjiDza/
         iNQD25YkPwErRPW0iQJxrSaHY24CBMNxhMzYeocADPNS/Qjk/P7ifWLB2U2KDALEMyUc
         zzq0e7b5pdPgByPMjE/fqcp/sAjpqRv0BrO3uzJWjSdzCES1V38iCPGC/+6t5ZNLtE0z
         tSw6cP8rEOmAlg5k2173Mn7jHJEAVCqjHQEp6UJKjcBn7fp4gkMreE2D2ThMR9lGGRVW
         ro8IMP9Akul404Zo06eyOgBea8vYFrwAY4Zw2ZN0pPQ7KNmEBUrKcWrZCJuqeT3AU0d7
         HgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236448; x=1757841248;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCLQAsYpR6U6YXx5WXyyNz/et5qkwEIQ90qwDmcTRHU=;
        b=L5FH3rqTxKXmOS1CVS8pWyzOA6Snx03SPY/7xfeuqoHcTawgnrMNWNqxHmcJHPL19A
         T4zJUFKZLrn/lrhMFzPt1S0UbspWPaEN8N39EBNUpe3xcc9tqhoN/n/+KU3hEoWNAkew
         a/txvw1NKj/eSywvkhfEudFEqC+yFntrfs7FSdGwX+HN2cTcZ5K25JThl/LPVnOENSCM
         FZwBi9sZqGgOSyAw5Od3Lg3f36XthqodPkORoOp9GkMGppyNeVv4UDBQxwKXxLFOI9c1
         UTXJPVTcyG9pxCxhIjtsPlWbbVXbaJWCe7p52GWo5KyW7Stlod8LBc5gESnBSEXxX/HF
         C25g==
X-Gm-Message-State: AOJu0YyCsYni91CekGt5R18lnUAU4XzM1T0zb/rf+9u4q/pMO7QmmsTT
	AEziuZzXf+Se8Nq4BbFz3G5DFTFXfXcl0I7B0YGAnTWKHBKvzRZABr3sOsG6757NJ2A=
X-Gm-Gg: ASbGncuIQIOq52+RZ0/V9trCX6BWSVcjf7PvlJlG3uRX8Uj4d7uyofhOYwjhJflX7fv
	mBA63OHYK+1Ie/nLzDUILlSA56vhydktXrcwzVjm9rlCwryyMTCmVNNnv8vK941vP53xBH8KMcb
	M11gJqi0SC7NbEEjKo9KYPLHjQsliUrWKc2Jttr4Db5dQtXPyWdA7uUJH5WBia6QA2MpuOHMkZA
	hpmH0tudUZh+PRKB3v6eNp2h/pEUuR9ZUWP+9MWYsZBZFLYM9UOwDfEMarZQlc+t91eAsBd4xv3
	WlA3hP/bbxqj6tOrnjS2Pw08GAJfJWVzOsTNc+v/zi7PvVA/lhDPSsdUuOxXdMVT1h5Usos9EiO
	aQxhyTydt6+FHuFJXTUPNmYEKpoQ2Rhv2DMQtOsg=
X-Google-Smtp-Source: AGHT+IG78HXO5H3PNHPON4QM2B7kxOdyJOW/vdjAFNFZeNRnZqCYRuJ044SQo+Ov8yokKCplK6e9pw==
X-Received: by 2002:a05:600c:6388:b0:45c:b565:11f4 with SMTP id 5b1f17b1804b1-45ddde84ff1mr18221295e9.1.1757236447894;
        Sun, 07 Sep 2025 02:14:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20250904-perics-usi-v3-4-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-4-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 4/4] arm64: dts: exynos990: Enable PERIC0
 and PERIC1 clock controllers
Message-Id: <175723644648.30719.8043699953915235210.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:06 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 04 Sep 2025 14:07:14 +0000, Denzeel Oliva wrote:
> Add clock controller nodes for PERIC0 and PERIC1 blocks for USI nodes.
> 
> 

Applied, thanks!

[4/4] arm64: dts: exynos990: Enable PERIC0 and PERIC1 clock controllers
      https://git.kernel.org/krzk/linux/c/44b0a8e433aaad8aac51593a052f043aeb9a18d1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

