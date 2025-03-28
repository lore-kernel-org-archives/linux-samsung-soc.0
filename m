Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE3919B3CB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168659; cv=none; b=u5YLFrYKgyO+Vce+TdyHkD7Cs1pwkCBsXLT2oykQSyMkyWQ66lu6xlTx19pvtjqgUibYLl2z9XDQcxLRySN1Fhey5Bw9QmiI2qdvvQVy/PSoJu9neFmae1u3X7c1VNVRtkcVeN7Tbbc0dlFnUCmkEi1vtrCfZzx5XzqLEHqJqNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168659; c=relaxed/simple;
	bh=GY5aflUP8HyQZVCvYH781i7uGwHWsWCKLpX/UgZ7jiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Db4VQBSxIVXsEp1PYwYX/ZsTjcd55kdeJUfPVtmUL+wTs4GiP7DaQ2Xx0TYUEnOoAzXwxkT3SpFDsL9rovmIq0W/KN3dU4Pi5SiIqHH8+A0YFfF0ZoISv4JyLRoQmU7kZolblNAdsq94zU5cuqh7f612+T0GgKfvKxaDraRaOzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwZQMzbQ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwZQMzbQ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso3667992a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168654; x=1743773454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=IwZQMzbQ4UoYCS7reOD2Sr1a1Dpzik0SCnLknyGcbCU4VFuq4DTmeCYQ1RB+eRSwtn
         o9pvnWYHuQDyupsms3umIbLY5ybOpPTMbFDf/85CV1GClcCL68Q5PG+Tx+ih5rWyC4hf
         imb36fhw6AL62JSZQ/X2VTo4t/bx0w5PMMYPiMXUAsBpHxjpsafCHvsjbgxYFWjT7IP3
         +R1G+qqdouHP815bRbiZCdWJdM6vyHl9xHCb47SG30f+RJWY5cJVoGZOyhXLAwik0++3
         BDRHAjNzoR0Q4Kfr7kzRIgvVD98AVtvSo/uBzB/5jOyrbykuHdCpH90JdfLupufu91oU
         6bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168654; x=1743773454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=dA3RzDbihix332kTQhRIlm/9CSfFmWTM/AiuR/VgGfFI8pcgGMupCaf50A9YYyPF5U
         6b2DzRji/V8qgs8p6+rxmzRPQpNAM7m3uCP8vbZlHF11GEcQ+5F9Ha7suG0EcurkLUQr
         ZziqLTLBU64vbORvDDhJgtoDlts8vSH7EI/Za4bQdXvsuoSSdVx1O9j7IvE/uvunYR6l
         gEXOivlh2wVJHqDBAwR06MrYPNPDuUnmgw/jwMX1DnOT6QJUbxrCzGvjMbbdDVE0sZ05
         ATxj6buso+0LOI0VBjV0KD91YzXW2zqjIZcJ+pmViQbrXbDMEg8oTsaxsPAGRIFAsAFD
         1DiA==
X-Forwarded-Encrypted: i=1; AJvYcCVeKIayfDD/YoGnfadp61/Rx7Cwi+92rx8k6wNZdKlTLmWqyX+0OefuSYmtt99Pju1NtPmGdDLTT5kVxjA+wOmK6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf0OATQdz5qtzLeT7Qc3cnRSwBsNv3s5H8v5L05VemUxGYszRR
	yXsOLnJHNgzL0IZQ0g7cGETJvKRmO6hI/bUmXPFiCIOp9QJjaCyufxqQSuqsNAU=
X-Gm-Gg: ASbGncsWAss7yxGLR77PXRAG3FSoUwh9tSXLXjBPI6RRqFoWl8beHK/HjsZWdqu9khy
	LfvZUhbz2hMVJHmnnnN8r49IQBBWMfIzYZmW4BBp7ls7bN4ZR6eyHWHjvKxhndsnkLgVkx/Ah0l
	rMY18kN7PWKHXWUMUMQd3fgrxd7vikZVw4Oi4vcMqlK/QCxHb5r7vup2N4fSSInkvtOxRwqLDxT
	Bngt4ej5Wm9KfQeXIx/zTlcPoNtj7UjXzaghwkFq+TC+42MgEI7HKvwutZMw/vTR7Z/VErfok+f
	8as64Ak3ZYAUy3y4ExUXwldHdP9RknWuVEDphxzSPG6o6Ie5aBYJkDZC5kHrsODyo6je32x3hcT
	7l+abYkrAfvfKrl2Rh03wS9ivoUg7
X-Google-Smtp-Source: AGHT+IFNlBH/xFV1TxcoV9Ofat0bwBhbNapLP3kxW0K3XFCOMqRnzn5sDn6+P7lNxf9DYLlCo5zX1A==
X-Received: by 2002:a05:6402:3492:b0:5e7:73ad:60a2 with SMTP id 4fb4d7f45d1cf-5ed8f901fb3mr7761660a12.30.1743168654052;
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:48 +0000
Subject: [PATCH v2 02/32] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-2-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.49.0.472.ge94155a9ec-goog

