Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01BE2BCF5
	for <linux-samsung-soc@vger.kernel.org>; Sat,  4 Jan 2025 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735998974; cv=none; b=NEeksAx1tUbwjssU4sU2wvxk0z19At4xEVGVqdDHXVyXWCzb6WA9OHaHWgHEzKU1jymMePuI5sjc0ZPZduXevAKrxcWszSfAvJizK1NTudzLCkrP94RV0oY2Y9akKUYiX6p4lJBynI+wyt2215KoSTr3hVg4qgYasK8HGC7MVOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735998974; c=relaxed/simple;
	bh=NI4tRP1Is76uLgwzVQpxCWLwbHMSF+L2Mz3je6ObnqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gG42JOHYCZ+fzQSwenyk74VLc/UffQa/z6WV1/7bsRzPZGz+KDZmYTMxA9+Xx1GPaT9ETDu8Ii9ldlrLeOdR4o7rDFaogHclFK9v+W7Hy3P9f2K5PXys3SAZY4UrcGxQ2ovJRlQrhpV5ZsefMcdQM1PXg4KOIALWWPAvyczGctM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQ4kMs/g; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQ4kMs/g"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436230de7a3so20392485e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Jan 2025 05:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735998970; x=1736603770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJEWejicaBz6dmUxoJQXl7EdOTueBwQvHraBKvH38is=;
        b=GQ4kMs/gOkDzbQQuUHac1YRQwFnA1pFC+RPMZo0b29ONUIHhhd+8s494KTMV9BxUse
         sOsqmp0PzHLkVRwwUUvmKYYLnFKpcY5IvOMkDDK1tmGLpAFcCKWpe7MqYDrZuig0eHD2
         xe499KgtsnPm7S3ZpZHzm4mHl+Ub/LuorRbDouYqVJgGcMnyZjH+OqZaY+6ZWsURr5H3
         sP16CKFsMjEOrgJ5VRiy9cgMF0KR9OIOLQVi4PAO+sLeabpCGjHDOI+Ek5xFgaNS75KD
         /mzza+3fcN5YyOmcHuYF+8118dcItntBWr5m6hBnC942RMMW7gkyOUZYezHhk6OoqDut
         FbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998970; x=1736603770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJEWejicaBz6dmUxoJQXl7EdOTueBwQvHraBKvH38is=;
        b=vcGFKo3g4XKEuwHr63wcHLp5p80SBOx2RzuJLAI2m6Bws+dxc0xyWAxpgV/g4fSZdD
         lR1rCmdL0VGm64Dj0h8G92zzJ4BghqK7eeJ3kT6QAYsC7LgHzldyzFwqG9cVhaGeMN++
         sX5UBF51vqS/01kQGrduc1wUsQ77NStq//uPhW3/JCIuNkR+f3Ht0BoIeKx3V/Kusr+J
         Rn0JW2Epw0BU5LWD9QWuya0l5xx50MQz+ue7cp80Z/4K6WDsPXbehkcyZvDroXvyixk0
         zhQ8h6jZ2wFILS/dk06EOauh9ipdtHGh2kJtN+/Iylb8VYGRh22gG2cL5cv+zi+i6/m1
         YBAw==
X-Forwarded-Encrypted: i=1; AJvYcCWE5rf41lDyHvZpzHiYULwYBybkeazaURfq2NjzfuJM2GkNGsx+UvpgsaJKBgQpd4hcdP44mk7GjnvSwvaeCPk6aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqMwJLF1a296v/mWVwJHQRx4LuKWoS3QxZ8YzoVoomOm6N5ARF
	tUSHqQX/O3qIi+LUnyOGj2XX3lfxUYfVtLim8NwhT0DPI//hG4f6ZpNvdZxxVpM=
X-Gm-Gg: ASbGncuiuaySA5czExS4U3XkA65U+FCyTtJdpNt/70ERo8mrFfYeQg5EnoKjk3yIrbf
	niyNpoqGxwyUih34BVtCiN6ssodHfRPI/m/QMS1hFQauWY5bfPwynDmSh0hduEJpDn03riVqT8T
	Nfm+ReM1vYz+T03tDu0Y3eLwtEn1gEz4nsfwYJhKDmZ3+8QNS1wF8eU4oftHG+ImqF6XQwlsvBs
	gnyHTKfxZ2+zSRoN/i+/NH1ReR0zIW5EP9xe6lsHYAkauK+JExe1T1O2ZmsQh/PzUSDG+4=
X-Google-Smtp-Source: AGHT+IEO/3u4qvFe5Vb1vURPH9ZBPG+ma9tc2SOelaqiPnyPkQaHdPOjLVZUFkyq61FMNDtN3/bC2w==
X-Received: by 2002:adf:b601:0:b0:385:f7a3:fec1 with SMTP id ffacd0b85a97d-38a221e24demr13083083f8f.3.1735998970188;
        Sat, 04 Jan 2025 05:56:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e375sm43946322f8f.73.2025.01.04.05.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:56:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic()
Date: Sat,  4 Jan 2025 14:56:05 +0100
Message-ID: <20250104135605.109209-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If tensor_set_bits_atomic() is called with a mask of 0 the function will
just iterate over its bit, not perform any updates and return stack
value of 'ret'.

Also reported by smatch:

  drivers/soc/samsung/exynos-pmu.c:129 tensor_set_bits_atomic() error: uninitialized symbol 'ret'.

Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d8c53cec7f37..dd5256e5aae1 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -126,7 +126,7 @@ static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
 		if (ret)
 			return ret;
 	}
-	return ret;
+	return 0;
 }
 
 static bool tensor_is_atomic(unsigned int reg)
-- 
2.43.0

