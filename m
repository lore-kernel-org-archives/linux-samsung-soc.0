Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D033E84047
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233601; cv=none; b=TQbs81BnMk7PgB8CiFlSvVnEsvzA67f6tNbPDm7+vsgN7PCJOUv1p/p6hQAOt8IZNPzlDfwhmts9uidAT097rofk9wo8rqMhIrO88mpRGgOOwlcH42hpStxUxAlVlL1Vs7Engo8N0aCLwirJOoWX5t1FdKoSV7pfRD5S3VgO7wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233601; c=relaxed/simple;
	bh=ZVqYn4HwzkGZ3NORH7tsH/YjN519R6At8CFrNLiJlP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GOBsj1PigU74NQveVeZteXz21T8mGWe/hQxzViAT4hqFOf43dRAWGHHkzQ7sqTx7Vdv4hygdEq1+CEvlePicHVCcAXZ6bBrX7wdc3KEFxgXsKfoe55HyOhbr47RvgoGNH2Rp3CtF7FyFCzSzK8GX50tyAK7eFaB2g7rOC+HxE5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PnIv1xFS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnIv1xFS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33edbc5932bso670932f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233597; x=1712838397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXdNsPRMeRxKNgTMvoC/YAjHT8cRrzE1LWBWedHVt+0=;
        b=PnIv1xFSetuTntTpKBn3ADePES8dq7kv/PSI9xfp1L5cxBxSmnEevldAyagG7ANFz1
         VBlsM35fKy1q84sP+yTCZgvJEabTTeyJTX5JG19AtVQt7ZGzrrlwagNFv0PeG5TLfPco
         l7rjb4595TH4api0so9ieOw+DHTAdNU0MW3/yDbg0Is07E4V2acwmfiYJwHtMtZY4N20
         6DRo2lBVwmDo+r2ltBXuOm62WJ5c9rs/GnoUSnulTFM9179hJ/tx6RzJiMHy1Dc7LCo3
         zyqxgZlsEaVA2fxF9ERkCuliO6EElrN5C7lB0IgmRHlCOiKxRkLJ0u7cZ42iQyXpKQR9
         9mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233597; x=1712838397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXdNsPRMeRxKNgTMvoC/YAjHT8cRrzE1LWBWedHVt+0=;
        b=w21FABSfatmyaU2nXzXH0Iin6fbtWh4/8CB+GETOUm/A8jC83ip1vE8tfYbYuIJI7i
         PXnGSrNrrfkekV0DhKL5+fAovgqF1ZwD2qT55rzdYoUQ2oSlvJJ7D7zLyiP5Od6cENSw
         fBabgfSIs544IrUXhxI8Z0y4tggHt8sO56htcm9Hw94yoaC1LO3HRLOnVm7saR1zcxQ4
         OcTuJ7gkPTaze9Gchb4AxdhtL7lisO3NHSHBjhjmMYAyyOK46Kbl49KEyhY2F1DTF1Dl
         QmsABCe1NaJ/9sOAmq+oxA4XPPn8vsIEtw6ANFXRgWt+Kih5XliMpJ2pdbxoUaookVmj
         XoIg==
X-Forwarded-Encrypted: i=1; AJvYcCXyC9jL62y2w3jfCxZPTJ8h6OZfU49H/d2s2wBrRZGv8BKCYHwcB+7umA08sPfQARlDCWADpAla7/BYluK56pcx0aS5h/Bv/GCQMRfGrWd2NPw=
X-Gm-Message-State: AOJu0YyUp4OR1xRJHc33oyhVZDt3IfOzymDT3hw6WKbfOuNRi0L1JdZX
	wbgZC630kZ7vbUob1f+6D7rAZ4pVnnnSWf9JLbRARLeo66BqlBllKHZbaI6A23I=
X-Google-Smtp-Source: AGHT+IG4W3L5dd8Mb63CZZWsH81KaevKLECBBmrLli4fW9RjtXnQf5HkEcp1WxySDAX4sVMmwjF8dQ==
X-Received: by 2002:adf:db46:0:b0:343:7884:fb52 with SMTP id f6-20020adfdb46000000b003437884fb52mr1946795wrj.50.1712233597343;
        Thu, 04 Apr 2024 05:26:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:26:36 -0700 (PDT)
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
Subject: [PATCH 04/17] dt-bindings: phy: samsung,ufs-phy: Add dedicated gs101-ufs-phy compatible
Date: Thu,  4 Apr 2024 13:25:46 +0100
Message-ID: <20240404122559.898930-5-peter.griffin@linaro.org>
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

Update dt schema to include the gs101 ufs phy compatible.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
index 782f975b43ae..f402e31bf58d 100644
--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
@@ -15,6 +15,7 @@ properties:
 
   compatible:
     enum:
+      - google,gs101-ufs-phy
       - samsung,exynos7-ufs-phy
       - samsung,exynosautov9-ufs-phy
       - tesla,fsd-ufs-phy
-- 
2.44.0.478.gd926399ef9-goog

