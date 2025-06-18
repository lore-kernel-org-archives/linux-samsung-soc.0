Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C86825F7A6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 21:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280941; cv=none; b=Wm63xUPa9V2dlN2Vjqg3rykWBW2H23nRT+zdj8jEb4XsH4on4u5C5KZwPxky0ECYqSv7Yy5L9yyasInE6IajQNxFuiQfs03CDEHFIgGm2rdHLTApk/8zo1ZbUJFeyhjyeBJCne4vks24zblIqeCqoZkxPRcduYBEPzPlvM4i0ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280941; c=relaxed/simple;
	bh=YiB0G6F8wy6l7JvT/ZZMMGcgJTsPVM5/IR5furyk19s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LMbY5r13CA33yD4+gn9RY9x+QTEzbe36m1Nja3HuB8qDVcZi4R9XiZ1DzZYOywTd4KUiSYN7gPCCWhKCS+c9THZvF5T80Rblv5cM2ojw/f2y2yUCBQwRa/1p6TpNKJFvmBy7WpxgOBp3u1bc9oGI+wMRKJT0m+yybJ8pXFGf3/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y8MTsWFK; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y8MTsWFK"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so46876a91.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280939; x=1750885739; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIV2B0fUwqK8CLLa1kWwxVC8BX5dJhCy6gXrqz6FTh0=;
        b=y8MTsWFK4M79J5xy6e0KibV+LM/zfdFmrsi1xm5cMyGgL/rchV//vgYnQWnDKZHTav
         wT1bHF4IgHUFxAsNjc+jbkVEifDuyEa85rgMJOpNq+R3Un5TSVljGV86+vFk6oateBr/
         wlBahHDL2EOX3Ph+uOVcOgLbulvywiSV/Bi9XUL+FDq/dxsy/KCwefNIf9q7L3s0godJ
         kKfWvpIw0bLnahaJjtsf0kHmb5S5NxKrr4wj5EXOux2JbT8pOUjPix5MsYOwCa4S4/TE
         b63pMSLFEMZPkeOlRbS31Lq241/jbIV2u4BWnKQuS3brikxPvrAwIFFLoAcuxNrLqS/W
         g/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280939; x=1750885739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VIV2B0fUwqK8CLLa1kWwxVC8BX5dJhCy6gXrqz6FTh0=;
        b=Vx0K8snT/vMyzmQMY+herqmauM4/27QihLjYRPPxyZTlJrkfQQbsrgm58XFHB9YZsN
         aUfAVonIHwDl3MHnUB92nboQ5HwpeQMlV2BAegRwh50hkmz2gMjBQxdOtgbhUBFhwWGm
         1AhIkFGn98mVlEPsH4vd5T0H0eSZE5cCNfNo3IWjlreXDkPG/frgsNVsYLBJPa/k4fKf
         r8Sji7UR87m2VoruRF9CqkvMu6r1T4BqKoNPWB/2EBbI82j62QCsCvvzpCIhpDK20dKJ
         Xc3jXeCWn1h7szGiT6b75g94LKGPKTrwz1xNIg2UfCkxhJt86toCVY62SVEMmT1FI4kv
         UBTA==
X-Forwarded-Encrypted: i=1; AJvYcCVBlrYSRXMWQQHpJS0ROPLwcvSxIa9Ww6ublM69kT48qQ5D/8ovRz3S7XzD8VpUD35RD9G/6TtNC4bVWqkT1S81fA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuHAYaCYn5pqH7SiK+juk1wiVwWqcXOrJQRpk2Lm3RjQggMnYG
	2F7HlnjTNcFuUsQQBiP36LtLbPZ4XJA3DivAei/8Aos5CPJJItJ4M5BYoHh5S/ceLi22+DnBE2j
	nrASc4cht8D2eG2wTUqKycFwkj2UWxw==
X-Google-Smtp-Source: AGHT+IGiJGT1YFIh+v5uqzvDM53cRKs7EFb+HuttlM33+6jHCYkauA26YJBxlkdTenXVFE1UD+DGINSTOc28e+IdqI4=
X-Received: from pgbq16.prod.google.com ([2002:a63:5c10:0:b0:b2f:6290:cd48])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:eccc:b0:235:f18f:2924 with SMTP id d9443c01a7336-2366b32a043mr308396435ad.15.1750280939235;
 Wed, 18 Jun 2025 14:08:59 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:38 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-2-willmcvicker@google.com>
Subject: [PATCH 1/6] of/irq: Export of_irq_count for modules
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Type: text/plain; charset="UTF-8"

Need to export `of_irq_count` in preparation for modularizing the Exynos
MCT driver which uses this API for setting up the timer IRQs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index f8ad79b9b1c9..5adda1dac3cf 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -519,6 +519,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

