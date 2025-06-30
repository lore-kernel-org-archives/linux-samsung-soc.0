Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFB41FDE19
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2025 06:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266604; cv=none; b=oA9q6GaTnP7onx6afNhO7pSmjTZFCaZ9xmv1BogZffnts1UniIGlOP4/VPf90i/j+OqcEe2oKcdI5/DIzs5ljCRYdRFjxq9UgjrG0EjwqsfGRJMj4edQkIVhYKipt6cgYglu59/w5ZHseP/Eot6e99Ah+LOJvfDbwr/rNtjG9Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266604; c=relaxed/simple;
	bh=V8lMI/ycTv3tqtCuknt2wqYhGtqZO6N//510l4dI67w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ejYx+ly4Pq7PvVHRlGezHbXb9NOzYiCDZBy9+3KEXEiH57woVEXQ9cqyVLETS5502NXcVvpCZN+bpB44RyafosjZFzQPAvHXaelmnu79hUk8QOONd1xiWLMigQ7qD519EcaCENGYqBsSIjLki650WEZZIW2J+Axzc2RXLXvlZXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vC+CiMtZ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vC+CiMtZ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6089c0d376eso844643a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jun 2025 23:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751266601; x=1751871401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+ucKXlTGds2s7GThwxlN7FGLXCQFZmOc6TZ3BNHKTU=;
        b=vC+CiMtZHVNmByHQKluhGBTBh7ivXLQDBwwKfgdWYb35QBN1k+xoCMMwwLKhbZ7mra
         dp0GmZwpBrXnQmyXuvBGGwv+KALZbA2TWc/hWmB3C3dvTaKJ1cYDsBnjawV2y1GIfIbt
         jRwGYZKLc/zo+lSPz9s0Y7ZSeBQheQiWHLxIQH/6sEORZ9Voul1iHiZWN69k1wCXQge4
         LR1o/GcAXANpjaosNR6sBuxXDPp8piCo3/5HcZ8TKbI29bV4OGZbQwZ0g+yCvWcvwZIi
         QgGVFIyQCPYmb+vRqX+xTQ0R7cOZKsm8B14L0DVugE9mS7TWsSBUDxWWAcogikomYfdq
         Wk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266601; x=1751871401;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+ucKXlTGds2s7GThwxlN7FGLXCQFZmOc6TZ3BNHKTU=;
        b=GD0CKShq198e089mjSzIi4+mYQYt4Dy59hTTaflZOIh2aB2u02Gy9uJ6H0hzm9oK6U
         K8ZeApKFy5wgSnGU9U6/NsPfK/Vlmj/3XiapchUECCEfUUb0O0rqO3t+EOgKsKTZ37tV
         DoO60ivQlnGQbYa5gzuLssq/zOa++j1ZwicnMdn76PRw4nmr0sX12wC5EdW9gSsoXyqI
         VO/6V8UaDTalU+XbOGS9LHrNvRBnAwK4vcPJhCwMh3vVnp+tAOub3CeMSn2EZi26PCnl
         t+ZUjm5F8FehtFHQCVEaHNKDZy6LCoPZxNyc6AFH3CQA+DK9K+q37rHaxmuCPSaRai6L
         dpnw==
X-Forwarded-Encrypted: i=1; AJvYcCVxQuekHOfbmkjyr8CUCiVpzVeygf5WgvqFPsZpLD7l5VCul0W9BoDPmWmwHIf56XLoBtufifDqWNsgcTZ3V18m+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUdgdEC4nR7heWvPKnZ82N+C5SyhV9UGKxc801/qIuaYxSYGi
	nvEeLmH+vpt3zlPnofDNJTQm/A+8tqLH4/c9MLsgKQeDObo7kNKTvHLyzLxMBN5yfXGjL4r7A8i
	lv8ZcBDc=
X-Gm-Gg: ASbGncvlvK6zV0xSPhjeb8JLdtGJWJ0fArI35Q+xsmsZDH4I9vy89zMoq3tUzIL7ZuC
	B3t1wbGMGOTcVwNnYxGP5+pZtDLJrTHGN9ZHAp0TqI+1I0HqMuZz2llCnxfNSklqyN4cML0Voo4
	GQsyKUAX3FOuGeI6z0ONNHn2dC+wEOD+BcfRh6R7BumbWATLaGgCYMBMR1EymbJwwWpK1mj8Xpb
	vjylmYANVeqSy2LOsSw8fIalU+FjsXWMks7TFby5oaGpe9EuVyaRwHDfJS7QzsldQh4GDRnYOMh
	22kSPn6U0vfkKBC/Y3bu3Fmh5GBL2L+q0PfIxDx55DTtl2TVH3FRibzMg+arMb4YK1w3QqIfJOT
	Y
X-Google-Smtp-Source: AGHT+IGU9xP+Go/413QUXOq1KbVbfMFxzQ8IwfNr4sg069oTmFb0gdttj33NjsLt9OC8dhZXTxaTLg==
X-Received: by 2002:a05:6402:1e94:b0:5ff:9994:92d3 with SMTP id 4fb4d7f45d1cf-60ca35c05b9mr2021686a12.2.1751266601314;
        Sun, 29 Jun 2025 23:56:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb118sm5368960a12.2.2025.06.29.23.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:56:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, kernel-team@android.com, 
 willmcvicker@google.com, stable@vger.kernel.org
In-Reply-To: <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
 <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: exynos: gs101: ufs: add
 dma-coherent property
Message-Id: <175126659939.23797.4726512180709761065.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 08:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 14 Mar 2025 15:38:02 +0000, Peter Griffin wrote:
> ufs-exynos driver configures the sysreg shareability as
> cacheable for gs101 so we need to set the dma-coherent
> property so the descriptors are also allocated cacheable.
> 
> This fixes the UFS stability issues we have seen with
> the upstream UFS driver on gs101.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynos: gs101: ufs: add dma-coherent property
      https://git.kernel.org/krzk/linux/c/4292564c71cffd8094abcc52dd4840870d05cd30

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

