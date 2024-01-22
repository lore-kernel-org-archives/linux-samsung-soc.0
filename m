Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2284120C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922117; cv=none; b=nET1Mm22tCCugnmYgOdNBlR6ujLM36yHASG4rcRH5Hf+lzQnUqGHblxK16eoNk6P9AjaKVeUYZ8Pp8Gm1B7LeR8kzI80GnLYJ164nLGT80bLTMUFUREch/69xyGb0Mfyf5A1MfXMpGr0oKYimFp/3g4pvJ/IGscxo2s0jHscjW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922117; c=relaxed/simple;
	bh=g71pOkF0q/D18ZOmtU7U8XWrY0ImCsg2nS7oXJFuYTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TEIKys5V7y/mUoaGe9Us+MvNY9RwZjazPa3t15SwFWqd7rA1TC6ar6pMa4iabHaJG0HxywZXeOJfsququhRW5Fghd5ROp3IRMjC++BODZy1KdzaK1/A9Hqit8rCS+2LGyEvssi6EgzeUicG24sPFOessXswjuzzQrq2hb5b3I3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VR6voqr/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VR6voqr/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-558f523c072so3548593a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922114; x=1706526914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18VyJIfEtiBUv58CrrtMAEX1dmGY5zrSQPkQzP0Kc4g=;
        b=VR6voqr/+necgvFihMKG+kzlldJZMmXifhR7aQkQqnI8olWtQu1SqgUcgoya6bAK6u
         wP706N6ESeHt5RI4wrZxzlJHm4v3XhqE3XKyT224q03mJoUOdaEIpKYkAgAoihlgetA+
         kh4DZs6+dyGzI5PGLKj3f89OAcX7dNqHEZc6Ernk4V+oss1yY2KgguSKJ0mEh9WQT4mt
         zQhcgg8vDuQwExO7sdH26roM4IjNW2rYtUAsJ3aEDvzQObWZx7Qw1aVpb1MBP1R3tB0V
         +trWKsHBprdppX51hACw+yLvPi9zZw5EbZOF/Lb37CzEnvtKkfnG+OvRcuTYZgsE6D3f
         ex8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922114; x=1706526914;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18VyJIfEtiBUv58CrrtMAEX1dmGY5zrSQPkQzP0Kc4g=;
        b=mzNjAHfySJIhk53LRRcpUNhGOEmygnqiDfnUSYsWcQFIxNDOOkhX8fWVpNLHoNowYL
         wR6sbqFCgoDop1TgqOMDaFl/0Z/OH1sR8S1EnGHnz75ZusKyYxggcdhsmXpQ1z48ugjN
         xSIt0NSem+HroLHDKCN40Q27mEccLiLsQ4CefL7VbPQst9U2mpZOQ0t6jk7fT8uZMDIi
         46LJgOrAH1+wBTLrdoQYEcFVnghpUCvyZ5yJUzIIpfJHzzxL463oz87YkJBasfEc/mOb
         k7GAZ4efynKsr/8/jGzDcNir7qo+3rw2QHXyKL5ZTPva5WLJZQkhWoskW3Ye340bs6Pt
         WhGw==
X-Gm-Message-State: AOJu0YwKe1JWDbtparr3IyRIfs3FXMY8vp+NBsl3DA2ogZtgVi0bk9QD
	o+Rt8HcPmJexTPfwz7dmiRKEaeJY3DPgaFaaUCadY7yjvPiOjWhHuTNI8AVktyCZnT5luj6tr04
	70xw=
X-Google-Smtp-Source: AGHT+IF072wtLDVuFhLz/laKC/3DyZTIFY+Nv3wRPhqhHWN3bhVDacXtc1jka+JGAi1z5WbEVcDOMQ==
X-Received: by 2002:a05:6402:31ad:b0:55b:397c:3019 with SMTP id dj13-20020a05640231ad00b0055b397c3019mr877760edb.1.1705922113962;
        Mon, 22 Jan 2024 03:15:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 daniel.lezcano@linaro.org, tglx@linutronix.de, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com
In-Reply-To: <20231222165355.1462740-4-peter.griffin@linaro.org>
References: <20231222165355.1462740-1-peter.griffin@linaro.org>
 <20231222165355.1462740-4-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH 3/3] arm64: dts: exynos: gs101: define Multi
 Core Timer (MCT) node
Message-Id: <170592211238.45273.922705807227687587.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 22 Dec 2023 16:53:55 +0000, Peter Griffin wrote:
> MCT has one global timer and 8 CPU local timers. The global timer
> can generate 4 interrupts, and each local timer can generate an
> interrupt making 12 interrupts in total.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynos: gs101: define Multi Core Timer (MCT) node
      https://git.kernel.org/krzk/linux/c/2b1b22054a8240e8e806d872b6fc361611f9c7a2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

