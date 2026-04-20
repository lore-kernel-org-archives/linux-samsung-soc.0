Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733E3A7839
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Apr 2026 17:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706818; cv=none; b=X9UrNGxPtn/j37qP5ITD84nOOENssTYV8OYeSWWNYi9euJpmh3VDGH0Nhx4mGi98gYi2b9kIGhDcm7SUZCICSgDtYDhRdylzSGzJGi2ys0+9eopY1gyEewoWuPMKYhY7bppPi/eXGIwn0ZXBH8pGmtOShmVCVr//fSQxDNcxflo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706818; c=relaxed/simple;
	bh=utGmC6SX1f1tsmdJMtEQdtOxlDLzgsEsYQAYl4X2W/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbwlvBdrJcFLM5qQy4zlsLhsPH2IOmze7pkHZALgmzMiWf50iKEIHY+IYymtN5EDWTxl98XMBXj9Rhab4eZUhNg+icYRquuv9rhpzz6T9baf1RGJuvlN/bmSjaL8mxwQyk73Z6h4SXxmC7oNWe5g1QVTdGWQ1DM7Z41BZoGl7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sDnjBrPB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDnjBrPB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so51848355e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Apr 2026 10:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706811; x=1777311611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=majqoFYlSL/xq0vEC9MR4HUJoBMpHEo2idjyzWrGGo4=;
        b=sDnjBrPB/7kBQUTlQHDyyMfhRibaGFCdQDG1TqlPH7QPloyKH/5o28pLAncaD5/zOy
         Vdw3QuwL4ht704Vh8XhjBdEgAoR1B/UopTGLC44rWAUSi8MPLwuxBYNNiI9qMzS8EB5U
         1VCNhIyUeJwy8d3wRAXeZmI2tAU9jst1uRDcWtTW5o6d65KaHFMZomtKMXcsPgl+Wn3u
         FT5EkZNr7J+4H4yT7onza0IUVPFiEDuQaTC9UeANDutohl3Vhj0ksv+N98B36CbrVTOs
         MhssuUb3gjcb689XNsYf5+8WSt8/6RndynAYKMsHs/e0UXwkzgr4PT8mDwK9QbpvP9Gj
         zMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706811; x=1777311611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=majqoFYlSL/xq0vEC9MR4HUJoBMpHEo2idjyzWrGGo4=;
        b=sviEF4uwqjvcPr4CNlsnkdAWbHU6DTKmjjSgG/udXYGUW+Zq+S0L4QVA08GbRzVNVt
         BEYQ1bzpRaY+XDuagDs/lFXapwM61R+g3EH4jcy4G1a7v8ixGiqKLKHUs0DllQ3dn6fB
         fOSkkIq6Oj/YWsUhCP05wVUpK4k4gPeI/JddBWd1bfhvmRQdn6y2xB9tntbODeL0WPbT
         neD7e8s+6rnQsYgm5tw8pSzfLGDgs46qfCbv1aY0wpO41q3+g+6fntzRwxnuwWX6AvPD
         yw6tIUqKiPbt1XYkAn9oACdsW3klyGXaxAq+MCt8e1efwsgrUzV2D3TQvb0B2kvPJ6YS
         eVkg==
X-Forwarded-Encrypted: i=1; AFNElJ9L2RLi3EHC+bVuWlzpXEa46FqDXQQ6xzUfgMMPsSB6BoSdyg1rloHkV3kq3VpoCdxy7QpmqWslX9HTCBW2osz0LA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6nCg6dk9d6bq/kd1aZHR66v1RnFPqO/TJFUeSpBhYcqMeZ/e6
	3pmHPDa1HSShUeAp6RChav6JRh9J7N0qd4C8EFlFRgTdHmsp/QVg+EcJzYla36JYJyc=
X-Gm-Gg: AeBDieswbyMefZS9CU1kKwverq1oM7ysWJvRILOQEBAP1zjvb7v9q7HG7oVjHiFbOsm
	d+LNZdTKsFDqryrXQeGWjYtFQL47X3D96vPxVNNvhlWMlF2CG5+jWTiJQV32oIw6uONRWTeFHQs
	s3vAwhsGS4qO9/DHAXaWEUWSOMzOL+CP69YThCpVkbp76c7u2dXuBHDoZTSWKdPd3ckPzrGzqC+
	0GkQxU5S5UUeTAkGmr7R+pYbhWmu0rRX2vYSx49jjrVY111di9BL7B4UH3DM5fKRutVIGUGMqMQ
	U0gIsGlsJKEXHQH5P66bZ3k7wbHzJQDdvErhbXqpHFkX+CyrydfPBx7NmEv6lE+PvHDLk9XGaK6
	O0AaUCZj6PPJ/e/ZB0Pl+vDf2QEXw3dLxRT/1cGGo8T4SBZIkkkaymW+9QNwbcSNsaXIgOhc+e4
	XkDbgkpoAuPEE9xKWZAZaIeKzucijGCOSSPlcRd/BsiKLAvXVUQAd6L5XFeI4lYgVMYrgXP7Ri0
	G0oHOtCE/K7ZRGEdw==
X-Received: by 2002:a05:600c:4f13:b0:489:1a65:dd6e with SMTP id 5b1f17b1804b1-4891a65de3emr95027985e9.8.1776706810700;
        Mon, 20 Apr 2026 10:40:10 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:10 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:54 +0000
Subject: [PATCH v3 08/10] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-8-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=992;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=utGmC6SX1f1tsmdJMtEQdtOxlDLzgsEsYQAYl4X2W/0=;
 b=ksF38PEKxEj8F8BXFtqnkVgT2aWgmm/cCh2qiLZZuahhGr02+y1RNkzFa4rchgDi3llZx0f89
 UBd/cw0V2JDB3Hr3mS1DuYCTqeAFm4+ZK/GDr40q1GekCyBRI6bSKdj
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 76d8291237be..fa67f6f449a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23676,6 +23676,14 @@ F:	drivers/clk/samsung/clk-acpm.c
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
2.54.0.rc1.555.g9c883467ad-goog

