Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFFF2E612E
	for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Dec 2025 09:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766221557; cv=none; b=puPXjbbUSD7dqTyT55QEiptE6hmWgRn4k7rTr18YCEsW7AxsnFykRh3sU3TW9DWro+x2TqSlgBIXP6Z6LvmlOC1TomLKBmbPBYBtmdtgOMxUGqbl8tBIYBVIK9dsG0/Laid0rDn0moJqJClKhHPrtPbXG4QmtNrwYA9E2dI+55c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766221557; c=relaxed/simple;
	bh=bUKPDLDgvyDmiCQQmMkKtxjUpJMIVvdlMfzNhg8FZ4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=thRGyCEFguQIBgXAPgc0xXs2YPdfSpKjZv6mQ6UF5X4YXn565Mu9Z5P7ci+BsVLVLAH7BZEY3paGf1jyFz76c/xE1BWFK/b0aUt6WjzmfRd4TaG4JokIVNsfy1vZZ3I+jElCo8huAIfKdaagDZ6DOlu+maQEsF8tzrtYwR8w9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUxiB5tu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUxiB5tu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso22031095e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Dec 2025 01:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766221554; x=1766826354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVw0aWse2vPhALDrtiy2o4KqkTy0qvB3phpySxD9iBU=;
        b=sUxiB5tu4BqMJL+YCHWPtDB7ip+7uz1gar90lqE5wFZscDmhYoUnM4MWmLf2Bv+2aK
         DlPhkhHZDLwXppy/TeQdo1ZaSPPUTh/WQR3eZY5I1KSh4SrdBO4yLD/udPAXWM0ZXcCF
         kRrBtmJGf/mZ2nN3yXvYr0kAxV1JyFGauDitcCTrljNOe4CTFqx0/LSn1GjU9gHkJ8e8
         LWKhljXClcUJg39lKb2szjiLknBi/bIDN/bTiovuzKR/ivKV8uvLZYv2FiuNyg3UbvPm
         KsxxlZHxpPHB8gOss/rQpSi/SEKIqI3fKRKYEfS5goMGwejrlgOAuey0oTZyTHpS2meP
         ivHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766221554; x=1766826354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XVw0aWse2vPhALDrtiy2o4KqkTy0qvB3phpySxD9iBU=;
        b=N1kfH047Yu+Mf0BR8cVCMx2+cdqIforYIq0K5oBN4GRI99LbOyLXquyuLLBMp5okFH
         r884WbPnjHKcjuB37JGnDxb4Fncr9cweywfWwr9OxyzuUoS8j75qj1pTC+TwNscUygds
         KYX1k4RvhvXlJA3LHR+QxFwlJ56kyNQoZ5PLoMpFNz2qXWIJzWyVmNRiR3rbcuzrgL6Q
         TlOvB3grbRn4PSESyHE7ygtwi5Ao3BqDxOhiIiFgQI7rhwuM1taMHxH3yt9G/wY11v3f
         NX1TU/izDni1S0PvYOX55x80i9WxFmQ5nX9gsGxfa1+maifh73YNyuzCCvH5z+R6NLY4
         qnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnqccApY2wIg2gTnpbtHhwGLQwta24WAALT8+E21KMBdijJdZXgT+nZV4cwe44RpcRdDwNzgkfWA7vNuI/2pOcEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGnPP/AsLeYXM2usXiybyEy6v1QmY19HrjkRhxS1ox74yEysf
	dtrcYWgGKhx7hrjJFtzZvnsPvu5Ith5tX2xhlPzciA1qcO07pprZbNT25jvqLFhlOSM=
X-Gm-Gg: AY/fxX6rIL6eEJr0q5kDgHr0fc3eIB3niuzYKA+asbgTkfVcqvrHLrIvTURnQtJUeIR
	ZFyOKlNMzyDRuXdO95SKIqyuiEFgmqdOZhvilkaerb0WNhuLZx/LJsmUHvOJZk3n50alzRb/r0c
	sTvQ/T5tYeN0H/2/ds5grG3L84QK/u0p6gfMVCWRwTIv+BOrIVSWCIMBjMW2ob138Y78m49a7aK
	c3UwU9aX627ZkVS+cg6CM8xWrzvjTMfwTObJYg6PzUVBTAgnXb2XcLgVLqS3ua7kyrWanDrKDiJ
	eG+j4jCtBlez9LeJ8YjPgH62pp/+WaLMLhL4MdtroEIPZsHyGNxGEN3CX4lqsxYSdPPU/F1d19j
	HS7vZagrFdVA/f21OycURNDCOXEzj5IP8sPLAl/950IcA8pWPcRYpCx6uqp4OuWWPgqYCrQ5cIm
	Q1tvAaYtPK2oh+/ocJM+D3zcqteHI3FBrCHDLKCv0=
X-Google-Smtp-Source: AGHT+IHm7esSV913JpdZ+YNyx0nqLo6qDaknHuHbwAmvI0v8Wnn36TQkgkaeC8uL3ugSC4TXAIGoqQ==
X-Received: by 2002:a05:600c:620d:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47d19569c23mr60792875e9.16.1766221553759;
        Sat, 20 Dec 2025 01:05:53 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm88466685e9.8.2025.12.20.01.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 01:05:53 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 20 Dec 2025 09:05:39 +0000
Subject: [PATCH v6 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-automatic-clocks-v6-1-36c2f276a135@linaro.org>
References: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
In-Reply-To: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2882;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=bUKPDLDgvyDmiCQQmMkKtxjUpJMIVvdlMfzNhg8FZ4I=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpRmbtf4HhlaQ6BY7Iw6T389W5xKye2Rc4k0PgV
 PmqcNLorLmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUZm7QAKCRDO6LjWAjRy
 un+/D/4puNY+0dl4g/cgXGWqZa6pGPbTlYDisHMcXVvoToKPpj99jEPpUolN+8x04z7ayoFFfn1
 goVpUIp6PRJyLMBy0vEERO47zp1u7CkFIhPhgvqium9Hs8KyfskVBD18nXqd4Mw0hhGmAH3EVkG
 eXUtSs7xDZxfqhX5fIvn6YHpgdqi69o3g3tAAC/99H5YgCmnehe5GGSlnPgKionfjdPUwo2R3p/
 AyRzWJMPDXs+72NxewSTQR8LdwvVPLp2YOk03suCHG5h+vuKgvnPa6omSXu9eN13aGGVkpJzAWZ
 wSbyGrNTGtm/fuU6dkNntTqptaTdXJPBWNFKRmF4jLGyBmcW6xmk9er0qwOqnGWcRwCgT4g7RE+
 WtNYOuNxtzvkMgS5uDVLekdAcH+OiczykTG21Q8Sirx57TfCCu7/QWegwWvTYMh/S8Lqxzr4lZv
 yQV0RypJikvza8EvKol3LHFShVF0fSfpNQCSynxoW0dAuI6wwK0575PeK9w7NlyCuFfjPj7vVqX
 FkBKLvVy5pfYRrB+dqVlOJyRxr0Bjqv3ZAda+aR9le+uGj+NVWmDhNJXY88AwoOuTOrv0hEcmnt
 RnESt47SMVByS2AjZuF8m/dQGqNS6C/RjMGT/xldnPixsfTaeT7U1sarWIad/v9NMch24lNiS6q
 fn7E9263EZC9wYg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, to fully enable dynamic
root clock gating it is required to configure these registers. Update the
bindings documentation so that all CMUs (with the exception of
gs101-cmu-top) have samsung,sysreg as a required property.

Note this is NOT an ABI break, as if the property isn't specified the
clock driver will fallback to the current behaviour of not initializing
the registers. The system still boots, but bus components won't benefit
from dynamic root clock gating and dynamic power will be higher (which has
been the case until now anyway).

Additionally update the DT example to included the correct CMU size as
registers in that region are used for automatic clock mode.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v5:
- Invert the test for google,gs101-cmu-top (Andre)

Changes in v4
- Update commit description with additional requested details (Krzysztof)

Changes in v3:
- Update commit description as to why the sysreg is required (Krzysztof)

Changes in v2:
- Update commit description regarding updated example (Andre)
---
 .../devicetree/bindings/clock/google,gs101-clock.yaml | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 31e106ef913dead9a038b3b6d8b43b950587f6aa..09e679c1a9def03d53b8b493929911ea902a1763 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -52,6 +52,11 @@ properties:
   reg:
     maxItems: 1
 
+  samsung,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to system registers interface.
+
 required:
   - compatible
   - "#clock-cells"
@@ -166,6 +171,18 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-top
+    then:
+      properties:
+        samsung,sysreg: false
+    else:
+      required:
+        - samsung,sysreg
+
 additionalProperties: false
 
 examples:
@@ -175,7 +192,7 @@ examples:
 
     cmu_top: clock-controller@1e080000 {
         compatible = "google,gs101-cmu-top";
-        reg = <0x1e080000 0x8000>;
+        reg = <0x1e080000 0x10000>;
         #clock-cells = <1>;
         clocks = <&ext_24_5m>;
         clock-names = "oscclk";

-- 
2.52.0.351.gbe84eed79e-goog

