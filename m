Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53F221579F;
	Wed,  5 Feb 2025 22:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794325; cv=none; b=KO4EgufaBE4/w1JFGan4CfV49LnkdlxMmpcZ9/W3gYeRMIzSyUiT1na8+7YqLz+6V+QQOoqpp3xjnizuLOm3d6/M0zgaIWi4yWfi0uDZjlllweDJgFH4HJ6Zo8hlfRj2OdEwNjzExwBOFrr1JN3HUNDrRGrodmsOIfLHDBar/QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794325; c=relaxed/simple;
	bh=pitFpjySXIuepfva3Qsw3uz7CcztBnMEVlZ37PJKssE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ceWmmzSIiPytfYUqvmrmW3KhGwmCE2FpLCJVYHnk4QWPMJH3xNCrSiJS9QveXF8+D0bqZagWmy4V4C6Mnw93gBQzhG6wWhqM4jpUsjm/Jc1VAKGGH2wUuCXLi3zwYTMyCJNGbML9PjppAaomFaU9D7lQ1c4TNw2MMgogfWhORGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwYPZmCb; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwYPZmCb"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afe6a8d2e1so151488137.1;
        Wed, 05 Feb 2025 14:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794322; x=1739399122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLGSgDdl5g9MmO62+ZaKTd5URN0HQgATTN7adUAMeJ4=;
        b=ZwYPZmCb9PC5fyY4QKADSrXF5MJY5q4qmOlO8xDWO4n/DLBlkc8gbxlrlU4ghpr5IW
         mj/iZujGpDCCXt8N1CtDbdSTzK8UHHONSD+w5ITJKMHtwnJavi+u/uYajtyFsfipRqm3
         XxRc+J9XHpFLhFRLzw8tR543jQVl67YGe7FcMNdxrgl4uPXxBY2sfwy+nPrLoddBvMYo
         +hHi8mED6T/zx2DJdUHX8WAh1TpJa274iJXz/t0tue8mMF8VUoF+a4u96BbfVYQLW5Yq
         0vKysj/FOoX65d9X4DwsBKoB04ycMl9FO6IsbrLtGlXz4hBRCvz8iI89omlF5Xu69WnK
         ERsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794322; x=1739399122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLGSgDdl5g9MmO62+ZaKTd5URN0HQgATTN7adUAMeJ4=;
        b=WKKIhzo4qIxERxKDH2ngclUdz1xe9EnXVSAUq8X0uLINVbTlzT9htF+iN+LiGTqGaK
         4G105I3ihgodkpRZeRmeDEYH3DLfJgPlPThVZDQOlqdoa/QQvgdrc1TpT2I4ohlii++1
         n2Xhrnf6417W0284qX/UHffFR4uUwpGAbbcp2VhCWDmSFezb28VonWFOPJbASyvAa7tA
         sYDjvhO6vA3hJVIPyRj1Hiu7Y3HFFtZvatbYo84v9fftmNAAP4jNATFlOK56M1i8n2ui
         SHRheS9k+sIrDBmeqW9NjFY7MhBx49HKaLXHNnyZJlZD7MEMLFx5FGDyukF0TFbx3TNH
         11JA==
X-Forwarded-Encrypted: i=1; AJvYcCXLqkhYd7tKUKkW11L4daFmx5UxkccAyaBanC5W+anyIJWN7sCTRAy95Pftf/BDoddoozVAz3hFsSth9TCS0cY2Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1bR6gMxAHktbtErY6DGoiLFMB56Sb/JRWofMny20xZBLg5AQC
	3zcsnEj9ZwWfqi6YTMpbL7O/CirKt17SEi7Q6xOXKFOqL9raeNos
X-Gm-Gg: ASbGncvlDRryo2mW82YmkYutjpHoD3Bbji5NNNG/Cboj/iZ8MYZLkGhObogTqd4iyRL
	MNS+X0D3nGSuV7zZetY5XKBZX9llTXguiv6tojePBtPDwTI1TWvYpijk7OLdcV1G+74+PnFyYj+
	QjK6PCz6YrIsAIE1ci56PW114sawmg6wq7ayC6BuPYhnT1P2vVYSq9oOlbMpAD4LqRME5uf24Dj
	7RTdZbMmPWSQmmNvalHXY8sbzrAn4tdTTfIUlOCjaZETeuTTU057sdRkc8JAVD6f/R0m1665byv
	mwa2dyAORTLpe2XQK38IYBPWYtdl+lHfT2ozCCEQGVu44bKlS/mc9BYm3VcDOakvBuxtdUzauu+
	KNQ==
X-Google-Smtp-Source: AGHT+IE0tEZegMQHIWkk0mn6LCcU2W7qerUiRb0uNn6UQq7E/4NmKo29oH1zA0GoKMQe8I67Cz1aug==
X-Received: by 2002:a05:6102:82d2:b0:4b5:c302:37b3 with SMTP id ada2fe7eead31-4ba71f8cffcmr740160137.5.1738794322551;
        Wed, 05 Feb 2025 14:25:22 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:22 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 2/9] dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
Date: Wed,  5 Feb 2025 22:22:16 +0000
Message-Id: <20250205222223.613-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos990-hsi2c dedicated compatible
for representing I2C of Exynos990 SoC.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 70cc2ee9e..b05d1e9e2 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - google,gs101-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynos990-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true
-- 
2.47.1

