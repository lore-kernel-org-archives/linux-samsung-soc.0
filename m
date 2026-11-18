Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009913;
	b=tn7iKcInNCIlY+XBc3VjILlp8mPXlD9MUQCNlDU7taCH/tdzH5BAPy7oAem/PHtMbDQE
	 oNkBCaB4gDWAzygZKf2fCw3kgJ0KkCCNrVTX19bcwReKmEC7aZrBTYDoRqpoI49+6Dgfc
	 SZnhEbgGPV6pW1DicQ7+s+VF49ar2/VltJAW8OJ+I5ZJoSHMCJM6YV46TjGnAGezZ7bUy
	 UiGIfmZSsZRK9/KAuBDq4sXE3DmqACOdHMEnFJWjUdyLvrH0COqzjBJe6Z2NUhMAipxGh
	 +Plm0M++ITaWCUSriO58fqEcYnY8hUmRc7U7l20rARlbjgqvfV22+Mwx7jj6kYRluHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GdYjun+ir64EdXqcZidFlUVCp8VDFd3V0EbMViH7Z2M=;
	b=fARS35xWqetV5bpKiIXKrqk7/NoYun64zUlnBlsHjyBijp/6gFVBhMpDrkdru+dO13sO
	 4/ktM3si4/O2BEIQdnyTRDP6uLBradeVRk5F5wZEnpUS0A1VQugYo51yPbGpTIR5OTo2O
	 FoJHThRBww8WTeeNk6gE9jJeDSqTLLrQf6Iae3jS2Z/bIis7Rr48rZzN3u7T6djMnFBE9
	 qSW3luatzFFfUUid3Mzk0wLiMv+1Bj7jvJR9OJ1K0cdGQiv99TGQFwQsF9QO+D8E+OSwv
	 WvfbemHkjlFGPpGVJfH1Y6xSgqU3PHLwEie1ZOTKvpTw7Vi7ET0ql9mJwOLbkNxVcSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FhSimmKQ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB73606A338
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 13:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB73606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FhSimmKQ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso16475885e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 05:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795009911; x=1795614711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdYjun+ir64EdXqcZidFlUVCp8VDFd3V0EbMViH7Z2M=;
        b=FhSimmKQk+9xaAJLsGe6wweNZgJKEn20mxhnNmEZ2n1WzVfq6fxpNehYKmyXCMIQP+
         ISIXYUSMtttMUZhi16+tqYXiViPcMYK7L8UfPfbikWkPPiOvMC0BiMjCJPMmyxChAtQ4
         Zb9qbyVHeAaPiD1PjpPTB0J1sSuOzjg027w+KsIC2QPh6duB/VEBUxegSTPJXV0YFpBM
         jlK/RqpCt8h60BFHaaRtTmH3i54NNhPeBK39u4EJ9thKoAuRl//AYCm/JPGrD7F9b2/3
         t5Ne66aeFMDetOwiHzJzK8CBQIc14bj9fs7TWdOXrVvw90n+KY+SDA368Bv6lrahVQ2F
         /xDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009911; x=1795614711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdYjun+ir64EdXqcZidFlUVCp8VDFd3V0EbMViH7Z2M=;
        b=HMiGLeFK3x5wLOOVyMyhFRHNiN/MhogUVs0l2Bjj75N4tQShgn60Oo2LpZaL50xGVk
         +CJZBibY+xVwvwPVHYInH+jTbOLdAp3sRJTp5G/SajMccNPgKpfCOt8c2Pjo4zlS2EV/
         fDXD+oprGCSno6z0uirxftEJ5xfxnucguo1MgAIuRP6LIe+PdOlm+ruKFD1rTTPqHo7q
         yBGytD5zCSQ67nM1k1M7QmbvO2b1L333Olqh5BQba8FaQy1E8oxAm7s4R7QX1OXedQYD
         GJerj/F7q6OA93Tn+jH6AxOPhQ/6Hsrp20Onm4+rYyEfKDtz7v9dhJNPig50UaFxPvGe
         oTTQ==
X-Forwarded-Encrypted: i=1; AL+hErGjPBkwJY4mddS65c79dAWVIF3+FEkeHdAsPky98ij9NBUvIK35vU0iT8dpvrgiZlvb1tfamJ+qq+UW1hfdystS1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8onlUqmAYBKmeCjpqfQhg6Dif+QPIl8aRA0CLF7DsqvRKDQ8pW
	4QEDpem7HEL5ZYHdTovXVYBJHjHB3ek7ZmNU1KGc8jTLVTSJIxTDYM/A//NR95KIJ1c=
X-Gm-Gg: AYBFou1y0p9uoNaY1QdOy9v+kR8WpoHkbQVBDt5224kLCMouuiQGHCA1wNETM3bMvQz
	xOQb2597fXciA9MqcK/haWWa5l2PjGsLb1VDf7lsuoJzLGxzTvyhLQBypSNtJbD5+tV14MUA/ZA
	vk8eTtJdzh0MR8vdxY4/gwBLQXBehNd7lSiG7VNn/vv5w9F3YAF6dea9RzQpbVu3s60E0sYm1Rn
	1njeZg8Ndfmu8S9TEymUSs+khecd3yGn9jHKFAkmizQr3pkftAXTTaFwzNknzwvp+aAIimdYIIm
	Gz2xcLcCX6WVXVf5NlSUnRaax1r99IqNB6CsfgdkDaDMv3Ab3r9ZzTuVNZyCm0MP8GDQUJA9zAe
	X07H7U08z0r/3mJI8DNdXAu/Zdre3wKW4eBmbSs2v0bzXlA4SE+GMlDf29ntwGMRPG92/WMwgdl
	slJ6fKzfqlazq79sejoNwaJzrks13j9c3nasAp5SUM1BZFxZgaFBZ24cjHqMeJ1U6NTLA3rOgV5
	fhzDdzvu8ZvG9JG91MlM6EKWJCjSQrDoL6qSR15+SUYplljGQuhB7g9EiO1eByMGJFgYSYDporC
	dn6FGlmDYJ/SApEYEzsnH4dccAJMeAP1viEtaCaBpApB4/vNHU7MCs3rxIj57OYoPH1lBaklVAA
	PZ6R4vPtqzmgWQv8gjLawv9U=
X-Received: by 2002:a05:600d:82e8:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb7da18d83mr47018785e9.9.1795009910482;
        Wed, 18 Nov 2026 05:51:50 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:80a3:e955:3785:90b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm208544775e9.10.2026.11.18.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:51:50 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 18 Nov 2026 13:51:45 +0000
Subject: [PATCH v2 1/3] dt-bindings: thermal: gs101-tmu: add Exynos850
 compatible
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-acpm-tmu-e850-support-v2-1-19848c0d97e5@linaro.org>
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>, 
 Thomas Turner <tturner@lineageos.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Document the `samsung,exynos850-tmu-top` compatible string for the
Exynos850 SoC.

Unlike the GS101, where the ACPM firmware handles most of the TMU
initialization and threshold configuration, the Exynos850 firmware
implements a significantly smaller subset of TMU IPC commands.
Consequently, the Application Processor requires broader direct
MMIO access to initialize the thermal unit, configure thresholds,
clear interrupts and collect calibration data.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 26 +++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
index 75560ebca48d..bea208cd4619 100644
--- a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -15,17 +15,27 @@ description:
   both direct register-level access and firmware-mediated management
   via the ACPM (Alive Clock and Power Manager) firmware.
 
-  On these platforms, the hardware is managed in a hybrid fashion. The
-  Application Processor (AP) maintains direct memory-mapped access
-  exclusively to the interrupt pending registers to identify thermal
-  events. All other functional aspects - including sensor
-  initialization, threshold configuration, and temperature acquisition
-  - are handled by the ACPM firmware. The AP coordinates these
-  operations through the ACPM IPC protocol.
+  On these platforms, the hardware is managed in a hybrid fashion, though
+  the distribution of responsibilities between the Application Processor
+  (AP) and the ACPM firmware varies by SoC.
+
+  On the GS101, the AP maintains direct memory-mapped access exclusively
+  to the interrupt pending registers to identify thermal events. All other
+  functional aspects - including sensor initialization, threshold
+  configuration, and temperature acquisition - are handled by the ACPM
+  firmware. The AP coordinates these operations through the ACPM IPC protocol.
+
+  On the Exynos850, the ACPM firmware implements a smaller subset of TMU IPC
+  commands (mainly temperature querying, basic TMU initialization, and power
+  state management). Consequently, the AP is responsible for register-level
+  access to initialize the thermal unit, configure thresholds and handle
+  interrupts via MMIO.
 
 properties:
   compatible:
-    const: google,gs101-tmu-top
+    enum:
+      - google,gs101-tmu-top
+      - samsung,exynos850-tmu-top
 
   reg:
     maxItems: 1

-- 
2.53.0

