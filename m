Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B636AB72
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2026 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041321; cv=none; b=oiDxLPuk9/VL57bWW8d5CpTTcHQtrd+lu+JP17JQWQwKQoH0rIoyIDIuRxHgclrwR5zdPA6ilJUHXHcTgdPn5tWIKy5uWh0bMTYfSRG5a/x1W492vEKDmnXfP02ef8PzWriVB6645qPxOHgys1TEaK4GtS1nhICOQZCzcaZsR+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041321; c=relaxed/simple;
	bh=VfS6i6Q1Xha9qkU4i3chmoL3Qdz2CyqS9j/LuIP5U1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/aFphD/e/Yeym0TqAXMqfOfybKNT5zR40eV0B4WyVTURMVpPf4rVvYzz2cA0y0oHq3mAx2G1Q2qIWv1lNUksU9UvCuOpsubHxTlNGoNcLEUHo436RW2pvFmHXUW7yRAcraOuuWUDd8iwGO1zgvArXB6DouDUi8TMb9fvkLiIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nN/28SMl; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nN/28SMl"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b40003d13so1538748f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2026 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041318; x=1774646118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQFYVJlRe1oBH7q6MuxKAf35Jb0tQ494FakvV5sn5wE=;
        b=nN/28SMlm6Omv1wie6ls/xdHKrEtBWWzkFJs/V5zuC321Wg9TLWIwcQHUWNttbqR42
         D6dbBWd8fnhp4gwtXC+Soe9tQsEvx/gj3jMufKBW9NlFxUi6GdJtPjVBpihUcvQWWV4F
         3z7ykxIhHnfSrYzHL3sz077w68v4+r4oNxcemT0RiGaPnonwguB3FIicGtN01wFYNo5S
         hqjfCFiOd2SBn4r9pfUpM5GBnbZVpnVdPoj5LhF/EE7ug+ze/2IUnfuNWs2uMpyDy9wK
         jcCGDoxerEKNHChgM6iBFChyF36O0l5n73pQQMR+AX2geLmPqcwhAel9nfflBEqEvab0
         dHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041318; x=1774646118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQFYVJlRe1oBH7q6MuxKAf35Jb0tQ494FakvV5sn5wE=;
        b=FyL9dRLjkDBIRTS5h8o04qhMgW9GuLGNe2OxkpG5k2MJY7Horich+roZqeOCcmaYLl
         GbKQXDGbD6ZxsU5VYtwufdDFbljVKqojTSiZQhIQff26YYQ3y99xTCo0dyp8x1RtJ8Gf
         qd12cVFc1pRgcTtXPw6I7loWowF3dEnv3hJWvBDNLohTeH6WhJRzmPiYA70I5cLZwxn0
         RXug9eqNTxfHkwmOpXQtOJjb/VmVhaBugfhxkC7+F+Am4KK2gCIsfmCKzdg5Gvn6Kes0
         nBim3G5sEy8uL4ecC8RSgCETEKcRU0AnoAHrgqIG1PdXcsyvz6cRDsoQr30ZLOyfwNkj
         sj2A==
X-Forwarded-Encrypted: i=1; AJvYcCW7Mx2W6Ix+jk2dn/2+U/N9xCaSxA4TSyvIIEG2hRPu4NazwG+/SBeHlmL4QbEs83vRL08R2mlW5fqa6Y5Kh2mloQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjInwfKm4yVgOAI5+4spwZF18qi1ck4o19Cj11gZdryM8HsM4H
	Uz5cxTp2gEhL4983W/X6DV2nnyPu3bGBoqGjueL+MhTrYRuF456ud79zOfJeJJ7l1b0=
X-Gm-Gg: ATEYQzz6BcThU0bPmbGkOkFnoAO2ltPiW4UwRfU5ppKEKaTWrw7VjkgYG+koon4sstD
	N5Z50QNI3X8pmEQ3tkscMlJ1DvxnctaV9PTS1rzWLEofj1CxRmdiYuHrfjW+nCtIT6gcvyBzrQB
	2WnuUix3c7qsAmEp1XVyrnT0wwyrT4Z3xLWMQiXlkJdE1CJUglZFgAajLXYCzrvOHkZnrtm3pVV
	IxynWqZLk/GzkXcdFm5ULGrpUm3uSH3zQCD/N3g0fABB5IPqfejk12vH0xPzJUm2oFVPnSldR9J
	fHGGXVdAzDtuFt+zKu2MeF56glnTZmyAy1mx/9ia/vV3JXPgCsiuv5OKid3YarRqXn62An7izxE
	EdWpnsFN52IoKcxwKnNIl3uyKpI4APHHFvudYZmZ+BrkR/4bjlMYgmnpkL/eOK29y0WxGFAgCzj
	cSFuuqfWinoK9jMJj11GIzocIeWOy0PWy+/DgdqroP7iLCLuYTTEroiBDHhXfr1Ft3z1zGazXhT
	gGqs/WJY7txA5XAr5JAmFg5Hw==
X-Received: by 2002:a05:6000:18a6:b0:439:bdba:56be with SMTP id ffacd0b85a97d-43b6424067dmr8157374f8f.10.1774041318039;
        Fri, 20 Mar 2026 14:15:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:13 +0000
Subject: [PATCH 1/5] dt-bindings: clock: exynos850: Add APM_AP MAILBOX
 clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-1-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add a constant for APM-to-AP mailbox clock. This clock is needed
to access this mailbox registers.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 include/dt-bindings/clock/exynos850.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 80dacda57229..95285589615a 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -126,6 +126,7 @@
 #define CLK_GOUT_GPIO_ALIVE_PCLK	22
 #define CLK_GOUT_PMU_ALIVE_PCLK		23
 #define CLK_GOUT_SYSREG_APM_PCLK	24
+#define CLK_GOUT_MAILBOX_APM_AP_PCLK	25
 
 /* CMU_AUD */
 #define CLK_DOUT_AUD_AUDIF		1

-- 
2.51.0

