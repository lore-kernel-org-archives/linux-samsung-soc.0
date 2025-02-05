Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A45218E99;
	Wed,  5 Feb 2025 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794327; cv=none; b=nVY9qJGA8F4kmxi/VqYMo8xdemZor3iOKGL+XkPIPnQbmKrDTt6yRhf/rNcZqMsRxPGN9MVmB5JoYb0YAdAht8U+zlR7OqPG4jywup4x0m4tQxXyJ/HZQIEVA1qZxEmpeu0K3V9tRLSADao0HGJ8Bb4owSZKzsMyf7GLb2FLeDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794327; c=relaxed/simple;
	bh=L81/DqXpSkml+m0QSDgaUqVNY62KONg4/CfpEaf6T7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R2CqWP99XObNvoh4a3JWzK7BSxm4eM/cnuxXoSomOl7NJaUqsZ36muge33c61ZHr1yHOngTaBqflTiVFDbbjTqBSqs0gsCjytusk0Snyx9iQUG19qWTLUFFamJTccguUNqYe3it4XiHW+yPRZpBe2iHWbYYHpHqSM0pPYiDszXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKtxtuPo; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKtxtuPo"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85c4c9349b3so56572241.3;
        Wed, 05 Feb 2025 14:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794325; x=1739399125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnz2IMViKhDM4Hj0WSKlwwRNtgDGeYFPFQd7FGQc5WM=;
        b=cKtxtuPogzshcSN9y3L3Wz8Wii9Qgguw6GLXZISj4ueA/0Ad6UN2h3UtzpFdZH5q53
         j8b9qeoIfg2Vkcq8sc9mOmgRXDFgiSnyBEQgfwutyuCWdP2hCgyj+UAyPRLs2yD+rGWz
         sPs6y3+oRbCbdVc/5KD4sH1HhHFygvQTDyhhV/DOlX88g1PEjePVezJzJpIDbSLsLeBa
         7uzZmRzp+r//kS5Nl5hAilYR+gxFyALYW3syDUQDFMzUpN6elrk1KQ1L6d5uyJO4A1Vj
         BXzljVsvO/mhK8ovWxvuCtUv4MzuKsib+Spd3z7S7MYfW3grEDVredxRbzlnuSpDFMg1
         Y8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794325; x=1739399125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnz2IMViKhDM4Hj0WSKlwwRNtgDGeYFPFQd7FGQc5WM=;
        b=MXJTvKi+ZJ8HnzQCzYvYY42WXFs7wCr/+sJqvmg/PUfJ2AKYg6/HXRRDVT80747Lx6
         XI9jAE2h4AE+Azflywj9ARw7mjSnh8IaXYJBAZzh+CioBhmyXYFr3+gJGaPiStSIs6Bc
         iamSreiDHfuFS39pRZOHVNfrSCQuo1lIF3AD8miJivXbwy2Nhyepr31x2vM4t053KvUs
         ASjFwsDtELYNqfZz4NmmbTLmB2G7k+JY1lE1by+RzbsU0pZS/l8VE2jWJ60f6jNZaYeg
         mWAJrrBsWaM5VtkW1GpS8NHFMyY44Bxb9hStF3m2SnPDOju4CAXcUIo7YLHIV1YSDHSX
         kvWg==
X-Forwarded-Encrypted: i=1; AJvYcCWV5Lsl12QoOk3Td8BNlf2o+P0t0Iqq7v7BDPCdrTQNw49gKB7wGscdVckib9k5eTtLuk5DQtGw9Q/kNKbzO4lmwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBAGNdsv1xYw0cT96ANcn1tt5SpDSw1I5u7r5Jn9ppVaAXX38Z
	eXC7QDwB8aCz5mtd+l90lnRaTgaEsRz5DjWDM03ixuv+CqNO8sEN
X-Gm-Gg: ASbGnctTYQBodeahaEV9v7JtXJsitjpLx0bx/NbwvmrT18gdGGSEYfhmaYysX1gBLSU
	nTOyInV9KrNSyVOpRbVR4k9zHeWndJ4LwKksEoD/FlqCr/bVrhwJpY6uqXZANzgPYgpbJNOWnqX
	93OpMwRpldGXjigK+Z99Ax7dIH3hprX2cwWiZYKunJDlhhd/qJLfdPpSNH6uTRqx1o+12j3zMmJ
	e7TDogaRIa77fpNO6AM2PxhgIHvF383SHev+Qfz9PIDbSH6vcYWriqFpKk/1yzV2Eug0bRMwsdt
	g1pY/CE39pV9ddiFzepnp+YkJAg2tmC7R7ZfwzvlceeR8P57ZMwd8+cHj7Wk0kPUDXQJpO1ccvZ
	I/w==
X-Google-Smtp-Source: AGHT+IGjopzGNcqEb/rWZdE5VUOc6SG26nGBuvHP2iF+xN8ZgN2V7SZQt93KOh1MxhdKUcdYZH1nZQ==
X-Received: by 2002:a05:6102:1492:b0:4b2:5c4b:5186 with SMTP id ada2fe7eead31-4ba47abc62fmr3535589137.23.1738794325018;
        Wed, 05 Feb 2025 14:25:25 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:24 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 3/9] dt-bindings: serial: samsung: add Exynos990 compatible
Date: Wed,  5 Feb 2025 22:22:17 +0000
Message-Id: <20250205222223.613-4-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos990-uart compatible. It falls back to
samsung,exynos8895-uart since FIFO size is defined in DT.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 070eba9f1..f38be8e95 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -28,6 +28,7 @@ properties:
           - samsung,exynos5433-uart
           - samsung,exynos850-uart
           - samsung,exynos8895-uart
+          - samsung,exynos990-uart
       - items:
           - enum:
               - samsung,exynos7-uart
@@ -42,6 +43,10 @@ properties:
               - samsung,exynosautov9-uart
               - samsung,exynosautov920-uart
           - const: samsung,exynos850-uart
+      - items:
+          - enum:
+              - samsung,exynos990-uart
+          - const: samsung,exynos8895-uart
 
   reg:
     maxItems: 1
@@ -162,6 +167,7 @@ allOf:
             enum:
               - google,gs101-uart
               - samsung,exynos8895-uart
+              - samsung,exynos990-uart
     then:
       required:
         - samsung,uart-fifosize
-- 
2.47.1

