Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F29145FFA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256277; cv=none; b=j9I57lEQjjDbLXxu3+u6HhyT142ATKJH3TAN0K9Yy/AkpG9FTqnP9Wve22eiVnaiC5T884MxCJ8WnI5I0d6WoJTDcDv8CfKugTc9sJXIXromtPeB7kavHHFt+dezLocvUvUidbGajql3/OnJ1HvoXdQw8AYW2fSA+YZsaylp22s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256277; c=relaxed/simple;
	bh=1MJdqvR4l66CFymtTigURAQi+Ak55GLMbQ2E/5ReGDM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RhztffOpt7U4rgDtQ6iSBk31AQDKkpNqMayo3eEtMz8pKidcJjRiUxajowAL6Na5oTFzGhSi86NoqFCKnjetsrjEv0XZDNPrReI4USPira6i+ucwhj5SR3odDGbqKFPee7WGq6LaKbdfd7lSHDzVXSjdRjLNzQ6SKtkTWCNr7zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RA1Vd/YF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RA1Vd/YF"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a94478a4eso701302466b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722256274; x=1722861074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXEWCd7FqpXeUoPV5fLPpv01DhdKsxKfAinrkombeok=;
        b=RA1Vd/YFLsDhjZBh4ET3F2CyuWwWNz+nVsbtGY9VzzsPOqGIxYFBE4yg9ekUGV10OS
         DHALFcbESjfOHJTwAfyn3qiM3HSLbe1/Hyzzel3YmaZY403Zdee9aVruysamQx3DMC1l
         ta0cgLR3minX/JIB7JyKhcgIu0rfWcrW5wvMW8bkdyHMqI4GOTf5N5Eo5z0acMLAP6W8
         4p9DhWrCNfRrcVt/5O/4UtSGBxUEz/p1xnm9kUZOF6Df26uuLGEulyodywkpU40QH5Y6
         e1l/9cr5WgJkiDgG8IRGq0tl6Khxzn5yLT5pPh5i5w3N+qyYlx56LTqEHD4YcxWotjdK
         uZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722256274; x=1722861074;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXEWCd7FqpXeUoPV5fLPpv01DhdKsxKfAinrkombeok=;
        b=iekqMA4lWb3rsPJDzqSS9rtastpQirZFbN44a/zUmvATdPE05lZXLcVNsDUKIs0WIH
         PI2tG9Zk6yDUha6MgEMrxiUuxk1s1bcG82wUo2Mlfg2OLjJ+JWhc9zoAEzDwtPS9gc2o
         ArDvO0y6Q2zrNfbx5v4C0wINGTT+MK2Y14MKKnOGe1ECa27rkcc7FDVszIOfLi6PCeso
         tH4UyjXsoCVS5kUl4mN4nM+uIWH2rAEm9IEchTk5u1+KeNCm5rDaREJQc37USsGI1GfO
         boEkwLI/ptdoWq4qXvR+zpi2ijZR1Uv3ANXE78Gx1hbu5ZynQoySTxLul8m3rF3j9oG2
         Rgfg==
X-Forwarded-Encrypted: i=1; AJvYcCUBaAOYSHj4pmDG7//iRiRNI9iErfqIAA7CGkHiv5HbXGiDr4tKDj3tnA2klofmBGg/4qhxB3nUdP/nxd6RYm6TizLQxWZLdL97+9+4sqg5Nx8=
X-Gm-Message-State: AOJu0Yy6akFw1TkgVVByNUyO3a5bmIb0KCR/L/LQD6/TXYe4YwViS3/t
	FJXdrRY01ibxyDS4domqRw15M+0XalXplwGT5ygXNFryJ7OCfMCzWEsFAaR8Bik=
X-Google-Smtp-Source: AGHT+IEcCCNjVqMjw+SlV2NGC1JBsZBQwl83wS/81hnJwhDhzkYKop8654LkJwHocVtqfIz4Gw4IXg==
X-Received: by 2002:a17:907:1c19:b0:a6f:e03a:99d with SMTP id a640c23a62f3a-a7d3f514a03mr869934766b.0.1722256273697;
        Mon, 29 Jul 2024 05:31:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab22ff1sm501973966b.35.2024.07.29.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:31:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20240628223506.1237523-3-peter.griffin@linaro.org>
References: <20240628223506.1237523-1-peter.griffin@linaro.org>
 <20240628223506.1237523-3-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v2 1/3] arm64: dts: exynos: gs101: add
 syscon-poweroff and syscon-reboot nodes
Message-Id: <172225627208.280610.7893124858038384866.b4-ty@linaro.org>
Date: Mon, 29 Jul 2024 14:31:12 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Fri, 28 Jun 2024 23:35:04 +0100, Peter Griffin wrote:
> Reboot of gs101 SoC can be handled by setting the
> bit(SWRESET_SYSTEM[1]) of SYSTEM_CONFIGURATION register(PMU + 0x3a00).
> 
> Poweroff of gs101 SoC can be handled by setting bit(DATA[8]) of
> PAD_CTRL_PWR_HOLD register (PMU + 0x3e9c).
> 
> Tested using "reboot" and "poweroff -p" commands.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: exynos: gs101: add syscon-poweroff and syscon-reboot nodes
      https://git.kernel.org/krzk/linux/c/2d0c7ae784b487343b4813db9cb133ca51c674c3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

