Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764FE218E96
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231071; cv=none; b=CrqtUxB6nZLkHW++fcs45IxNn7UUEu9ahAnbUSdEcrdDLtWc4vJWOSyF4HElsi6qnu0DtzmokdKVpGs/iqB0Rzi94Ls7rRF2/2fNKjcPs/NkzNg3662oo7LOJDZjSl4Vz/Tk4PBLoSW6mnkD6ahAjvG1pesvyomKPdXTFYg3wfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231071; c=relaxed/simple;
	bh=Hu3iyZXpRaCR0lrm+kXeKWpWaXUMVhvAHxoE8tYowXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mkinbro6eeh+UrmpJrwHGzd2rBSM+oT0Ku1EEt4+jcymyuOwTzSKs+yLCfZc5RUWZB2OKCTDVBeLB2WgXN7X02j33hjO7MBZ0U6JylRxmM6fYsfX3q8ZvrEDPHJ5JswHY1dz36477h7qizdpKdKE3ntqGMXr9FXPnyRMRnvzEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cj0oNcpr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cj0oNcpr"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac297cbe017so220781166b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231058; x=1744835858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=;
        b=cj0oNcpr49Su8yi3o6BTtMZYy4ddzNWv02bHDkK61fPRVWEi0hRprBrQfbcoe4FfMb
         51bnRElKmINuLAl1Ru166txXZop5WvTPpG/UVIBafaKLATKEJJOl6oxGiFh9qM6aQfMg
         4K8zeI5dcfwPjfLTX/krWZrjVOndVc2RYbCDgs5rG/9KyAzlsFq6RHAa/ExwC+wCvSPP
         zzRWtRNCpV+nZmboXU+Asi7rjBkYJCR2xFCKvSnwhDC+u+iyeSCfIrLMyWkxYzLjlzuA
         LL7VXs77FscS7bX0e3EyJXU+f0PmzHuyXit5ZHWLM5LSHjw7obmNGx0SVB2ZX4k/HI03
         SR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231058; x=1744835858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=;
        b=YabZxiaY7vqpGghV+qvhFx3YjLIen0+eRQuAsJPiPDYDIPYs4NJlegnT4H4i3qtYIe
         dd1oSrhNtWxD6Y1V20gP4AsQQWPaSBMpjmWxNnt9Yq2KPJV+18PvfJLbr3gG0l19fpH3
         tGf7Z3pei5dcTf29fPTfwHR3UmiZKsK3uG3CYXKO1gLnrzuqYPW63wTPhQRcjszrkpTv
         qQ2NVJn6+hwsTsjUQn7wo/rf5BHvClTdRTqAFj42AxADhbkLKI8+5bC5zQwcE6RpE/XT
         Y+JISZHzdKt6Xvih8DSy4qM+YPwuWWbuhIjRFP6GOiVIMQsruzjx6jPb4UwB0hwKhnKq
         qiPg==
X-Forwarded-Encrypted: i=1; AJvYcCXY9EY9LftlzC2sbituHo4riwmCX9Gp01u9dyAMU3YmUe4S0KYankSNBORbO+GFCSWGlMew0QTqPWEQ0JPwkoLvbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE8ll9Og9mH9cNNOAWLTqu8XqIUinbhqH2bv84nVLyDFFWLm6g
	y6ZrVib+bE5FRzPHfhHu+bvTC+3F4oYQeafms1fOcd4iWDudj7xTRrnCVSakXFQ=
X-Gm-Gg: ASbGncvujKvLTjOdF4TYdLpzW+mLpoAt95MC+OGrDtc+/zYGoMRAIOcP6yYofUiU0Y2
	81hMmpmAXgD7h8B4eYg/+vXbsPvaSM969SwqNxhSjp1+09vv4Qv559gtthuUjUobhfk1tIxJiWX
	7o64rZ4IQMcHodcaxQaunkhUXUHawD7aGf/9E+dMLFafHlxHwcwKEb/YdB5qDIxMwp7GkGRhCZd
	ajEL+usFlAjUIUIvVSohgE9wT75iYL5iyPvTu7b1T+3RZzsLphI3mNm1wHOW+pPScGKEWehHq2Y
	7Pd1uQA8425C+R7ULzHwnXqx522FC/nWh1BqSLLv6eimq6vr1qHtf4m6Cja49CFQmautMzguuG7
	TpWPuk3GJYTrDkGxUO4/blPudX9w=
X-Google-Smtp-Source: AGHT+IFs5jQKKi9PBtsfwcpWP0uR3pXLFKhxM09QGSN5rk/PWUonr2doF0wyNuXkGit6lSL1qy8RxA==
X-Received: by 2002:a17:907:1ca3:b0:ac6:d368:aa97 with SMTP id a640c23a62f3a-acabbee8c8emr16347466b.10.1744231057853;
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:37 +0100
Subject: [PATCH v4 16/32] mfd: sec-common: Don't ignore errors from
 sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-16-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.604.gff1f9ca942-goog

