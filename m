Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB562D978A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081010; cv=none; b=iv5/cd+eFZU6oLaEE3j0bQMXm9rxzsPfYGwofFtGQtX4sOG3XcHFn2bU1i6tkqXktqPiAyy1yVJLdm3g5ygODe+RGUspY95uz/pQaezKU5bp7A1cZsmZ0e5WV5wrmly7HM0RSuQ3nCgP5JiEm/6l7xYRGl0gaNpRb0vXR/t5Mpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081010; c=relaxed/simple;
	bh=j9nZfVw6WNDy8P2NhYDYq7yIvlQTGbMyRsqF99spDPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UwqyZAQJN/qGVD6P3JZyDrMatvNv0uwyJpf9eU9LuI4p3ho9/d0D6ow8zu7XCwRmc2R/dgyNr7VfKKjWFr0am3O7EVZO3bBbxoRJG0A91pB/9DJVWvziH9bB89mJh++MfaP4JyGv238sM3c4AmCzlUno9UqHCrjRnyGyJANIQuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WUFJxWfG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WUFJxWfG"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af933e84619so105350266b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 03:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755081007; x=1755685807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/uSEHyOY8TPjXVXr20mUPgAnYEaOn2OIFqZC7pMk9s=;
        b=WUFJxWfG4eSFGdYuIruhFLprBSs3OYy9j9FabWpGTd7q2ocK54xvxHDEJJ1dfFkvlJ
         hfUJ61RLp3OIyhZEbcFzLm2DRUtlY6/mISgI6pBwd+ybA1+wEZJst4mMyCPvK8IScmTD
         oaZnS4AJ6/4tNpulm0OZ6wgoG1TBNPrinTktb3mqvDIJFD4ioqQfE8FIcFTHcisfuI6a
         9FHDWjmkdUKbu32XA5vhCw47pfv6dez5Tx9ZD7tPUfezjnxaVPEy0LqVY4QX2mZdvfmx
         ShAzh2JXgqwyFVS/rwYZNY1uDrx9iVfw1JD3YdxkjDDQzfWN4Ub5x/Djy3f+6EKA4ntR
         p9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081007; x=1755685807;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/uSEHyOY8TPjXVXr20mUPgAnYEaOn2OIFqZC7pMk9s=;
        b=jNBy7L9q1C4aK34VxzDcGMpmkUZxHqiXYvWGmHhkJWUGqbicTwax/kvHl8pz2a3BxR
         yxAHz5D72F9V0rGqENOwsBsBaTSL1OHlpmn6dvVcrOBlcyt2H9lA1UPppMtfCXccNQ4F
         AMLO7fWEYYCa+rDybH50KnXoMJw5iKJKSdeSus5XgP3IdxqbT9fZ8xL6kyfglEbhxw1J
         VubVaIp29Dano/X2slWJSpO0K/W8BIFzjwSpIxs4GT/S7OhDTdp0OTrhXThuHBRTdovD
         TSAwYlz2Mx5khKyD6D6Acz6Mdyed56jnTDkoYEsBSyb5Ku5k/nrP7Idc0KcKQwFW1gym
         i3oA==
X-Forwarded-Encrypted: i=1; AJvYcCU36oV3mOKPLxdFMZlyiOWubXVWzgTkRxc8cT9KZHoTaNGylqHdqATpcYjdn+HwbuQiNF/jQm4ghbldCfwRnB1nWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgfp+9IA34ISfk0g01DLr+r3+DvTRg+9cYiY+RwVMBg4Um9qZI
	w770GjTd81oAYBq6MZRW8e7X0KC9eK6tJa8Z10og8p058aAXaW4GQ+8A2Wtd1cKoJAs=
X-Gm-Gg: ASbGncv1JGnqp2h/aoR+OlvlCYYyxHBq04X4kuLFbxNau3k2TmCCDEdswnCAor+0C1O
	PGYl1yhjvVgTMHCnNscHEauhRt77fxEMUWRQ4LgSE5bblVg1lbhyBaX9s8PP51WZt1jR7ZvuzI1
	EPI/SPEqxilIW+UqgcBnQ4okcm9oW+h9YzAEl/5ON99lmwXcHrv7ZNX8TamME+R0S6g0wikIyCs
	7ohziqGTq0jTLaVcMRkKqBoYJFS1KehGstQftqZVPivbM8xX3U+88GTtQ97gJlY3WXmPfloWROW
	498DAe19oa4WIHEAEUA3pVcjBONllmsanZl/hCgf5V0WD5DJiY11Xg403Oq8q1QRlAB3SGfjAb2
	vkkHmtLL/rnQlks5fKt50bG+n+AHEFxNEjVt6TFg=
X-Google-Smtp-Source: AGHT+IF29cdNPOBhCMcj9Obj9AvGdSJsCml5B5sk74SLW18u0La5OP66JPcnqGI8eEVOZWoaJs2nkg==
X-Received: by 2002:a05:6402:1ecc:b0:612:f2fc:2b9b with SMTP id 4fb4d7f45d1cf-6186bf79c06mr842428a12.1.1755081006695;
        Wed, 13 Aug 2025 03:30:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f15d9fsm21466335a12.17.2025.08.13.03.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:30:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, alim.akhtar@samsung.com, 
 Zhen Ni <zhen.ni@easystack.cn>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20250806025538.306593-1-zhen.ni@easystack.cn>
References: <20250731083340.1057564-1-zhen.ni@easystack.cn>
 <20250806025538.306593-1-zhen.ni@easystack.cn>
Subject: Re: [PATCH v2] memory: samsung: exynos-srom: Fix of_iomap leak in
 exynos_srom_probe
Message-Id: <175508100520.39785.3470511038407039138.b4-ty@linaro.org>
Date: Wed, 13 Aug 2025 12:30:05 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 06 Aug 2025 10:55:38 +0800, Zhen Ni wrote:
> The of_platform_populate() call at the end of the function has a
> possible failure path, causing a resource leak.
> 
> Replace of_iomap() with devm_platform_ioremap_resource() to ensure
> automatic cleanup of srom->reg_base.
> 
> This issue was detected by smatch static analysis:
> drivers/memory/samsung/exynos-srom.c:155 exynos_srom_probe()warn:
> 'srom->reg_base' from of_iomap() not released on lines: 155.
> 
> [...]

Applied, thanks!

[1/1] memory: samsung: exynos-srom: Fix of_iomap leak in exynos_srom_probe
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6744085079e785dae5f7a2239456135407c58b25

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

