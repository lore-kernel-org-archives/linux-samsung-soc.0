Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE781F611
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 22:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705964252; cv=none; b=iiZJAzTEtHOL/zBvsjoTOP2XhBH0XyJcwHkQnmdF8gRbku3jacIbR7KeXFsd/2HFjvzi7qTmWtWnRfh3z7SJYs6pMS0i3MZTZ34dlqMu2kSPTwvaIyKWm2iDW1seF4MybYsqP0ziEIQVaHsalFPFRx8yDNJtGrjKoBxhRG86iGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705964252; c=relaxed/simple;
	bh=ADcQXaAoCN3feVEUxUAN7RPLnjxcu0Da4xFhPbbzd5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOJVaEydoJ2UYvIlblxaWy1Vp7sKjx+amORNaCCbjbpnbc9Kjv/YEu/6Pa3WH9pbAuxZj/HWiIrFt9yx1iH+HoHhP2+/j7DrddfPWth5kmAFjmnrlDVbNa5E5L9MavqrsKIm5LUlgD/vP2gJ1sZtDPLMjPMi5TPfv11e4gp42XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+rueY/u; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+rueY/u"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40eb033c192so6977695e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 14:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705964247; x=1706569047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBly9XkHZ0SVFvJINs6dkm8lumCZ4YgOwJi4aC1YyJM=;
        b=U+rueY/ums3yLa+tPEPHkPAH413XgjgrkNiM90wko/POsOVn897uZzu6UmuieY6ZNH
         moSQzOKLGVx8RFDIj9qzOvIU/GhNCPuhG9ZK6QJd8/SZn6rGl5Nj2/ciyDCZFdcO7e7C
         GHtCWLm66ybuQKe9Cpn/L0NaKRM6q8eWQhJsLR3a52i5Ppm7HzklHHM9sEGPAr42pamZ
         DCSWKBfVT+OGseYwtMR3mh1GYRl+tWUJs2tEIPeX85z3/RUDY/VzeTh/td3LW2tHH1tY
         bw8yTpAhQAOn9KedVyX1fWVYvP+8MR9Fhw6GN0TzJUGAZIzqatAHVK3aNI1XAPZTzjbc
         Zaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705964247; x=1706569047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBly9XkHZ0SVFvJINs6dkm8lumCZ4YgOwJi4aC1YyJM=;
        b=qFus4dNfrZ1wwRRfL2TfLdWnXUreh13Z0eUoxqHVyPcjXqxAFEek3gM5PtSNCTOKlY
         jhBDZ2vcIjPiGUoJXHCwu99ni5Mj4tl8qfWoydj3+9Ki5mU4mn8toxnIBN/cU6l0VGqq
         tcnTeQwh4KkhjIAxcM4uKBUpBRnM9Dz6EzhohdoWZlkbo5DnsqUCDpanE8ZqdBQ/DA/O
         rpPoBDJoR8btaTU5dAgFKZkQPP3x2uHlqdR/8vuBm0N+nTLZ/pCu8s/gnkbrWXd6V3Pi
         E3E/Xy84SV6waUN+UpMHKNPMz/UY/0BOCCzSpV9uX5UrEdVJPH84y82Rl7CyXCzBYOwR
         0Vzg==
X-Gm-Message-State: AOJu0YyKbrq38Xr5wIm67+QQ8pDi85gL5w4OCB3EWyDvsI788Jg91yj2
	KhAc0wvUYavOd/DVRiJvd3tzelf8JPU+JdpWV6qczkVtADAC3IgctwnZzaTPy9g=
X-Google-Smtp-Source: AGHT+IGsC8TYulGe/aeYf5Jm4N+xn/nAtZGRWcp3Eljm49ls5iykYPcGcShpWbH/uU3Qy1q7Jmq4Bw==
X-Received: by 2002:a05:600c:45cc:b0:40e:a565:3ce2 with SMTP id s12-20020a05600c45cc00b0040ea5653ce2mr2204825wmo.73.1705964247305;
        Mon, 22 Jan 2024 14:57:27 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-76-30.as13285.net. [92.18.76.30])
        by smtp.gmail.com with ESMTPSA id fa26-20020a05600c519a00b0040e89ff10f5sm19776847wmb.1.2024.01.22.14.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:57:26 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	chanho61.park@samsung.com,
	semen.protsenko@linaro.org
Cc: kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/9] dt-bindings: watchdog: samsung-wdt: deprecate samsung,syscon-phandle
Date: Mon, 22 Jan 2024 22:57:02 +0000
Message-ID: <20240122225710.1952066-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240122225710.1952066-1-peter.griffin@linaro.org>
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The watchdog driver no longer requires a phandle to obtain a regmap
to the PMU registers. So mark this as deprecated.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 77a5ddd0426e..3970d6bf8576 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -56,6 +56,7 @@ properties:
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
       Exynos5420, Exynos7, Exynos850 and gs101).
+    deprecated: true
 
 required:
   - compatible
@@ -66,20 +67,6 @@ required:
 
 allOf:
   - $ref: watchdog.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - google,gs101-wdt
-              - samsung,exynos5250-wdt
-              - samsung,exynos5420-wdt
-              - samsung,exynos7-wdt
-              - samsung,exynos850-wdt
-              - samsung,exynosautov9-wdt
-    then:
-      required:
-        - samsung,syscon-phandle
   - if:
       properties:
         compatible:
-- 
2.43.0.429.g432eaa2c6b-goog

