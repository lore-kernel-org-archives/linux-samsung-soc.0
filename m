Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910F3325715
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 19:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762889205; cv=none; b=B2UDQFEFPNGmoCWXceANW+pXM28MFyOK+c5v7RuyriGLyk1lH6GIcmxCG+qUqbxPDBoHF9T3yl/jVkTDPAHI1c/hcIRWdzmFIE3/K61cuP8xFAY8CPywLL/ARbWCTbB0cdhYKITijFL2olCLH0dRHcsCrJOaPBSSF+l8ZXsG6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762889205; c=relaxed/simple;
	bh=PuM1AACg2d+I1zG41cyM/NLvQTJ2/H6JFpNiUOMJQO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEH7v5cYjMO3uB794AaqqwbFGu6lGmkZpc/dSoYBVaW1Ieo8n0HnXn1/czxrtaH7zkIhk9HLhXUC8s4IKsWPknKNwOk8dvkHXbnLp0ED0NAhG8Pil7I5xUbHaZ1VqUe1M4F+JNWqPG2PoAMYUaNrzI+3ouwHMlOSQIQCzR/9eBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=czTSgGHG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="czTSgGHG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-297d4ac44fbso21525ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 11:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762889203; x=1763494003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdNxsDJ9m7UGbRcYc8TABHid3VHQHv2h0LQ2tYeasVo=;
        b=czTSgGHGABHc27+UBO36i8NZqqDMtOKmZJeshxFQSzE7w8yHWNBVghJ1OKn+sh/OTr
         pO7ohLbAh3htpT5Tab1CnPR28QtdkyFyl1OX0XN2t7g8oGbTYQI7SVLTchelDU8JgIxB
         AvhMjwViVRw3M+mr9FgRdEyIebm2BDdUMFLy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889203; x=1763494003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BdNxsDJ9m7UGbRcYc8TABHid3VHQHv2h0LQ2tYeasVo=;
        b=nK8kD5pgy59K/kLxdChBQbVmwqB/ngACG0isPlcy6P9lmJkFXbOc7jSVE2YNSgnFFW
         RCjkPMJcbzJfKh+2W5XRkA4faCGIfDjzxst928i+2DMWvNofH4hihAsD9mvad5r1ea5W
         edAjFerBKuOu2tPwxK315rJm0+IB7OJiT4oq5+JH+rtzIluTaolCGtxHFGsDpoZUu501
         dwuL4xceNK3Kll8jksWQKsIt0Nq2fKvADHJKbQTdFcCU7n/2FRRGakgcapOsiiS5QN9U
         g44gEqCN55dWV6AMy7JCv00/hYpf1eVQDC4TEWdvcbo0Dp9Q6YZBLqZMS0s1N24T7bWh
         cKBQ==
X-Gm-Message-State: AOJu0YyshFvL9lXuK0flP9cN0mdHVOlN9pd+NkboD0NBYeEP66YUG5ed
	q2pzwcqj8wbrjqb9ymC0hgufpvlBAiSUQnuObNWNJpeu8f432vFgYRH9z7WtFvjaVA==
X-Gm-Gg: ASbGncugLt8Ub4zx2Do23TkADnCmXRxgBkyO/y3dOh/x+s54IGurlQ1+J9Qu/9eQacO
	cuFvtZNjD8BXKSch2bEKtE+Zjy4JDB16UrvU70b2Lws8MPL8S5khJsP9KxEZShU47EWQjal6WsU
	9EHZQ09P+aCsMTd1aPZdVuiBmb0HbIobtWqZX6R5pWD2n7whSqwKlGHmMWyj/C6Z9kwgS68LByG
	8Rc/V3i9t7oiWbRXHVQVw+tDs59tTqGQUu5vFLMrvR4pG9lUbywhRVK/3wj0Q2e67EvcY51z2dr
	s9tk5iGLLfNF520KomnyWhn97dhves+kJUdDpxhczJpCBCul1mEM86Nsh3mcLKn1YeLzdOaCWu3
	gwy6xOtEtqO6RNDaW1XoGhgFvxwuJWnPuzlcFCaCYi3xMps/mmxEGheffFcwK81bwURGE19xTCn
	tu8mOEPNjr7yOc3ebSLSXm3giFZB/6f6buCGsK8P4ZwKtQFKnLWSMG107Zrsl4De+U2nUaFg==
X-Google-Smtp-Source: AGHT+IFUhgG9WpQVUBXncCvJtpv/AdoMd+/rut91fwnGCd4l3imDRqM9pTW1tm/5jIJ9RftY3SLcaw==
X-Received: by 2002:a17:903:944:b0:295:28a4:f0c6 with SMTP id d9443c01a7336-2984ec88253mr6581805ad.0.1762889202759;
        Tue, 11 Nov 2025 11:26:42 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:ba9f:d4c6:9323:4864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0974sm4861075ad.90.2025.11.11.11.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:26:41 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: serial: snps-dw-apb-uart: Add "google,lga-uart"
Date: Tue, 11 Nov 2025 11:22:05 -0800
Message-ID: <20251111112158.2.I040412d80bc262f213444aa6f6ec4f0334315a67@changeid>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251111192422.4180216-1-dianders@chromium.org>
References: <20251111192422.4180216-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Tensor G5 SoC (known as "laguna" and canonically written in
code as "lga") has a UART based on Designware IP. The UART appears to
work reasonably well, at least for serial console, with the existing
driver in Linux. Add a compatible for this UART based on the canonical
"lga" name for this SoC with a fallback to the existing
"snps,dw-apb-uart".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index cb9da6c97afc..df6a7558a9f2 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -53,6 +53,7 @@ properties:
           - enum:
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
+              - google,lga-uart
               - rockchip,px30-uart
               - rockchip,rk1808-uart
               - rockchip,rk3036-uart
-- 
2.51.2.1041.gc1ab5b90ca-goog

