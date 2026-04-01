Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD92204F8B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 04:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019126; cv=none; b=tdfe+2D+U0CG/+bnvl7vwDbw3iPPAU+DGEmbAfNE+D4kFJkQe/aHkipxLgjes1WiU62lp1FTCXW/yUt9mvRcZjW4rFByyFVJb/G122aDfa+ZKxQGBMYIiNOOzl8N5eGz4YxHCssY68vzBMbqK2X1ZPg07Ir4OwnYFaAVooF9rNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019126; c=relaxed/simple;
	bh=jlF50y0yBoCtfja1lf+Ldu9VIn+xMWozYuJarV1V7no=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=raAKC1WnQBpEOdlE9vwkbjX/a+ynleCXJf+g4zrHMyzoumiW4sdGhZKUTKyxpztSJ7v6SqA5V4qJn+8w+sypJewyAFGxb2i0iFHoHQf1WI3SZ9NYhQH70HNzdAgL3TDAaFTa1wrw9i0XP74o4lDwF9E+Q+gFViMW6mVWHEjQWdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jj0hITj2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jj0hITj2"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf7683a28so1925667f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 21:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019123; x=1775623923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Er/UMqcx4ckP/cOLow8b5xPe3OYHBVkCHhXLwhn4wRU=;
        b=Jj0hITj2RYuQid2VGJf9MnXYo21vCp+W24vgEsTW+VON68km+j0lFs7O50d/Kely5E
         EtGg/JbiBiKFS5elw3oxt2l28b5RLJY7rmeXCIRx9+/cs4uiG9JpRQeOTRlp9aLF4q2V
         +zSJo5S3HnbgWu/0Hr836Vl4wf876jzHV4yPeZRz/5ovP8/5ACT+IkImUG70Swx3/QRa
         h/U5pn/i3koV8JMolUkt6Z6EVDwofZ/yv99QcTNCdG+5dhrm20HUGhzqQiWGOP6BDpQn
         K9oJO2ww4GR2nHNES8soLMFKqY82ZMfyngt0KFJu7wDDLET4buncCSOEn84AZ9OPfCwU
         ULYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019123; x=1775623923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Er/UMqcx4ckP/cOLow8b5xPe3OYHBVkCHhXLwhn4wRU=;
        b=LhbRC/mWpcbwFTElIaOWKaUGVXoX80Fv5lWNVL2xUrRJPmi7nRcndZ3PtRIw5cHHry
         lyT/mwOkmUey73aU34R/4C4LnDQ86OppCGtzWYTo6qiYOuKeJnqwbKnXUoNDmAmqZap5
         5HYgc3GmavqEz4CITkO0SeU64jQKaSWQ2tNmbrRv9O85+Y7CIjj4nWUQZzSTgt9/7fDC
         L6HOYyVFYvNa6/NAANuGHUqXtexXskoyc12Z3PUKG9EJDeuLaIT0gjGA+O5wu8vHFWRx
         5hKv83rC/rP8xQ11AJpgRrRaOyiX3uZbCKRRWp8ED7ogceWzm5L374JWoVKboN7JdLdM
         1g0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7Fup2xaElZ0vsDo2OkZEggKnBPdApefdAPGPlWN0sc1iBwkxH77CSUmJWwQ0kO56BAMudY7V6grGcauBVaI7pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYcO2W9sQ8thEiQZ59TfFKUnilhALb6Ggv0my03hdaYuJ3Nu6d
	Ypp9UtJ7THLhKENMkHYd3IUuwYrlc7WXqEhMZq0NMLm2XY7C8ce+bkZ1EZUEIvKlGaE=
X-Gm-Gg: ATEYQzy+XqpoVn/bAKLTRAM+3plIhlk85uZ1sI858ON0IdJc0z2d0JcR6S5DGD+1sh7
	bqzd48s17EHMlbS6cO/p8CxSP3pmP9uKc5jhST/l7BZ7hPThW4Sweiy+0Ob/G/dUOmGkr7nD141
	tQan4d9Y9TayHCgC+mq6fBNLZkts70z9VOqDueod8vmG6y3ikTV+fyBN3ue4gZRuajITxHnpe3O
	guPtU+M+GRGwCl9icpzctfO57WYW/uNyiI/uZeZfG+nkSZG5DxMB530ozmE6ZXmqAsArtkir+Ql
	MrJ2lMI8s9x1XvfHboTnRj7HEFoenz/eA2lw3qwY7JVBUxBD73G6xjLrcD94mlonAi5Ixv65jCa
	mnFfeQPIuaF+x93J4iUWQi1Z4w3zpBf0yzgFIKPp+YFDc/b8awkxNAYD57/3KDJUbsDSih3wFFM
	9b5XS7722ic6mIaX3fQLLb+ZgyGh+wlVeA/gq5MG0PPuhDukHJZpwq+0mmhRjbOLUuiyT7YgZHm
	Eid2gOPgqlbfGXz
X-Received: by 2002:a05:6000:2483:b0:43b:4f86:e985 with SMTP id ffacd0b85a97d-43d150e2f1cmr3908311f8f.33.1775019123164;
        Tue, 31 Mar 2026 21:52:03 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:52:02 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:59 +0100
Subject: [PATCH v2 6/7] MAINTAINERS: add exynos850-pmu.c to Exynos850 entry
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-6-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Update Exynos850 entry to include new file
drivers/soc/samsung/exynos850-pmu.c. Add myself as M
there.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e14e6f874e05..4b28e92b4d9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23601,6 +23601,7 @@ F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
+M:	Alexey Klimov <alexey.klimov@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -23608,6 +23609,7 @@ F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
 F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
+F:	drivers/soc/samsung/exynos850-pmu.c
 F:	include/dt-bindings/clock/exynos850.h
 
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL

-- 
2.51.0

