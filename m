Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42B6363C6F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664175; cv=none; b=sXc9nqWK2xdrZA/pHBSQzEf0wXdZC2OCMUizNlySUeupvt4JEDXIQULN3Rz/CTr1kC5kVozOC1QguSNdWqmNim/KBoeofjAAT+mmHVwcFZVAxv9+x8Wbm5EB8IpZsXWxTjziMVDLuFz2Sr0O31NjJUTT4cRto0SCfCo+DoXYLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664175; c=relaxed/simple;
	bh=bgfytSBH7LUphmvFmf8AM1B4JmY7ELo3wqgFaeraDm0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EeppXy9hb8t6hl1dlUn33UTPHABkpiHeOBLefGtGmkMrNpyTjne9l+cx9fB4mJrhIQ5TuMi5JXu14axiYgyjkvCOnzub6knIzmthQQ3lEoJ/zpPZg1w7Yu/MubxfweJoguVyhQwf08vl5Hp/55ySg6mtM5n8KIqbrbJe2w8+WyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NKu0FSj/; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NKu0FSj/"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-297dabf9fd0so17205595ad.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 10:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664172; x=1764268972; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RExy28cj9QkD+uGmena181X3aoXaellaEJhmZl5Ril8=;
        b=NKu0FSj/f9+shzNZmwEV6WXrR8iwFagqxAgTLNbUYahe557IXrE4C35J9Gsxq3NpPO
         PuTakO+/hOWoJtnyjmRNzdsna3FCjuQWe+JZj+tYLSTtCiaFPstgOr7O7aA4+dR0gmMp
         w+op6+EsSI0C3TPYMmCACjERREKzNnDbG4djoRF0sD1iXDNshZdRfGxyWUxxrht7b+W4
         dk+L1XGMkEYvH6VpGaqzm9UM/DaHt4r4PM+lIvZjrlmTvMkUhYm+0xA32xH5KynurxQM
         TQd0W1U5hUJEerLnpNnjEV5L+oJaUqc2U3+DL7L8EnR7TGuelwUrjWFdQYhS1lMAVOcO
         lz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664172; x=1764268972;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RExy28cj9QkD+uGmena181X3aoXaellaEJhmZl5Ril8=;
        b=uVBXxVFeAlRcQrHqgExiaBtAxs+UF8O0pb9cELrqo1Tca9+TLF5HpoNnra6sJQ0ZDh
         vMCLufQ47YDjc8BWy6Ha/mFcWnk4hJ8XsORnepaQ3iGu9bc55OwX2n9Yo8nAyCxAd846
         GVucVtwh1gW4n7oj8EXD9Xv9jyTqNS4jHwJCdwJRVc8btUHESLmfR6WFmyYYwlFFkKvJ
         M9/Pqv52uwM44sz1fohdf+b+skjOQv3+HubdexfMnqyPcnk26BNSZaAMLi+r1CdM3J+3
         e1nzeoKR2ZkK94DljgiTqUw2my3uUmph1PKN47sDz4D8IWbGNcPVTKFF1oIZ141k4xu5
         dzxw==
X-Forwarded-Encrypted: i=1; AJvYcCWfQYuwNFE3Os4ECYg3lG7+vX72rtv4iFRwHb7EjnZ/WrsPA8fNNU8q68hPo/oFR+VemRtoEZq06dJm5HgNrjkmvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvN1jNYUVkJAAPxrKiP9C76frYmOiwebUapQ3NG5+X76wh8mZr
	qteKEN7edeAemnpto7EnRtZBan+IZYU59kdHfGN0vXnJI4dW37T7JlwJ6EgJj9cuYF5+mWf2raA
	Rcy6IYugM5X+k5DLf8LuOX4HDrjUCWQ==
X-Google-Smtp-Source: AGHT+IFj4eYCHjnDTY78qqXAXzFjDOGfRWJ8FzD3bwljbRSaDt9DxqaN4Q0Zg0pQMA4iTkvLUZBi27kxn8VVOeQs6UU=
X-Received: from plek19.prod.google.com ([2002:a17:903:4513:b0:268:c82:4230])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f607:b0:295:94e1:91da with SMTP id d9443c01a7336-29b5b0f8119mr52722365ad.33.1763664171869;
 Thu, 20 Nov 2025 10:42:51 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:29 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-2-willmcvicker@google.com>
Subject: [PATCH v6 1/6] ARM: make register_current_timer_delay() accessible
 after init
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
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
2.52.0.rc2.455.g230fcf2819-goog

