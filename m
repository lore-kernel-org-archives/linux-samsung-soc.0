Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317B130F552
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907812; cv=none; b=UAS6bYnhTRZQf0Bwd02DIaVNABYDh46LxmdTI191HhQjURwseBlGbTMA7XS3oiVeAsaRLMsGZI9VIuL3Xrt8lsu4w5Ss+k+ybQs5T32ksqztTY7zmkIP4EwpFE0yb6XaJVRT9l9Z7lDFuyEiGAYMZczfm5ulRB/yhJWQ8gbZFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907812; c=relaxed/simple;
	bh=jmSGd1LEiJi/OzRrbMT0IdOTY/EPAZZsAFW195MpqOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UK8gnpN+79qGmmYwgz2qMp4f+pxrD95DwagKV0Wn2yVjqZP7x9g8qTGASax+87Iwk+D18XA7R0Y6PJnEVGzpjeAk9d5e/acOiXIg1myD9n/5r3llaBK2pozCc/uIsdbRf+Mz3YNTpAsVnutoe9eT7oo9xefboQA4+Nqd/Rl771s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gu3DBpJq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gu3DBpJq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45cb5492350so6223565e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Sep 2025 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756907807; x=1757512607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knWYmZlS1tcNLIvNHwra67g63fbf9sRjO2H/UvMZ5D0=;
        b=Gu3DBpJqJIkDwXMJR+3BFOmT1ZwdlnBG+T5WxgqkanYALyWEifLQkMzZi6F92t4ZfN
         ugfWuT0KOUvLTz1emDszCCsgZcBwobQ+9OIFBBNq0H5oNHN2s+Owhv0m48HDreG3EYUb
         uxtoDd8djgQi6RZ3x0gCToLphTDMSwq6Hw0CxpuczLMmwpjqzJ8uO559eKufYAsSRLQK
         3hows0RUQUf8chR33mbXPqyzDCkfvX6eLnMaj/oIWkFbhcoC5CxR0NUM66x85+EfRbbT
         zE3J0TdW48iTGmCQ22lIshOkSqy6GOOfrdbmwoHsahoctH2Vl4wDHrSt8arJnVHeJSDR
         HBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907807; x=1757512607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knWYmZlS1tcNLIvNHwra67g63fbf9sRjO2H/UvMZ5D0=;
        b=XH9/tecFjQZYY0VWC+b57flw7UB2uYyilmdCYmMh0HDtN+HD33/mMCxwmGGNQz7I0O
         hkRdqfzVTfKsa+j1egADM5jtHxqsdqpwpLgnUUdCpfZAo1IIevoxcO5gSTiA8cdcS99t
         Q2JEa03HlsxzdkuU080Z7Jc2GJPv4r0JVdmJwHs2Zt22DKArfQrf9nN5oUvlZAP/80+G
         n/3nX1onqT3BEsoexXEI54dV2nbslSJDuHZ3byXrUcDkOYqKKdWVBgss+ArNS5BQ8jaG
         ZEJKpthgj+Ypc9mFIYtZP7Exvx7iky+HKrfbpSlj+9DB6jv85+S4Z6Y79rgaI5k6cSSp
         M3Vw==
X-Forwarded-Encrypted: i=1; AJvYcCX6daLkFiSC6HDs0rFsQp5N3/zN7KvTcVJXjRRaTUGtLKRPtM9sFy4FVDTVkZyYBDKTZ72UKyAMYM8wzLhfSXi+ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7WXq4mrz+io/iFlPuNtadHrJNkvM9+qFi5PtfExebpBvfoag6
	7KPDGr7x5mCUyLceVnaSyv0AnqBaNbQx6rI7gbBaLWYUXR5wohuNktj5AQNNxy6D3F8=
X-Gm-Gg: ASbGncsUkq0esTRvaA0Hb3N64BNWwRlrw5HH4V1dsx11TIlVncwbxpIlPUjD8aMkH/0
	7oUJg+jiw2Sh/WEzScLWqVL10tUJQEBdRY6jd9P8NNoY+j5OLIp4U+8rw+yI3La3GD9T7tMsonK
	WcYiemLCYstoH9dYoJGH2IbGq3n3JVj+fKILFsbWuG4v1I1w8IcB/1/Rp1qVjJ7rH8bY7em5Krb
	lcnCcmOh2+dLeUaEZFvTFpFILaEeHAFn2QUxVJbICciPrEIKXLExugu6rvCFKQ7t3FS9eNhHuPi
	/aqn2/HXnJTrHGoTCtaYmDs/BOK4nj7ZEcbYBfbrui7KRE2A93q6gV5gkqGH3k7tdEoUgPW6PQg
	18geZr4g4kE79IsSnsRt9FbptY3sz5vVtSGXsFObUg2me2AytpfYUw24RpiVUOi4oKDIrcyiT3u
	OzWPLTZlxxiDwU
X-Google-Smtp-Source: AGHT+IEEbe9zmys+SdHs+R+yvKPrY3H8cKyU1UJgBhivbEglt1LnfQ35e5S95bN5Q3yU4Jw1QrwtWA==
X-Received: by 2002:a05:600c:5253:b0:45d:98be:ee91 with SMTP id 5b1f17b1804b1-45d98bef030mr1077085e9.9.1756907807066;
        Wed, 03 Sep 2025 06:56:47 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87632365sm197257135e9.16.2025.09.03.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:56:46 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 13:56:42 +0000
Subject: [PATCH v3 5/5] arm64: defconfig: enable Exynos ACPM clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-clk-v3-5-65ecd42d88c7@linaro.org>
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
In-Reply-To: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756907802; l=820;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=jmSGd1LEiJi/OzRrbMT0IdOTY/EPAZZsAFW195MpqOM=;
 b=uHbQ7xT3bV6lIp0HqgAN0MLCg6QtXHzra5fcYf5Lk5NwyHh5UfcdGdrFyQvIdgzD6dfszLV11
 AJJjST6HJPrAxYtlucE/6MSFIODMgces/93QGOxMCFOl2jtohAP2doq
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..4255bc885545fb3bb7e9cf02760cac35bf2872fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1445,6 +1445,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.338.gd7d06c2dae-goog

