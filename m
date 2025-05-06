Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8041A256B
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 May 2025 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565063; cv=none; b=fwA7EtbX0FkY291g8FpNFhOY2FvogxQd+FwgUSHvfww+zwjPaxW6Ux00RJ7P4FipnBz8CdW7lj8TMNkD2o/W7MdxGYFg0KpO2H6T+WduSZm11RueghvX3IY7OZwrQtF3Lek5JoQq9ID3RPjuQEBHRxwdJ0IP2ezXrrAgVsRIcH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565063; c=relaxed/simple;
	bh=mHVfdZqUplNPUuQlpTqhLpiAYdBfxBb099/0y8ffhnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5aSOPU7HOTTHW1ijeRj+s/uCAn7RwEIvnhekeK0qkEdgqdbumtgF0YKkDHoqCa7vcgjm6U/5gUUMo/4TaDjSBTC+QnR4Sbi8BidScSN4O0v9mQz2oLz2Ew/8PRTrddO7P+J0ehBMEpahHfuLepDlWcNWNGqmu9Vgmi7ItPeug8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R1SR3sYZ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R1SR3sYZ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso4036505f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2025 13:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565060; x=1747169860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtVVAvBNRNXOTj9ycnjiKhQ81sFidRMeXup2zFY3GHo=;
        b=R1SR3sYZRYP/si2AvmqJQ31h/tePCJj9lnbz5ZzkZNgWExIJi9JKG8QMNplkjRKyyM
         7kjSU0Pgv6ELYz73HNrjG/tbfy3VwQV3HZWWg7iBKrb8ANiGo6Vc+nWlVcXosKKemi97
         PUpiFroC8k5aWg9H9yKyHhrEcGjahaWh/TYlFaeSs9oetNed7qOQZoxwzqqdJ9DwIMeh
         CIDe5wT4XG1bp2uY6/oJFnhPZQSDX75eUKyvxMQL0jLXgORulm6joZvOwexYqF5+H2gV
         3YMTGO467HYTzqAQtC3tmRdHX7awZL6OG8E9daBKquKe2GQ+7LKcjOiG/0+jHwNf7YP5
         fxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565060; x=1747169860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtVVAvBNRNXOTj9ycnjiKhQ81sFidRMeXup2zFY3GHo=;
        b=RJBUyMtiGxts1VArezaubwcJE2QYGmTsV5cR5JPzrLOQC9o+XmALRtwMlpnCMRra62
         HGmvNF0nsaWbnGlH1l101Yj26c21uYewt66q9Q2xKxiEtPZIflG4U3sJx6xob0yJ4nzk
         f79xY6F+t8sbGrUEa7+p7D4jXQUnNavlRmt72GB1fCq1Q8KbOrx26AOyoRWF/tjZhIPc
         dG6Awnlm/tBA2Ss4oD77VAQuObeUVOXWmYQZbhj6qKu5GDtD1DGL4yAf8OrZQHGYmHVQ
         TLCpKV7wgDHlrD4eIPEBPXBfuKB1PsZbPTeWOem/YhB2tqRkg4UAqFmwCYUjooLSGDTK
         DEFA==
X-Forwarded-Encrypted: i=1; AJvYcCVcWJyaIvH2POzt2vq7gCGQiI9vl05SkfmMsGXvdmqsmuD5epnXZciEFVN8Zp7Y9hkkT6ejEdD1M9GuBJ+T068sFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7OqpSAVkbPBLWvoouckhJv3zx0hZTtOvIT5KMlpB6YlrxcWfh
	8jvLojp+XMDde7VCnDNSWf3qqHBo+UzaBPbj1fG1XFIRGhiRHOTqEKtSme7e8Ek=
X-Gm-Gg: ASbGncvWC7ZbqxQD++xmm5FF105WNPQmJyHAEijqCIyfERqzRnG9kGqK/kfJCfgx4+z
	MpKPUqKFIdFpcLXJo/VDW9cSnPSvSBkR9YhmMDeraq/pGqiA/hxDSyd0ciiabl9iXv+o7oTsWV7
	fW3nvC4eetCIHLkX+R/g43Qhuw/Ft1MHtCU/I9i8AkrcPQ+SIE9HBYjbbrKG+DpI9KRtmtatD9i
	xNYbAyshwA0Ujeh0OP10p1oX6sFrkLx91+2lHD8m9hah5I8EM8TuFr4T1OkdG64Q8NUI/rFCBaB
	tlQA6/yoHSGpAhmqPdOlz9GiepM7CW37jUJziDYldsHYECam42zMAc5xEiAOif3iHdpKQ74=
X-Google-Smtp-Source: AGHT+IHjjOZpvxXjJRqm1EBDvtIRg9jViARXQDNiynCwlsBktmak9gKLnfrD+JJ2M1IVcyYbpqIRWA==
X-Received: by 2002:a05:6000:200d:b0:3a0:7fe4:df6a with SMTP id ffacd0b85a97d-3a0b4a4a407mr683343f8f.56.1746565059782;
        Tue, 06 May 2025 13:57:39 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:39 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:27 +0100
Subject: [PATCH v4 1/5] dt-bindings: soc: google: Add gs101-pmu-intr-gen
 binding documentation
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-1-9f64a2657316@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=mHVfdZqUplNPUuQlpTqhLpiAYdBfxBb099/0y8ffhnQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne9fwRgTCPtGjWB5xgUtQEMw/NDbt+Rmt2sm
 OgxappgTnGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vQAKCRDO6LjWAjRy
 uhh5EACBHRVSSR8424VBCwpWJmj8L/Pd5ZJ8uAUZL4RYy0ESU1SZFbn4HnDzr8MrhI/Sy0xLloR
 xnaPFOrDfz0OECmXh3EAmbSPCvqpArfU+56v6KQDFBCLouOmgXnXzDVeX+QV9OMkL1h4KJk8qyD
 Sazg67p5MfS/MHNPBZnKB2ZpwhmB05x14QNEn6QUY9A9gk25+WJkt3udIsLcUCAyzICwTWCqGTY
 nmksFGz0oiR7Uie8+zrBC7OJUYjyOHoW79GOHy0wdHQ+HrGbaH3CUK6T87spkKysKJYXBGU+aiT
 wYLNCDkjwHgfz7X4ikO6B2DbckHpbQHV3wtPuVMaxpTRSPcyPFo7z8U90I47wRW9bs4zVXOYPs1
 V5p6ymVUmnikwlj7V5DOqQDRDnkz82hfDccHROc4x114OcSeB8kdLu8vJZkE2aHjqJ7OncN8thV
 /eLegORccxHgj0Si1LkQqcudSY4/1RJo9skWsrwbWf9xiLWYKz6eeNMBG3xMmdGIS3PFdulCeAb
 9f5hLQuNhNOBF1PnCP36P2X7dYJmKiY7DyXkhBNEQ9X1iWxAOIhAik8yRz+LN6XD+TBPSWjw5nu
 o2+uUsYZhhGhKZquccWpS04GD+c35EyTx/PodQI332ZSXUuzX86pqcygHw1Qwj29O7QxwbHnhRV
 uwpU1IvJEDRrkTg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add bindings documentation for the Power Management Unit (PMU) interrupt
generator.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.49.0.967.g6a0df3ecc3-goog

