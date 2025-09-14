Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193DC1DB13A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757859480; cv=none; b=Mg5mKp9f8YV5gmv15bo71OU+Rfe0DXWDYVzAJEvYIrcLWdsAuWxvJ6KUseWrVMJYIhHj3/kq+YdprahGZFcCcHIuLlkaE4qbaK2qZ3ye2roH0Q9UyuamNWvkZhRj5vElK3H921LKpMHGpRXW2dYZafQ1xl5PvOx1LOnHFdoLNOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757859480; c=relaxed/simple;
	bh=DmOsX7Vf/ilavkrwxUtj9QNM909CJQfFtlFDgRHasuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ns/ebF32i0b4Ldl19uMoakndaU284yCuODGOkaZ7u6rk0CAfeld+lnxoly3gvb7aPk0gQAuC8ZHIDwqQ8nWQHfZ8Elc5lTVaJDp0idcjevb0aFfeEdqLrQmG0kOuwW/bViXCa84OnpEbNU385zcRWbn8JjoeCrV+y8c3wZt1tvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAs78iFo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAs78iFo"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so3165945e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757859477; x=1758464277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=bAs78iFo5RW2G8RUQ7HG02HMm55yDkHX3miJkXl+rYXg/Wb6tPWjYpndPMUwU8H3R3
         hHsJB8+741YN65AQqOyF1SgbEEqINfmg5kTrblKuGzw//KTfBybI2ZQbiV9ley1NANRV
         98xB5vSNqlew6HeCNIBMUB/jFY+FtqBCfzvnmMu/fGcQ6L1vx5Ka8U/p9FXwQaKDLjEY
         EV0D2Ix80wG91CfX46o79g2/B8V6kaY/tS68EbgGTxc1IW/4N/hhgFBjHRFiN5kIZDaE
         CuLS85e6a7+xlSppknHLwLOlb+qX1FNDMnO6IqfN/HULsrNC34nCrC2VWf3iaZm0mShS
         byJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757859477; x=1758464277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=ukHrW8yURXAUmByIJ75YNqTQMGxXBP3LvSG1qklTpnrbajmQ3OsbNsY+lppM4o9dhv
         53VGi0aybEn5njrt//wdAFwuDy/wKMy06IuzcxzbxDveDRgYH1DXu+yurqNWfD/64uxP
         FrQPoK7FxfrymtiCh0ksYmaXEbKXxXpxZcZZDPpsrO+GCW/8ybqbw6Ofq/FRWPsCbgEj
         d4TgxPDwwK/rmFimuBie7DTHlLS4Xnzu9oEghWUrb0M0RBCCWR048T3/73lYyBQMriCA
         p5aBOBRe0BGi1JMfwmFIivS98Yr8Qr2zsbq0Hdnf98EUfts4Q/R1StrWp76gAW9xda+R
         QupQ==
X-Gm-Message-State: AOJu0Yx/isYrdDJpOU/Ck5o84V6/rHYGj/FuLNvIz/x3jGZf3zKDj5oL
	+niJRAPlcR+XCjrXg2ZJeIF0T/Vj2gFnmcLWeBFX+IxnPTbMt5hdNU82
X-Gm-Gg: ASbGncsUkoOE9KdgCIsGQWYuBzlZmEhcOQQcut7/j32XUmsHwyrrIS6SwhHDD6WjJXO
	EvBPF7IB2+kZ0SsyRR6VhVodJ8mLvxx1fFzLqelt2MWfOhwNv/2Bnc6TePcESibn8LvLXytnl2q
	Y2SAPIf1ucAI6nZj/qaQckk/HvhItLA+5ZbNEjLaVZQL8uK8n0guBWenKW8MFW8NAzhdpz3ax8w
	JWUGgGwV96wZalDoNelUFi4znehjDwZbYRadGKuleBQjHhL75ncqsjBMwOyS9/VEdwgk5r0CBgL
	a8ZcNGCIYxfqJGjF4kSSTbkMJALFOr7cqKo8RM6/Gp7+CyWR5PhywcniQQYdDsWVDPt+DyMBogY
	EEicrjxQXXMJOrWAlE+aZ8y5Ih/znCQs+vq5JqQ1QNEhO2Y7NLTNxs9jo+q7KpQqdVAm6FUN6MA
	==
X-Google-Smtp-Source: AGHT+IGZa2TxgX8agd2exKpvk7TmNbKmYcyR1Hha+oaP27Kljq84rYHxWKx4npcT6+CgUwnc/mAUug==
X-Received: by 2002:a05:600c:40c4:b0:45d:e775:d8b8 with SMTP id 5b1f17b1804b1-45dfd5aaff0mr93879005e9.1.1757859477068;
        Sun, 14 Sep 2025 07:17:57 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e813eb46f3sm7319270f8f.23.2025.09.14.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:17:56 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: phy: samsung,usb3-drd-phy: add exynos8890 support
Date: Sun, 14 Sep 2025 17:17:42 +0300
Message-ID: <20250914141745.2627756-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exynos8890 SoC features two dwc3 controllers with one USBDRD and
one USBHOST controller. Document compatible for the USBDRD one.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index e90640320..2b1544baf 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -33,6 +33,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynos8890-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
 
   clocks:
@@ -209,6 +210,30 @@ allOf:
         reg-names:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos8890-usbdrd-phy
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+
+        clock-names:
+          items:
+            - const: phy
+            - const: ref
+            - const: pipe
+
+        reg:
+          maxItems: 1
+
+        reg-names:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
-- 
2.43.0

