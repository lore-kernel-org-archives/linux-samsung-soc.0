Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34DD423A87
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120838; cv=none; b=ePKDznPYjLIkSdd05vG28hNGs7MYzz/UuGdlKDvi2u5nb3xJL+M1GNwnwzqAk9iBM8Bt9h3/3A7r9wpdHb4L0Na2IqVzbZw6OvKKgiVWZ8fprn18gRqPgedgP949pYIDnXY+z+WzmIDmgKUmUaxlZYOQE9VCqujVNb3OHc+npZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120838; c=relaxed/simple;
	bh=KI8zS0eSrNW0sDC1Q5BeDySFx6bb4+/qC2XzzBPNrd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lakSaclFCwRsB/jqKcKx+qcywMAlGAVJMyeUpZS6cKGR8+V5Id2CpCIRXNhry7UVJc5JtlLsE44nH+2RqL2igPR7ef3P+EYhavJoaYvihUToDULqjO8026y01mJjaoTvSugpO6luLymHP6WsLmVLb1HLr1nz7QkhhTKLi0FlB9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=shT7zZYL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="shT7zZYL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4837634de51so4664655e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120833; x=1772725633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=;
        b=shT7zZYLqlO+v4sYjOxhrziMF+y129V63JUE/18gmxIK1PWBf+3lwc7kl/68RIosHD
         f0wVhZ57FJQROAQCPEfpwzc6Cxxyjn1pTqI3188WQCcSMt55nvwvZ47ZSXs+QGiQZFjx
         1+T+AJTs0WYzm+3tqYpvxuTJWFQr5uUudf4CFSKEuC0NbHGcJCQ1LhTSiWWv5gWESqQK
         bwDzOnidmE+b6OrF/WIScgF7o51BeX/g3Pc5/PthuFZOcSCI1djgtfGE7MFnuDfYkmgc
         dy7FtnC/14lukVyurKoFsoiu38jjaNAcTCytan4/B3w3MuWVMAAUO5uJdytaxrsrqP9v
         GPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120833; x=1772725633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=;
        b=cEuXv3hX6uOe9CJsTkghGVhiGNOFmdcvWxLka5MCZLBgXz5gZQHOyZut9XpfP8tLPd
         Jwq2BybKoWFe2CLRz9iD+2DdKAHUrN0a7F6yEW2+louUrHUjHKBb1waCesLpegLgmlt8
         IMwFyte7+yIwzoQMFHzUOk2dZVO71S3tkk0WiwFCzCJ3ITMdNRqGfnVoL5E5El69ooxg
         gTkg33b+/MaPXxYPYa+wdTSoxwm+yi9KnY4dGGnAFknf0n4sohDqJlA/OTrCxGaZFfnM
         gEZ20RBw+YYP1USMHIgUFHBE/wtExialyTsW7PQW+r/yliQrl8895E8ZDvrVGWNmFlfK
         /JyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkLvgXmmpf2Ro6KCd3sdjxyt+B7qx/RpGgIab2C8vVOZ/lbFRQw2ubXugzJlILOY7Uoha6tHtqQWouHQbJoWQdEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxzNX5Gtgj4fJdhFy8hzWXu6rnHjtopwKl2V/QqIm2x4jR6yH
	hYJ4if/P+w+uG4f+mIW83bAxOt190yQgumBDCNc3WMOA5CzRimgfcofUG5KzazY/PTo=
X-Gm-Gg: ATEYQzyARIYE+Rop2S+idx+iNKVTHO+lcGRFjZcxvCPDkEvGQedPji+n5wy2Xjm/Sy/
	AsOn4Tg1l0DFmrRHSxTtgeSjEFuJl26kavoaqfe/joXNVhO/xqvZmurhM4myT1963PBGZMCbpGc
	V17+hv5Yvdgw5WHsGJ9Vvx9WNv5QQ24HryWBc1Nqmf7L+dx1akecz7pbjEn+69d5cwiTi/kGN97
	88oQ6Z7oEam0EAhxdSNPitLLFx1grH5lsBy7ACJvvadfFj8CnfJsJXuE2PQNw9nvFqYQtwCOrmK
	eidzIGvNM+uyhADcc4uQdBSOmsNjvpuyuNqEVyyEKHl0wd1gSKk1Jd4ndz15df+9m46DNRu7gDo
	/sU5FaTdyLRRPET1+fnuRorDEWbSc8eQ+7MvKgnE2PSl/YdVTmQml8nwPW2eR8mKGFOkHa9DmF5
	fQTR7cz1XNhrisoocOmjc6CRscWze3pTz14p16GLmjemvp5YF7VmgMH2rdHCY4Y32qf7D2moY2b
	mtbz5pMwdN+j2g=
X-Received: by 2002:a05:600c:c166:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-483a960a0e8mr372926465e9.15.1772120832942;
        Thu, 26 Feb 2026 07:47:12 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:12 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:09 +0000
Subject: [PATCH RFC 3/8] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-3-71d7c4063382@linaro.org>
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

Some Exynos-based SoCs, for instance Exynos850, require access
to the pmu interrupt generation register region which is exposed
as a syscon. Update the exynos-pmu bindings documentation to
reflect this.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..92acdfd5d44e 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -110,6 +110,11 @@ properties:
     description:
       Node for reboot method
 
+  samsung,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
   google,pmu-intr-gen-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -189,6 +194,19 @@ allOf:
       properties:
         google,pmu-intr-gen-syscon: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-pmu
+    then:
+      required:
+        - samsung,pmu-intr-gen-syscon
+    else:
+      properties:
+        samsung,pmu-intr-gen-syscon: false
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.51.0

