Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50E6218E99;
	Wed,  5 Feb 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794332; cv=none; b=Eo4qrIEKM5GpybDDwU+uAh+9TNABtCpMnh3mJ3dBtDmNe6en/elVvQsGCVqHS6C/VqRB58QMmJ31fGFDTTLMQwjjGNQzxGctBlUTGfgHKAPXNpnVKyFSBZO1jLZbsnipJmowXmnK04hVOjy8l8pfq67rZFqmnYGyXmWAbA0fL1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794332; c=relaxed/simple;
	bh=6AOvDPtVZ+I13OeUjiTDvfyEUBh37hq436ngITY+fsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VjN6RwnMdSJC+vLAsvaKu3sy6mziMNyyio/DVz0Lo/R7vqAdzz4b6DMgyPvd4+vT+N1vNKajQpEPxi377s1PUhOIr5LQOVGw3qa1uouMyO+CzpfuwmXX4ppMlTTX7BB3ktl9IIcpKZsKkvTtesGxPxF58fK0vdbQiCR+ubOG3k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQZ+pzO6; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQZ+pzO6"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-866de72bb82so62306241.1;
        Wed, 05 Feb 2025 14:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794330; x=1739399130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fudfumjX9RZBH6qmvyzpFv6ekbh13Mvx8da8aLOM2hY=;
        b=UQZ+pzO6dqTnkHmu4NvPuHvTtairG7LOoTxYmFGqgGZD9ULTugKCX+b3VvWHd1mGnv
         O17aDqnTseCdpy+zR1BVjjegXm4B4wz19/5uRUKRZgJ/Qk1Qtav1VmJpDGrgSanh1oid
         G2IsGw2awV7Gz2m5BmlxvTqC6UzrHhuTMCO2TgXpB4r3KQec4UJ6ZC4gRL+JdH/jIlBt
         cZIOJVnoFndUS9gwyBTn7tU5l1Zs5YtzNff+hOQLmqA4YA1yrpji0XEg2QK1YEONiZ2K
         CVaHnoNOgSKLySOdYzB9yL+ZC9EXxmmpn0jQE2una3aKZL8dgZbEmGvAlOwWiM1J2EeL
         u4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794330; x=1739399130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fudfumjX9RZBH6qmvyzpFv6ekbh13Mvx8da8aLOM2hY=;
        b=JeWeEsNIWmgwXmRCU7N3uKztt34wiqvZuxLFMJzgIDZH4b0xhz2EgjyrCrGoSK65/4
         IjTJC2GQDJoxv0Zf3lx6wsaq6NGA9v9xPV6GjrgDQpt88YqZojjNXil7DktwSFcx1jJj
         ckTbxhOQAGV+WZhae7id2WBlSP2HRjdwvPj/rh2AQRtnbqO+zNG2A/6g24DO4QysQUvR
         KFldtyB1QihkRWqnYsPPkAr0WmljRZ/VgE36y8hfD2BKh/4WlNwvbA0y0YNAt6hc+jyg
         ry3bj7tBqCr2SQSGd6LImUjZ8vnl/HvFrUg1SLgycESG6x+mirXhvp5v4TeoIbPwhNes
         VBxA==
X-Forwarded-Encrypted: i=1; AJvYcCXrf7xklVClQ/XfrWhjvesrmvzYTYO7x4JX8JQunfVLqOAyHjzWe/2TI4sxc1HZTRoQ73SsSnjA5AEK5pYXXwkRpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYmqjO5kUaX44lY/5X6EWKPWrWhpkBar/PF1we/nvndUyok7g1
	/DDQWWxm4HDZui54FFqyIaJUbjXh//oZvloPm/pBUAX0ZZz6sThW
X-Gm-Gg: ASbGncu/F/yY/DlBFR6lL32nYKR8RRArRxNBxgXXG5DOhm9j9yr8Auy1qPGTeTjrKPi
	RT7M8IkyK2CX+hWEzYPg8SzyZyxZgtXGWqMDgOznCuqELl7XdMj9VvERUTA5sLsMCdH5nt6PPGI
	v+fkeK3TAooSV+advVKzZKMf/RmuImfba8WsKLYfQIi65YcCCzS3iZL78lZ4+mpeLA5giIfb31M
	IrAZLJmyyqpTiCvE66oiIecYT/76O6CAfmt+PotZDBt8k5WE4pzdqTSWfHuTOMpuuJk05tQQJhG
	GwLMplcoS6ynbzPC57Vb0kk6uTyv551IzFygG/ixXdT+66F9A4FFY8tlQTlZD7NWWBGHHH2kzH0
	WVw==
X-Google-Smtp-Source: AGHT+IEdJ0L14y+yqJvu1qivXHC8OglVARnsngubthm0PnC7P3RsJxZ/FSG6acgtAR+YQSQh8g2aNg==
X-Received: by 2002:a05:6102:3f05:b0:4b2:cc94:1879 with SMTP id ada2fe7eead31-4ba47ae894emr3528199137.22.1738794329685;
        Wed, 05 Feb 2025 14:25:29 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:29 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 5/9] spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
Date: Wed,  5 Feb 2025 22:22:19 +0000
Message-Id: <20250205222223.613-6-wachiturroxd150@gmail.com>
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

According to the Exynos 990 downstream kernel,
almost all of them do not use the same 64 bytes depth.
Some SPI nodes using a depth of 256 bytes (SPI 9/8/10).
But in the end these nodes work.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
index 3c206a64d..1d3c95bd2 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
@@ -24,6 +24,7 @@ properties:
           - samsung,exynos4210-spi
           - samsung,exynos5433-spi
           - samsung,exynos850-spi
+          - samsung,exynos990-spi
           - samsung,exynosautov9-spi
           - tesla,fsd-spi
       - items:
-- 
2.47.1

