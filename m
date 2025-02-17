Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1616D1DA10C;
	Mon, 17 Feb 2025 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739783652; cv=none; b=KXm/p3Jx8rGkTQe0vdtR6rNyjtziXqNGH8GVKotjDxektq55Zu6SbPd2dknwRuZYsstWsyNESbCE2ZkHn+DS2UpadNS0L4qVmjIF+8R1cuM3z3SnJTVOlq5r5lYBQZI3A6nRUgXBb8uqHGzA2qB1dIk9HElf0jvFV5aL31cCnlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739783652; c=relaxed/simple;
	bh=adj7j+EjjOwpD5z9gBch+KpoPFmQVE7Ilh11JvBi4Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gqg6cAfXtQkLHiThvgnD9cS8CoEjJf+zXJ9IY94QM1qVsmMZ2yvK8hawXwIgQ4VFpbEPwMhBFEiKfhUlTkbdv6sieKIFZrnvULV6MYSzLqKXfNRXv68yG/7SpSe9/dcFsblQPkURPnt2elLTbA53cbsN0cqSfsAoJcGu0R90qU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+4DpyrX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+4DpyrX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso1709905e9.2;
        Mon, 17 Feb 2025 01:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739783649; x=1740388449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2/5+Y7Ff+7jEsKltKVHAC7YhlbKvxCsRgTAXGknrcs=;
        b=V+4DpyrXvDzqYrZRnEhHeWslaxAiYS0SacACZmvDxnohfkJo70BLvCfkwKDoIMUOmh
         vJDcm2yhBIld8SiMWm1hJQt0xPMiIb0I1w96NzsAnHjwjRb8dDJow6LPaAs+1M/jKOTs
         jR2ARS/KyFMQbgVTLnAKjTDgdBSd+NpRWSox65/3gTKS45D5GfWrORKDEZeZKlx27svA
         lPv+cO4l7DK8tMQuQ1K4Alz3RmZM64Y4WTds1c/mIGfaZ+pg7uRq1z93yjCuiqprtkHZ
         OAI1a49R0dSu3ONxi2lykRaptHJSZkfxtB3x+OIg6C4sr74iPGSlyoayn3RhFCeC9eeG
         0QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783649; x=1740388449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2/5+Y7Ff+7jEsKltKVHAC7YhlbKvxCsRgTAXGknrcs=;
        b=trjDjtIt0vJwquPhn2hsedG03KcMkACYxQ7l2rEILtePZYQOL6V35bsMq23mbwjkPp
         lOgQnT1mQF0D9y2Cv67Wlzx65k7Uyro3eQr2Rt8OsVnSPHVBmXnyXs4o+YRqy9EkO3wX
         r1OxrNWozTP2+KA/d+EbRSAPBurnJxaWeQ4bw0tkxG4rmW61o3NUcRMPM6IRVayq2nRB
         2yhInwW/BS189udI8NC2gIcaQCIf2phMVmMloB6cG0gWzlIpwt1bME3voi2YzJQdWev9
         UBYRPPhlvTm8nDxqqIe5HBY8f3PRQ/SfMCh6EikDkFDrwxx0ZveffiHc/1SC4ZgqzrhT
         opXw==
X-Forwarded-Encrypted: i=1; AJvYcCXSzWdCnIJssI63FjrSrHv743/WqdI0aAtz9MQqp+NMXDRR1vd6EDWt8GxnVNbHk3FEbg27YKKUywqDXA332n4Ejrw=@vger.kernel.org, AJvYcCXZmZPrrZVgkLEWkO20Mh5f695VJEv9L+M2E/f7ZoH7nXLtZmLzgU2vW8mLUYZC5MPbmvuBZVAuo/Usp+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGfTbXaMTQABsADqmygMyOgvNN+qONSV7pJBr6Itm0GrlsYUt+
	Es9jeS75Apo+ZiP+KYuxwLuQlEhvda5xfjVZ436NU7r+IO5EF/OlJ6D6rZazats=
X-Gm-Gg: ASbGncuN85K16aj80lovjn+3LEMofSlPQWFE4Bpaug1nLKJXGzgfcCpKrNvOlOgB7yC
	fim62uvQpd0PouCUK64MT6Wh5moPyM0ankTI6ZJLIrWP8dRjtgFE8f5PMTyTe5e23VRzvk+pjNK
	Lcf0x/ZjTwfgM++a4vqex0RIY6p28TuNef6KrTQxgar0gPdGKAe7+U9ntjPe1TaeTHWnfS9Mc+m
	NtplJ11/Y3AVNIzg6IGI8lb3+eTmiuGxSXFcbmt5NAipQySF4k0T+Tf+D6VBDdrfSVSMBaDlqvP
	QCirjoD05WSGa3LQ
X-Google-Smtp-Source: AGHT+IG3olWzKxbZB7uXgl/e6AWRg54BTyf4+PSo5Rjh4NLRyEDUpv0Xq8U4vn8jjAa6cyj/4py8Ng==
X-Received: by 2002:a05:600c:190f:b0:439:554f:f64f with SMTP id 5b1f17b1804b1-4396e5b9f88mr104227635e9.0.1739783649144;
        Mon, 17 Feb 2025 01:14:09 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439618a9ab0sm114505545e9.35.2025.02.17.01.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:14:08 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] firmware: Exynos ACPM: Fix spelling mistake "Faile" -> "Failed"
Date: Mon, 17 Feb 2025 09:13:41 +0000
Message-ID: <20250217091341.297401-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err_probe message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/firmware/samsung/exynos-acpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 1201380227e0..a85b2dbdd9f0 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -620,7 +620,7 @@ static int acpm_probe(struct platform_device *pdev)
 	match_data = of_device_get_match_data(dev);
 	if (!match_data)
 		return dev_err_probe(dev, -EINVAL,
-				     "Faile to get match data.\n");
+				     "Failed to get match data.\n");
 
 	acpm->shmem = acpm->sram_base + match_data->initdata_base;
 	acpm->dev = dev;
-- 
2.47.2

