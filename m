Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2141420A6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2024 19:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710270258; cv=none; b=QqJU3mb7z/AchKPvo129peh6H/ZnpsEG7zpBfbhXcNE6E1tx3dqqxZa/0M/d7QMBoX2x26RtCaA6O5TrXwinFymP8Lz+6AwVRb8x2JLwgJQDSyFlsAk3WsiXzvdV6rSLuCTWsV1+IxHhhnfyzqdq/KsuNYjkg0lFoU2aiS+1hq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710270258; c=relaxed/simple;
	bh=SQRvqno3weA2SpppxGsRLACyWfP4MXYb+R8En2zxrXY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=BN50cdRDE+FScBM8IY0CcOboYA/3uw/px2BFSboWCSEW8EIQgMaBQGO5Y7CBVWrDX9fYqyBFx/nIoj0z71LirpnNjbN12CJRWwlIy3Hp3JPNyrBO3buqWXyxKaaGwa1ZEenR1N5oFsAfL+5y7JS49tz0VTUdi89l+/9G7OrQBHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYQWkBwG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYQWkBwG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4132a348546so16230135e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2024 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710270255; x=1710875055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nh16+Oh9k6Mlc+LShu+JvHr3Rf2JG6ms52z9eMyG5NA=;
        b=LYQWkBwGciuXPdVy1QqPyhx8FVU8vv5s2CCNKouVXIce4hKvN4vDYjMgbe8vR4OowW
         KuuNEE5pcAOuuIaq/J2tJC20B7FnZThvAO9/J10sr0UGDl91bascWfFQYBSeQ4O3ImEE
         EuAorTdjLSmX3Ao312M/kXoLXARAKXi3/XYZeZwMKlkKDA37QQaimBLvSPy6DD8wFV7x
         W6pqlks/25tH7+mf53xD0Ly+gaBAkk0Z1zfp+sPKZEJHiiZrnxjOWpx2JFYi3kTYdT1C
         RyDGJ1xkd1uJ4f9tnC/Y0IbIU8UnGX0ba199xBJ78xaKDfIZPPw2R18oDqSfXQ+Fhzhr
         i+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710270255; x=1710875055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nh16+Oh9k6Mlc+LShu+JvHr3Rf2JG6ms52z9eMyG5NA=;
        b=qPCn5PaWzcWA0eKE6xTvd40vd+G5d3DbKcOQKSO9IzrjqvCzGvgv1V5FAZjmneqma5
         bjvcArP5o37jW3+rb8t9okO9GMG+KMLdyHGNT/yiIULXe875QzBgmssh2cjpg9z24gj5
         Z7LW0LEl6uYBva6UgSl4E9aZprw3HQZJlMSvzcSLWT3dXQHwoQ7Al0P+JAkFD8dkhX3T
         hVB/vYq946nGYAwQvInrE9cfEQ0gnqYUcLsf9cpDoB5fVI0BJ2IY8ZnRY13+ciEzqIxi
         Mj3MlNnBF2V5DySJQeiegEWrBWd+UzZ0eUpibCtvZYEzdTBW/mWMP2VFh5a/2uGYmY+t
         LeaA==
X-Forwarded-Encrypted: i=1; AJvYcCWtUQSbHTOLmIQ6ZpZEFtbmbI8bNMvMnZL/heKrZyA1Hfs7RHdNycGYhUvFAPatYpowQjVn9yQ63Vhp5ULyqs554kW9ymitAeoSViG63Q6WNSk=
X-Gm-Message-State: AOJu0YxcVbgyNMDxYarZjJXkk9Ovbg3+RRkgJADfQjt1luu2DjYE9C6v
	7/CkL4RN6DidAEnNLuNkl7BueQMsUEsfHgu+YdaLgSLMRzyiUfwqqJtWGiidQsA=
X-Google-Smtp-Source: AGHT+IE03tspZ9sgXYE9B6vVJFsBFq8hVMsaS8u+v+becWRB1JKdGQdCgH0fW2AYovTobu+W5fqFiA==
X-Received: by 2002:a05:600c:35d4:b0:413:7f3:8d5 with SMTP id r20-20020a05600c35d400b0041307f308d5mr7370972wmq.0.1710270255136;
        Tue, 12 Mar 2024 12:04:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c4f0200b00412a31d2e2asm13435026wmq.32.2024.03.12.12.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:04:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: memory-controllers: add Samsung S5Pv210 SoC DMC
Date: Tue, 12 Mar 2024 20:03:48 +0100
Message-Id: <20240312190348.724361-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document bindings for the S5Pv210 SoC DMC memory controller, already
used in DTS and Linux CPU frequency scaling driver.  The binding looks
quite empty and is most likely incomplete, but the platform is so old
that no one expects any effort on this, except documenting what is in
DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../samsung,s5pv210-dmc.yaml                  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/samsung,s5pv210-dmc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/samsung,s5pv210-dmc.yaml b/Documentation/devicetree/bindings/memory-controllers/samsung,s5pv210-dmc.yaml
new file mode 100644
index 000000000000..c0e47055f28c
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/samsung,s5pv210-dmc.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/samsung,s5pv210-dmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5Pv210 SoC Dynamic Memory Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
+  Dynamic Memory Controller interfaces external JEDEC DDR-type SDRAM.
+
+properties:
+  compatible:
+    const: samsung,s5pv210-dmc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    memory-controller@f0000000 {
+        compatible = "samsung,s5pv210-dmc";
+        reg = <0xf0000000 0x1000>;
+    };
-- 
2.34.1

