Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D7913A87C;
	Sun,  4 Aug 2024 21:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808526; cv=none; b=HwoxXQ+dBoiiO7aMnfFMKhrnWOU6cNrsk6qnjCCnCF21cLQLevPxTGPh+wQimYPziikDgKm+vmADPAZaDZJhq28jOU2ZVTI8Ys5YWJE+vrnPR3HWVHPxwqiH3b/ceNR9bPNT6sZ7ljKtko1R6+xsWyjtbCooKzvhuY0XSDKp94A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808526; c=relaxed/simple;
	bh=q4Ku6pFSV2ow+XrfdLqGqmJQxCqO1DZV/loKv1Jvq3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgnlTJBIZxnzRt8NHOnv16tL17kBwOH8IwuPSzcbweZ5ffBmOzilMuh7BdnQbL+ImPbCc+LpwL/Dk4DyfXYELkAMye1lcSynIl9b5piC6UYXhPWruGvheQgMsKkaQpCPDS4fFBzTaS087U9+c196M7+NmUlG7kciQSG+42+2hLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyhkxYEq; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyhkxYEq"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7aa4ca9d72so1159639266b.0;
        Sun, 04 Aug 2024 14:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808523; x=1723413323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAWeL7Nun9ZYhbxsfj7pwIcuKQrCXh/qT58VXqHCCDU=;
        b=VyhkxYEqGpQ+YZYhAK6QKxaymFk17yXWQiZlW60mSue7Xuj8Wtrhmrst7LzUw5K8mw
         COObkIHffAbg5+jsCfpeA0P3Ccq6usJ5J2cG8XYTteO5XaBk9vkLyWPxxBnjDv9IOsB+
         roreG2eCTkjCRT4D1oOCq1to+ozgXZMKk7qhvd3x8UUToiXv0aXedSv5lRBf99393yDQ
         UhN05zXxALATWNUgi2PVZp9uK+d0aYxaTgY08cavWAneTKgo0h+njs5ixp+nzpebpwZo
         WW6wVc8Q3pH2/aVoCIDPJqkwHEWXlL42L+qA4SYc0joG72+mgz9tbcaoeLej8/DYMQND
         MkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808523; x=1723413323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAWeL7Nun9ZYhbxsfj7pwIcuKQrCXh/qT58VXqHCCDU=;
        b=LNST5+Tvvpa7Xm8aWL5MTZJ4fB/0mc8/x8Vio0T7vEWpdhMiT9LxRubrdUHcJAdKS1
         TgyApYnMvS5tKzQyQveLrCArYOMFOTtBALcw+v1X3bBhJbrvT+a2lbCWkdZqLrjyitDJ
         lqlly7cmOJMkQrEwGwzzr9xUiKvvbRfmvwAsZKUMm+NtzAftG2GMV6Q/FVc74pxrBK4Q
         QCavO/j88yGork6XHMdMdEjksrNAR6jbFFyiwdKMoLEd6jJHeLHdbpkGwEGqcOzgEdeU
         IQXGw8b/HKPnpgvr6BFo3RmjSwjSiPv0uI4SEKKkDs/+Zw/nzl7ZXMS/R/0vFUmTkjhu
         0BrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGJr8QzTnd6F8ZUmfb3TTzvUGlRf9cKnsNaqJI1+WFOh0UIJGb+6JWa7TfWq9a+8+bWXLpKOQsF7pFDB7Pu/plIzoxynGq0Ua0SlDaGDIbWown3ZA+Ozq6DC90TYRXuV+mA0A4FA7Vl71LpiMZgbs8IxWuGYvt6tO78jYLFUPn4soM1FgLBBlhCAEiNW5M+M8GSd7mSCHDm9T3iP5DumeI2voBb895CFcydQDf1wdFwh5NOCmTFLZ6N6BKIfmo3VRq
X-Gm-Message-State: AOJu0YyW94OOXsLl0WUUWOdTChTREElZE4iOrmL6slzRaZKIq3kQHHSb
	t0KeN+uFC9x6nVA9wLd/X6uV+1bIxg3cZGG9YVKX2swTQr4axBST
X-Google-Smtp-Source: AGHT+IHgEEDrTSF0voUwvDDCfjCGSv0d/UaByu12LrTyy3FIYy3fv13CItLVvOLTPykh2j0xtVTI2w==
X-Received: by 2002:a17:907:7207:b0:a7a:bc34:a4c9 with SMTP id a640c23a62f3a-a7dc5101505mr659446366b.69.1722808522604;
        Sun, 04 Aug 2024 14:55:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:22 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	David Virag <virag.david003@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 04/13] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
Date: Sun,  4 Aug 2024 23:53:49 +0200
Message-ID: <20240804215458.404085-5-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240804215458.404085-1-virag.david003@gmail.com>
References: <20240804215458.404085-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Exynos7885 compatible.
Exynos7885 USB PHY has two clocks (ref and phy) like Exynos850, which
are already described in bindings.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 16321cdd4919..bf993d738bce 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -30,6 +30,7 @@ properties:
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
+      - samsung,exynos7885-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
 
   clocks:
@@ -168,6 +169,7 @@ allOf:
             enum:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
+              - samsung,exynos7885-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
     then:
       properties:
-- 
2.46.0

