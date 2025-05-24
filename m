Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EAC19D07A
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 May 2025 05:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748064102; cv=none; b=KGTI4NYiZl7sZ95iVzpRITN+47HpE8Gncq+wAqalYLOYz1j2+PkAsKrjIajdL8lGDT+Ef4w/HdmadwzM5ZvW8SZDRJmnTWeIUSx2bEvI+3jhRpqgSRBNQah1uKvDpFDOE6gGldpCUWyn0JSc+PKq4jQ6Tf298g1P5CZj/x3wglc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748064102; c=relaxed/simple;
	bh=TpC6PkRugx4epgip2T3sTO52PlSZ3ufOTy2Swc8UlBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGBuZ+Ys8O5qVD8uHKcE4EBO3U4ikZDtZFyAL5hOaxZjWnEPTJ2rrKWqSphmnVa3/ohjQBgp3k/O5/GaB2c+NSdOGMVECJ0HiDFOHal8JvNG8oKJVFco1B7xisMT7LVXqeReWzrtx2AB2eijHs3zAUPz+sxpoCCJh8rneQrzzBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXHOLTY+; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXHOLTY+"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6019b564d0bso1037832a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2025 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064098; x=1748668898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQMgvnHl/e3juDL0qxGSaY3LA5gtsGQ7YiUwPKjqwnE=;
        b=TXHOLTY+SoJgQrYJyEJAq0VeIldAcBhFyk8BkplsRSFZyVx3nfnKjKoaRbAbomb0AU
         ONd/0ulOJ4c+jyDAJbEup4Bu07DIlUuRswtu3sC6/jJAQq+u4NrJPI+TO2sq/1bPhuwP
         Im+riDpmxx+R6Ur0DKq/osdxG6ltQqXZjhYHTjx/R+0bMML3Bo1KPv+3y99MrlCc4U5V
         yDninXyZsUwmjEf4PZ9v1zN5O0mc5uHZYA+XYHk9Z61dAw0X8RzAQGwb3c8gfU3v7bUj
         G31qmH+d5G1Fejt3zEqpf/fT006q50VqHVauLzqvSC+bR7szhWHaF6aP8f4A6sfx5rg4
         +UCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064098; x=1748668898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQMgvnHl/e3juDL0qxGSaY3LA5gtsGQ7YiUwPKjqwnE=;
        b=U0UhWxmbgSbTMR1tAI7SNmSY1oHbb66FMy+OmE6vlsUXC4VQ1CuY0UzaBHLReGt/HM
         fIj6QXZfKb93yZbo7Mn5GBFZkMWab/Pft54r+HMdbLN0b0PwqUwljzmjk/a5lHh2JfNd
         Klq9jIQ5plr2TyJXc1bXI4yUhX3Rt1422HAT6iIo9dFIq23zf0BexAYYZH0dUZX5i5Yk
         XGKNG+ZpUDysFXQlwUHfb66fk/gWdIA/3QK1nvOE+XER6fq0ih7UBy7/jWi8uf/g0JNw
         jFdWVcjRMZUWkytz/ufzuNcGSpWwlsyCLpeFIHq6io0i6l4qBfAymiPoNQkGEY6vI/s8
         NvDg==
X-Forwarded-Encrypted: i=1; AJvYcCWcHKPmyoEERSWqzJKazmMwlQWHCfzABm4bwqTF9LXmyHmdGarhcoMSZvDWMDlcXZVPFLZUsoIAvErvtrjSk4dJfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdOeSNfN/WepMaXcxUn3sTb/jBIrN8Wo24VGoRAYzEISiVXTmv
	H50KVfJnOOEn3zTutT8bm/5OijOU79ZKzjo4Y8a2MYB4UWxYHBrwuB1NaAr8Ibt0hLQ=
X-Gm-Gg: ASbGncsmvd+cDzuTkJNuvWNNjCGeYNueHOjmiht6w3FgFYwTErygsmSftA1Crj276h7
	tT2Fx4cV6Dwq1VvEONaVTnnDIu9+hOR9ieDAD81f9jBPHAihwik2jbRrs+KuVh2UViB6uawwDvu
	AupFmB0PMPpM6gug2XVheXsh9TP5Q8OvQ50xmJicVJRqDZ2kwE0NgCdc0u/nd6NRR/er5N0WPz3
	oaqxOaxguVVKd8xDQnloFSD70/RIc9m1oQ6yq63T7a7Y2W9iQDufxMC98YKePaZRWlNBoPMjw7e
	zo5i33P7rJ7VOgetS9U8oyaX6e+Tw4wVN+0O9JKEjkjcJ/jIYQcCJFMLGee29AwtIVlfJvmCh0P
	0f87RlJevCgP77huaV/kZJ9uZBDeGGnd9HUPEDHxxEnjIfA==
X-Google-Smtp-Source: AGHT+IHXaAPaMnNiBFZlXKcRr+qFufWpMyOC01eMRk+Jpj8a7drQ0LfzI9zmQlfsyWsV8hXXiHulVQ==
X-Received: by 2002:a17:906:6a29:b0:ad5:3055:784d with SMTP id a640c23a62f3a-ad85b1300dbmr126184266b.34.1748064098471;
        Fri, 23 May 2025 22:21:38 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 24 May 2025 06:21:28 +0100
Subject: [PATCH v2 1/4] arm64: defconfig: enable Maxim max77759 driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-b4-max77759-mfd-dts-v2-1-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Enable the Maxim max77759 as this is used by the gs101-oriole and
gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards,

The child devices' defaults are based on this MFD driver's state, so
this commit enables those implicitly as well.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f3fd474911b7ab1aa75dc72d42614f12b2dfc54..07e5e76edcbd3fcc4358d08663f51cca00acd49c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,6 +769,7 @@ CONFIG_MFD_EXYNOS_LPASS=m
 CONFIG_MFD_HI6421_PMIC=y
 CONFIG_MFD_HI655X_PMIC=y
 CONFIG_MFD_MAX77620=y
+CONFIG_MFD_MAX77759=m
 CONFIG_MFD_MT6360=y
 CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y

-- 
2.49.0.1151.ga128411c76-goog

