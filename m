Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1D94D8DAC
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 17:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026781; cv=none; b=I0b1I3MmdkYRXneV1v4xvjtYcJevRf1AjQucYuiFtq97Nr+63kgTCFyT21HHt+rku8D8CKjPGZOffcxr+sUUdwtjSidu/RwftgNaO0iQqktXEaXbAsPFoyXQ7JKwMMJmSVe7KMtHt0PLDA7treeTo109mMxDKZQ9bRgzFpUtKIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026781; c=relaxed/simple;
	bh=2Hl09FruWGr6pjACeuq5DjMb5si4CPaD6fjJlZmzP28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AxySK/zTE5Z7xTnXmOcxmD/9DsiYs5Td0QL0HH3fpotcOIype9oDXEGFsuR6a6LANhB+nccHb1A9nohHVLCkw/BpfcGOQmG9bGeCdIOQMFzNUGbS4oalkixTJCPFMxUkrcRXHlMzr9vobGNMgOxhuEqxKk0SJ+MWN2SYETGS3GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZchO2r36; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZchO2r36"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso46345815e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026777; x=1781631577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=ZchO2r36Lyrt8dS0ugE1SecmWTalo9zuAfM8aXyKjyNbrF3PLXucX3IBxxUTBAAFoY
         8oGLPCfiFnpv6Fq3hj5YjPnr4Rp0NbktqduzhxBwBR8R2ogOKSWwmArS5pNfGXXccHxv
         0nIIuhmuvMIv5ncH2wHzdIW7v2+FjlFzmIkVfrS79EEF0r4CFhgjbaYy/A2t8JIXKVs7
         26l1DI/DZgCnfuS8cNICTjEEQywiSFcbjh3nweCQBdR06Q6oLaz9jDf+yQo0ksCuKFcO
         4UsariVjPMV/a8fOuzwRVePLXn4ozO0c0GD2gB1cin1BQVx0C5jRPazvio+gZ0ntRAg0
         Wvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026777; x=1781631577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=ONHOTc9cF0u2som42WDBa39FIGLBqToJwzR22HBUjAYYDWYE9nh5ywjWqH/v/GMHo9
         xDxewPHrwJPii6TbqrfNb810Bg0DvLjJ6HG2Mrzmp9k+a/FUiJgVo+GBBxKCiH51E4Pm
         y6ncZx66EAh7HFagnpIwOAnrMF9ozdqL5pERpz4X/KQDaaLJFpfzKpLeL1FMh7MIR8+i
         ScQYWyHA90xrnV2JuV+36l0qrDUVgJtjyk0Qx3MKSgUb5ZP4/hS7s3GRSxCHH+gVaw5o
         bz6/ttMDPZwg5JxGdlSdEqK6LA8U4z3NX5nVNEg3mN8xfIS1xymdlKO2E2JfX3/SQdCN
         jQGg==
X-Gm-Message-State: AOJu0YxT6Bq1W/HUxh3vTWa1EYvnoX6SY6P8P0ql6ozmdOtwtudqlxta
	oU/GH+COr/UTgDRBOolJbEYzu1EpR6/lnDFsfpVb4IfgHZlVjA3wN7edsG6CyKhZgmatHOGe18+
	6sIcSrzg=
X-Gm-Gg: Acq92OFUjFmL37ABMOdG+8Ba8gAYfP4dStHycuJqiXCAMnw2GBMuTD7h4UphAUeOfUp
	CWBamy0nLNmO8azXRbGlI9oxadlfSKAmFrvr6yRHQJ/P/Du5W/dB5fxJRsMmAmS8KxgbyxKum8K
	7i1yqgmZWs3eGpD4KIlxECj+a0h/rjZc5su7D8DvBXndgt1esOwXxDMEFzGK5vnRoawOq32Kz28
	5qs7/4RvKRUfF7yxGTFpB5ZEQXPpMsCnE2/P6xJiPOJlv039c+2WK2qJXW1Rf65wBaaIc6Q7bEo
	FFZKJeQpIWXY1C8PP+s6qZZ5nz8XdN8mcpvUMu6fbaub5H9E+AftjnbfzEhk/NcAZ+P11ViTlnh
	reeRszszYKaXQ1xdxuA6p6xqTABvPRWDPTgxXrViLESd1Ku2tcIY1Nr8kCUq770Ogm8qvGkM2f1
	X62UtDyIYbcW1hxixZoi1DxjA/3t98uSZbGkFkklLaTH1v6U1sovrEhm5zFrbFuXOhzv5n3GHOg
	T3Kk9r/5g1CTjwLSZrSZG2KiPY9q5lAbCI/8w==
X-Received: by 2002:a05:600c:1c29:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490c2ceb6f6mr309457655e9.8.1781026777516;
        Tue, 09 Jun 2026 10:39:37 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:37 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:27 +0100
Subject: [PATCH v5 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-5-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 498ca30a00c5..60c25fed8ffa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23645,6 +23645,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0

