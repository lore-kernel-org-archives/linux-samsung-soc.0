Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E4614EC5B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 06:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907588; cv=none; b=OFOniXW/GXvxfZMVckOsQMHcFO4+FdQlpB2np6IUz04zKV7SRMkoonicKjSFfMmozvJO6ZyjoLK/C+togL+aouxandUWM8sS9oeoqZ3OcECZrCxBQSJgw4m2QmjHVRGV3lu/+0oKnkRj3WFim05ddeqxwFM95flT6fH54mn1UuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907588; c=relaxed/simple;
	bh=Sp2ayCAa9I3PDRmWW7VLfFW+7irdC0o52an90/gAFl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKaaPAvJTMK23h4ZOCVHxxotqZbOe44rh/bswbm6f8Q7dvoCz1kZSZQW9BkcwEyosL1yVYOuq31hDBvVyWTD8BahBt20tNmhvGBaoiF3AC0SqHaR424rSAjNVM7CzRiJUxOOil6piBhDgQCdWPCTc97m8tcyaQOmREpd0cyblDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LQmSjLhP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LQmSjLhP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c30d9085aso4077963f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 23:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907583; x=1746512383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jzh26vdjbG7G0Nm3rm+vVlbbhRcsrkTRgLg289ahfY8=;
        b=LQmSjLhPhKNg8l9wW7QnuOl3eoAsAjQhwSopmOgv2JkcN5h7GiTxpTy9H9TtjAAwQL
         mu8iC2E4tEDTD6XxK/lcH5nByteWiYWA5MfoWkmZO97OsMYmrS7NDbCasaaGUoJsNpo7
         Jkk0KzplzIt+kwwqpq3fKS30CQ044VDUmss3bZtiTvT3D+cW+TMlFWthr96TakZS/p+1
         l4zt1nTkQdPtu4lLP8RSyw0PwDMFdudsRDTy6Kt8FD59IJfZ879K755KYKvn8vymJfLO
         zyslHV3Q+K+Hgy9wwYv3QYdhHSjAH7/5gYurHL9To9Hfw1jVaqNUf4eaeTTu1M4VXKAQ
         TrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907583; x=1746512383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jzh26vdjbG7G0Nm3rm+vVlbbhRcsrkTRgLg289ahfY8=;
        b=oLHrXM3dGIOtsfggkUkHj1/ViOTM6NXoHR6gud2/bzrFHib1xREDMVf2rn7I2e0oFJ
         Scz1MYKswT4uxCslk6cjXoR3GfH5A7Rsj9bB5dkMXpLlTn1MmhRo1HK9O5QqvDxUhysv
         jnVmBY95tWYvQvp4ehvnwb9C4XvlsoIe3MexfZhrahh9wnwEaiZDpCIayrB9652NJ20/
         NcGr7HQcY+zmVT6ki0NpCnMtC8XCVnZSB5pT7H7uC+6HVssVQkS7l8SLi22Y2akRFyuS
         skT0A4GIvDiZRdrjQCWanpJdUL12Q3yYaDisAubY8ynrDDSNgfN9Jep49jqgu8Fp/OpQ
         oSCg==
X-Forwarded-Encrypted: i=1; AJvYcCUvfpyL1uHfNtZOCRyp9Rca6do7M5FgnGcSBEmJDhItBwnKVBV+yD2hKcPVMkvOs09mtvB5a7dRKGr0XYwr2sDGhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn5BHWUBZ5e75K6pMujX8IXgiEwl0J6VnCYKJBhzEIGexBUk19
	VZb52DuWrfNj2025XgWdQtESXBqJQsQMU2oNxSX+1Rpbt1ZFDhV2QRNLLfK4sUk=
X-Gm-Gg: ASbGnctysPtyCFWzZcB1QKc5k3aFz86hYBu6UFE+BUKT4jyWSIuupvMzOTt8MwvVz+l
	HwALMWedbo86+DOIH7FmsR62Sfs/mcH8xDFqjpMn6mYdKLMl4JocSme7zqS7qDSwNfJVGEjlwq8
	wrQ5tJFqSqJaXrQQEPFxbmBnXJpCnVBbupQbALtx2E0wBhgvrfnMRPdxMEHVN2Pwmfmjc+JF6A3
	M1mztCBprcDcdjk6e1R3S28OZh87oRaQN8BbD65nlz6sfWNr0YOGnK7/Rp6cuSZ8JgY/YJspy0n
	MvbaxHqFkI5ZSvVYQxvqgQKYaH3vrg5qytZLLXtmQDRmXtIClpqOqFkFXVJsiGuFompaJF0=
X-Google-Smtp-Source: AGHT+IFzJb9NMtr1f92/yBh2GExm18tiJRJJXDmpFNGgqHW8ipb8xWMxgVsXCJ0bIiAyHKzGOHvZ2g==
X-Received: by 2002:a05:6000:2483:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-3a07ab85d86mr9231177f8f.47.1745907583567;
        Mon, 28 Apr 2025 23:19:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Apr 2025 07:19:37 +0100
Subject: [PATCH v3 1/5] dt-bindings: soc: google: Add gs101-pmu-intr-gen
 binding documentation
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-1-1bcc44fb1d55@linaro.org>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Sp2ayCAa9I3PDRmWW7VLfFW+7irdC0o52an90/gAFl0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG97ya628YBjIwMAoykPzIHd++cHXjeKqJsWW
 IPBkePX5JOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvewAKCRDO6LjWAjRy
 ur4aD/42kkFmOL4mqo6f7UREpZ8b/Vc9BvXjiOZbf4+doh0jZmW7DjW3u33WYdPdjAfDgCKv7KN
 TLVrFjUNyeubXl8qc3Rp046Gl5mQ6I2653ezKjZMF5Wc35+tDnp1aLeowP9fSe1Wo6wb/mhQnr9
 zTBEuccMveKG7m5C6llUBDBo7aSLltjVtYUAFVOlhBD7oH+D0rPOVl+JfwTFcN3hcBQlk0TD1Y5
 Ng+69qVlfV4gP9cpvNQwljHzaLMbYL0AXoZmvnXCcZCZHvhp6g8PAcBNFB7H9gpy5/aZKOb2Wfm
 VRNdfsJHG7PEtBvizuKLU4c+6xkCMngPJ9F4RpmD8WZs1mPoPEQbgpqW5gVkl7Y28JmDOn+/PzO
 3Q7qraOKkwNP5Ke/xDnqa5rJ63WbIK/bUU0ulYocgvXcdhOhbmQgjImRmjQOo7R2S/76eJj0gUY
 vKuk+jtXFw5Nwfa8Dnu5sKyK1fWDRPw1rB2zA6sM9FmUs9d8ZszZHSZ16VresfHgiofcTg+bwh4
 dOYiGFnTs7YCNVs0/fS0tM1I5WxjIs0jNRJ559oILfvda7Y+VP89DKu5pWSgffxmX/kzSEsdPHy
 lgXQOe90G0y8d3JM8f6Uh0g80mVLLV8sGuhfw6nH5o1fV0YroBRUtXbw1CItblDCfnKXkr2bzqR
 EAf5YBKHSzJnZ3g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add bindings documentation for the Power Management Unit (PMU) interrupt
generator.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v2:
 - Fix dtschema error "relative path/filename doesn't match actual path or filename" (Robs patch bot)
---
 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2be022ca6a7d0780db3163f1b774e4825a9123fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Power Management Unit (PMU) Interrupt Generation
+
+description: |
+  PMU interrupt generator for handshaking between PMU through interrupts.
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-pmu-intr-gen
+      - const: syscon
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
+    pmu_intr_gen: syscon@17470000 {
+      compatible = "google,gs101-pmu-intr-gen", "syscon";
+      reg = <0x17470000 0x10000>;
+    };

-- 
2.49.0.901.g37484f566f-goog

