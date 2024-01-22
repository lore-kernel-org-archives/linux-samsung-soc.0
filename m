Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75C24D12D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922129; cv=none; b=ZmjA9zEwj3b4qvE+umDlwbe3VPk+dslccA1xRnRhiRKG0xQXO/gsr7zOOMr//v40ONbuuQ8AFGwWVsIYQJnnJVUMIswezjBJ+GOkWEI1v2Iznp/l+Ghlf6v74gkcPK4vm7RkFxguq3GiHVCw8iaGC/g3Yr0033DHvNbXfmvk+zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922129; c=relaxed/simple;
	bh=zqUosqAADFAXSU49W7yNSpBo5ZdibFlcSgW7jwkjAr4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r8jtBZS6Xza4oBmOBkdMxGMZsFezMW3esf0YxzyR6AzoXNf/z2wKWgih5wlCBe+GtuYGpI+NcTk9pvoE9D8qlSN248paMOzww4EtQLw8LKuoD3cnL1AqrnpcFjB30UNzOGD1F7+JYVvwZ7LI7bU8EFZ0x1B20TYC+nUmANASEgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eRwQAzxS; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eRwQAzxS"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55a86795a3bso2290789a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922126; x=1706526926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1etBiuY4Gx5fpLncSE9pUUIVH+BLsAa47XQpuiDMaA=;
        b=eRwQAzxS6iHR5qP7hDPFXSEiQwXyw6me7hoGsBZkbCME4b/EDt/+d9m5FAg58gERmw
         crdyU1xPFwSJVV2F9Vm8zWRk8694FerwubhtWsjAVH4ZRm5/WpqklNjthYfDK7DSaZkd
         Wyi0BOy0p1lk9V6yG/AQiWoj8J/5iF5pokQPKzVRshKbmaiKkw20J1D9es2lS6xPyzmR
         yVCGKWghh9kGPnFdwuXznYMhOBXa9dz1yQozLzz37gtALTqpNBAzdRD0b+xhTjmHnhT5
         k9lAKyoavpO76/7WBl/9bvpJUgB3sXPi1on5ZW0DPnyUcClXJOxywz87iBKjNPHqE8dG
         Usdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922126; x=1706526926;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1etBiuY4Gx5fpLncSE9pUUIVH+BLsAa47XQpuiDMaA=;
        b=Z+OrXmYmOTz1VDNWAeUZWIo7yj0u0tGSVNtHF/P5mQQ4RsRDuq3C4Ss6kAX+XSGT2r
         oz0UvCSBWp0fhAJsNNDlugs4YGAiPRAm8TggzSYUPFVFhKqJ9pl8TAOhwaWSMBxdBnn2
         9/1wQGwx3Dqy3YjuIfGhADSklJiiESPkTsWsXX9ektCwSFiOYY9fdKcE8ncW/IPSw0Gq
         dUkLSMTvNsET01ylu5Ip9jeKPXhbE1/FEVXiJ2R5CDs/ib4wdqaTgoW7OOe9jZR1UPhl
         i7M3FA8NnEdBtKQT3rAqNCrqo6kpqRxaJ8oEVkl01KKLNOQmFvODTSaO2HJPnNYW3nT0
         PX8A==
X-Gm-Message-State: AOJu0YzLvw+Mm95RmhdvpXcDbf3dFoXmTEYBa2rOcf708zoNHuUiFT+u
	1dy2mE8QPz8X52LoAaH5HYiIYHTeVJxlUtFavxnS7rMYewSOcgrKhg7tvx5y5tTJeBOHAvpZXOP
	HF5M=
X-Google-Smtp-Source: AGHT+IFQKi18QeQZr2+FZ1aV3dK9rg37DrM/PU/a1FLNq79hBsfDW+nKFDeUDYP1JekAUJlndzmQPQ==
X-Received: by 2002:a50:ff17:0:b0:55a:3c3b:9880 with SMTP id a23-20020a50ff17000000b0055a3c3b9880mr1437666edu.60.1705922126038;
        Mon, 22 Jan 2024 03:15:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 andre.draszik@linaro.org, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20240119111132.1290455-8-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-8-tudor.ambarus@linaro.org>
Subject: Re: (subset) [PATCH v4 7/8] arm64: dts: exynos: gs101: define USI8
 with I2C configuration
Message-Id: <170592212446.45273.6681368312727990012.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:24 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 11:11:31 +0000, Tudor Ambarus wrote:
> USI8 I2C is used to communicate with an eeprom found on the battery
> connector. Define USI8 in I2C configuration.
> 
> USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
> doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
> selection of the protocol is intentionally left for the board dts file.
> 
> [...]

Applied, thanks!

[7/8] arm64: dts: exynos: gs101: define USI8 with I2C configuration
      https://git.kernel.org/krzk/linux/c/9ca7055a35a7b2b373ead6f3a67ee8b5e0e6e468

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

