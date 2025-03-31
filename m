Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3321D5A2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 23:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462050; cv=none; b=hWviKQ95SJraMv84DM4IbRm5EcSGkoIYqAUB/wC01UkOZgqtYn5ZA8+82Nps5e7wYRMPi5pedr2ipaStSpxV5sySPzRPuY8WEhwcwUmZ8FKRhxz4uzRklapM8fjQDcIGvLoNpQ48yiaVtEfRLNOJCRMlp7M8Ytzmk9O1SWkrSSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462050; c=relaxed/simple;
	bh=nZrzVWvi3ekw8G6oETZmBhKkYjcASs/pkTWr9Wls2ps=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nMWejmmu8QJuQmUg3RxlT+ujlG+D3o7qdRsEGAhXG+CYotRdxMcDmRv4TtZss1uapOdD07qFdgJyOHSShhAK4UITP11u7ruXeDNVwWozoOqkvBTLER/Hrb+I2n8L6bPnZQ2tqVsyZkHNuHDBztUWOeUX79NmVeSsW/4h7q0btDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JkdZvR1E; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JkdZvR1E"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff69646218so14833649a91.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 16:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462049; x=1744066849; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eYIAFf/wPB1FgKJfqKNRuXGM4xXRDDSYrMtDo5kebno=;
        b=JkdZvR1E7UHprJW3SOXV8NaTDVIaPLgtc2TGGCMAOhaCi3ViPO4j1hQVQsFTjUaWsA
         9OBpuRFOzQSW3MBrrLdy7zh+xYorjC3kardDzJn3DO72ESOSArs/EjAB14Dy/fNw0toc
         8R1X+xSChMwtXu/do3ctlEE1Eezi2tI9SWgJ1aknAsaL5rInFreOGsL7usB6ir5dewm+
         kHGixtA4mF3bQu5lLvgXxipxPuV8sb7gVTN0Ow990vbl3IRJqs7zscFa7WEWDhLRVOYj
         hV/7wd/Ihn6l8tURGfX1H53OFWeuD0+4DLyRkJkkxkQ3MFVHRe20FtPrmP06LnNSipqP
         x70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462049; x=1744066849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYIAFf/wPB1FgKJfqKNRuXGM4xXRDDSYrMtDo5kebno=;
        b=nVUmtQDD/HwDriy1KYBi8McV4dYNCvcnaxwbEMjG9FsgDzDhy8fxtDOF8wgkX/Xyke
         CXhWh1fSgmrbryMaf82tdPtO3zgW+gtZxwbCrYBAg1u+iPXaHMaedb4/xete9FC5zRPZ
         YX9S/9aKaH19N7JAPiVhRWiHjG5Kx1TVWedVZE9i7pNru+l7jvGXVvJGAgrFMx2h5EcQ
         mebK2rYxpaBkI7kvx2Lr0MTGPUkxAW+yAgFUsSI5h8buyUDsdyePPBj45R5FOFFARE/Z
         /235BkEqRmGcfLXmF/eWNFxKu+fhCwOzAaGrWx0HFc2/QnZUi40NfEUGfM6Kw59TMBhg
         uiBA==
X-Forwarded-Encrypted: i=1; AJvYcCU8uDf2HTX7lskWX5EDrhQuVZg89I5Sq1VlHDsksM+O56rbZeioee7SNLU4bM5jICpgZTfRfRGrvoL1tNa+IPnqxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBUa9NRhC4qe9uSkDHMwLLdaEr13C6htg6IyJY1mvk69E/2j4F
	aSuilktC8P4XPZdloL7XO6VNESP248/Fua90qZ3cixNE+NCfCvzIocPhXapHBtntaEnQkTl+ec7
	U8/w98BMuF8rS5wa0sXn3jkIHxg==
X-Google-Smtp-Source: AGHT+IFpiB1mL5vyi3i3SJZAHaJn7lRrJRhzSesvvlRpke5S6KVBbYcslhy5s8ASZECHhLaZs8DNDJw+s18hm0Fszqw=
X-Received: from pjcc4.prod.google.com ([2002:a17:90b:5744:b0:2f2:e97a:e77f])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1644:b0:2ff:6aa6:47a3 with SMTP id 98e67ed59e1d1-30532164b69mr14496424a91.25.1743462048717;
 Mon, 31 Mar 2025 16:00:48 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:25 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-4-willmcvicker@google.com>
Subject: [PATCH v1 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Hosung Kim <hosung0.kim@samsung.com>
Content-Type: text/plain; charset="UTF-8"

From: Hosung Kim <hosung0.kim@samsung.com>

The MCT local timers can be used as a per-cpu event timer. To prevent
the timer interrupts from migrating to other CPUs, set the flag
IRQF_PERCPU.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 05c50f2f7a7e..21ded37137d7 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -590,7 +590,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING,
+					IRQF_TIMER | IRQF_NOBALANCING |
+					IRQF_PERCPU,
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.49.0.472.ge94155a9ec-goog

