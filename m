Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5645B2580F2
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757861771; cv=none; b=DRotmwJYsfdiuZDjWqc7T3v12TaSRV7atGdV34sV2EixrKBKbt1/EUw80FQQISJRPUEp0k9Nd9biTTaaN6AQe3YNVHU/3wNb19FDgRzAXh8JgxwKDm+iVwnTCqy2ZMfjXVuExEpW6VpZafaBLd7kkNfDQIsjSA4qOu0saKEYIeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757861771; c=relaxed/simple;
	bh=DmOsX7Vf/ilavkrwxUtj9QNM909CJQfFtlFDgRHasuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9H0RxIGcHmfLAnguptJk48gVGDHCZh8SESlMNzdYtbAFe+0eR7JsoFCbgCmxCbdhURSticXncO6uCifva+HJ5MnHMLxOynpGgPAXP+lPDCo6l3v+eyBhTXZr7YFzGLh6EJa+E190w9zp4UAycrmeErIgsgd2P/KSYCRx9PSon4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvZ8pmIA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvZ8pmIA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so32201475e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757861768; x=1758466568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=OvZ8pmIAEwMzEhOFajgfPj3NDMK60UunkabtZBVnArGBeH+tHc316Dt3KL4Em3zYh5
         bd0zAS8O0BggJkH7sE+i2Y0YFTk4j8Hw4U1u4KSVMhy9iaMwl4SxnfVEqWwDY5QAKsQ7
         SHLKN61EeT/4OAoE59lKLi9BFcmNd3nIi2GukqQFFui7CcmTqw6j4l5aTJLk/Xo9eWSW
         GvIiFk9gC/dwNh5ojDizp5BCUFo2edvzpv/97PMSnIV9Cmlfra7kyOc0Ow2T148JOizV
         hydUCB86z809yOuaYtfNCApoDuc7DSx4BsQwgXtuTBWArQPolIOZKZ4vLpkvlwf+8RUO
         ugTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757861768; x=1758466568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=p3pjWis8ArrhnIpcRWTas/nKasOOEkoHka4sy8OXWBOr5BhlWOsbei3bYsZO0udIeH
         BtPmAw3/mHJGIXG4vl9Bo8Yxfhs6WhX0FEw3BD+kc0E4/Sjx8i7Pm+WmElztyqWy/olM
         E+CcQ53SHu/GMaGguw0VtU+kuUfaO+GYOu43v4mQGBb3HnihZrLFAwSEHJZRlMaY3t6H
         snoZEWY/AsdE/Q/9jO162w+tDxaQpIes7BbcdYihtzaqX22syCJBMN+Ed19pgO8QIZ62
         iogviKTzDIYdnrVJg2Bhc8QL/3E4V6ZZ6mgsZQSxLTQVvNZ5AWblI21Ek03f+QytXBmQ
         82xw==
X-Gm-Message-State: AOJu0Yz180BGb7DkUV9YgVscJuRsK/UGToSlYj9nDsw6fC434LDql1f4
	OYU6JQpfHkXjk25MTDuclns30HOLH9UGKSsM/bP6geeCK9zVAx517fxI
X-Gm-Gg: ASbGnctpDn4/mhX7qZJMPPtfgjEchBFZhZ00Plx8rTpguTwfFth0+59K2+Ej1BZfsM2
	FZQ7VQRrqXmfBNuAfD++o5Qdc5pz1hAEOpf2lHTzCBteCkcqV8HB9e3KrPb4A5Sw2vVVpRbhWY9
	yC9FJUPn7VCrf3kD7Vv8VzBX3fd4v4ZumdoHYMjH6zsEygW8BhSky+c0iL6CyrCbxp6eJd5xjcM
	QHLtWSFbJKNlF4NVnUjCON1IGrFp6PdCY64M1PURkif5beFbIG5gkQJRlxvJ15gjLBHIK5oKjZn
	8yRm3FxyM7GgGYuHOj/VR6/xvWR1rAbxb+LIPJ814axUfMZwQP8eB6VMLLc/KpJOQkXyic3DHJt
	pJNtJvojw2c+MSDia2vOWoaE1p/Bt14wSlSt0NeaUy1e4ltqIZbrg4Fp0k1wX7meb39c2QcMyN7
	iBjbV9u0wD
X-Google-Smtp-Source: AGHT+IGA9P0DPlT3qLVqItOCiBENzd7lo8jFqFbJSSw4qh0mrbF1bC17C9VB8+t7dwhrkHYrwMRVbg==
X-Received: by 2002:a05:600c:1c96:b0:45b:4282:7b60 with SMTP id 5b1f17b1804b1-45f211fb7c4mr77463375e9.34.1757861767382;
        Sun, 14 Sep 2025 07:56:07 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d62besm136303475e9.21.2025.09.14.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:56:07 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: phy: samsung,usb3-drd-phy: add exynos8890 support
Date: Sun, 14 Sep 2025 17:55:54 +0300
Message-ID: <20250914145555.2631595-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914145555.2631595-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914145555.2631595-1-ivo.ivanov.ivanov1@gmail.com>
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

