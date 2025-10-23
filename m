Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4851B4F09
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252652; cv=none; b=ciO+FRJmz2qs5m3IqBit/EvJ/H00A8pU6ZrKHjYNfQu9t7lAK77aWcJ1lJRp1ddH96R9YfNg578l9UlfrkTR1gc5L/Aybz7pnupKQOfNHeNneFVocKp+42gFhmNy4/wJa8U4ILsmfBuTN+M2hJfP/8zqZEnVyVIODwQAwPRVluc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252652; c=relaxed/simple;
	bh=vidsleBrv6UezkEOZ8wsCGdMuLsh7QY/kEWRWgsv0s8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=owqvuLzkIbJ6R49Nd2wKXvhYjpBh7+3dQxHEC3H6uDmXTTAkoQRXWeptBNu1wDNtrvgX4pWihmF5mvxMi4xGEuIC1RQ53KCCUyCYq4Y+w3j3aMr8AoGiFGe7A99rZ0f7kFsfk7s2SFxPy2Ygzxwqu8MHsR2QMR2j7giPjM+yBo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mwhUkgIR; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mwhUkgIR"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33826e101ecso2892216a91.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252650; x=1761857450; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=;
        b=mwhUkgIRgzV7DgzYp/pQsduxcK5RRAyYh0XvhJEOjXPTHtFgdKjC9yizrZ4rl99YZ9
         DGr0tH2ZqpDZNEiypG1vYDl6Q4NswMCcryEwrHlHxNHy1H28EAyS/A/Jsr5+5KmcTq3v
         rSfsgGGV0LOqR6O34ELDKlbad46u9d8YHQG9M1YOjfojQyhXXTn6au7/CIFRkuJeN5s3
         iwCda82RFQ8KDpumEtunpDJXWjqaPATY88a1HhhWzZlzDkWJWHTi8ywGQoQz3ZkDap2c
         5ZkjRHw4Lp9XhNM6eYyOYk7QjDKGp4Rk90fcA6V3jny+FH19dXIJlxbhYdYO2MHdUc3v
         fk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252650; x=1761857450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=;
        b=AaHDYszSTSpo5zDo7uxjRzkLjEnna2q5No+gwxkRo3iW73VEtXYhFzXXxUn2hX+ATY
         WRmirknWnJJ1ZZ6a1rrXqdHru6CZt9mu8WjpS7Oa2elIMP0ceq1HCvgefrG9Pv1m5trl
         /3IteS2ew3NhCqgz376bGWelTkOiMCSKPYZ3z6QMS9F4XSarkNTsRZqu7j7ohuJnhlxF
         1GIesbhf0BhnzZhv2uLa9qAKqNmbSSGcZV1xi7GQD3y0ZTaWgWc5p/TRyNMFeYemy90L
         kD2RIC2wsunXge6eJmT18aSb0Yxs2k8q/6ED9YvEakN9+UaG/G85PaKugUXpXccrpBOg
         tbGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXov2qKxYWIgvnM7Q/jAqAi064LKFBxfhB+IKv0tO91XihGDBfmNN5r/ahFGnXGwdGsAoJ/XG+jCgShQvi/vyAaaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU666+OFPNsKbmysql6f+4vs0SUrlww7K2o8L7/C9PcaoMNjm3
	jYaXV8XvxMX1V5jzC621sO5AD0uos9QE6yNOs1xZBS4GaaOft66GMzN6HdeVcAuhvxLx+kEWyc3
	y/H6kDAWdZ/mwbvYYoC49iKzvViEFNw==
X-Google-Smtp-Source: AGHT+IGNMg2DMCJiL+F+pPhnBIlXppfMVHZRBUW9I2WIAEdbh06XGL0yXf0m3s/lwp4/2Oi/pJT3D4KTbFExW6OHopg=
X-Received: from pjih1.prod.google.com ([2002:a17:90a:5801:b0:33e:28eb:7df2])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5490:b0:32d:e309:8d76 with SMTP id 98e67ed59e1d1-33fd3bbda7amr336959a91.10.1761252649957;
 Thu, 23 Oct 2025 13:50:49 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:50:27 +0000
In-Reply-To: <20251023205041.2027336-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251023205041.2027336-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205041.2027336-2-willmcvicker@google.com>
Subject: [PATCH 1/7] ARM: make register_current_timer_delay() accessible after init
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Ingo Molnar <mingo@kernel.org>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Hosung Kim <hosung0.kim@samsung.com>
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

