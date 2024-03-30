Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF7F5811B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 20:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711830819; cv=none; b=cGkOS+H1Hy+3x4fUpcrKsm8WXI9dwtN5WKmixZtLr6xHkCbPgltlOBxzwoOppcMySf1aJg5T9y2lUCUKWz40xNao3f06RpJ+5+dHTWgevjRRzPMIW4ZXaH8PJl1cRpppUB5g82BRcF7T09GyM23Hj/fiwUBWNHC3bJO398PQzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711830819; c=relaxed/simple;
	bh=HQ87N2g+njEbJxhRoLJs9BnoTb4aNANgi6MNopwNwKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2Xai/s3DuL4k24neBy3imuOE616+SyL/ZssZIXkDc2GlQSc3uhszbKdw+u39gBFMS9FF/T7EdEJptDU05Ikwzb+EoLuT5VVHt7LwNxrJvYDa3lXH41QLAzdoQLJgZpSuWx/fsQinObNjlx4uTGS7mJd9Q2tJLhNLxJDOEeTgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TSDCaDNK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TSDCaDNK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33edbc5932bso2141117f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 13:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711830817; x=1712435617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hu49pY3Aels4UnjurH0jvHxhGoMk5vz5ZNjCI7/eIj4=;
        b=TSDCaDNK0qx6hifokj2I9mgVd4sf6O/E8Ul+b5ZPfWV+MIwqTjSA9fd5xLS48tibHb
         kCFLCXJvuhuEErq/RQXlIEy47J1mMMOeoNfJeqmfwbc/NVA94s01niiGRPtc2usb3EKN
         qKZX5UHCMgSKqQWJBMuE8Vixi+Lbw4UxWeQPPPQDhrkaSaVau+edVbDPEiejtGN9SD37
         Gji09/eVUz0G0Ec8xAsUta30eE3iQq/MMF3CZ93mbqF/gYZYvUFN9z41xMqJXVE+C1iU
         1WnehCkyrNtgm5Ad2UsxcQW/M02B2796W167734AH2pwalpj+IRALQgk92epPx+XjwRE
         sI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711830817; x=1712435617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hu49pY3Aels4UnjurH0jvHxhGoMk5vz5ZNjCI7/eIj4=;
        b=ImnNbzrddAGBspU2GzRvQT2abn0tYA7yZNn2NG3OyGYGu2gckGSwRHOznWluSnSAUB
         uD7gj+Hocv3uYPgAz0rbdvzNwdKh6hc/WJA1QUQ2oTtdIZsU+p6TiJuanhxTII7ha+cl
         AYuuPKKxTMHS3Tz0tuFCwbzNbY2J8dda3LaNbFAO5lG5/p+rbpRmVr4zCg3PKvMAdWtM
         OiuNvVEuyToxIF8F3SquocdT6MsgP5KGY7rgP9JK+5raNVcLHAmUeoDMb8Re8Rdp8PcB
         ztq4+lA/6rs8Zm7asyV++/Lz9iCaHxRo0zolHyQif25mqvXyWKUFlSUMNGzQb5vd/TkN
         Ot+g==
X-Forwarded-Encrypted: i=1; AJvYcCWPfAaGsppbMJgNbXSVImQbxwFU3gSRfJh8nssmmB3Z3eLnmhZo5TVxWJMaz4VApgDa7pvQEegu6v5enIg6RB5EJFyQfWJVoDcbViaypqGsnvE=
X-Gm-Message-State: AOJu0Yymg/xKwPwwUWcaTqiROs0f3/gh1YCI6tMEbJFtNdqE5gMILASN
	iufWuhGqQaS83F7/ewgkfA2fMhUrmUzVKgnRMHSDGTg35I+bnRZ02J1DorzpYS8=
X-Google-Smtp-Source: AGHT+IE9rECqol/JHoBja75sISL7EwdTrwlxgWuq+Lw/21YRJ06u1rzu9Pk0WA9Fli2/BEJ+D+t1Jw==
X-Received: by 2002:a05:6000:188a:b0:341:bf1e:45a5 with SMTP id a10-20020a056000188a00b00341bf1e45a5mr4126691wri.46.1711830816802;
        Sat, 30 Mar 2024 13:33:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:33:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:15 +0100
Subject: [PATCH 11/11] drm/exynos: mixer: drop driver owner initialization
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-11-3fa30e2c7e5a@linaro.org>
References: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HQ87N2g+njEbJxhRoLJs9BnoTb4aNANgi6MNopwNwKM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcNDMWmrpKmNr486z5EGVste9lYNNRpzO3wp
 HBQmSyImWeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3DQAKCRDBN2bmhouD
 1xjiD/9XOlK5ROkZIz3QuqQjP9yXe0fi4Z8Bt0uuVEKlQbVQE+o68EOjwD/EgfF2YyhA0klD/sq
 raE9q0YOpkj6NBrl/0RnDf9uKoYGIeQq9aXI2LPXyuLoNq/zBQ7hzFZdpLhXGTP2RjaBqJ1A7wp
 p7attUaAZDnnHMD8ddDHiMytrfrcVtAi09tf7XCC5xD1Ksx+ovcu0zKae2VnhCSUXzZZEkxyeJy
 3/tyMB1FjbaBfIaEJOHgJN9egHchSQJV8i9QEO8U2gO+SxMC5w4Ouxu3kdpDvnTnZ41xYkeJrAO
 9cFbUa4WPbkzHb8OiqtIbSD2GkkXeTZ7oNbhs65wbGZCONFNMCY+5ZQ+BamEbJKJp/coG6NfQzR
 J0JAnvwJpahiIa5tAG1gT9+qX88NMk2AvKs6t+4c9c5zQOcfXrXgf0vJH18g20jgmtHRFF0OucZ
 rxRSaESwCWFUgHdTT3YVknwuw4o6VdjKoPc1l0K7jf0XWT/DCC+2DtFAI2tjPOu3CW1Y3mALBUI
 s0vq+jjunsANsAXIuftDoLB864WCNT6S1Tl+s+qKG8Wb1UaLnKkpkGExQQYR/Nudm+h4rZ8uxCI
 tY+wSu6se4fGzQmcHtTxLYwpEbFEidCsPUUsTu8O992i3te1o/oXM28TMKjQvr6AZAuEEGUYkR8
 jIDNMgV3AKn9H7A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 6822333fd0e6..1db955f00044 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1331,7 +1331,6 @@ static const struct dev_pm_ops exynos_mixer_pm_ops = {
 struct platform_driver mixer_driver = {
 	.driver = {
 		.name = "exynos-mixer",
-		.owner = THIS_MODULE,
 		.pm = &exynos_mixer_pm_ops,
 		.of_match_table = mixer_match_types,
 	},

-- 
2.34.1

