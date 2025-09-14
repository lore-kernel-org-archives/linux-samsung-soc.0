Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABA5EEB3
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757857527; cv=none; b=Ck1qGZY+/3B7svNd/MV6Xyjyl4q5gUsUwXvCVWaaAd1GVPQg96gQLsc19WDXqyOnP7t+vtYPEdVecMyqT9fFRx8kJWIDAGb56EMa/5Gmc7F9W+/UnGopg22MnJUe8UYec0RO7X5Ae7jOl6uzdRfmO039y/hNh01V89eSWTHIz+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757857527; c=relaxed/simple;
	bh=ZyIwDRc1karmnPZqugX4+B0QPTIr0vD/Nuuu4fYp4xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhwcvfnHUFCDRWeOzjcgUetiti+I+vWZzWNkt76W6QBKIx59eLlar/rbvZPdjnPaTxpvTUAIhFroBhkG0pzmyQkxHoc7FIUBX5KGwFsQhq/Dj9fegIIffw2O12CiOO+RE2DbnWI0p7wcBdlVy6i9qB5VnfCNKDnT0iz2T1Gw3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TITA8mok; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TITA8mok"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so22410505e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757857523; x=1758462323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV3zHUbx1e+LhTjQHrHCchQZpY4e/gFltYNW4sD9Hjk=;
        b=TITA8mokEpQ+xw1RuF9qNrXl6uFUthDmKm4Ef0GjSZNpOkGDeaiaf869+vs0h4kO6N
         VbeQ4U2VH+JlCsfbIdplbgh+6pcvdIUI8EwxFpYTQ+VeinTdUivwAUzRwYi6UMsf8fj1
         K1MBFMPwHfvF61SLBvn1JdbeqqDHfIFsT7U3zvGGx+iDOdchPu9sjvNACg/S3RY756Sg
         iOWc15//SWy0b0U9Un8PRaWvUaZ+hhc4lzzKY34yiFImJs+o+cTd74cCdXql+WdKLAae
         T7/6UnCrzAoq0DBYjX36T4rUKtyYcUlGB2F2FpX2KHmTa6M7HGhVRLS+8xA0fQAxuEBL
         y6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757857523; x=1758462323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PV3zHUbx1e+LhTjQHrHCchQZpY4e/gFltYNW4sD9Hjk=;
        b=CMS70sOHm/KYy1hNLUgAhDq/eME5IWkeZRYzqANEdvYejQblVYIqzbdmflXDYd1Pp7
         lWeFtUADaCZSxtl3aHjwobqBktXI3flBzbUi0pcbHv0F6OIs2f1k60kh8Zs7mD2fI6sa
         GZID/y0BroFap7UBOvi1XF2xzBvFWvQCFx8QbEQxJqyNbhZ2ftoAnhhVBW5NuB2h4UhR
         /0VNyFFuPYkgwAhquWNMVOOlmQyA6zbWJRsH5J7A/s4Hdz9BVxVXtg37YA9g0Pg7Qb6M
         JXUCJQ77PdssvwdrLrgVYnz9uGqD704aGUiHPWfxCSEAFRMSjGBL23YN3ZaS/QZL2t1o
         OyRw==
X-Gm-Message-State: AOJu0Yw6+XMKk2faFs/FmZmvPf3xRzAMlVaPYVKwFwBzyy4eMR9Si9oh
	OUMjB9ibvM/ZU/LBnzdxy/vjoQqcz+XfQbPx6qIKOsyF9xr1ZxhJyqpm
X-Gm-Gg: ASbGncsOSQrmrBunbxgfDRA5EmM3N5fCy7QJqE59/wecwzbsOXsUcEZhU2Fct7o9vEt
	FeS9cQqKbG7BdhHTeHYryXLTNMW0aui3nxI1kH01Pomt4lnCkM170mrzYwSMTizVyeWq3GWfBwC
	czy+Xxg8osWfCWHjYH620RXLFaF5qZ17nx25iDt9Xh6M1jLpGOEz1UYNeqZtsuDtDMeIh/6KtVF
	7LqtpFMCaYBKiFXf0zROAw266SEF+nI26OGSIdEcRj0N4e957tFDD5taqyDrbADPMKlUHWXQZ27
	UNRw818V9ti180ypn8YMtssHKpCeaxBu61gNhuCYXph+czlNjq8jv6u4SkhAvJQ7V5RwzsZB2Xe
	WfbQtPOCBXohj7LdP+T1xyW64fsAdRRppbQwHJj4q0X8e+3vfLL9xZffI09HpcPywPkVWmM92QT
	69xfSInpwz
X-Google-Smtp-Source: AGHT+IH4PxlS+eMu4I7zsqkF333IE4ZBIXWlFwsih4mbbMUXY1y5US4lIdGFnDdmKTKa+deYcjSRTg==
X-Received: by 2002:a05:6000:2408:b0:3b8:d360:336f with SMTP id ffacd0b85a97d-3e7658c1c6emr8490202f8f.28.1757857523258;
        Sun, 14 Sep 2025 06:45:23 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea4b52b7fcsm1467591f8f.33.2025.09.14.06.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:45:22 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: input: document Samsung A552 touchscreen controller
Date: Sun, 14 Sep 2025 16:44:56 +0300
Message-ID: <20250914134458.2624176-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Samsung A552 touchscreen controller, present in devices like
the Samsung Galaxy S7.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../input/touchscreen/samsung,s6sa552.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml
new file mode 100644
index 000000000..af151e245
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/samsung,s6sa552.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6SA552 touchscreen controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6sa552
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  avdd-supply: true
+  vdd-supply: true
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - vdd-supply
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@48 {
+            compatible = "samsung,s6sa552";
+            reg = <0x48>;
+            interrupt-parent = <&gpa1>;
+            interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+            avdd-supply = <&ldo30_reg>;
+            vdd-supply = <&ldo31_reg>;
+            touchscreen-size-x = <4096>;
+            touchscreen-size-y = <4096>;
+        };
+    };
-- 
2.43.0

