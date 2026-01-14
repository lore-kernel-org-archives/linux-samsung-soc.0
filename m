Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D9D2DE6F9
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400231; cv=none; b=grgLhfMdIHyFGdw3D3xrkoNEnU01Y2HT4zsXcekB63HhkvAjVqC9HWENy4v7k3BCh8KntNdwvdSSrTaxvwyvuiSUFni4RCkmgBr2gs71Xv4ZCFKpWMStjgL1KGpUFuYRCwESfNW7Tzqpt0s/sYLcaNoDD59oj0g/env6yE1vL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400231; c=relaxed/simple;
	bh=Y+qelmK4bAlyv/krT1u3T7mbMOZyLus+NJ7siKthjMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zr4Q6+phcqIGTzetj6tP4rF16v3zMZZO0a0EtynP3q18Vgsqxn5PAJ0VFIIGJDCqeV46Jd/Pv/hqrUmBsUYrHsOL4KVa3QS5CGt2J9V2a8YPtcRkem3eIuKD8GyRg1RHrL1a1NYj3ySH+eblTOJxS0fXUTzWlSrmPgn1jsc1Uy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6B+ujYV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6B+ujYV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so55509595e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 06:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400229; x=1769005029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YO5IPtO5cdGkzvneXRvi+dlXdyTwC85OfiFr6xfp5RY=;
        b=l6B+ujYVKM1sBblbNAMJCTC70KkS2D6EZxpInI8m5TBmcdckqVhkYCM4Vr0rk3EDx6
         BsY/9KGnUThwD/foFJER3XuEEexoIDAwHBDsePKSNf0phTuxjnPA4obqoNFSn2yHzsN8
         4Uu2hCfrMojRFH4CKOLuQRJxTYRnThz8s0L/fb53Xstj1KP1Wgld44gGJ5yBSQMIG+iv
         SML4SsOoWTobjtV+cRFy6lZ8NSCFzlDMkFYgINR83W16bcBnFScjnIcux4lKXIpEh8SX
         TOW9UyvyenBMbzePgouSlZKTFCvdKTo5QKI69rxxwgBG69G0h8/boJSdaE0u6b3KRJug
         2OKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400229; x=1769005029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YO5IPtO5cdGkzvneXRvi+dlXdyTwC85OfiFr6xfp5RY=;
        b=lJUZawXxUDUzjYC/Wbh/Pr3xvK3V/UizioQ5XY49WuieU6SPGawbcJ2fFgTZSAEski
         QvZPf8sFb0w1ZPI+BZ/U8bm+CkGE3yrje0fDJJhiru8Kii/ZxRFP3pTxXH62DneisVk/
         NOssA/5emxSf0U8B1YAWRYuJyc6YGPjQLpGBBYpNBdBSQg5qghLFUPixXa3xBy7DW53p
         OuJgQc51WEhavmSbf8pBTdmcxQ3OnlWuIr2nJrZu/Zn/+TeGLZatIqxafqkWXPlhwLij
         X8xV8R4Rnykw5q/tzrA7N/PyciT/bSracXe7d0bPCbgiGaUsdjVaQpbYKnVV8rAkD9T8
         gVxw==
X-Forwarded-Encrypted: i=1; AJvYcCW/ftlMiyWQHxrnsIUsoYx//Th+eXp8C9KhIwkzdxSuu+NUuvvTAOoJnJlwCYrFH0aP8rcCF4TjKTXB0GcUbMo1GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbdNSZD2EllHZDmsQU2M09e9BHyiFGJ/tvsJbCZSFt7hKLynZV
	rHiZvLnB1lUNFidpmSJn//USKVK3bTW+dLZfRsns9PvcZZrfQ5OScfJDTZHcepTaS2I=
X-Gm-Gg: AY/fxX40SDHZZFtAdIs/I/bmrYW99Rn0BcubLPbyxlC0ofXJ04iapUux70A9r5/Ri5W
	BZAABiFT8qsTpuQUxZ5/20VRKnxcHCjrxAOKlWiL/7Q5lVwBowzcIjZpBAZHWN7T4epr19zkorx
	bknSYu78gWwP9RrbMINfAIMrAsDQPyhzXYgrf474GLH5hlc4/VqwOD8MtHuJrUxOmnDXK6Y1zUa
	DJCxDrIsP8v0ugGzLcYil4eTaW/Tms/oni9sZl3+KagEpayRpIS9Wh8T+GRg2eZV2GLn4pvDuQY
	sNHMLkoqficwTVGkp/0XkoXm3/DtLfnLCG3T7T9j5EN1ATzpnq1D468yRrhB+HqPlzz3/4cimAB
	Q7x2eEl205XsF/aEakNBxfLrYBmpUE9XuuB0XxsnWk7DeYyEsC6NCol3BvjaTjXuHINKNTA8UAa
	UvMwxcQL4Ce8OC9DAWXN/LhqjIkIJJ7EU8ZfB9DszCOH1ggLybn8oqcq+zLPiyTThm8VItNA==
X-Received: by 2002:a05:600c:3555:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-47ee3363c12mr38044285e9.19.1768400228580;
        Wed, 14 Jan 2026 06:17:08 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:07 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:30 +0000
Subject: [PATCH 2/8] dt-bindings: firmware: google,gs101-acpm-ipc: Add TMU
 child node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-2-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=1633;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Y+qelmK4bAlyv/krT1u3T7mbMOZyLus+NJ7siKthjMI=;
 b=C+ZHlnpywyNkQkIYeZeMHaDsZBGpz38Vgp8+GMBcn0/FwlaNnjHtHkxAETXB7iXLe1n+GG1Bf
 Y6UwZZFTUyAB9FjKozYqzSJoOTCshklD/jjZIt4actl242H/wICUhN9
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Google GS101 Thermal Management Unit (TMU) is a child device of the
ACPM (Alive Clock and Power Manager) block, as it relies on the ACPM
protocol for configuration and initialization.

Update the ACPM binding to include the thermal-sensor child node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index d3bca6088d128485618bb2b538ed8596b4ba14f0..4043a6453a9897b9e1d0e618489f79c19f32f247 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -52,6 +52,15 @@ properties:
       are used for passing messages to/from the ACPM firmware.
     maxItems: 1
 
+  thermal-sensor:
+    description: Child node describing a Thermal Management Unit instance.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: google,gs101-tmu-top
+
 required:
   - compatible
   - "#clock-cells"
@@ -93,4 +102,12 @@ examples:
                 };
             };
         };
+
+        thermal-sensor {
+            compatible = "google,gs101-tmu-top";
+            clocks = <&cmu_misc 71>;
+            interrupts = <0 769 4 0>;
+            syscon = <&tmu_top_syscon>;
+            #thermal-sensor-cells = <1>;
+        };
     };

-- 
2.52.0.457.g6b5491de43-goog

