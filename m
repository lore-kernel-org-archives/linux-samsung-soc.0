Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415D426D17
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2026 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675845; cv=none; b=tD0/XyeAIUZ09BCtOskX2xQg0rwuwYyjzPzvapaQG9t1+hiLkutJNuAgiXkpzTgAUGGLATqDeBTLkdMURIZNsJ5GJABqnvH5oZ0zTuZM9ZCcAd5wxWDfPzPFY7vWSGloaIaMx/r9pebqANahOhs5b1opDDvW/KtvbWtIIS71foU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675845; c=relaxed/simple;
	bh=2Hl09FruWGr6pjACeuq5DjMb5si4CPaD6fjJlZmzP28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGE4dlUGlP3ZzsWQ0uMojt9yJ2hSgh6GgW8srIqA9TarekPfQRcLN9VuKI7g7yJZqWoGrq65Ekr1LpngUZjsRJMD+3UUtY05w6jOAvibkIAeclWMtHm/xSnY+T4ONWWWWbyq9dLvjpyIodmkxNWeLs5pGJ8ycG0zc9lScs/0v30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sHCKKF+C; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sHCKKF+C"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44a5174670eso3776755f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2026 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675842; x=1779280642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=sHCKKF+CnBeOZU4CM4myHpo3qOcyrTUnKID4fu9N8Fs9OosM0tLLyRZAmOrEr0Yurd
         +n2q4ZQ8Fw79aDTDymyZXM6ihIbVsINGOWw5vnSLipjPBlSxpZrfH0E5hhAVs0Au1c/2
         NIhmMi5gR2974Ig+07p8yTflS87Xt6GEHGLSkDHVozJiFjPrrvaBOHHKXpViSXd3lfqF
         6A/BUP2vAtQhjvnNesfpnTP1NVlS2Aj7BJbKEZzDxgpjYw61Lr3x9iaTkQku/yXinqoo
         C1n0DW51CalgKSA7TjgcHhemWl3m6+JsA5Ac94LeWxanlFK9V1DfbcT0ZTftYYd6rGdV
         +71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675842; x=1779280642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=GxB6NrDhygDjkgZRxpPerwefbzuUhRJ7RZJjXQmOJb7s4WGw39Kk9XnVIumesNCOto
         xS7RljYqsPpClwQX5idakUyYfmUuSG95MFyoySc7g4/F3ECVDIDIi9PQ9ICt/ynkpGY2
         sVNlGzPKE1YitGDccL5CJOF9Lk/lloA0xQlQFFcesecRfldY5K66MREFCiqxdp4vYq3A
         8+4y2+2jAmTaP0EXcPGwuXpl7vH1oo/2DzQoBjEfa4SGoZ2I3oSaoaV9nvV7tBSVqK+b
         +fsOOjypKT6um+sZtjbWCXfCy10agDVI7MgQZvKI4L4urcweU87/QJCwcGD7NoF3tVUv
         6yFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1NL1s3sak+w4hjZD5G8C6pKi2zq0j242O2zgc/vrgolCwRRlF5QjNpZm55Y4m1HFTFmfsh6Bpro+NJQfQJ3yOXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7OsEYCXVWDFyh+sSNni6xh6L4Y+wi+aPYOqGje8wM5og4WaBV
	l5lAN2D2GFLup5Xc8JiwaILb5x6o4Ljtsn9JMV1UzLTN2/WUR3+OFUq7t2JnDYLQjcs=
X-Gm-Gg: Acq92OHnx160gDMMuUWZw78i0RGvPrEDwGJs5Ku+A1V7ijyVu52ig0nkMQXyVepXUN6
	gz4fZX6H8rV2fpo10QwJEMQreXHqrMA0i002uxbOGdfwHRBIwN57ESLSqMLhnUbKQAX7wmqWWzX
	nG1Ct4rqHmNMm0CIskvqye+c8ay4lLJfhI94F/r6lgcVKZ7fTTch/itHI9V/N5s0E+0k+TU5hUI
	tCQcDW+F/TZKdt/kNNBCSUEoXft+W7AKIrK0JVjrBtBfdD1ijJ+Z53p5FKiUrm7lORAmqSS2/aU
	z58w9rbYObEn5YiTGWNtYtwFxP3gViwsE4LSo7wWrrD//FHTYz1f5v8k8iVlr7WZPxZGQnHjRCq
	hUdXqlCcLYSEE2vrKYklA3YzIAia7LEla9OUBgKZv8rSVc5eqVDNybbdiVfq+gVa7SfpiK/5puk
	olK9tv9B8NwsrBqBzM4L8/YbYmiS/gbAL8ciXYpe622BvX231yLw6wlSW+YQzhK7iGP+Y8+T+NW
	bT32ATmoV5bygw7
X-Received: by 2002:a5d:5f90:0:b0:43f:e94a:e773 with SMTP id ffacd0b85a97d-45c79f297e9mr4410874f8f.27.1778675842151;
        Wed, 13 May 2026 05:37:22 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:21 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:17 +0100
Subject: [PATCH v4 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-5-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 498ca30a00c5..60c25fed8ffa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23645,6 +23645,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0

