Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43EA35A925
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824541; cv=none; b=fz34z6YVKPGuJOTh+3Y1xDsCrr7kCTAAeE/76h7K4M/JTi05rQ3Z2eXbFEQFNjotFecjSnVX08tbxVDLeFFZL5p+bWGyAD4gikvk1/lmJm/RysMVEJp8+Q7i0lNde/iOWMWj9dzAFUpSglTfZrlDyFjI4UBdOgpgHdgNm5bVX1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824541; c=relaxed/simple;
	bh=7HVJFrG3U/QwDFKx95QyYbsMuRfAm1hbMd+GcbM229I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFrm+VxTp6eJog5FL3s7cSBQ3skSP4AHMFw3+RvOR83QVWR0fY6O0TR33lOsefVgzAtC9C0bDqb2/aibYwCEnr/49pqilxxmdBfdUzgBaLJAreUhlIAuTE6dEryczFrjldsSV3eFJ4dO1hiSG1b1xJhJapq4sMYgw8k4gPBmN4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQzwqJnq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQzwqJnq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432d2670932so3377447f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 04:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768824537; x=1769429337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDx8GJwGFtxKfvZU7MLXX1ujE0p+LvEQKHj4ysnyPoQ=;
        b=xQzwqJnqQ9rESYuM6yz0wi16zF+AOWzQ/9ioAwCrKB+FNjAvPAcoTW8DBJWMOsQG73
         M8SSGiF5rsY2DwzGJAEfb19OsltfuMwQf4xbG4+CHjuXfsXQtyq+Z8zUpMith6UZT2j6
         +Qo1OIsiUIjlmX7pqMT9ZvgDi8xr50Emu9lnR+sneekg3amiQg8W6NEPHpU7eT7u4P5I
         xjWw3gOEasYumxiXnz7dave6/yI4j52BgUEs4H41GaQRdG2rdg7sJOKoahbZj/k4vr+F
         NLhgifc7oeOg0QMCxwLu4Q7jqC7kJ0NDpQNflmrYdQC4HyDsZadLN82BF0+K1OOT/T2A
         LY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824537; x=1769429337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uDx8GJwGFtxKfvZU7MLXX1ujE0p+LvEQKHj4ysnyPoQ=;
        b=Ew1SGn0tOASJlS17gjZIHeMnJ6kkePWG20u0sLkIPJAzBTejktCGjSzl9ByZ6YL7eF
         8FqCBIpocOcifFue1AIc5MCw2L2lZXPsp8qvv6ittICHi7Fs6zol7A/Yi5CFR5RBpKL+
         Q2ylJzx0tjkxUYk7ZZayInnmrIgguaWoQOzuyf3ErhN4BEvgXBx+mIk/OnZWm7w9snqV
         djNHAKjXWMU1s6KhY4FOWPOBpGW3D0s1KbmXtWakSE1xuxKDOaQMQ+/jMIutjil5fdC8
         uSKoT6MZHvztVyI96zqPq7MYQuAPmdOyW7PurYVT/vHaaVtYxySziPQMkCRtqim3V5sd
         ZuaA==
X-Forwarded-Encrypted: i=1; AJvYcCVq06D6oHj2eM7XZsxP2zV/v3TgV6rgck0qClZlbwvtngvkMw00UX8uFPBsFFmhcKY7r/WsIlUV+VdlA0LEq8xSBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLD4ViJJQHFIDR/x+6671/BR0lcniRM06U/MqSVHQ7+/ZD3TQn
	E/Vi/Ef+eR2+yg5GhTjbuZ63+fxIVdnCOl1aAX3LSfPbG8KPRPPFPbFf90syrwKsgSA=
X-Gm-Gg: AZuq6aI5LQauCs298SWib+Q2lP0wFUlWf+MsORnD5jmS0657/sSyRodmPBXZkz7tXSb
	e/o4IaDAeRXitcCEIFSlxRoh0XptQ9OcKZgq+ttxDLkX/b5WSjh3EMCFmhPHaMwW1QHVxL8hmJi
	p1lDWGu6XtqojfgUFRDROY6pQHVipVC/zrdXUUCb4yk3f7OIdfw/9+Y4BbXXaK37nVZ0Yhymkh8
	HzKekorCEMKjeWn4e1tMObDIFNyVNBrHLy+nfJIn7QSG13WDJthJy2FP395xqmJe6hyTZPrc61f
	jutonrgGaSVugLosVXx87+mKXk+OI5HdKSWeJNt1az4amYZrbK4Lm/no20TL+6/NlsX8oyjrbaB
	uAHBqlWMOOLdqwu5jFZyynHK/PKq9zlQsZKG04S4H3BZdsSufOAir5wpwgXxaP8ePf4k2uX+b2p
	d4t+G8DorUpgG2hhpGbrvg/RB4Xsd4lcsh6G0aKM/KUiFoZk2EmXFlr2UMb6JwM5+aZM11Cg==
X-Received: by 2002:a05:6000:40e0:b0:431:2ff:1289 with SMTP id ffacd0b85a97d-43569998e7emr13611166f8f.16.1768824537135;
        Mon, 19 Jan 2026 04:08:57 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm20698421f8f.30.2026.01.19.04.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:08:56 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 19 Jan 2026 12:08:51 +0000
Subject: [PATCH v2 5/7] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-acpm-tmu-v2-5-e02a834f04c6@linaro.org>
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768824532; l=971;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7HVJFrG3U/QwDFKx95QyYbsMuRfAm1hbMd+GcbM229I=;
 b=TlBEnMuauOll69kA3Iht1mp8Vn36O+nZ27Yqrrl+ucAF9TVN0wbdHvi0EFHd/dHU17mHdXaSU
 xi2wLoqH9f+D/9H1BB1EA+6a5jaXfj1M4JXToWWKa7JZ7HltBPIb1du
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de1e9e43f63787578edd8c429ca39..ab44f2de8e8e03ad9bb022ebdf1b6c0058fb0425 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23171,6 +23171,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.52.0.457.g6b5491de43-goog

