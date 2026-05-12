Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766E3A5446
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2026 23:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778627541; cv=none; b=ptb5kwlSQK4BflNstIyi9h6YhqzMYdMhBgSYLAFKz1rYOrkwcm1VgniIg75KFjQVgWmZucROcO1rzoa0+G3z93UQp61SEqAAjViVvxxJclfpaA+dPfcukuPOaE/1JA+QE8wGstyfAsfWtE2vuy3tWyD5uS5yM0WX6BtGzcLUtvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778627541; c=relaxed/simple;
	bh=MKDoKv+U4AbZ5taa+fSGH+o46ov1RsxI1vDLHg7S71U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Adn9iX2PHhSQ+NiEKSA7IOzPKo3/Ttznqz0C85hL85zhH+r/NOReB514NiqMyddnhBqnJOKxFUGCYmid3gSqxrayyWUpgBJOADi67N6A5oRp/gvCFRfJsP5OnG78ZuB2ydVXd67UZZZbrlftgvLF5Yp767PZzdMTJ3ckMFLKdTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGb99TEr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGb99TEr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso34004935e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2026 16:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778627538; x=1779232338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgDS3ViE9NSujWIMzNrIZdzaFnZBEociQgn363+PsFA=;
        b=bGb99TErvYnJAEE9CwrFVthpUjf+F0/AAZyeZ2wvjOmEvI5WO057Fxm+CKIEDy6gSH
         ezhzxoTIk0T5TJYNySwJDlEsQz0TUgBdbJ07JH5QVg19TI2A1AVBjbqEGTypv38BbQES
         UjkTIMRmNOqu18pOltys/jVxi/vpwfVWfQoZlE3UlLvh5XdSNyan4dr9aZsjm8O7Ye6B
         sow+7owkyhcevy4lNVg8xGhmVgT5yKfHQXfR07U9+wH15ypkY4U5E58VTaNgUdynZUOD
         zYumoiPtFuh4hik4KKahc/QqvdwZLDx7bPoznrW4VEUBklksOU4mHrnTMEHrIYbnf1tP
         orxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627538; x=1779232338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgDS3ViE9NSujWIMzNrIZdzaFnZBEociQgn363+PsFA=;
        b=J9h9lBXA6GzveMCk9E1Igly+b4ZnYe/F/Qf1tUG6tSsA501lXRjNmgbQlNgDyBUPyJ
         Yyc+Hc7d1SFWdVmTRqcsYUfQb4M+/ZxOMgESWQwWQfkkZdTG0OSKxiA9O8H6Q2NM8i97
         +t9+JCA1ihPqNidacBQ4htEzlPuz5FCcQj+fLnr8FDoxE4rIig2VwQNPUihi+qcolD3o
         BEYg3a4sOhT6sPwQ6oCbIHMgJAvQSCEBAJsSSA7Asa7VKRYHUKCbiYuPcSeX/w6J9eZ5
         r7TPYbS4e4BCgVHIRYUIILE9znmxmTkK2ecvqkgB9aI3EZ+MTmBUUfX/ce7R92PIciM8
         dgiw==
X-Forwarded-Encrypted: i=1; AFNElJ8d4gPbu2xMIlhIn/Z/ZHlA0AquqpuRye9c8WCtuXsBvTXgJRAo/rOVMwo76ufkfQ94w6IsxVqu4UT8eax1feNRdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAF3VoCLm4uejgstkK3Wv9jVY5etRoFRawv0j28yMT4kNNGpBl
	JlZRiJwSQn6+ZQNcgS4vDO88SoOdQYPtxzORXk33MNmK7K7oVYKMTJCMAa2Iggrd+Cw=
X-Gm-Gg: Acq92OHpgH9xziZfDgdP/cjQ3iF5rPGjZIY+uk+YKhbHcFWTztfWbQUI61S6b9geBym
	RDqTfgBOjWhFeVffGKcbT5gg2fP5+5sflzhW1db7Y4vBC11DMaab1P4YBtJZUBuW9M6G+Nev6oU
	t0O9k59mGx+1dm+I92DmbmIlwJzmXIcKlK3e6cl/GGgOz/Sz4PqvYhpAIVUR8ld2qjfEtZPiheO
	VNcCEEs/u4queSTDJYssSY6YBEp3XlHjmkmPo7QKOodsPtpIo73+ZMFO/cO4LCwEcFx4IsDDfCH
	JpRGJkkOIXDc7Rme5YpRykg/hlWAXi7yneniXv9xkK4kF55MTZtzM3fmVE+7M2wp9ZFOIhg0mly
	S1ijxacmd72lrd8HFlQXjRB8SXYlMFtsQxLLIVJjQu9Ce/c647v6BbvOuRN74oj2QlhAUYesVHM
	+vX+Z+qW/+NTVx+o01IAfgMi2M2jpQh1lAkHTfawtKTTMpUMkav2omrFjZQ6z1L9T+Ig0VZkxMR
	NP5IrGV4xCdzxYt
X-Received: by 2002:a05:600c:3144:b0:48e:82af:d9 with SMTP id 5b1f17b1804b1-48fcea18dfbmr1307925e9.29.1778627538335;
        Tue, 12 May 2026 16:12:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm20712305e9.14.2026.05.12.16.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:12:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 00:12:11 +0100
Subject: [PATCH 1/2] dt-bindings: firmware: google,gs101-acpm-ipc: document
 Exynos850 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org>
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
In-Reply-To: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC incorporates an APM co-processor. Communication with
this hardware block is done using the ACPM protocol, which handles IPC
messages for clocks, power, thermal management and PMIC control.

Dedicated compatible string is required for the Exynos850 because
its firmware utilizes a different initialisation data base offset
(0x7000) compared to the existing GS101 implementation (0xa000).

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index e68f9c3ca5e2..511c873280fe 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -22,7 +22,9 @@ description: |
 
 properties:
   compatible:
-    const: google,gs101-acpm-ipc
+    enum:
+      - google,gs101-acpm-ipc
+      - samsung,exynos850-acpm-ipc
 
   "#clock-cells":
     const: 1

-- 
2.51.0

