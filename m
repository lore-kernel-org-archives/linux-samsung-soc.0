Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2392220297F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284677; cv=none; b=WlLBGikccXkcw2Hq8wVvLIpSuneMKkMzVRgFh+R/AnBDIcPYeELzcImro9a3/HN4bG8CReZ6Gtc1gIieW/omHerWyblQeefAE1H0oNs4/gDYgjpaa/VYIsWcO9ySvFMGN35tmltKadTUPB99aZC+8zk9o4uIiWe9yXCmJ19BG7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284677; c=relaxed/simple;
	bh=JbH8xjfsf6P7OmD9axfTwXfSPdYjRzKgiAuZzz5MlcU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aEWNXSVROhk61hBchcLU6UpIb9jrrIz2OypmspA91/Wt25Rp504mzlpYkozJPPXMyn8HcFFrzO0ozjBlprqIpoQgmhBmnhbuxkB8a2ynmWnaoCzQ/+G4R2KmUdBITCITADvqk4AMKvswhlw3Q2kS+lXLz0jawHXDrxU80XCFU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWy2UugF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWy2UugF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394944f161so899095e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 10:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741284674; x=1741889474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AnLds6lWEOgctovP8rZZIFlWYH7eclRkLDrgHTySwE=;
        b=qWy2UugF1tUw8XPDYhoHYbJrl0VOPngWhUtJ5xH+7o6fmMcFqmJteyg7MoWekPmjpe
         Ch0Xo8SF3N51fyqdn5fAUEZopgiT2PBuKrROUTyLNfJcktapgs2f31kkgDNZ4Ahn9nx2
         RPlJ++L22oSc4MiIv2dY6NgDbWbvkqf2ITqMXbzPGfAVm37f3kz41msk9jEhzH1pswK2
         RK4RXceUXLS3gHPZVE3WkzekX/G1+ciDEDvD2kSXCFGFD0MbGkaqXEoCXl8C6MsxuawJ
         7pWLWW0zUzueVBBSZFD/rMhRxMW+0ZL/ygPVvJ4nJEGXKGc7g7K0kTh70I+oNxKQc8eR
         VF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741284674; x=1741889474;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AnLds6lWEOgctovP8rZZIFlWYH7eclRkLDrgHTySwE=;
        b=cGK6JaImzr2RSfOKzB9QBKY8bxM826dZJYvw8BCmKdx04JfyYZnZWyG46K2Lx1J0c4
         rKmCdoIFJ1xrnhfhu1S5GGwIDq+1/xGwu6TGt4+GovQRDVjJMo2x/7SRkFaqjbkv2Ji1
         ow7leNW69caJq3T4w8FAGuyoeZnOELaY9D1U0lVpBw0FUxLM7Gv7ZZVKjzufti0BtL19
         wVEa5jiqm9BavNhNXxi6cYP+rpVxoh+J1Wp7ePSE7toun/akls9p6/v+eO4zd7BK3J3u
         jZ1oS3B5LjsyzmaRdwaRDG08QLrxXap+9TDQ8Q7rMUS5UdTlDRoDns3ThzUYB2c3DQZr
         JQSw==
X-Forwarded-Encrypted: i=1; AJvYcCWtww8d+MT24BNafzPY9ajnJgdPPfWvF1sB+XqelVC8IQ6PwdVxOk/AhRYWtEccLC0V5gHxEU950eTHfpQJzTEaRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu2DkE1OPVjz7mi2i08vvDqAzzJxtZ4iGVqUWPRRlPq5Wg+TyM
	6AAFf13u9GhQiGB4AbvB6vWyZef+8cyCb/xxYL8u9KLehp1tcn/Ivp4402oVj1I=
X-Gm-Gg: ASbGncs49zyWCA4g8XYkMJy4k1XfFOBOt1Tir3uSGAxdsTDAJ812z+EzLyxF1w2MISN
	f35IFVSl+edItUouneQ6N9baG8EGTfkPg9BsaN36lorDOBJog8gKW+FtK2WRqluBKVC/s40Gjvy
	1XxmLqHV4tn+zgUX59MeJ4vNQVNXlEwMoRYe4banF8ESUpmR9et/fll6s+If1xAL4I+jPxrzPyL
	hZZmznhzRE6guy9JA1DCnVR1D4OuKMVeYlRuK76Dn7QEBQWyX7ZaWVzhM6BsPfume2f8rx76MlF
	NROmhrvFOTUmoZhNbHBTpIL92mVQBcQlZzcxHCe6Px604KCiifBxEVtIrFKT
X-Google-Smtp-Source: AGHT+IFFRvwmZacRwHe9yk3mbn6KEKhfILWjskick/fV1fIsJkk5zhEz8ZiB5cRx3bewoTl4Sqa/eA==
X-Received: by 2002:a5d:6d8c:0:b0:38e:48a6:280f with SMTP id ffacd0b85a97d-39132d93f92mr48151f8f.9.1741284674274;
        Thu, 06 Mar 2025 10:11:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1027d3sm2716967f8f.83.2025.03.06.10.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 10:11:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250305211446.43772-1-arnd@kernel.org>
References: <20250305211446.43772-1-arnd@kernel.org>
Subject: Re: [PATCH] soc: samsung: include linux/array_size.h where needed
Message-Id: <174128467279.252750.12742713284242817976.b4-ty@linaro.org>
Date: Thu, 06 Mar 2025 19:11:12 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 05 Mar 2025 22:14:02 +0100, Arnd Bergmann wrote:
> This does not necessarily get included through asm/io.h:
> 
> drivers/soc/samsung/exynos3250-pmu.c:120:18: error: use of undeclared identifier 'ARRAY_SIZE'
>   120 |         for (i = 0; i < ARRAY_SIZE(exynos3250_list_feed); i++) {
>       |                         ^
> drivers/soc/samsung/exynos5250-pmu.c:162:18: error: use of undeclared identifier 'ARRAY_SIZE'
>   162 |         for (i = 0; i < ARRAY_SIZE(exynos5_list_both_cnt_feed); i++) {
>       |                         ^
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: include linux/array_size.h where needed
      https://git.kernel.org/krzk/linux/c/4c57930f68d90e0d52c396d058cfa9ed8447a6c4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

