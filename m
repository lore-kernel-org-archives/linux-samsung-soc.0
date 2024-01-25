Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8F3139C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 01:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706146540; cv=none; b=Qif5Dcv9MM9dZ5Rz6xC6sPBEIK21BOCVVVsJFhqMoBCqzxHMTPv919IHonXc83KJYAHqJBzMakVV+hDJC6kDpq8GJwOow+ldqUVPtkWJH5IR4WNhAu/xdn5osfn6P29Ks1EhQmPLCr4RWNk4/3WZ+D4LKVh4KCXBr7966kHhOss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706146540; c=relaxed/simple;
	bh=gvS9OR872hMLDwjbJt9LD4SXHkhJWBAYwtl2RkaXhw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bFC9iI/rTgwriXT65xNq17mzvecUhuq5Eth1zC1KbQlEV8JpMd14eM7tSmoOHNreIxWg/b2HH0qzfgYNVYNg+6etdVzVloPZnfwxbbvKZtVEeBm+sYROjQ7dQGufbKzqZV/0EdpjW8KENi8TIBapdvOu2NOOHW1nl5rs2E73Fo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p5ZuQX6T; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p5ZuQX6T"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e0df9aa43dso4717771a34.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jan 2024 17:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706146538; x=1706751338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrTPIRFEFJl4D6usMUg96I/YEqaZ4s0DmE7WQLKQltI=;
        b=p5ZuQX6TGPuwjyR+BO8s3gBt2K53kor0tQRxtY5zOTX9sTgzaXqwZi9t/CnYxL7lE5
         oNTcrBK+2RC5w+btmrCX6kay19xE8QJliMuy9wmP/+dZsSZc+9vNI0I9AfOi9ttV8nwT
         HKzE8CA4p71t2kWVlNKKyZgcsmenp3RRNG5CrrqwvuQBDWz97cNtmBJ/WL6OR1m+wgO9
         9/QudA7RgGolsA+iCDrDr6VmXGKtOc9y3FLPgtyKHiRMr5YnBOfuI9pyXR9M+LyxPaIu
         Zr+TjqYZLVfhbf6WMZOKB3n/WuKSTH0Ln1XnMwLgn383PjuFGlpQ0s+miAIR4qjJRRsv
         PPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706146538; x=1706751338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrTPIRFEFJl4D6usMUg96I/YEqaZ4s0DmE7WQLKQltI=;
        b=i7nET2Qjv74f0slI7pPbtWe8Dngv6UUbUqF3K2DPcwOeIDOidJxAl7k65ZoWZmYDBU
         woUKMZADjE9fdNGHlcoM/K7IYyCvbsmly9YFYsReommwaBCyEC75w+84CptA+sEgwChK
         eZQ0ebMfsK7E5vNkkojBwT+TytfheV+a7jC9XW5mqBz875bpz5bb6/ltrmYt19h9qnqq
         P22KUSxPEI7xm3vn4lNFkdTt8ttt0lZKOYed57QVCUvBjn1+FV5VAfdJgdq0OgYju49D
         fb4q9X7IKYCm/BfEk+4AwgK9Gh6mUpqdsxFRkpkUGqbBgfuTbuTLw/XpERoWE1uODzHT
         dCng==
X-Gm-Message-State: AOJu0YzqgpdtiSjBI2+MhnwOOmr8YvG5ca3hlojtl8ssSDMSgRXQ10GM
	4LhLyAZBMKp9FmW3MMJVD6swGM6i63TuHYoRInmQ4hkN+cjW6W0TtkL0T4NNx7w=
X-Google-Smtp-Source: AGHT+IEiF3CQdPoY5jyVBG7JBTXllVCtLJ+MUSyX0wMqIAPSiBv+se5HB8ZlaC7NoLgvBlhEcAeiFA==
X-Received: by 2002:a05:6830:6c18:b0:6dd:ec7f:f46d with SMTP id ds24-20020a0568306c1800b006ddec7ff46dmr197894otb.11.1706146538402;
        Wed, 24 Jan 2024 17:35:38 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id o6-20020a9d5c06000000b006dbffa39d39sm2834483otk.55.2024.01.24.17.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 17:35:38 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] spi: dt-bindings: samsung: Add Exynos850 SPI
Date: Wed, 24 Jan 2024 19:35:35 -0600
Message-Id: <20240125013536.30887-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240125013536.30887-1-semen.protsenko@linaro.org>
References: <20240125013536.30887-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document samsung,exynos850-spi compatible which will be used on
Exynos850 SoC. Exynos850 doesn't have ioclk, so only two clocks are
needed (bus clock and functional SPI clock).

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
  - Collected R-b tags
  - Changed bindings patch title to "spi: dt-bindings: ..."

 Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
index 79da99ca0e53..f71099852653 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
@@ -22,6 +22,7 @@ properties:
           - samsung,s5pv210-spi # for S5PV210 and S5PC110
           - samsung,exynos4210-spi
           - samsung,exynos5433-spi
+          - samsung,exynos850-spi
           - samsung,exynosautov9-spi
           - tesla,fsd-spi
       - const: samsung,exynos7-spi
-- 
2.39.2

