Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995011D6195;
	Fri, 21 Mar 2025 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568025; cv=none; b=NUHS4Ib21Y0zbBLvl3hpbyTKlYKbm0yrp8kDz2NvWfmAFAt+T/PWvN8hedAUg0PZCbqMl2cCnTZGHeaxRO4hrJAwStFsswZaPmpYuBw5SEcpHvdZfpbn/WJyBrreYqDwXXCvaWnxCUpcxweBfkISkcuQnLlXgQpZ4cUxqgDMiuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568025; c=relaxed/simple;
	bh=WTw9fvP5/VILMPfomhOfqbesRpWzpD2Zw8CkUCDp+9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQnLRBwZ8MRNJTPnGpVbIzY/Lei9fnr1Es9o7gw9sKS6IWa+b7CF5+zVeWv46mqZNfIPu7i3j9IIu531ijL8FI9tY2wkV3t8srKQX0Qu4c/gdvlS6k1TMmjgMJ4Sje+j9lM1n6JRBtBs5MgTAnXRXz8m2wKssV4jSo8B7DO/oqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSyRHJs/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSyRHJs/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f2f391864so1156825f8f.3;
        Fri, 21 Mar 2025 07:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568022; x=1743172822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LoofhK/wQGr/+9KAmshAJ8mFNKJgp9hRkahBUOv2q0=;
        b=LSyRHJs/DLLz1ath4YDizggJpZerimhyLhk6/K9jzttBNvxrmXKBbgn+2pNl9wjPju
         Qt4TctIBbAemK/8yhoVTZRZcq+zmG6BiDVag0a7Fu34YYZzbzOVCGI9tA0DHKvVHSV8G
         pCJTdyG3J18EBkORhXiqiHiPo8wzN7Tb7pLiqTvy7Al/9U1tDiHkQ8YwxZokBX6L7Lxa
         +2omhfOi4BcOlbGfMwIGudOTwL0YK9ekaqNndvYfBVVMJepGmXluucP+e7YvrI7zv/bX
         JklxbTY7G+bF1fQ3xy93kLQ0ORA6uSDWYnmrxsim6vVsNihFMXqQRaksRa/z4AVQFmYv
         fzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568022; x=1743172822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LoofhK/wQGr/+9KAmshAJ8mFNKJgp9hRkahBUOv2q0=;
        b=LoL6v0EN+Zb/0pZvr9JbPnrfiwK0ZV2xLDjroNffZuU5pBXeSTxjKY1BnEI8QrKRh0
         0qXRIK1lkIv8ZMPr5yvCus44npcO9FTLySZAlQeVypwRExjWYxO6hJ0Ug9juAu8m0Ead
         dKp/BXJK5IWiPszpEyWnmZ1oyEBLl1hqEDVfD3usDe5U8vK20dDpz8wkPEAGsbtphMyZ
         ZNS3/iPp0lRDeaUI4rUrI7Wre0uyvouzibtlLPAltIQPe8RxyIIK3nTEZzk0irhO1FO7
         /T/4jPto3xMcT59f8XaZPAQiVB4kjQj4FsPiBrWipYSXpct+oTV5yTiTme2PeVfGlVl8
         fU/g==
X-Forwarded-Encrypted: i=1; AJvYcCVxi5GjRRCk7ePG0JIlG9U330C3wX7p+l0vJDfhh0in/KO1tGPutf7cYmEXptaLTa2TCvo1AvOKNddrFvw=@vger.kernel.org, AJvYcCXI/BUuCExupsIb5DuSjZtsGsEmogblcWRxx1RBpYRIeb3FdZswZtctF3PwftFn2vykzQzhvKvbRzywox3Fp7NIC9c=@vger.kernel.org, AJvYcCXW/pfCb/n2PYsJ+uIMc2r/wg/og2MiSkqdN1+hccIgIRI2yM+lRzMEdtgWBYR96SzaiovVPJlWgWq2@vger.kernel.org
X-Gm-Message-State: AOJu0YyYVzH7e7lqWF09blwU1mpQF2O4kY99KCDQAEqKFPWExL4U706A
	dIue6fWVFCQEBVdi0chYXcG/XII9LbLogt50b4v8t1HYpXD26ZdT
X-Gm-Gg: ASbGncuc7IVAGNk6z4ae6U7SMXLtlC2rqQviMkZ7l9a2TW3jOG13b+YTsc1jB37eGkC
	I2Aca+1EpHOy1LMnAFqqDwh0CscDxfb5Jt3kXq+1paT0/+EmeccHjsTXtYci5KKg3Hng2ckYtDK
	vgt65JbxG1nCiNHv1kQOpq/wfhTMITDgCgzp+buI6REYhgTATIdtVNzBLoZTsa8gNVsEcq0EnDr
	OrpW5c6VrM2KiFuo4liS5czdrcNXBz3ZcdSTteGwVbhPerwq16ydxFoZ0Sdu7ca8UGbZeHl6923
	Dl5Khy2RVH/UEkTkkbuhFa0rMzruAaeaX8+F7eQuHIx8noxKT1xQeikycTGi+qhoYLjJj/tZMR4
	jIgaaDsWvWqj+EjImVZ77
X-Google-Smtp-Source: AGHT+IGKF0/9vMppFQXLfG3fhWhSIXTNDv+iiIejYeyOQ7CuA+3GXv5xqTcwGc75uj4W4ZUzzSuDhg==
X-Received: by 2002:a05:6000:1a8d:b0:391:3207:2e6f with SMTP id ffacd0b85a97d-3997f932d2fmr2949465f8f.42.1742568021582;
        Fri, 21 Mar 2025 07:40:21 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65d5sm2557156f8f.64.2025.03.21.07.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:40:21 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
Date: Fri, 21 Mar 2025 16:40:15 +0200
Message-ID: <20250321144016.1434848-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321144016.1434848-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321144016.1434848-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Exynos2200 SoC has a DWC3 compatible USB controller and can reuse
the existing Exynos glue. Update the dt schema to include the
samsung,exynos2200-dwusb3 compatible for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430ceb..679088c91 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - google,gs101-dwusb3
+      - samsung,exynos2200-dwusb3
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
@@ -73,6 +74,19 @@ allOf:
             - const: link_aclk
             - const: link_pclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-dwusb3
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: link_aclk
+
   - if:
       properties:
         compatible:
-- 
2.43.0

