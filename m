Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63A92165E2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2025 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266608; cv=none; b=ZNDMH0rfPHAzGAIDAkb+O0RjjaExv2tvCUcGFjWsZHP18ud5o+DjqJH9Wp47Gz0iI3LpNf32tZgBtDy0kExHnV9thddFfK9koGaDuGU1+5N1ow3MVCzDZqdQ+9Fzd4TH6vaLA7qy8VMS/bjUM43NiaZM2DscRLabPD+Dxr4ilSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266608; c=relaxed/simple;
	bh=HTOHobrCfI6hFxlgMrBr4PI5jq5Y4VVtQkCxf7slG9g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D+2siqxYLiYzWDHCt86x0vKC6mvMrduDsiXhexsiK6Dtx62QliG5KnTao1jiBbWMoM+mFVU+v6Hn039FLW6vP323f+GXg3Bab47QvVsMZpOxejt8tSAdKNeCe94jh/SsnFDWbDhm+QcTNser8BR+FLjOibkUge+i+MEV66AylEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vvt2coTt; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vvt2coTt"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-607fbf8acb6so669282a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jun 2025 23:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751266605; x=1751871405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyZj8nPcPoTnFMccEZ4zeJr7vJzNSB8EdaxDKX89cNY=;
        b=Vvt2coTt7yhRFMgvOOzvlZzLen1fv4F+NTPNLDzw/4RpduOGXef4fD+k2SvpD7exn0
         m5Z1BB3TNOcodc4E9mU4hNFSy0sRmQH8ysAvhI1sXIzvYdH9vGL5NS+tHe0gVLuSKV5c
         h/Ov6pBaMS2zX5fcI5gOSW6ggqnRMaz5IcPRKuCNhL+I/Xr+QJtMf3zavnxTNYkVkvcR
         IyU+8t1PUv5yNoLwGqT31v0VZOKqncbGwcuFqNqv+StX4gE7cOXJkB0pFgQ/txJgjUrD
         G8qtgyNqMB4gfaFVGK43AEVnS/Oe8u8HegVJojZT7qIDa+mOtrikaJHUAkD0B3giOLWj
         PADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266605; x=1751871405;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyZj8nPcPoTnFMccEZ4zeJr7vJzNSB8EdaxDKX89cNY=;
        b=NiiCzgk52gpupJIFwDWvlDI6zuITMZ9ExgmXAS5q+h5T+wmopK35SUKyDPVjbvz0Hv
         Vrlz31jTtRaYW3LLL4QzU8evph32mkLP0yNCMOAiE1mhGidX/TsCJ29r6GkyChKZ6t+o
         mnwq3311HIQLJEUlmYy3Kh3uDc0riTg5zrdwVLhTTBnRs7eQbVswaFO2ud/ymXWIWHU1
         htOcHEuzmk6DPPmps7G8wBhv09ck3qV2POu12vLCiXeLJ+CmudChUuTrPhMZHn/KvlvL
         8WzlcvxFPndrkY+h8YEfgrBiuN91mAN0gvYp+bBfk7wQ+G0WraTNkAWRnewIbNf3ivtU
         AqyA==
X-Forwarded-Encrypted: i=1; AJvYcCWIc6SKLGq0ZF+yRF3aDw0lunL9F3wcKUFR6wd/zZLGaEd3rLTO1oB4g4j/pjC7qfs8oCc5uScLGShrl7Ruy1qOsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX8TbCj825rJh6qY5nTLqxuOpwWfJQ8ToqBPjHFFncBcoY4Jd8
	nGcTluZsum/qYW+NV8ub04hnpnQbQgDeWljEGAx3LwQgP91JmTF8pBpmI0WYYjcyiF8=
X-Gm-Gg: ASbGncu+fDgS5IUJIHWeDCp4sw0ZQxGNZvStAjwtUfen4slMgWywgrC8YGkV+y2XGJn
	ZPFyCiy5g14OaqsWxvPINjP6xqPXdBGHM6kqd4MrU+WGqSqPIwUw9KvKK6U/eclTzb7y3CHQz2P
	XVNQDEtZa4tjjRwqOKvS1ToToXGAQgAuWxEYC8Z/fAUYBQshDk5DkotSgpgNNy1+nCYNi04+9XQ
	nC0ZlQDQnmypQ0Ry0cEWgm5nBCiz8h4ANUEP6UF7aAD07q8qu8N/RYUohtA8+F4qf0OJ5K/47N5
	Hbns6frqU6UAMVRNx+2zHjhIZj1xbZdQcAloEG7EekOA3flwC3cqQ/dD9t9NcQxU/M64JXIibXr
	Q
X-Google-Smtp-Source: AGHT+IF0+z1owk+fQhEVA2fP81jzcJuC/IcoagGIIigKva5Af1N3s9aozT65e1qAq00izYhFRMUbUQ==
X-Received: by 2002:a05:6402:3490:b0:606:c63b:e330 with SMTP id 4fb4d7f45d1cf-60ca3e0fd25mr2340236a12.11.1751266605105;
        Sun, 29 Jun 2025 23:56:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb118sm5368960a12.2.2025.06.29.23.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:56:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250627-gs101-reboot3-v1-2-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
 <20250627-gs101-reboot3-v1-2-c3ae49657b1f@linaro.org>
Subject: Re: (subset) [PATCH 2/3] arm64: dts: exynos: gs101-pixel-common:
 add main PMIC node
Message-Id: <175126660357.23797.12999014695836191870.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 08:56:43 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Fri, 27 Jun 2025 14:29:31 +0100, André Draszik wrote:
> On Pixel 6 (and Pro), a Samsung S2MPG10 is used as main PMIC, which
> contains the following functional blocks:
>     * common / speedy interface
>     * regulators
>     * 3 clock outputs
>     * RTC
>     * power meters
>     * GPIO interfaces
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: exynos: gs101-pixel-common: add main PMIC node
      https://git.kernel.org/krzk/linux/c/cb98b8a8d6e2797f1e4a0e433a20c57492daf783

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

