Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3716514264D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 20:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713903589; cv=none; b=pN7P71WBWm141HFtyTmjEfmR4tDCnEmlYn9vqurMb/lV30pk7n0o5mCAxZdz+z+2FVthMRSvCwjWxKvBwpNqstnwMYgG1i8IK40f0hOIluThuAKePn7cu8IC38KfzrjB2WIUVH/3icFIytpL1vJeHydjTopLMJDf+W4Z3TJUTTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713903589; c=relaxed/simple;
	bh=3CzwqGzDuhmrqft8+3cpPppE4Eh6d7hkdadYYz33FRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0NI07zLO9T31i1tWjEskSI9obOgOonzXhGsAkGx/h/LNSLiNYdV1Pgf9Y4mu63m/tvLggUGYeioVL1aGaj9Wv1whsJfnwWBfN+dTd4HinC5Pdnp54UDbluCk8pX8TvHcr1YjNYOxKuW1jBXkS3QDxGAnR5vdkti0eRNpnMrp5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqqOFXh9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqqOFXh9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-343d2b20c4bso4875473f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713903587; x=1714508387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZh4v0xh3rOUzx0lgDgNEZWx3gWz2MaFaaSz5XXw27A=;
        b=ZqqOFXh9/AbTkJ6PmLdhr3OIzWE2oKYsAi3VzEUqQh9pPVXFKi/ox5kjBU5hw/REQV
         0oBveYl6Sc6O3mPhINAAULrddynsyS6hzAHnCp6eqLA71xeqnQlYiakWeFIn4+t7xFmF
         KDBkY4kaAXgvzTlUQiR1ZpEZCu3LqIGvI3b5+Wq6QEp5cxdfYX2NX6CO7kjLl/WwJJs+
         PLyFccwHKDrUhMLF+qWZmeUH77fTGOHd5Szmbhz6GtzsRDFBUdfLjrO5exwB6bdO2aQW
         38IFB9KIEUiI+m4On+8XpaxqhCZ1qXqI5PzumKKkftfqyFcDO/cTpzGxrUmdqEw9yWje
         uKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713903587; x=1714508387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZh4v0xh3rOUzx0lgDgNEZWx3gWz2MaFaaSz5XXw27A=;
        b=DZp2elxrhC0O7G1nbcjLGeyDkTJenVriVAYPQC4MaCWXbTrNOFXLocttmuW09pqWvz
         /DDDUK+vLVG5uZ9Yt5+8KPEulrFZPdF6Kbo0UnrjQfV5IHTPHLTIWF18yEpskjJ4LgDU
         8ME/0wqWZgPf4oZ2f0+BlNZhohXZFTh3ooLjMepBkmOceA6QSF3J3EI8hLm561Gx5/NG
         9rqxWlYIfj5GyKkdlmxGoAwNtdyYKBOnnpjClTt06STFHESX66DByo9oKc4MFEis+goD
         MlfBLwK0kHYlScEZ00a9DTzEdAdrVzKVOtpavAjh050giYq+3CWt+/Q3IvVMuwU+I4zt
         LHHg==
X-Forwarded-Encrypted: i=1; AJvYcCWk21Gq6zTdcMQRzQjmPxfHTFJjWmq+SwulPkWAIKSZV36ZFlgtVd6p7N+Ci9hUcUsf13FRWN55RcIWGhxeQvCsM3T00cdyiehFYxOdsMYqF6E=
X-Gm-Message-State: AOJu0YyFe4RQXKN6DdO9FIL8pogTNUVmg6GfkWoQYKnprMhisVJRx9Vi
	m5C+4lg3vJOzeuPNRq+hAsVrz7ei9QPnb8T3Y1hDRyYyVyhDEui+1P7l7EIjqNc=
X-Google-Smtp-Source: AGHT+IEVk8IdQBDdbt+6eUNjL8ZwuM4GtjoAlH1F78ZTMRMT6v62264S4wc8kya9gMioEKJPj3KZJA==
X-Received: by 2002:adf:f18f:0:b0:347:2055:f49e with SMTP id h15-20020adff18f000000b003472055f49emr183121wro.33.1713903586677;
        Tue, 23 Apr 2024 13:19:46 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id i7-20020a1709061e4700b00a52244ab819sm7552431ejj.170.2024.04.23.13.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:19:46 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 21:19:45 +0100
Subject: [PATCH 1/2] dt-bindings: usb: samsung,exynos-dwc3: add gs101
 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-usb-dwc3-gs101-v1-1-2f331f88203f@linaro.org>
References: <20240423-usb-dwc3-gs101-v1-0-2f331f88203f@linaro.org>
In-Reply-To: <20240423-usb-dwc3-gs101-v1-0-2f331f88203f@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

The Exynos-based Google Tensor gs101 SoC has a DWC3 compatible USB
controller and can reuse the existing Exynos glue. Update the dt schema
to include the google,gs101-dwusb3 compatible for it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 1ade99e85ba8..2b3430cebe99 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - google,gs101-dwusb3
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
@@ -55,6 +56,23 @@ required:
   - vdd33-supply
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-dwusb3
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: bus_early
+            - const: susp_clk
+            - const: link_aclk
+            - const: link_pclk
+
   - if:
       properties:
         compatible:

-- 
2.44.0.769.g3c40516874-goog

