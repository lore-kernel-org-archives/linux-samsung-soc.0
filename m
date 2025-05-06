Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB8192D70
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 May 2025 20:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565067; cv=none; b=lyET0jUGZo0jGQbgKAU7RMRrzZGns4ozlDjTIjCfZ0si1U9nnftugGbrVkMTE9ARZmKYvtH4So3Q6ykxJwNpfLE+pICrCYgFWNWomvwbtEykac344F+cqKmrBxrdSujOecdXQCJ3vt5nLrf6NhGwiRzLI91o1SV6d7VTOBNGzh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565067; c=relaxed/simple;
	bh=Dwi73w8Z6PrIgKWj8BhvUdNVPqAGEMJAhF7n320ltE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQ2RNk5o72lcP+KNkimgOkZyzToG444fvtkQwF1QC+j61CDixFEoCm5hWBzhzTsS7QX4ovy6xeZ5PcofuOY/pvYDhC3yAyaJlOS9X+Lcrhd016vlFHPkwvmMh2PPrz4lTb+PBer2qy5/RjV1ITo394zzlxIArvTTb7qejv9REfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAUVxAlJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAUVxAlJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so41506445e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2025 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565062; x=1747169862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPphbwPW3jRb14mN9MVqvjGdvmGkxh1ARNk78hKTSio=;
        b=MAUVxAlJuqkySUbWPV6Y4pIqJTaoXmigS8Af4qEo918jgmjkkeGNnWUXk5qe8jV5FZ
         museLZmD1SGdmQmWJpKBWRB15/e99zM+xEP4COquKID8k7uNANv0/rf/wiIRyz0z6oEc
         tz4xcP/UWHfWY1sRdDU4Icn2vcMEjl0TGEXRgl5O8WsOOcTXQZDuYwvbYhL6t7h/BTo3
         O4yyuo5Cidafx+vh6H0hfniZeKuRZQ8yUKJfLyXSafgJCA1CJgCyRrlKdiNwvhl3UbFl
         UXZuRJbwaneJCnt0mgdl9APvqjuUGVcajl9cQvF/MPkyxWDMs3i3zwviEPj9tBjqXmt0
         oWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565062; x=1747169862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPphbwPW3jRb14mN9MVqvjGdvmGkxh1ARNk78hKTSio=;
        b=voUHXZD0uSu6gwoHzpFLqHbIqkzvhRAfLIrYEfFntzFGf4NPhkNvjJ2xPw1dWmxNEc
         q2DKoiczUe5nggV1N5um+9PWO+u3/6ldBp2rXrqtYY+UpPafnKh8NhrnIcqeLWd38ZIs
         WU6GrFgi2BIvvG3mebnYCzeeNiU/CjQBE3jFV7jGagL3rjdjrxE8Mkh3jWyDRjGGWB8j
         di69SXXjHzEV8uDoHvB2DAsXu91GHjNPNjH21w+l67QvcB0zTsmISgmtvVo9REitku8E
         Ha/x91X7vWY7mWeirmWFNi+8f8GiiYuhprayjchsHrtn7hBfMLzHHzw6ZmFfpmcBSuIJ
         4WmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1ux57HzwzKNBQ+k8SW6h5md/5+AkBUyFpj1suVKmdDlO62d1S1q27+uAqW4SXu1y+PokpCMvS7i19nUaKiSv4bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+FBK9IIUOmPyvNn6T67o6M7cthQ1bILzYcXeZUL1+xIAZc628
	gqhoppDoRVl7O7AJ6lylgT7OwGJqImiB0CWq4ITwLW+bhVLs1SoUNSNS8mswzhc=
X-Gm-Gg: ASbGncuDQWr2dCpLbKpbjX+i+khcuoIu5z+gs0bqcJela7wXAvxEywkVOylX6dBDqoX
	gaJ4YIqd+xUSrbUWdBxh1a9cKOwK0A1B3Ea6oSw7BZ5PLI9Zo3fMakwmF20IpRRkk32Jm1j+Kmw
	9mfuEkiTl1dTFEdZYT4ACAlFMtqMnSIXNrZNHnJcnR2l2XFNLsHR9VBpl1gFI1QfkAYP9ARFdP2
	xBOFC3+G8Mf6N/hKjKJiEVduw/bkvxm51cTEqQ69yUwyYKGsUClgHMKSpvr6NB2fyMqMnq9RNOo
	UtJ2rMlA/LWkLcFneEtc5pCWlDW/IIHqnAAyY2CldQDiGsosihyBLafdGZcvMFRhpQia2DU=
X-Google-Smtp-Source: AGHT+IFSlhDE95SzY++0BnY3/6yTVPg9tSQuJShvecTP8iv8glzD71jC6MAKKuiKrPDEpfjMgkK6Pw==
X-Received: by 2002:a5d:64c7:0:b0:3a0:8495:cb75 with SMTP id ffacd0b85a97d-3a0b49ae884mr743025f8f.9.1746565061881;
        Tue, 06 May 2025 13:57:41 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:40 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:28 +0100
Subject: [PATCH v4 2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 google,pmu-intr-gen phandle
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-2-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Dwi73w8Z6PrIgKWj8BhvUdNVPqAGEMJAhF7n320ltE0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne9FqRL4vyvavqCGSB8WiKiy95ngApArMCaz
 zSnaJhRQcWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vQAKCRDO6LjWAjRy
 umGjD/oCM4hr2TtaKL10ufwpnUe287uZhycwCFgtVwq8X/kssw87WV1sQqeAdEhvjjA3AUwy8/d
 dOsVU8TNA7f0OmgwKvtAmB5tmgiCwt1ng69S2rn4/1M90mg86/YPwxeV08PYMdZffJi+eoges0V
 B5zFC8IyYWK0NpRGRG5kKDEcuSZwbta2bROdJyh1r2Vfk3WFPJNeCBqusgpn7qZIOUWd8VUGYfQ
 rg+qHDEM1uvD7WI4HX2rKZtwvoLchyB0eAao0xhzIVar7ALp2v5BK+99TQp/n/9ClPUwdI100Ni
 bfDhWB2Vi2TRlwrECaQ5Cxh/xC1yxYz/oGYxc65Mo6Bfmx+MHoWuDVHOc9Cx3wD5mqgRmDS7GaE
 ufmexxfCgwQQkaNKwCzATJLPv7QETXw9lSsYUFW7m0QccfqEsDXAcxo5tcF8mbp7yn3VMYcS52B
 xv4FKTJDQl4DVRXNPnQGsYgDdzGM2pXyK7t8Y0FMrCx+I/MZNpLOpVpm6Cl7aNRRNjKJoJTgzVM
 2rcxQi9VmrGfKu9W5ygzhTe9LBybVMRgQn6EF+Ve/VTtpN7iQdLfBuswSepHiKy32jz5dcAsFIY
 x0u0jaGtemD2MBIBfB6zCrpTLUwdx+nkifTxl8IaNMLRgFhG9p4HiESrcWc6/VDWlMKdEzjDce+
 0F23juvsfaJoLLg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gs101 requires access to the pmu interrupt generation register region
which is exposed as a syscon. Update the exynos-pmu bindings documentation
to reflect this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 204da6fe458d2d4bfeee1471ebc5c38247477ae2..3109df43d5028c61cbcaa597e7bd8cb530eafb37 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -129,6 +129,11 @@ properties:
     description:
       Node for reboot method
 
+  google,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
 required:
   - compatible
   - reg
@@ -189,6 +194,16 @@ allOf:
       properties:
         dp-phy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-pmu
+    then:
+      required:
+        - google,pmu-intr-gen-syscon
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.49.0.967.g6a0df3ecc3-goog

