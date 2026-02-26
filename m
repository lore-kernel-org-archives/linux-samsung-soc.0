Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878C63AE6F8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120840; cv=none; b=oDpAMLwJTFhofr0EObDrusbmKu4aBTkSiT1j92D2YL0GICFKuggBDNfQKj2pNWm1D/OcON8UX6huF/sNykEADknnvi4iLyZisfAIkYqSoAE0StnK5yGocU2czeirBzs9Tze4mA/WBwNh72dLOjEVc4Egza8s2T/R1hfS9aIgMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120840; c=relaxed/simple;
	bh=Qm9tTA61Ww9MqAMv3+0Yi00nEvS8JCqJXhVchUlKYn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjrGN0Iioy/N7vqvx5fjcgaZjwaPaCcZQ0ypdqoVuxk76dyruKyLaAREITiUC2bt2JizQzwf95PZlTEeH8tAqEp2M4BmbOImMiFkh3p1G4B/42P2VcfoeUUK+W+UEU4cTBOjBCSWGW0JFa/2rvBoc6HOBTEqmL5BUOPuHdojg1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNugA4BF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNugA4BF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso9185865e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120832; x=1772725632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmmAx1S14LmDHsFx+ndwJCjg5ME4U7XjD590Zfkzuzg=;
        b=kNugA4BFt7lb8qhluU1N7NNJTDeSrvdYB0/ea0Xltb4aWj/jTXK4HhIiY+jtmKHGis
         mP1JKxX1Fe5Q+RkWAANmtgbgR3z2DOdIIQJQjOWOqTqkz/hjAx1iH7aCmRuGum5PzDrE
         yvt0ZfmmW+ONpbOReWNCTRVhIEYIX4JFvoeY3tE94jgPj+xm/+GJYphzxk6IyXVXjk9v
         f51K9Nq6dB6X2rIbxryikxfJRiGHzRIG4Avr9TGic6nEsD07AWlee1YNFBHdGu2eV4FV
         v6gVQJFOq+alQbene0ZeIHWlssFIdgxGPO1rRjrO3K5yuNyp6kHhsNZOFkgPqqGNUrUL
         Azew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120832; x=1772725632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmmAx1S14LmDHsFx+ndwJCjg5ME4U7XjD590Zfkzuzg=;
        b=WQ4r+iHXnQEKxbBV0ww91HgXj7m9orcIsEWvmLd7JSxK5hMavw/mVgdZX8NF721CV6
         1h8ybxDe3DsJxqbwIbmz/v3EgH+7hXkp0dMgau82VDiyo8CIXD2pOoxog6t2iVhMbb1p
         kje+GF4t7U0pU8Vy+6e9Rp85RUhFIK2TNUu4QoeWz+h1ep39+w1ygweqNgxb+lcN6mQc
         msgb097l5/74NE6WJ7Hd3TK/kqn2hgTYWqkoTou+Rj4FmbP0w6S6Lu2q5q4i34Rw3W3/
         l7vQbWAuLz8F6f690GvQTD+8oZWUqwbGUUJmoR0ZmFILkLEaj/GGP6+TLp7TACWineRh
         rA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFD+bZM0pDnVWRzTBSqTHuugb9pDLhFA/zkPrbtGht+6Uh21QLnIMiRnOw2FgSUbv32ASSxsO+Ue8Y0GkHXW5NNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRj9NBuEuwKyUR9hhyxedRkgrc5MIZhCShw9TOnHuvaA+LBe7f
	Sb6BIIUv5Dyt0yOmDegDp4CEKHJJ0HThSeNaYW7Ps78QPh3oqC0Q7WJAvpqsPcuP1Lg=
X-Gm-Gg: ATEYQzzRnjYR4mZI3pzxTRWbyEoiekxtE0MkGVVQgoJ2Zt1Dld73hZze24t1KOL4IHq
	d2bT1YCq5oh0TrB8eSnszvXd0MAy+R6nFrPq5p2Wmi77/qDVoCoH6AAqW2p0K19pJ8ws62n2a4f
	ztd6iFK6Lb/JAv+FrAIlXqpvuS8UANYOKaEaKiXIRT9YlUEv7QTeWRPPy2L3vORJIeeVDu/Pb+M
	umGOFQTGLcaTCBljgsj9cU9jc4RHqPWeN7RpTq/ZZ1Va6DyEahnsUVxJsKre6l00vJ2yGLdxZ9A
	MQy5PmhG328aBgBfO6r+DU3Fo1mhfLPjTiU0kWKckPpGe9yvJQL3GwS9Ve9nFZ+wMSPmxAhUBUA
	lB51QSmuKJVCwwL1mdYD3X6OypNZmJav62XXRaaq2Ncy1c7nTOpV8VmUE3XSrqOBtAMGPbBdOUz
	yMcaSotdnQvA5N95VHPNq62udbs5mglA7u/szdcf4tSG35+DDTH8kq9uYnMU+0umzO5eL+7YvYk
	4DCGy9J1ABTBBs=
X-Received: by 2002:a05:600c:3b0a:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-483a963df7amr351710945e9.33.1772120831805;
        Thu, 26 Feb 2026 07:47:11 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:11 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:08 +0000
Subject: [PATCH RFC 2/8] dt-bindings: soc: samsung: exynos850-pmu-intr-gen:
 add Exynos850 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-2-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add samsung,exynos850-pmu-intr-gen compatible to the bindings
documentation. PMU interrupts generator block support is
required to enable power management related functionality
like CPU hotplug, sleep states, etc.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index f9b40f3fd165..df23467d0e0e 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -15,7 +15,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: google,gs101-pmu-intr-gen
+      - enum:
+          - google,gs101-pmu-intr-gen
+          - samsung,exynos850-pmu-intr-gen
       - const: syscon
 
   reg:

-- 
2.51.0

