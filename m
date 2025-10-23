Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1255A25A323
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 20:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252785; cv=none; b=kXG5Yczz0F6GKoVFWxSZ2KprMgBUCGnXSF+IWG/3ORt8Wf4Seq/Ap7ub6Jsr6HzrQW+cEcBxlrBBsQDkydbbcByTiiJmaVxoUXomwdJVms6hf9sOFz6W8CIvfg8K5TU7619U2V1Z7QkCny1a9mXXoo9xQvc/a5mawA+YFIPu0UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252785; c=relaxed/simple;
	bh=vidsleBrv6UezkEOZ8wsCGdMuLsh7QY/kEWRWgsv0s8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WsKAZHKa+XIc3spFOHarldssZzJn7RoohNtR0p93kWle8x9qi4X7+JNs+QC0BklTMZm+WztHKxlxFI6g6zPXYliGmd2Bk45Qv0Eu1ftCGvYx4F7N6TbpN2yc7nQ3GMvK4x3Cs0kx7u4hktcSDv0H1+pdWTyuYocNBizVAAnIQsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wEcCSZCx; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wEcCSZCx"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-27ee41e062cso14171845ad.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252783; x=1761857583; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=;
        b=wEcCSZCxL4O4Dfzjq6WX3cbLcHNT+dSlInHAKQeJ9ZsWpeHE+MH6/UjJLzPGFG2ZH1
         /Jne1MO4Y2aH3iS8TEX3nDtI998LY84x9mDxST5eVFZgAeNdofyxygnyveW4cS8AEYZz
         djIVNECKtRdvHvQF220kuxM7IQReqjmYyl1Dc3zZ7kSdugw0Ht2P/nsAFn8lPmF5R0fS
         9jBxgV1TNzj2MV2X43VznPXM0IgbojXQ3bh6M9c7kVgGHys/rGHGMJecRZlDmvMuqkrG
         86SCA+d/0kBnIad+egBtf1Tz6moMdUMOkYSi1Vx3SerI1RKQbd0ojhziEuClWDYwXgQ7
         sddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252783; x=1761857583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=;
        b=gFNQ12tlfXPOhRzkRT/olQ8FI3GcJItknQCTtfbpsulDxQ9fEoB65e7pOGvgTNjnt4
         cRQnZJwV1esnIfKdzoJAIXcWQyKSybWxQuIFsIhHCDkEWZ7Cj3RUGxVGrAFx1aovYBvz
         n/fgAmBzTPNjXmZZVro6ADJi/KwNvCY1S+bmCTwuyDmDbiJ6Zf7wVQGcXemtrbPbkqbs
         MEqsOGxnvqQ9lqKkJ0nbmvnr/lwuP9/p6v0G3WX8MTRPB+sTKSUE9eVGUuwezQ5o1ceT
         5uSM2T1KGWZWaS7jeotIuzJGjDQ2U4CWEHtqT/TJ6Jby/vVnFNEwjPzErkVtzNxCOBE3
         S6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVphqFks+TSSidms+sJTntmUwPEUsfT+b0Ee2I9yqSKdwUnGpjQwMOC6lnYY1x+S3srMGBt6FkPAhb//bkx8l0ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhacJw2H+1SvRC5m6xCMn21P56Sfa/BgbqKPb7sbMwpbAjMgP1
	S8IaHIM5IYja3UvL5EyI6958gDhc8M3P/YvxjLbx34VWYsHhq9YDPKzASxLLHaYh4poWvCTibp+
	yvBkBw1ZxePQNkzLz2jTBu2QmzXyWPg==
X-Google-Smtp-Source: AGHT+IGZ8YUla39b6Z83W7WgxBQC43Iqqksh+N1ptF+fhn6Q2OrPyzQYe93BSwde0qjKCGwbnFHIHl9SHzvH0QPzRfM=
X-Received: from plbjh6.prod.google.com ([2002:a17:903:3286:b0:290:b136:4f08])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d60d:b0:270:e595:a440 with SMTP id d9443c01a7336-290c9cd4b48mr299453355ad.25.1761252783163;
 Thu, 23 Oct 2025 13:53:03 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:43 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-2-willmcvicker@google.com>
Subject: [PATCH v5 1/7] ARM: make register_current_timer_delay() accessible
 after init
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The function register_current_timer_delay() is called from the
exynos_mct clocksource driver at probe time. In the event that the
exynos_mct driver is probed deferred or the platform manually unbinds
and rebinds the driver we need this function available. So drop the
__init tag.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm/lib/delay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/lib/delay.c b/arch/arm/lib/delay.c
index b7fe84f68bf1..acfb87143f21 100644
--- a/arch/arm/lib/delay.c
+++ b/arch/arm/lib/delay.c
@@ -62,7 +62,7 @@ static void __timer_udelay(unsigned long usecs)
 	__timer_const_udelay(usecs * UDELAY_MULT);
 }
 
-void __init register_current_timer_delay(const struct delay_timer *timer)
+void register_current_timer_delay(const struct delay_timer *timer)
 {
 	u32 new_mult, new_shift;
 	u64 res;
-- 
2.51.1.821.gb6fe4d2222-goog

