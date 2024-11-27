Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3717D1E0DE5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705097; cv=none; b=O11Qy7VMgTdOd55ugORG4l8NqVUvivogEBwadYFqHXYO3004y8JEpUExEo3BUH0fx+vnvVGDgjmFhIjFB6zX96XMY1s/YTWucqgXXHiw2MMRSpQITHzScSft3aXx3M5aHWeY/HqkCMLpENH8GFlO3MKl195byfgylgj0t6TScc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705097; c=relaxed/simple;
	bh=VjxgEP38+L+Ma4q4uehB1/JLcL29L3ctWPsdy4kfO1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ptd4UuwUxN20qwGnj+RXYoAKv7k3OUGpcoXD2W1+n6TMvLCIPtuQlaURZBItmx9qDf7FXHxtFzEDKaGLLbxzzE4i7MJTynBAnCYxxzm450xacTlVftJc6Sjl8nyytJUnESml/bOxljOdmDZ99RQrH7i+iJ7qb7lukzZ4ZsU6vi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tSnfjJYF; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSnfjJYF"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53df3078a4dso161457e87.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705093; x=1733309893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EX57ICOKMzOs0eby+nVmHR92z2ekmaeMdJuyR8QQpCo=;
        b=tSnfjJYFiH5cE+6qkupiG2hOfWrHY7ZaRffpPU6bl4YeOs6bDFLSFN3+RLGeGWzsWG
         ABuB4zm2NwiyEmrzhSckmLRyqwYib8tPCfLjTb6pjEBYTG+mtzBDZcQg92C88fxDwG0d
         xAgrrQ6kK63z30BbMrdqmgU4uw2zdy6NyU7EI6pb/pOOhruyIXGZbeYTTHLjXU4ygBvU
         aNTii7xGLCOvECbdo52AIsTJ1clrUpYSzrudaSfTTKZMM0mXD4guIH5MAkGehQKRqyKd
         yh657vVa7mK50yjHgZvMFztUjCEtyJhhPndiUfwXAqaufwaZvAJMoonuqtzKzU1YwRNk
         DHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705093; x=1733309893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EX57ICOKMzOs0eby+nVmHR92z2ekmaeMdJuyR8QQpCo=;
        b=VCQKvSLhqATMqps90NQQk5S1812YiUVyY1nJNTFslyCsqFVBeFXQ/ZJx8l2wuJzWon
         epG77knN+A4S1HDPHzLHFtaUTcEQ87jrebeLvGkMcCuNsqd305Vsk871t6A9k2N0kO0b
         /9wwVrehridhRZI+JSzaWbx9+CA1aZk/90O62J3qWwafc3B2TqRXTqwG4vZreLDLnJiv
         VqX93uplErzM2L/Dsp4PNjIiB4eEH2VC/s7D63dnsL00qJswTZeKyQRW1ede0BS3ChBh
         n/MJMjwsTitYFMazhhd6x7Wc1ZViCURGGMrHcA6qDQ1IUoZyJE5afPxyfAXmDdMP8vQS
         TJ7g==
X-Forwarded-Encrypted: i=1; AJvYcCVfRf0alfB8ShJMA3w612JHgMwHU5SATJ073BNKgteM/EfuHee3WqgU7Z8xU+p3ZsDRh1EmS0VkyiKFb9nwtte25Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5neop71NVRiFXrwSy/c8TzfvRDvopgABn1b0KiQ8o7b+fg25r
	4t+RTvm/r8qgT2c21oepFpyaegTCJNCddNojLh1b+ITXpIpXqfzDvwCl+24zTLM=
X-Gm-Gg: ASbGncvvCsOx9BK64QIJQN6HEaF0BrEvFR4hImKVWSEOA/p2G/c2MxjiTosxtC+R/0U
	qc5qaB2z2pQxVO+RVTPXQpxED8cfmAjvym+H5BONYYFKA5Vsoe3IokrtQM4T1FWTCbimxPy4A8K
	wNmd7t8E1NqilTDH8ui+SFe3Z7WcCZcQm0NQKd/h9t3hHYcMi521vnPDeGcFTZcSSSlVSJ1VEFX
	z6hC4anrUhF6yalVt4rbHfFwTwjDlob34wOPES/BNEGhTpo4EyDihIrLHY27qknf0hSTZxVaJjb
	QR8U+vrzIcP+0tyPdO8ef5HW4GeXn9oAJg==
X-Google-Smtp-Source: AGHT+IEDZQbqWW03yw4ZJpKkkOp6D2uswnTAhfUmoQ8ZqjktXEwpbL7Kj9opKFu91DPbwMPyQP7BRw==
X-Received: by 2002:a05:6512:3b06:b0:53d:ab04:54ee with SMTP id 2adb3069b0e04-53df0107235mr1294962e87.41.1732705093247;
        Wed, 27 Nov 2024 02:58:13 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:12 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:12 +0000
Subject: [PATCH 2/9] dt-bindings: phy: samsung,usb3-drd-phy: add optional
 orientation-switch
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-2-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

orientation-switch is the standard declaration to inform the Type-C mux
layer that a remote-endpoint is capable of processing orientation
change messages.

Add as an optional since not all versions of this phy currently support
or even need the orientation-switch.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 1f8b35917b11..6c17a44718aa 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -51,6 +51,9 @@ properties:
   "#phy-cells":
     const: 1
 
+  orientation-switch:
+    $ref: /schemas/usb/usb-switch.yaml#/properties/orientation-switch
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:

-- 
2.47.0.338.g60cca15819-goog

