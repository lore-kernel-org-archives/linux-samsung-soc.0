Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD0F69E1F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Feb 2024 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707379722; cv=none; b=VjVKiKSdYDZnqRm0WPXP43Y1Hh53IEqhKNbQo5VbBbuIpvZzz/SMTbP3VN0rtQ9qVuPosRklE9PqzB/MChKchjZh5Lm3jlfCQtDZqBH0uVw9+dWDtKnLqSd5ok9qS9RFEf0hWX7udAzNs96DqLDYaFAar4MSZYVYhSioS1rb3WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707379722; c=relaxed/simple;
	bh=ISjDitqb+ZbK8+dKabF973NAA2NPIuhmUPhTTGAzRW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p2gRfUHG3wEnraRcPH7zsAo8nrhh74xHyg1vscRHmEknbJlign/7tbVwFJmtwPQ3t+jZHJY51p+aKE559RapSCFOcthvyhLE5C9KoBmu2RdahgiQk/E8emMiFgo9L+DabTHrx1cc/DbOYuv5w3EkEl5Yl69NYeghMp5MXCXXNUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KjsGCCwe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KjsGCCwe"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33b4e5ed890so1106851f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 00:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707379718; x=1707984518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGlc0BEFXphJtLegLo/m9ZhmZ3HTFX+KzHZ3/qNGobY=;
        b=KjsGCCwehVzRoNpZcxJLh110+x5YboIFLf3LXZhNYFzYyInRf4JdAN1hkeUrI8JW4W
         xuZ6czDGLcxfaGgfPT6OmmDFuJ4FDZVlUadAbbfPCU7OM5Hi+cnbFiCWh9/rEvMTNJ67
         viyjRLNpukTaViW7BHW4z8CZAVIVJ8bOdw8fkHlXmdhPq4yKXQ/vHOkIVL7Jlpt9x0nx
         faoxyMQ4djTNvXExasotLI4AkwDRk3TMMOPFXOCrzjvDbszzY8CpIyv5+wdcsWz/CiLb
         BHLF5tedOv4LEv1W7i2hHjsNur2WVVhokTH4RSS1FVEJcW/2G9ngKFzQ+qmyvlx9R8Ld
         ISig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707379718; x=1707984518;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGlc0BEFXphJtLegLo/m9ZhmZ3HTFX+KzHZ3/qNGobY=;
        b=SCiF2rT4D5aYC1/TxgP3aqNjWhB/p0knzrNUBWHgIWxbXUXYtXQ5JY+k2qdIgfpoxF
         7FuxEauBolxnUs4LI+9pJuhR7jRD3FrJR6050X6tpKufUAS5bwoES1DZvkmReNHM0cm5
         GxRnP4ZWWZQFy6ng831+wTQPpOlcuZ8zLy9FStWIjNtyTZso9wYkNVLUjlfh9piZ9Pmd
         qNkNPUC5CrXrH6W6IOo/Q5k4/fAaUr4bvvU/G7GRExe7h/WBH2WIERKtLlm8wUC7iPwj
         8+rqufQ+L3DZIpd43KaEY1Q10seBzMoKY01NQY6mejOhe0spYoajDNHaE8MeuUrSA/X2
         zqVA==
X-Gm-Message-State: AOJu0Yx6MYVJmoya0RgkpDnGCR2plMtRyvs84QQCKzUIMhPM8dve9z5o
	cECpzDsazO5FzJ0OVB0hcSHoIfyoCHrkrCMN2QNY//7Q8kmGo1o8kt55rb+Ptr0=
X-Google-Smtp-Source: AGHT+IHjVvYgErJX0lDYYWtwLfvLSkWITRZKpjgtaX6OAr2ae2qKFP+o/nGEz5PChX0mOUyBgVtRxw==
X-Received: by 2002:a5d:51c3:0:b0:33b:26de:4289 with SMTP id n3-20020a5d51c3000000b0033b26de4289mr5130746wrv.42.1707379718123;
        Thu, 08 Feb 2024 00:08:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYiyJyTwxPCbMdnZEBmmPC68dFbfloB8T7e+/FPtJQDikkuc8hNtkMuy1BIwNGDpqd/i3dAUVdRjLstT7/b5N+6WLvEW6a95ElGs3MK/5AdgjnbleCn6jrOd0TcKx87n/Hio1QHx4PGy7bORVPPW5NS6Ju84mw0NkfWCcOre1uN3i3E+vsYh8dmH4jpvinGhHlekFOEnRaH5iokZxx8zn8P/hiwSMZWDy/L5ggvl2ZEkA+EB84jDQ+c8SkDqis7v8QL5G00uhHWiYovrIOAUHee7jQFKDJjCcQCWnc2dw2q7oq+qmtuysHiWOe2PhDSWiq3AsKfKXA0332q3rLnCBAEyJVoUAQiKG6DZjl5CwXT9k35gHaFHhkVS0IZvJ35IKAeiMjEnEyHucwidkDlnFsdbIRzt1p5shqEUEjkecWDB0y2uhE2hHuCzPEPJXcpN34tX9UXSoqCqoLtQSIb84lycxGzc/lIwCHJkhgM/MK9NkV2Wk9n9KGwqpDs9+dXf0C5B1M0RPkkarQ2/TCDZylqj4D2YACqCDdv5tCCzGDJ766e5plGhh9OKG0SuZn2lOf+iSQYXPzB3qGPWe0Yg3xSvDTFmLXvuvIbFUSk4ARqu4UHJj6IkU6up47kZh3ojF242EeVv/hjjZUhSgZ/T0D4JYY0lb6pWggTiWVv9hzs4keuevPlA==
Received: from [127.0.1.1] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id m3-20020a056000024300b0033b2799815csm3065421wrz.86.2024.02.08.00.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:08:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240201161258.1013664-7-andre.draszik@linaro.org>
References: <20240201161258.1013664-1-andre.draszik@linaro.org>
 <20240201161258.1013664-7-andre.draszik@linaro.org>
Subject: Re: (subset) [PATCH v3 6/7] arm64: dts: exynos: gs101: define
 USI12 with I2C configuration
Message-Id: <170737971569.52344.5797056301424786699.b4-ty@linaro.org>
Date: Thu, 08 Feb 2024 09:08:35 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4


On Thu, 01 Feb 2024 16:11:42 +0000, André Draszik wrote:
> On the gs101-oriole board, i2c bus 12 has various USB-related
> controllers attached to it.
> 
> Note the selection of the USI protocol is intentionally left for the
> board dts file.
> 
> 
> [...]

Applied, thanks!

[6/7] arm64: dts: exynos: gs101: define USI12 with I2C configuration
      https://git.kernel.org/krzk/linux/c/118261df42496241713cf8190535e9c90e7011f0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

