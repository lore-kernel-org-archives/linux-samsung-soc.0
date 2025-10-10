Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF996846F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760077745; cv=none; b=JyJRxV/WYUZyy5Bs+4GYK+luEqF9W2WBay+Bc2AfjinsSyobIwYFj2zZYZsf1yz9TLWpL28DIjpdjJnGtcfvyTlrDbFABm/6Bb+KwTe8zJnfa9XZFzxG4b4xbGi5GXwbrBvWBG4CP9C+KsuQGHf5NH3fZUakwmeG4Yr73Wc3nu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760077745; c=relaxed/simple;
	bh=kySh9NG87grNL5z+EmRBxiIrYlsYRYH05crLoGgqga8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rN+VE3c3TjdGbU5nhuDLzF3yGy9I0oNs1aVQ91hM2uYfnL6UvIfuMTEHZwGJhns0YWFrB/I8E3zlD9hM/BmidO+Ta0xebGAyvQ+mRJBocBIBeCUFSDrpJEr8Oc/RU2h6AoV4bZmTTZarcsUZCc9dmkbE6jDQ+QVSOfMaijxc9xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GMdUieqE; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMdUieqE"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b40f11a1027so302893366b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 23:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760077742; x=1760682542; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yUUNHiuEgnPPKqI5m8ivJnCwrgRBbv9ROPeU9S0a/7A=;
        b=GMdUieqE6ytVvIchw5Ewx+ve4tEvbh+tFNVxNRXhWkssapGHM/QtC2DZ+B8od9jmrl
         HodTpAKN715Kd3bAUXSxSnn6xoDE7r7nfkH/bg9dBVxOqEgnP2Vlt26smFmh5zzRHb2h
         nEf6J9O5Y1G+NcdzOCW6XGmVI0YG3vOFMoEjHYkehycEz0JIo3HzfziIQvEpRU1I53Dp
         0r564twa5Uh2KSxw4EWlJmtTgJmCk5eZEZYnZDimGd/VXAXjnJ8ph2INRYUDZXyZC2og
         44ur0uzB9Pd+LjlQSuHqHzJOWrJM62K/nCFUnw4hfdWMaiufx1OLy8xtVbPFvvbtYaOT
         Guyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760077742; x=1760682542;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUUNHiuEgnPPKqI5m8ivJnCwrgRBbv9ROPeU9S0a/7A=;
        b=IdW/2bLlDYfwRHLdKwTcylM3W0fjseGoBHjTMpHw/DlWJYMhEfFo8LUiAsCZM3HqN8
         gKRvYUID5OEbOFA9xp6kW9wWvQlOBMe8hSCrUMUzcNsFgx0Ehm2OHpJF0//WneU8OZ8n
         H0r90FFP51OS3+ZpmxT4iUv79K9OoYtnVNmnAe4NwhYGZUo62Nt1jtLbopeNgt7hyGn6
         5U6laqoHXEWijQKws1T2EAxpfr0r00pnOa00rdsNJlCgolbjKxdN10Sq+gUK5HlH6R8d
         vh5x00IYO7Jm84hxdgbR3wOMZN6/v/NiNlkHDVX52P1gREJAKjMrubA00sLS9s79azSA
         OYWA==
X-Forwarded-Encrypted: i=1; AJvYcCUvA0U0d9joQZE3K6rRPtQ5a1pfIViSLn2HRHXFxPj/kceXfIUADPA+zWEzBB66mxhXgToKpBk4FXS4jjTlGRktbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRV7IWv1+QeYcKd2a9S4bcEoBvd1xN9oU+Tss7nvnr5vSbN//m
	2EBRiH1usZKwXMoHrsBHY232V2Y9Layeg53v+sIh5id9r6K9mjJvjxts7nHu6I93qXk=
X-Gm-Gg: ASbGnctFUyMpwnxqYHCxGuJLLNZ2YT2kR8N6Keth7rCeaEL2k7gAPIxwvrXxO0sgdDs
	9J9siy4hxRm7YFOpwnEWsNKbJ1cMnYMUPCwYjjZ7GDZqRtQxoll8tzD3DZbzqURF0nxR3ncr0Xa
	0GoDwKcQAaTi3jGYXfmzemr4wCoMHkgID9Hkntw5pPIXTIIz3OYL1QX6iCU3SLa11xkffsT8XNy
	psXr27xUe9pwCga1fap6Co4QGY7x6JeZOrAkU56O2ROi8Lkus6kz4gmTrPUy7amx1fL3eEcGiKU
	h3qZtRB3MjUw581v4T7huAnYpc++C4l5PdXIy9TMAtuWN5SJXMonm8a6jWzABavxp7F2H2DMSPE
	I0RBHcxnwtIJ8o33G7eZQY9XcixCpqnYlGjJ5zpFhknX925g1TdTeGBmD4QecebIC+Zlms1BpBt
	VU7CAlO07KYvrAuWFo9MzAgl3+mYZSgw3EWrVSSapBj0lW5Q==
X-Google-Smtp-Source: AGHT+IEn4M2YqhFbmRC2ndhdI24yjeQJVlUILDD3ySBiu6pkd6BQr4bN8V7llojmXDE9gUYXL+O6Dw==
X-Received: by 2002:a17:907:86aa:b0:b3d:73e1:d810 with SMTP id a640c23a62f3a-b50ac4da07bmr1000402066b.49.1760077742044;
        Thu, 09 Oct 2025 23:29:02 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d2a76499sm160895566b.0.2025.10.09.23.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 23:29:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 10 Oct 2025 07:29:01 +0100
Subject: [PATCH v2] dt-bindings: soc: samsung: exynos-sysreg: add
 power-domains
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251010-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v2-1-552f5787a3f3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKyn6GgC/52OQQ6CMBBFr0K6dgytIOLKexgWpR3LJNKSDiKEc
 HcriRdw+d7iv78KxkjI4pqtIuJETMEnUIdMmE57h0A2sVC5KmWeVzCEN0awodfkGewILXlL3jF
 wMMC655d3gPPiQ1ILR3RQWnsq6lqqNjciLQ8RHzTv1XuTuCMeQ1z2E5P82l/v8ldvkiBBt4U0p
 awsmvPtSV7HcAzRiWbbtg8bw49M9wAAAA==
X-Change-ID: 20251007-power-domains-dt-bindings-soc-samsung-exynos-sysreg-5dd349912b0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On gs101 only, sysreg can be part of a power domain, so we need to
allow the relevant property 'power-domains' for the relevant
compatibles google,gs101-*-sysreg.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- limit to gs101 only (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251008-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v1-1-ab41c517dec6@linaro.org
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..62bce63a1557cf425a651de8864f350b0c46b1ad 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -73,6 +73,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -100,6 +103,16 @@ allOf:
       properties:
         clocks: false
 
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              pattern: "^google,gs101-[^-]+-sysreg$"
+    then:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-dt-bindings-soc-samsung-exynos-sysreg-5dd349912b0c

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

