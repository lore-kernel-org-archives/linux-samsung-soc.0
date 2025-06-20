Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A84C2EBB8A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443465; cv=none; b=LY7kJOnYiRWtk0UUob4uh677AH1RXlnAUryBqwoEz7l9D8bLqo5C+9SFfXt2n1IUuYri0p5tpsupvIPl4vTaBbNFVk/QB4qM4mky86NFbSBRAktI+3yjAzF/BrD2tuMmeLR3IqA8C2trjhFcMj9y2ST0v4xjH9WINhMlqClDkdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443465; c=relaxed/simple;
	bh=E5gNelm91XMJ+AZCHJOExXs098uttzq+1BtKy9LZWyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YY/vLfBhc51ITobvixPEzosGFZa784A+cSoKt0VagK9TzuzD9ijH/KUy9RwyfLCktSYKBaWyLp8R/SdyNyUzW517Y70hgsn+DvNCQUJS7DJKno24g2h+remrQjY2XS13ZYK4Pz5Eu1Z95qbzw3DJI+rHu5v8IUfsba6s7KfcE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FA5gbIpT; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FA5gbIpT"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so1763729b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443463; x=1751048263; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=;
        b=FA5gbIpT3eGmw5TCQRoNCphA4HGwPyXSGfUyi3jfnw5gfDmi31+PKgXC6mxizVfwLZ
         UTg4b/TtHRWSsHUAseVXbxm9uAICxsiKzbgI8aJLDRgd+l3ITvUgO/q6bpCenvhS/TMC
         8D6wHZ9fhdMCk1v8XekthBMUafOJ4dCrtDDDNUJcBRw9MXYtVImFrmHOJKG9JkmclmeO
         ZI3DvFerS0kJEQrpZg78U0Ojy8QVX3YO7mM2lbIy+PD+RpPpDtuA/1843dlmN087L/+w
         +0FtaMKfv6E29NWqumfzQH0GH9yDpiWrczZfBSEiflH/xgygxeBlxLb833C60huFB9sq
         BfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443463; x=1751048263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=;
        b=XVdKRPANA2fb3HcXo2lC+CfEbzkL1Hrly4IxROw/pgZMen7Qi7bdi7Mzgwn9DO3be9
         ciG0xjs311vNXAvj7bCeNTL17hrEC4KnjDBFb62ZxWBqM5kkS+G2Hs/UWuWOyTJFUISU
         2i3wP7RgH6Iwh0O6FF1zGEG3TLS/B+49lXF6coW45UYEOuqGcMjr53qVKTWV4w7bhyDi
         9Ppicq6uGmsQUZ7gUXwCZCvEMgcgqVxjdM+I8p1r1MsLaudrCIrxalyg8wQDm5/usz+N
         CKiXJA4Jke8sWEeAeGrvSiLlWZ07FR/oB5ZV7Iz3y6e0/oEOHTBhdCn0smUCRA9hcfTu
         FrvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN8NlUjx87qwg592zi1cVEgIIyUvgM2mHy8403GvUuZJnoIqdzhFd1GPNo9IWfz2h8VkyYHUKkdB1uYfO4QWEPkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1azmUT2iTUpHxD8U1RexKkJ/aEx+6Fmekzk87SyYFgEfSsyTJ
	o8X0F6tX/TwTxTy6m3TfomlzmmET/Zd7QnHU2oNP9/evYO56Fru5A8LhD4IQyV05Unnflct9nrY
	LxPBrxxvnGJZBSpEObNuu/ELzIiy0qg==
X-Google-Smtp-Source: AGHT+IGm/vFj5hrKzWy2Z3pEyDUaKOhhI+CR5MlaibQ4Zvsy25uFRQsZYTONpTVOibGjQMqu8859Np1afVaE2rSP3T8=
X-Received: from pfbef10.prod.google.com ([2002:a05:6a00:2c8a:b0:749:10a2:4f64])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2da0:b0:748:6a1f:6d3b with SMTP id d2e1a72fcca58-7490d7b8df9mr5222155b3a.19.1750443463199;
 Fri, 20 Jun 2025 11:17:43 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:05 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-3-willmcvicker@google.com>
Subject: [PATCH v4 2/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
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
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The MCT register is unfortunately very slow to access, but importantly
does not halt in the c2 idle state. So for ARM64, we can improve
performance by not registering the MCT for sched_clock, allowing the
system to use the faster ARM architected timer for sched_clock instead.

The MCT is still registered as a clocksource, and a clockevent in order
to be a wakeup source for the arch_timer to exit the "c2" idle state.

Since ARM32 SoCs don't have an architected timer, the MCT must continue
to be used for sched_clock. Detailed discussion on this topic can be
found at [1].

[1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send-email-chirantan@chromium.org/

[Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Acked-by: John Stultz <jstultz@google.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6bb..96361d5dc57d 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -219,12 +219,18 @@ static struct clocksource mct_frc = {
 	.resume		= exynos4_frc_resume,
 };
 
+/*
+ * Since ARM devices do not have an architected timer, they need to continue
+ * using the MCT as the main clocksource for timekeeping, sched_clock, and the
+ * delay timer. For AARCH64 SoCs, the architected timer is the preferred
+ * clocksource due to it's superior performance.
+ */
+#if defined(CONFIG_ARM)
 static u64 notrace exynos4_read_sched_clock(void)
 {
 	return exynos4_read_count_32();
 }
 
-#if defined(CONFIG_ARM)
 static struct delay_timer exynos4_delay_timer;
 
 static cycles_t exynos4_read_current_timer(void)
@@ -250,12 +256,13 @@ static int __init exynos4_clocksource_init(bool frc_shared)
 	exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
 	exynos4_delay_timer.freq = clk_rate;
 	register_current_timer_delay(&exynos4_delay_timer);
+
+	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 #endif
 
 	if (clocksource_register_hz(&mct_frc, clk_rate))
 		panic("%s: can't register clocksource\n", mct_frc.name);
 
-	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 
 	return 0;
 }
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

