Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C0B1F75A6
	for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Nov 2025 20:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762115253; cv=none; b=YDZgMDthKljCOxYSV4o/40uPakJmHsXUd486YRjnsHbcFKsF7BR1mthagjE+DLhN6NATK0lLo9GB6GkgrhC0aO9eAjv6CZzQLdXqZpwDT86Jw86FRc+9aNMaX4Sy4NfwgBJ6GdCIu7NCn7KjDrHgEeHO40TPi4q0Va56Dj22ppg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762115253; c=relaxed/simple;
	bh=rW93Hlr4vcum+GKJgXc1ajFfnfWqcxUHYUOR3Zmf44g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttNTy+rhM+e6UWKQbM0TFijgL7PxO64BQO7P6Kfz/l6WXtliFO0u/WXCJUOtVp8GQz22wUG4TuRYC+ljquUmiUb6rzjNEiuaFr6U8HynqCHQJuaXRey6UcTFzfq5oErN26OmPW1IzIxIwTjlFsaQgobUFFC03GSEz0//GXZDmYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=spPclBD/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="spPclBD/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso51122365e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Nov 2025 12:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762115249; x=1762720049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqwzmV8ucm9ZpizFb4InEfSGE/OBpMLcQ1DSFma1Oj8=;
        b=spPclBD/+xF/1VDujn3fFq7tYrhrEkpEAxmvtImr4ddLUF9DaiV0DiJ3cMs0jsANoa
         jp8m6v9yoLRJpmVZOsW7tqgIl9ohdP9G2aPy3HClM2jQ9qhLCCZUrgGCa45cFD5K/+jA
         jST7JeGyw+NNkpqgAWLVnFC3DEySjKh++WCtOgmxBQVRm4Go1mkVZTf5BRd4iOulyK8m
         Fnoq51tykTYEFkAGx390iGC5Aa2+qjEGeCkAt8KSFw2HzeMRX2xxDubo5h1XK76+VvQr
         vehHxG0slZjXO0GSdkjwoVsdXRUo5V96VU5xQdjb148GQyPQafU0xsZfVxpZFV1aLIHh
         Zh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762115249; x=1762720049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqwzmV8ucm9ZpizFb4InEfSGE/OBpMLcQ1DSFma1Oj8=;
        b=uoqn+h9MGxynOhXU6mHhhnBa8tKsGJsfBHoALt+shgVYO9HJxi1V/4TrSUeXLXA2F8
         zPwBqWg9kvFyw6Le3iWLbyzTwuEsitZXBAq2DzcoWjgyhsqcLbH78hPKw4AzeEhowsNh
         Shtz/8GKozFKQ40kVxaucVnhvmxKNKGwZTGaYrBdvfh9rtZlEqBoYlOMkjA88rC21hBW
         aB4YbXrkJPhhER0SU1yQYwCFo+ZhQDPoAVAfwYhmuV76dFd9gzYn528idPkf1EFU/UAz
         Mk9oeDeFMvX1K9f85sqUU9ty03xngGiQYNC/Qm1esoUo80wRYoFFUh2Hcg3Sp+iUYJiQ
         PwDw==
X-Forwarded-Encrypted: i=1; AJvYcCUXphNjxmJ5SOWFKOnNsMcW3h0ukBX6z1geR7grZR7Ajh/MpvJLRydkaOM4pLPIlkfv9SlbH3eQDVsMhha1iRjuEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpyuZPJinJt92EOUKNNlaGZ7AOh9kIpC95Y3hUpJ7maYLFlqbb
	biQemU74Syeh0IteoerzHJVW6v92V+9jozHQaBJtw3caWozv7LRtDB6Z5BBuwFbOdYk=
X-Gm-Gg: ASbGncuvNfXFDO9w/f0mmxTmbaY4E4UT4SHo4+yXfbTbFXqBu6wxKlsrkSDh5ogpxU0
	RK8VGLkwOTY3VekSqPZbsa9fXXWLOHkIWM7vBeHZqv8ACVnGtilCVyttH24UT6wTayfFkgd84+V
	7M7TVClW+w5swo0QgXex15ksb4syeoB5h0L22ycIQi4kI+u2MVPHGjoksDDbnUAEmQSKY9ZcsW/
	/0+9MnHv0918KgKmes+McBZQ7sY+qFT0p5HRgrGrwJ8xMRINCw8V5uCvNjrSXM9yv1erZJlx23W
	o1bFWmPvBiaP1+4cfQrFxQuK3EegCWRx14to9RCq07Qw8+ShPkvg5Ud4XhtJ3ld+ttdVbOPBLzC
	WP9reZEXP2pLqDrGtUI6gbF1IriZ0UrZfRUmL9Y1NXJPWlvBugq1u5vwZMra525ouafz41Swz9s
	kXDu+Sc8QxB4+AoFWT+qBLVxmJriaZydQGq9GvQsvaDQ==
X-Google-Smtp-Source: AGHT+IHO6Kj16XZq6wFeuaf1RbffW2vio8belueyNJjXBAP6hwWK/ytmja/cRAdCXN2PlNhsCr1t1g==
X-Received: by 2002:a05:600c:190e:b0:471:168f:717a with SMTP id 5b1f17b1804b1-477308599b4mr87271515e9.16.1762115249274;
        Sun, 02 Nov 2025 12:27:29 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c374f84sm114664165e9.0.2025.11.02.12.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 12:27:28 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 02 Nov 2025 20:27:14 +0000
Subject: [PATCH v3 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org>
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
In-Reply-To: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=rW93Hlr4vcum+GKJgXc1ajFfnfWqcxUHYUOR3Zmf44g=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpB76svQKBqYy4GDQ/oR5w5NFCQd80R2RbT/sW6
 cO1sayfIrKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQe+rAAKCRDO6LjWAjRy
 un7MD/9tdkOyjZlhnamX0fDBgvsMJET6LH8N8JPdTmn7dkF7GI4cvOuhDF0DKY24mkl1k1t+Ihs
 ynh39V1v15ZLyrpKTDjD3mTCEWxJjHRdF2WcHeXr0w7Oi+yuqjZaVcnMFa/hWoFP0kstG4NpApi
 jliMamJwva3OATI1hqBH08xqxqlyTSztEr79ZOhVR+7ugOcVREUNP+D16BSObwDHjhwJSN3QQU5
 MacwZsMYrD6R6Ym/qMH3MDnjj4TqcuLCzNwaAl0D+/UsgZ+wUIXBRLB/0OkTMOrwhuySjw60yPM
 vzJF4IXTtPUygBa+75pAPGUhnHtMrCD/MQkXTPlahGD6knkYwPnALiif3neHHcpNdEytS9cBGx1
 //Q4tvT53ZaPER/CbhFZMvkwWv+EiMvgnn4uyS/zCD/Lgt8vaHmCpBvxUpb5DkjNKUger87dwoa
 LjICe7n3KKwbVNrd20GQdk5MVmUBucaQ34jDCJMJOCtU5DYUGPccAvlvDhVONyHhe1ocTkSTz8g
 9/7o+kOtywqhAdi11O31sc9s2SO9m2oA0wUgEfWgY9Jp6F1VkoAz4BrT9yRskKJIjAmrRuRe24j
 2Havbr/MOjzlFvNvgqXHx97qAyvrYsMt9p3Ck29WQ2muZ5JZb1soWDVffEKo2CQmJmb+Lx7namy
 /7yR4IgeWDLaRog==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.

If present these registers need to be initialised in the clock driver.
Update the bindings documentation so that all CMUs (with the exception of
gs101-cmu-top) have samsung,sysreg as a required property.

Additionally update the DT example to included the correct CMU size as
registers in that region are used for auto clock mode.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
- Update commit description as to why the sysreg is required (Krzysztof)
- Update commit description regarding updated example (Andre)
---
 .../bindings/clock/google,gs101-clock.yaml         | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 31e106ef913dead9a038b3b6d8b43b950587f6aa..5ce5ba523110af3a2a7740b8ba28e2271c76bddb 100644
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
@@ -166,6 +171,22 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-cmu-apm
+              - google,gs101-cmu-misc
+              - google,gs101-hsi0
+              - google,gs101-cmu-hsi2
+              - google,gs101-cmu-peric0
+              - google,gs101-cmu-peric1
+
+    then:
+      required:
+        - samsung,sysreg
+
 additionalProperties: false
 
 examples:
@@ -175,7 +196,7 @@ examples:
 
     cmu_top: clock-controller@1e080000 {
         compatible = "google,gs101-cmu-top";
-        reg = <0x1e080000 0x8000>;
+        reg = <0x1e080000 0x10000>;
         #clock-cells = <1>;
         clocks = <&ext_24_5m>;
         clock-names = "oscclk";

-- 
2.51.1.930.gacf6e81ea2-goog

