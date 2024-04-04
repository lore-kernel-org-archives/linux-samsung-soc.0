Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD8C127B69
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233580; cv=none; b=nIMT+2JG5r4ykcz8hxhQhNA7v7XxatUxuEZCKkn1G8Z3a5xoc4hMjyImnwHbKVV4RIHue6e2l+Mb49DHIq/BQFR8RaUjo3+BdkI37yiaqeiHVO7SRGXn+XWmVjLLeqlUaRrXm2sqIN4C9uh3Obs8oQO6OKnMae5qcjOUlqGojjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233580; c=relaxed/simple;
	bh=2q8gij64Ov8TqGR2w8c78XW7P+5rgnWSMwbThRQDZHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z20mSqHIkrCcA230aj0M/h/O29PEUedEBzsU9CZQRWyzg9F/3JgZef4q6oU5uKOAmxrF4Qwg7XzueyuM9mkmVuBW8IPqKulFCurPKoy7NxYe848eGX9QteIA3WXy4vkHC1rtR/Mgb4yPYdaiFCOMo9lX8Gad7O8cmsv1EWsDePk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rj3iFcEm; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rj3iFcEm"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516d16db927so204528e87.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233577; x=1712838377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d249q8OLaMbSIVMmFzjKWfEr9wukeZUtFSKBwYI0cD4=;
        b=Rj3iFcEmapu965Ht/c98I+poCEk8ez0iCGNzQrDKCKJLJMfshDIC6WO3JyPaGhogLi
         ctzgdcGa18SRItRnha0dktzITk5C36WDwaysfQnk+pRORCMASbwesUQmAUFEQ5IRzC3g
         exkCOGqUlNPl3U3Zll68SNOpdU2l+KpLN5V4xBseMvXnzH/gevD291sYUm19ijObX7Ff
         pf9Qq1ghXkgZl5Rn/6rM7O6gLqWytcD0B+0XoFw3/1fhFDwrkA1ORSBcWmPyrlnPAoCd
         CyOoOtizxxL3s7mB8eriTmYh1xNVluaUts2CPJxVx+pyBdsjPvCT9kaEeWo8pj1CZNTC
         z5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233577; x=1712838377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d249q8OLaMbSIVMmFzjKWfEr9wukeZUtFSKBwYI0cD4=;
        b=O/OZWE1n3NX2hlmWfHWWAmn+O9hYJMFjUM6zX7PQmAdNQgYiaQ4W3PwLeOW3Jih97N
         uguMctC1ulEVCo5J1R3I2XMz8ZCjAzgEY/6Wuw4Y0p3jKlYhK0TnmB7s1gQri4FsyJaZ
         JXAEP/MTGFZnV0ZgjWA8fBWLaGS1DA4OBTw6y3BSDyH1sLeADGCbfTSXiO+M9OciFIZ9
         gmdL9BVpdvaM0FJTXmYDcAA9ICZi9qt54trT/JKOWmh6pGVd7lYaVHmCDDCZzY4BV82a
         ucPSG8CNwZMwtQsG1LmHGS9/DAi9Vp+mU7AkuXnPLuA6J7IQD5RQWa2tuS5jbDz5IA/u
         uzwA==
X-Forwarded-Encrypted: i=1; AJvYcCUX3mdVtFgQO3q/59nx9AwVlGypBnWnVPcooqb599JwmeMML6OmDr8s3pCsy4ewIUdsRk/FCMAKJNU+ZPIHwxXKgQiixwsm4abEIzNNFiVCpC4=
X-Gm-Message-State: AOJu0YwX4Rgqv5rzhIeDRVSckosOU618ecuX9tMrcvg/IWwqm+i9wugD
	S4Q4CGRSt7FBspxqXLqTuVfWnIXyG1sjRIlnNIPBKJAxo3k+weGC37kprRdGoNE=
X-Google-Smtp-Source: AGHT+IHKUb9uxI3dVCBnRZqZdhwAN2Y0OAl2yQXHesVhm5X+TGFWVXPaqh+/KMFU4TwWx7ODQVorYA==
X-Received: by 2002:a05:6512:3a91:b0:515:8564:28c8 with SMTP id q17-20020a0565123a9100b00515856428c8mr1952674lfu.67.1712233577227;
        Thu, 04 Apr 2024 05:26:17 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:26:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 01/17] dt-bindings: clock: google,gs101-clock:  add HSI2 clock management unit
Date: Thu,  4 Apr 2024 13:25:43 +0100
Message-ID: <20240404122559.898930-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt schema documentation and clock IDs for the High Speed Interface
2 (HSI2) clock management unit. This CMU feeds high speed interfaces
such as PCIe and UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml    | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 1d2bcea41c85..a202fd5d1ead 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -32,14 +32,15 @@ properties:
       - google,gs101-cmu-misc
       - google,gs101-cmu-peric0
       - google,gs101-cmu-peric1
+      - google,gs101-cmu-hsi2
 
   clocks:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   "#clock-cells":
     const: 1
@@ -112,6 +113,31 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-cmu-hsi2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: High Speed Interface bus clock (from CMU_TOP)
+            - description: High Speed Interface pcie clock (from CMU_TOP)
+            - description: High Speed Interface ufs clock (from CMU_TOP)
+            - description: High Speed Interface mmc clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: pcie
+            - const: ufs_embd
+            - const: mmc_card
+
 additionalProperties: false
 
 examples:
-- 
2.44.0.478.gd926399ef9-goog

