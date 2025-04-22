Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6F21EE7A5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2025 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308981; cv=none; b=SahappIoxb08DpP6Eez0/rkTWpLL7YaKXkjdeWMf+7M2BHUCGb+2t1gQ0f5LohXfmOrF64Qb+mGojgO9X+Wl6sfRxZdFyiVuu18n/rJOopbW4mraqr1CcCQQU841iNt5VBaZ4rT5OlJHkYIg5UsmaIpkCygy0swZtjAV6KYSGEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308981; c=relaxed/simple;
	bh=EYyNE0jVDJ/u4xhfpMdq85OdbkUTw8P9w8wtSgmEz7Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E9PyisDxzZWEAZsW3NXYGQvxdkjmGPUyJfASnwTBTc0RGYZmOSmdqLeEChFSE6b9NblR+kZW5bLeRs0abseZQ/CYqIND1aCAr2VsZRf1JaXsvl4F0K0AVtvGC4zUk2MsbbGIeee+3NDAF+3pEsZSwNGglHX+xCjHS+Ge1KWQYcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oT3TQjyk; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oT3TQjyk"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ebf57360b6so616248a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2025 01:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745308978; x=1745913778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2SXaJr1crC6irGTaWOzi3O3ULAEyfrCbSvTACAoxuM=;
        b=oT3TQjykkqdLBk1jT75xuV23rjzZ/L7gv75loEXHL/UtmL+ikPv2EHQOUqJPM9bXMG
         JFB7IvyJdZ1N28yr0o72IqH9Zu0fwuOsoYfh7TbCZkLSE5l7tb0kLQg01XJh+ZMrjDcc
         856p4a7pxceQNIbovrNIHfZ39jxhu4U/JKrk4qloddaWTRqbqrL4eyxghCyIZu/PzgYw
         VZBMxp3Yy8Dq7pRMdkwL5gG3HcWi6xVddbl/YS2QcUKu+ZWWhM+wc9+nFKcE5hQ028V+
         gSqY9gkeP9X8IhvEbflu7mryla6UUVowdReDV1gPtD/6EZGe+KYKhI5y0l0yBjVRu8mP
         Ctxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308978; x=1745913778;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2SXaJr1crC6irGTaWOzi3O3ULAEyfrCbSvTACAoxuM=;
        b=P8BK1Xm4o0i+mUl1UFmu9WBp19vn4NE1UruQcKexFxhPOj2cgNww0TxdA0TBrKb/1/
         IjO9GbUgFOo1iGZR5QnZbZRvWJ7DHku5xrgeBD+uNA2XdAd5sp6U/wuid1opd4f5pQAX
         JRlq2VQBcM6vsHgRg/Yl8SajmzAC1Lnsj9KLZxurwM8ieHHPFPJdAYpiuK0IwUv92EHp
         LYQ2oQh7Uy4ixpwM+5bl04zbbxU+xR9sxCCSF/br/U4Wi+pmLni+qN9pp6LosQbM7Yh/
         7ei9l2olLzLThN6eE2z2B3PENPs5JPAdtZTvofZirsPQ8RVTcs4003FEHNEfV4g9DxZe
         t+fg==
X-Forwarded-Encrypted: i=1; AJvYcCVHb9wm8s0AupHUfJIxC8MaDazo/CUrnsCtS25Zs1HNna7rQPvGJ0+A3KpjWvU1OuAvhcdQzhFVzmhhN05B9g7qJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwccvaOvI3FVf7xIsL6yHaf3E/rouE7zyd1JxJWqPq1LUEzx1Q4
	+6yifu3PhQCu0Rm1v4dc/VAj2RNa5Tnrzam//s2KoNmIRHi7NQFapVnjyGMp70A=
X-Gm-Gg: ASbGncuA4ShD5cGA0mcdACTigfVEXDe4ISr/qD6yM9Ehw/sQm1ngYjBHieslbeQ/0Sr
	tgW2V0TiAPJtMdcHWUTe4sTgMoLfKTNAS5xlq+W7Li/ALdExhIioNAFjw/b6C/tmfGQF10n3nwl
	Me7+Uum/z7nPy3aGFbRI6tkUq2yn2tX2DUeYvd+YukFSfUhqujsFfd3B39SA10MfV3PBOFwcnkF
	WGAMQsXQnhLmSliqI3L1tWvoxRMY4eA/P04ec0T1ixJY4bKHgg1JFppKWl2Z25AyjC4m7AUKJhX
	TbXw/alpnuhjntmiHzrswrNCevrI7NktTG+DwcW6jUeuJsffUA+U8BoW5phYKGLfDGgRHQ==
X-Google-Smtp-Source: AGHT+IEO95pVgcbTTuL6m1nZThpMsZDecLSZl0E0qY4XHaTmqD45YQmuajiyCZeoAAauzastwGCgcw==
X-Received: by 2002:a05:6402:4312:b0:5ee:497:5221 with SMTP id 4fb4d7f45d1cf-5f628628bdamr4155171a12.11.1745308977929;
        Tue, 22 Apr 2025 01:02:57 -0700 (PDT)
Received: from [192.168.70.232] ([88.154.3.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625593409sm5532352a12.37.2025.04.22.01.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:02:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh@kernel.org, alim.akhtar@samsung.com, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Faraz Ata <faraz.ata@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dev.tailor@samsung.com, rosa.pila@samsung.com
In-Reply-To: <20250417113511.759268-1-faraz.ata@samsung.com>
References: <CGME20250417112513epcas5p2a44d0a4cfca2cccf97f1599af0e6b494@epcas5p2.samsung.com>
 <20250417113511.759268-1-faraz.ata@samsung.com>
Subject: Re: [PATCH v3] arm64: dts: exynos: Add DT node for all UART ports
Message-Id: <174530897488.9276.17366412245478167269.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 10:02:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 17 Apr 2025 17:05:11 +0530, Faraz Ata wrote:
> Universal Serial Interface (USI) supports three serial protocol
> like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> Add all the USI DT node and subsequent uart nodes for all the instances.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: Add DT node for all UART ports
      https://git.kernel.org/krzk/linux/c/1a6ee48d8757dbd1c243fa518ff31f33665d4fa0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

