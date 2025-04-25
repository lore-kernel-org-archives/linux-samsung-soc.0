Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA2A19F130
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598320; cv=none; b=AljgY3u4p1FQJffQKrhFps4mrkVIurTA2zrnPyWOA95HkW577obDu07p1eNXD2DYcjdDZvWY3nY0jtP16EAmJ8GmtqpskTvWOeb6m8sgXQPX0tVQi3Ut+OlkmGJR1v2e+2aMN5fOpBwemcrjytW/sVg11L0+RKsRyhznurRMXGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598320; c=relaxed/simple;
	bh=FMJrOlGR8LTHqC1O6Afl8Jai2Dk/T6WHWfMwiUsHQbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rRMk0/nrR+R7xFu0tTK/3EArk108Sn+YDvlJtck3CDLo5hyCx99TxUcBVBEfXbIh7AF+QJCow1qFmq10LSwHqdNBtsVm0HZe+WYXHCVVAvEvtZFDWT84Zt7y4Dfe+Th4Cvt9BwWEX9JgJs45dzcf/KYTcR3zwHvBYNy5okP+1GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPIxSGL2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPIxSGL2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c266c1389so1756653f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745598315; x=1746203115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwF9CflCPdWCYrp7r5q+/Sk502aNvZmEG4uUszEXbak=;
        b=DPIxSGL2348HWXBfF6EmBboTMZTk+ufviIBshJQRINeh5Sn8Fm2EYtOdC8LVG21PhV
         WmxQ+fAenwuS6MYwoj/5sEILXW3qBTimwyOAYcXnLRSMDpsRja+0qk/8nSi50/LHLUTN
         72az9M+aQ4fc/jCOVeqMsFsxfCEu9tohZZhulDBOTOR30oXpnd1z8oL7uJN973luThRt
         4qvcI+IwY3kmB/nnXQeOs+monOp75+hHQRRGKTmzX43oZyFMGb4FjtCHdqFEz7WaT4M5
         uN8Lf5VNe7viFu/aC0GcEgpLJ9CEe/oVR/RI+MTS8xLgaZ2HZ5vjsbx6Ydi9DgQVjzMY
         yMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598315; x=1746203115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwF9CflCPdWCYrp7r5q+/Sk502aNvZmEG4uUszEXbak=;
        b=FvNC45+j3/bKqbws5bU8CJZmHg9WQv9f+X4AdBhTIPYCA1OdoCoXtpBVcZ8dTwFKp9
         FDKadjCm6nnRc3wmLhoBnMP6NrsBTIKmNFI9d18GO2qsZ9VztvO50xBxFBBsSNsjuxRO
         NffKUvCuwl6OOSielzpswzLVIyQqt29brbAXJZHTfOc8hsZQBPRyVCwbFmYw31mUfLv4
         xX8agVztt/bnegKMQhgd9R+zTRtm2d5I/6DT2vb3m2e0KGbZ378Tr6gDmupueHKbRA9w
         cozGHh8f6EoCn6opuftrHl0IsNbqSp3PeekbzU/dP7IMtseYQTdy0nOXlzRppHlEQm3U
         Kvjw==
X-Forwarded-Encrypted: i=1; AJvYcCVVwNI1iIUgc514nFfCpbnMUd+vdtdijDe7KG0z0OMwffmKfuCVymyc8ELQbCAxTqZyxzngkrPSa1DBe/eIWgN02g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqeqKBR8Cr+IoyH2cZqMQqfX2fHmMQHNRcG1tbgu45QT9XhbJY
	WvSnHZ6eVZHvyoq0pDcY+dPoV5+7ZTjgzBrupIIT5jiAZpczxwiDWFN70mL56Jk=
X-Gm-Gg: ASbGnctEOPYFEMSgT5FBJPY2sMzz/NHQdCkUoTwRGaTKVju192L3LaQhll3sAWwpFJk
	ny+TGmadbhjmU/+xmlzcd8vBfeMw/WtVRZ/Q9cR0dvOqdo348dAhQLcjq8LBiFLysGx+sbGVM8m
	TYjr5k0S1rgy1KGtLgczC4+6enJ+8tjBfmppmV2f0PaRbzEKoznnGdQK5r8ryfKG54DdomKd6L9
	oCGe3uNWECE8EKqP21oDXEFC8Uo1oqy5Oq8Q7iyRpHk5mVIn46E2NPJQ/PyK1xgOTGSJ5kjSq5s
	6+FFac+4nqRbRLawsyPG6kdmCT45cQ3CjalpgaJ5qyEB+aJiZOnPT7b0Y/7m20ivUKQ2dVTWxxF
	i+7hYI88=
X-Google-Smtp-Source: AGHT+IH27tlRdQmfaEd0vU0ekKrOUtyYgz0T/lcDZ8jxrvySztmQdJ9j631XFVWx4vKEx6N+HkWnDA==
X-Received: by 2002:a05:6000:22c7:b0:391:304f:34e7 with SMTP id ffacd0b85a97d-3a074f15530mr2464952f8f.44.1745598315279;
        Fri, 25 Apr 2025 09:25:15 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm61263715e9.27.2025.04.25.09.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:25:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Apr 2025 17:25:06 +0100
Subject: [PATCH v2 2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 google,pmu-intr-gen phandle
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-2-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=FMJrOlGR8LTHqC1O6Afl8Jai2Dk/T6WHWfMwiUsHQbg=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoC7dl562ZRqMPqicNiLc9QCICsJBZHoRyLw1nT
 HbBSFxv8G2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaAu3ZQAKCRDO6LjWAjRy
 uhf4D/4lCMQMOrnjqdMlIot/ZGWME40KLkgHPG3cgQ4A5wYavbweCTTNv9mDkLoRbwxQahs8k9g
 maZ80JEv9h/hvZGDpzkkQ7A7Pb+bvB+dccca41fkoDlDLRaoahUpJxGKGwLDK1ICKiR5aoIkHQD
 wMKylpxJ5KamU6Z0OeM6r9rqx6HV05f7OHYt3b2NV1o9C82W5U3lCLM+KBwygbLbnTZLWMpyjza
 3V79gq5IhWbyuWZ8ntuUcxIf3qq5OAWZio5bPU8Cu/x8Nc2imixW7VssoQ9oegD5inVrVegp9RK
 bVMJPKayTSZlXTG2OQrtQY3djKCgygoT9Rf/BdIoqjSbwReVTU55qJNGGU1Lp6S52/epuiQKaPB
 3TUC4HHmsmQJMpG4xHReU5KwLb677dzRyR+0T7rdkptRdfPNIUwes99EDGh9Fi1FRBX024hJfIa
 Ht8nb4vrX0B7PK0fPeClYEi8YiHhBVcJpjxvWXbM3uHLuUaBEKg3iXTL4MGbXxm1Z5WtVhi70Qh
 zt2gXctBwo91CuKdTMCeI9TCKwSbNoOxHaYwzUzsB44XFKUEfC8e3tRIMzRxCa3OOldQta8ZctL
 VPVMW2UZwYaRonoyEJ936Tte2TAmsyLJYjxaPDCTEXC1g5YxDglGLr8/YYPIpvc2BWIw4EswpAa
 YY0LPsWYR0HsMdQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gs101 requires access to the pmu interrupt generation register region
which is exposed as a syscon. Update the exynos-pmu bindings documentation
to reflect this.

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
2.49.0.850.g28803427d3-goog

