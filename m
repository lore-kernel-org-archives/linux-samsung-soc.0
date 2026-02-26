Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74C6423A9A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120839; cv=none; b=JxRFdSs6ffgxO20rmIIf9j7e1yKl7V5RM+uIYVxEbiht9fyfroj/9QGcOhAPCzz8CHjZgze+4XOKNIppQ00PrWwe/Iyz52LHyRW24QuyfDbRCJjBkaCDnyYfF+iYEaO/+5J19zVMb+In7LBQYrEeOoERDleGsgZAKm587NXS5yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120839; c=relaxed/simple;
	bh=Rvye+ruoXWbdfAJxvkI5cdNATvl1ZuuLfhE1+CBMdn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qlr9tsJZvIDfP6sTCBsoIZ1bIlKUAYNtDmMDT6NXiTw6iUc+nxbV7lmQr9hEb9QITY95Si/7iRmuzAtgP1yIvs7YREQWnI+no0oHhSVdXo/Mz/h5hEopZOWU87RAeNAAfqWX9Pip39n7UAtSdSvG7rGctZ+ZVrHz1fxV9usNOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nx20Sw7F; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nx20Sw7F"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48372efa020so8737935e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120834; x=1772725634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=;
        b=nx20Sw7FfbkFbfYOs+0/a+KBs/z84t5zpl7j7FhkzUMR4PNFQA8k9n4DQ2kZK9FYDc
         TH8nvi6NGcKfN/ww+3yYqosQQM0xVjucuM4B4cqUcuvkFogmaLXuVvdBJ8Rb0Rw4x0xj
         yU1Fj/DguPQNXRi07WUFz5TCvZ5MeE+ETcMqnPi9uKX+qDOEoRQHhCEn66caHjjnbeld
         cGMIOgyE3KdnpVNIsmjQAbMV2n2xbSmYL2PyaUMSURgN0n+LL+gcsJ3dmIa80hESHULM
         aeBCmHUdQIg3YszmFgiGg3XBBhqCpw48FjWFX+HzksJk3G++3OfDvcT8WV2ykAa6svx3
         /DZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120834; x=1772725634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=;
        b=B4kR2FKoY/YKWKMi0mTK1W7fZvk/5fjm/BIjEy4/b+vvm0b0GqFEiljjfPWbl8Tp5+
         KFTRpDbwVND7g+E6eA/Y383EgC43v+0EBYAf7HINSPZ+5/ncTEiUBZRwb0Ji/ttronLo
         h2QB41vYDtzo/1uBK8/p5hnG3pgXtw/7JFZPAboVMn5QCZHRrHyPd26MAt2fuzvbkeGw
         CY7sJL3dfzz1QKkwRqbgQfdGrm1DI/oCLxc8CERUBy7+aCOdX/vPdVT5gBo4lTTGY89y
         ZLZJPu9/KUpZUhqCfQXqneoDQVI/LXKwcSUKWElKTFwOuA/ByqVsjniymOyCe5qk5+BH
         u/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCURuJOROlDEQmgGLkIKse7EMX/5SyI3777FL6Z8itTZY51Qv+bXKeI+iaq3q33yLG8NkM+d5gUpRJ58wqWVy7QAAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKbczS1midds+oFg8nBM/wC/Oj2PPVhZYW2WAISmXv1M7Y8Wr
	SgBEY0o7Pry3FZB13KXHurbEhHxzKGrToIk4C2pTJkgG+oYSHiBfhXc1rkL0GI0hAaw=
X-Gm-Gg: ATEYQzwJ/qsMx7Sn5cSrSf75enuXOZ/RteoxVwrvl9u4EHGRY2+6PbANEdtR5+8x6a4
	7PUa6Lc7upSNIjfzWqULvlxI1KBeqZSbmMnJt51NdT2zMRnK7w/vrkbN6ZsIXY6u1W5TmZMbNn9
	Yfkpo8CoOLOvltZ4Mvs9adhwRUnK9+FrxbMuYckMvLNm0+4Y3UBpS4enK48RQpYejCeWcIU8RpX
	LcSdfLwQUC37ozdtRFXQistFiqSPFgKsumQWGYwlhAD4SCzSrvS0HiQf/HBGTXiJWZ9IA9P6Nux
	dlXYZXxKJ6oC8vA1AU7ZZU48Ob9CH4bWdF+XSRvvyVF8x90gBdCp7V+EvQZCcG38fiNcXzk3xg0
	tAcFD5XPH3EGAPWjU+ekVREYWrRL/GS/EexpNJJolFzdAZwc4DUAdx8iGCq47d9c8I3z4E+O+mJ
	wkmsVIBYzKfVzqDq5mwX6N0epdtXYyd3JNbf3PT6eVrpw7pTYAjRahFziqbb61bwEOJzqzi/kVd
	K53oOINYeBpkD8=
X-Received: by 2002:a05:600c:4750:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-483c219eba1mr74883375e9.22.1772120834054;
        Thu, 26 Feb 2026 07:47:14 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:13 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:10 +0000
Subject: [PATCH RFC 4/8] dt-bindings: soc: samsung: exynos-pmu: deprecate
 google,pmu-intr-gen-syscon
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-4-71d7c4063382@linaro.org>
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

The generic property samsung,pmu-intr-gen-syscon should be used
by default for Samsung Exynos PMU hardware blocks. Update binding
document to add deprecated flag for google,pmu-intr-gen-syscon
property.
While at this, also add dependency to not allow usage of both
above mentioned properties in the same time.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 92acdfd5d44e..1ff1a8729989 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -119,6 +119,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to PMU interrupt generation interface.
+    deprecated: true
 
 required:
   - compatible
@@ -207,6 +208,11 @@ allOf:
       properties:
         samsung,pmu-intr-gen-syscon: false
 
+dependencies:
+  google,pmu-intr-gen-syscon:
+    not:
+      required: ['samsung,pmu-intr-gen-syscon']
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.51.0

