Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654E215F42
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757859483; cv=none; b=KugKNG7cOdlE9NX126fgo3Pt112x2BYykp8XUJreRDPZl9IKb9x1uvHxGdyJ/YKzQtggCAyNf3GL3RDPhjtTri3vQyS428Jf0+DTMZzz7GS6akowD7VxMZEEnlKEw0n89HAcFE1Uk2kl5QsFmwfaTQR+rXo8bVNIaGg3qdqQVcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757859483; c=relaxed/simple;
	bh=DmOsX7Vf/ilavkrwxUtj9QNM909CJQfFtlFDgRHasuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTDZqnQnm58ZoTUSag5upVOfQb8keYGvqRmVdQaNzBbN/apVcqPrd/rysp7z/UssBYsMdLJk1UmvWGxbelhd+fAGejiOZQR1bh1IvWf3v0SOJfP7ABEwUTZ9cxrmYXJ4aYUPsyJX6dsNcWr7rc8ebRNcx9SRz3EnUpX6zogpPPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEgFIYxg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEgFIYxg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3df35a67434so2035796f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757859480; x=1758464280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=lEgFIYxgLGHYqJn+ddhQ28oIZ/tjQi5GuPHuzoxr+Bn289qSDM276yQyFigIXMPG8L
         419MkelxiTX8SXCa0ngobbcKxNqUdomev6m4ZmRy7r0Os9YxTkJl4RRXW2ttzm+sS4zS
         9IEyF7ffKYegwSe99ElP7IO4xVr8kelRwbnu8iJtfJL4Z9hehRE3DLomRaRQlntbFUf0
         FitHnEM2c3we7suSR/9BdVIktzdXKqbeeqRkTBKaoWoK9VM5Vq9+briz/pu1j7MJHgTt
         vQtFL6OKPs59/xfRZOar+Rt99oO9PBz/cuSAyC88KuhP8jQi03wsyC6/EhNBXpkvEYKL
         915g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757859480; x=1758464280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLnk4ZbyfQe9FhVo0Iaf0C5FfaSInQx1UG35rxo35j0=;
        b=Y2pA9Ghxd1xOm9djwQJ2I2/RQ+nPiLzc7uOYh5BvJkkpcuflHBccQ3KvcmwXfs+vxe
         JIgubvB8yvF3WI8Ntt5xTZfGYgwcyn3aQPAEl41uia3+4JkTUiRd73u3lLOyxNOXOPlJ
         tsEVBQ1kKekTw4LPjDjFesFOuvgHc+n2t+/f2tnUesfuWXBbheKWTzi0GsBmF4gCv73/
         8m6dBC4uCR0nqJbU8w8wc0XxtUtvBWnMGBuI5aTAjsW/TPMiUCj0+p0g1Bv0hWQh7w1y
         0KhWNpVd0y5SyxkPyHNUmFqUKMry90w+WXiKkO2NVNyerFiwCV15A+GrzyO1JZCG0JJd
         FvqQ==
X-Gm-Message-State: AOJu0Yyy53ApRTlitqMTCWI4JDF3zoQM2Uh2wRzJp06VSZtwVaTWEHbs
	r6Hm3YT2IfhYQ3pTRR0kom8xUir2xSTYWbzmma7BW5l6Pl3LNWW/K/ae
X-Gm-Gg: ASbGncs5pSGIYD0g0qaricWcnLagSBWi6l0R7hfxWuCNY0tXo9sVO5yeTCp0+6dCAnd
	Z6XTixYMqsdntYb0T9omS7O+UASgBD0XG4Je/b/lHU/LMH6kBdO0DqylLXAcOMeb8eKqWM3T/JZ
	5dh5pt1BAOQfHq9rEH3L51iOkinfIhyF6HrjA8f7MY6XApdpltCPlV7sU8LsDymuTMiF/SL+sD/
	F9Ease5UY4L/iCoqwAuOScD3qQDI8xLo4hvVNb3VSWowPHT/u89ad9v8LN2/JtGLXPoBG63eWUV
	hLNkGeAxniPxgDygxva6NfggKME8N2y9rMV8mTVJhwOY0Moht+X1iVEgmA9eAOqTN4axqsDQ15J
	Kna5RUWiJZSKoDrnfJmnzVzPYh+Cfr6TdrZhM8swmD88b/imx/zqXnLTPK1beHPg+EDpJaQABgn
	+CIe4IUry3
X-Google-Smtp-Source: AGHT+IGob/FXoyz3+A1gJIBnwRTgWRN15gu4QTGHa/hPMhwPvI0q1Q0NHBycPN6rl7zOaTPDOVjCoA==
X-Received: by 2002:a05:6000:22c7:b0:3e1:1cfc:ee90 with SMTP id ffacd0b85a97d-3e7659c4a5bmr6355341f8f.30.1757859479650;
        Sun, 14 Sep 2025 07:17:59 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e813eb46f3sm7319270f8f.23.2025.09.14.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:17:59 -0700 (PDT)
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
Subject: [PATCH v1 2/2] dt-bindings: phy: samsung,usb3-drd-phy: add exynos8890 support
Date: Sun, 14 Sep 2025 17:17:44 +0300
Message-ID: <20250914141745.2627756-4-ivo.ivanov.ivanov1@gmail.com>
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

