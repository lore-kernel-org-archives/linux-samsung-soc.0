Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C3620CCC9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jun 2025 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065092; cv=none; b=GA60eeZu6aFlgmh4IAi83jVxBSgvqJdVdBFWaBV1PQ0dXeB+gdgGhxbNpAWgxFvaacIP3Fzsrha3sukMuq7ZYiv+pL9eLcRWi2ykeYTGaICk9xkomd87fxAAUvMBBwJSIwCNQqlrlST5IM8Z52DTWWuC8z+yrU6T1pMisHHXtX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065092; c=relaxed/simple;
	bh=vEElryBNL7zZFeTJ1s4TPhoEWiGcSxvnISjWLIlQN9U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hBvSoAT+U4TkgayOsYWLdT+OaUQ4eGjs1ugoxvoGh6LIc6JE7ZwS/PaBKDsioyqz52MY3UK9nlsE1fpDmqPizX2nTfsgyKc2Y9akU07DAE71+baiMFwidIHN/RddADpnLceCdIibUCLeY1UmkWD2yttEyFOJRGTHzeqFXuEyqU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nc9LZ5SY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nc9LZ5SY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45306976410so1276985e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jun 2025 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750065089; x=1750669889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG2mpeuISDpXhdrt6iGw2KiNF6LC3P7QlYizdJ45M+c=;
        b=nc9LZ5SYxVDgRVaw4/zii/NkZU5/9WimubReXFMTXQl2PcvfxGrSwjHM3QE1RiulMA
         5B61RScbWC2deadYIBT2L/Sz7sUasDuB/7c5bFtm1gC8b7TpzCAcHCGzqNzDfvv9Plsk
         nI2mM3mox7gr5YhWBa+3wTQz2DAFGScpJEojRL6sheOvxbL5Cef4KzaBMrtLDwejzP3o
         gQN98MFJKig+Sle0xsLEtJUOXfOKDn5Q8KbUGiPNLixSzArzsDvAEgxNvrvwjnnjnrLq
         Wa4sBXuJP+u9s9OpPoOcOb3zhtF6LPoi4SNx0lEwLL1J3NiHmC3JFVYt5FwasQxafj+5
         WNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065089; x=1750669889;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG2mpeuISDpXhdrt6iGw2KiNF6LC3P7QlYizdJ45M+c=;
        b=Q0cJHgrR+3QG6CDs1+5wi1KHYx2c2ZM6T7MERQilSVJ8kIRjzdzKfmRXLYVN90ctmu
         xRzDrzBEp8x+ULQKFXfliBIJVJoQXKzbdUet5TpgoBhtW1JXXK50bvM0RRVJBQsix/Ew
         PzRku8OOPAYUNF+dMTp/0tAFjKJlkJ69pTnGPYDjlf0RfqYRdmPCMjYiEVV6rUUEnLXg
         334DNCRFCszFNgA9ezvn8k8w3C5oxt2hg5Y6rhqlGixtp6CC55hMtXuZRuCv78ILrKuf
         hXIppDmaU9jK0U8IvpYem2H0QzpqbuLAwUFv7hE4cZrri7MZfJNQfYogSr7XYfPqh7Ya
         8aZA==
X-Forwarded-Encrypted: i=1; AJvYcCWuZjL70+gIB2ygxL090dgsR9FYZf118Saea4qJyjQ2d2jGVJ/lNNw6RUwYXrdLjlOqYKfEJZzOji65mi8tAt++Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgi7JEe65G02kBZfGI7NexlxoJ3pvvsBezqV95nFnvXejjbBeb
	rbauJxy8nl5S2Rybyw2vAlQpIMVFRyXKAN8VNITmvmlNE+IJO9QCqCM7ceQD19bNyr8=
X-Gm-Gg: ASbGncunP4GiRJtE6rMKLDbKHuoZElSJiAyysGd7fIov/BeBisItyUEIVMnmnMV7TY7
	CFKjux3IVwPZA4NcD08pnPvc8SMJcgquXzx3/3FYz2weJObaMWwGGFOsbK7H5WeOtYO1wcxQs5y
	mr4wKmTC7AcPBvApPMiAmjTIn3cuq7hZPceEc+/qZ92nB/sHsNW+FFu/NevnjMn+3COIznxEoYG
	PS2PSs5iFlAdntMOQBe2/bspNPjUa9Iks4vpxUu4ioQ61GDBwNcDqyUxA+CJy70EqEf4kXRtfa0
	P/GaB7awewqHTAO1UJTCZIrYR5ZTyKTiWalGckt6Ou2/60t3Sy9yVUaZXjFyhgcnkDT/fFympEN
	B3SoVZxE=
X-Google-Smtp-Source: AGHT+IH1WB0/sw9sqaChH695gvNYuYsdGilhFE4QGQCFNv0A2lCd1A3eZdG1Rw5dHdNgAoDh7P85qw==
X-Received: by 2002:a05:600c:3f9b:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-4533cab4477mr28464145e9.6.1750065089320;
        Mon, 16 Jun 2025 02:11:29 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1cc5sm142655045e9.16.2025.06.16.02.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:11:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
Message-Id: <175006508796.28664.548838572668518596.b4-ty@linaro.org>
Date: Mon, 16 Jun 2025 11:11:27 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 12 Jun 2025 15:44:22 +0200, Krzysztof Kozlowski wrote:
> Sound drivers are not essential to boot boards or mount rootfs,
> therefore in effort to reduce the size of kernel image (and boot images)
> switch the ASoC drivers to modules to decrease the size:
> 
>   vmlinux: 152864 kB -> 154528 kB
>   Image: 39391 kB -> 39067 kB
> 
> [...]

Applied, thanks!

[1/2] arm64: defconfig: Switch SOUND to module
      https://git.kernel.org/krzk/linux/c/927f1259c517ec0dc589f5014c4edbdc87591cd8
[2/2] arm64: defconfig: Drop unneeded unselectable sound drivers
      https://git.kernel.org/krzk/linux/c/a8365bfb249907069fb584a535d03c291157ddbb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

