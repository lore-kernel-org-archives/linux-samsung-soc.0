Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997D01B87E8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Sep 2025 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582983; cv=none; b=AmLMVscVm05lXMGYvwP3csuN+p/jM9brMq9yw7FSK7RoezHi7HdACFp9Rc0x2jWCOqKVivXX2TKxd9SjMRPQ49S8WQGjjR1bbsJXQ7VeMLwG0c8d99dL3T/STvoFb5KnojkofD2r2XDM+AfwGtGiftfROJX5YfsEk4G6AXMXM0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582983; c=relaxed/simple;
	bh=aD+vVYVhj1ox7WHNmXKQS68L0Zye3qkpz4fixE8sgUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K8GXQk9tGPlHojg91k6Sl2kPANCUwWeu2akrqM1XYBUSmW5FW3dLHytG+7NitWX1K5nXy3fuXvu1VmlFIfUH4fWGZ8iwQdoqGHNrot1GUJ/9oSqfVyUebSOmT4aSB5V3vfxOVMS1JSFcQwVFKYxSpT42W7tr8UgIyIVH++g2Bx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZILn9q50; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZILn9q50"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45de185c04aso441985e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Sep 2025 02:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757582979; x=1758187779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC+hJQkcVSXLbc1lxRNyfmEb4byMZ95qWgYNvEiyn2w=;
        b=ZILn9q505Be7nFGFxpjI1BtMrDCsBqHeLc6shTE5h60vK/24maUDoaYTrGRmPYgUFY
         PW7C/OT/BXMnHWb4yZWkGoj17xM5AlgOQq7dzThfYexegCzo3WlV4KvuKE5diaZqjfqh
         R/Zrb2AMFvLZjjDwlcObmFHCFpVVx2RaCKiF9iun3LfywTqX/kho5/TvSDL3lYhTwas/
         sUSNKHa5iAQHswha1ptUXIOoArZ424o+fgY6RhJKbXkoOVhYndGvoNlOHCTcJS9OR+hq
         8lRAOy7nCNeeQtfr0T7TDrHwK5kdMYRyoPd2rd6w93MJZGqAEUquXVAsofrseNIhi0RF
         +9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582979; x=1758187779;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC+hJQkcVSXLbc1lxRNyfmEb4byMZ95qWgYNvEiyn2w=;
        b=W7viFbTT0NHbBDSx0BAfS/qLAuv7NgT6otwpHoxhQqgMY43GziJLC5+tgZ0rMKrctT
         XHXGAgHVzoK4AzORLvqPH2sT4gkX9U7onKq2oeB4iWctJbKQyJNfPfC3WD8B6D7AGhCX
         jbf9SrjCt0r3H4JXWy5o3Rtf7DNJWrxTaFZuamWb7mTEsiLsi/3ySBV1CWVH+fdf1tTm
         EFQ/w/nKrN955YWMKtnAfXyiN1ZkTIY10Ie1hNVgCi6x0DJXxsqeNEmGbN1OVNez2Jv7
         ysZj8iEBTweeMozdw/PWpcUN/9nTrxfRQ1ET7bnmzyfIqDGzCaPxLijncOsjFhNATywz
         TvtA==
X-Forwarded-Encrypted: i=1; AJvYcCVJhYNHRQoKkjyAX2xRauqFsgNB3tbHYGb2bVWaUuRjFpwof+zB3Zq7/TYxHTJmyU96eqGCgA2o+lHGEXERXQyEHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL37cEqfjGKQLAVoPKs6asRqSdMHKpTu1x0yMe7Q2Jpdtip7cI
	jph+3Aggun8AG1JCD55W1BX8duk4vR/fheJPgHrbD2FR7qsB6cSDbSoldcNhz6Y6EDqsuhKzelJ
	mGrqe
X-Gm-Gg: ASbGnctPVAljHe4e85earcB1E+hWFJj9GAuUkxWwx5sWxEZ4h/dywnyfMIbWcWG+Hg/
	c2cVdvHZJ0qHqGiAN6slESYPmeH2bHcUrhXOYxppRCcgBTbBC0XhTdn6/3hdVQRc5cCiGarnqe+
	LvVHMeZkuhx3H+qeOtrW9rPbc7+GCTQNY7jtJVw4Ja5NF2AwaMBXvTAq5xo6QaxdAThtd5Cunyj
	ZQ+1vA0Ts7+3STEExFPCaGIx98fKeFzVxBWI7WNEb13P9f3BnqdGGCQwgohnLy0NpvNPAFy6WR7
	SzZF9trbkMBpOQQ/5Y7jvTBF1QaAtoHmn91y/yZxgVuZqVMhfWdBh2KpWj88+CMDZwPvB0AlkLX
	dmJ5bpD6t47iT1tmav6XlA79V0XdJAECV/bi1uSWDSMch0RYfQw==
X-Google-Smtp-Source: AGHT+IHLpivrFJJuNi2aFsQowzY2Z21CVbIySOCBNLdn/DehLTyA9Hoq5rzO7sBA4BakWwnpnraSTw==
X-Received: by 2002:a05:600c:37c7:b0:45b:71fc:75cb with SMTP id 5b1f17b1804b1-45e02a94b69mr7953895e9.5.1757582979441;
        Thu, 11 Sep 2025 02:29:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d75a0sm1731484f8f.44.2025.09.11.02.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:29:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
In-Reply-To: <20250908-acpm-pmix-fix-errno-v2-1-bcc537cf3f17@linaro.org>
References: <20250908-acpm-pmix-fix-errno-v2-1-bcc537cf3f17@linaro.org>
Subject: Re: [PATCH v2] firmware: exynos-acpm: fix PMIC returned errno
Message-Id: <175758297808.29372.10913804909854615057.b4-ty@linaro.org>
Date: Thu, 11 Sep 2025 11:29:38 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 08 Sep 2025 14:02:00 +0000, Tudor Ambarus wrote:
> ACPM PMIC command handlers returned a u8 value when they should
> have returned either zero or negative error codes.
> Translate the APM PMIC errno to linux errno.
> 
> 

Applied, thanks!

[1/1] firmware: exynos-acpm: fix PMIC returned errno
      https://git.kernel.org/krzk/linux/c/1da4cbefed4a2e69ebad81fc9b356cd9b807f380

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

