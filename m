Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5CC2EA16A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443462; cv=none; b=tDWe28sadBU1yWilr1DrQj30xtQZY7VPfCj+zCy+ifv1tq0vY5K2CFDBJ/+5egig+oFeCPS+yQflZtl/9ssBmexdiw0h0EFde7W8bfWMz5mv70x3TJTsFs3pzbbK/EvANRJucw1vUWvDXfCoUVb2vYEcE45oCYjh3twFXKxlYhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443462; c=relaxed/simple;
	bh=YiB0G6F8wy6l7JvT/ZZMMGcgJTsPVM5/IR5furyk19s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T8o1oy2r+LRYF9Nt5shnYdbdr1B2+R+QDwsWvFLE3IMBGvqbwIiQPXFIRTJyg7CFVDXYT2MnWKfQlJrsHINYE2oAbwJFgV7gAbMxwlCwu97eEF44b1xpZM4lOMlypBGReM7CblXNHKC9gzICWkBd6U91Le/aiaGhBNKerj0Uk4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kEZF0ghV; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kEZF0ghV"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7491423658cso569521b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2025 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443460; x=1751048260; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIV2B0fUwqK8CLLa1kWwxVC8BX5dJhCy6gXrqz6FTh0=;
        b=kEZF0ghVDfUQitDq23CzPHJ6pLGeasp65ZfPJQwQHE3th09nB8I6Ai2cIzZvv6Y4HK
         8cM0gbuYCdakgx2OiwaAcGC6AKMLUNTLqgJp06JMhstPFvOHvJC46uUESDLQKOyvEQTp
         VmF1q+9fuQWtRPV4nLqbGgLnXz8xwdgr33HUa7JnM/msd7j3aHFVVADhSguOS2e+vCAl
         v6qhN7sZMdqVHgiBQ99BfsR0Um88hxJB+/xZGFSKwjxreLaD5k/ImFHpGJQ+Nd2pf5CF
         Y5qHa3mNU1/lZz/zmqpJ9A2z+HAseO4H2C+LVe3Wwh+t6nX5fERwZDnlMzF7zEn6Zy7Z
         0NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443460; x=1751048260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VIV2B0fUwqK8CLLa1kWwxVC8BX5dJhCy6gXrqz6FTh0=;
        b=OYmRGFdolzOBc3Itm9IOqACUaCqE5CJS1FTDA3/YjIqoOFld/NslKKNEErnbn0TzRz
         Q42bsXLv2De/8jzLawh1UcqMD7QhKLSNFk6vI5ksDbnyiq36mdz9njWWQCPTkwOr7s0I
         EUmuTeB4721nJ5HoNn7cGQqPuHsC0EbtOlbrSi+GuqhJOBTAf5M6BmbS1O4+4WnzmfW/
         BKjM27QV14kevmz8Wmt4IOdFTLmZJTKnqnJVkmoo7K7BH8sKIphKOTfSNUyVHPhfR+8E
         CNQxuphkblhLqr05XwByhxA9jJHDP5rQ2NnCWKvsB+WbEMXZi2BuBxiGW3LMpZdPy6gR
         iITw==
X-Forwarded-Encrypted: i=1; AJvYcCV4pOvCJgyVl4MdoO8UjHEA67Jjr2E7cqLCTY1SAxvENprm+M91iQ/jSyUtqCEOI8BUvz4OTqx2zFj9UMS//CsVEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0cqEdIudTYK6hd64VYK6kLwPjMogDgxuzTM8YvAl4GsRhcRSE
	Ni5q0uTaSWll5ZU8Yhah69S1bZ8NKQBkjWDXyfQWD1ScV+QfW9DWdbaUOuVQ2VHCRurxLGZJ7or
	xQ8p0Wru7IaW7UJJ0v0aS9K1ujRXDLQ==
X-Google-Smtp-Source: AGHT+IER+5ubUXb+yU0g6Y0g4aUyAkU4ur+g2SnRAtI7gYMUtRakP+WKgzwI5sAh2R7yuuPE5LK9mNIpkJ/4UWR5zIg=
X-Received: from pgww8.prod.google.com ([2002:a05:6a02:2c88:b0:b2c:4548:13d0])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:920e:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-22026fe7f17mr6330358637.38.1750443460127;
 Fri, 20 Jun 2025 11:17:40 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:04 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-2-willmcvicker@google.com>
Subject: [PATCH v4 1/6] of/irq: Export of_irq_count for modules
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

