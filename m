Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE073D0CA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707746627; cv=none; b=fnj/SiBe3idOC8uk3x4deDKhNPMKopRc20eG3oDn4KZLdbT1jefXVTyV4DYX63XxQ+jpqDGw2T6rha0fQ9eCH3xRQpWTZV29CM5/ls2ZGr+O6VNcp97kxeRN8odsgiML9dFLZtHv927MKQh/Fbt+AEcwhifxuXH28phrRIdbz/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707746627; c=relaxed/simple;
	bh=Hi+AYpj4IQjYK7Gxuv2V8sKTS8H17ViP7cxbuRFgK6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy8fgMCj5dQGd7lE1ejs2KMV6SppipgIRTcvKXv/OxI9gOwmN5wqqp5sE+q2eIoSD9krNQFv9QLPo1ogRRkJeEES6DWPI4KBqKDzTu8dCNttdycc7AsOb+ed7Z43Oqe2OmDjZaDYwOYLnHfQxY/M1+knu9jJ+3GtUZJsRvikk70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g66FBhGd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g66FBhGd"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33b0ecb1965so1755911f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 06:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707746622; x=1708351422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQjx1BYq38FUSUDdH+R5TkxMe5lYPMpuxbAcZUZM76E=;
        b=g66FBhGde5ZkjVnf6WsgiGuhLz14oF5pvl9gDE9OHU74RYA5qODAL7fTTOOsHUQmZr
         x8C/ZGchsPt3VO7GwC7MJxQzO65gFfeJHflq1W3tMFxb6cnf4137vT35/pO5q4ZmAsg9
         hpbfMUKQeUQ8ap/m7j53WaVcCahlJaIm8+5dsnefp0A4Fgz33TM4sdNbocxS8crNJiEe
         sb6GozXrGF4dw0FdfpnQRQhbF4KHO0bMEO/3KflJibbSAfDQaLQ756UPWU6w6xIZOC2C
         TQN8/wLORrRrpvwan88GazGefDBx1gcpXITer8NMNG+/IUf+rmGekll9mf15EHuDMx4z
         dwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746622; x=1708351422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQjx1BYq38FUSUDdH+R5TkxMe5lYPMpuxbAcZUZM76E=;
        b=o5xcpc1DRrVFRrrzUBDa6DRGEd297RdwaFBclNQkn9li+gtOS8KrcHGp5ZB9syz3S2
         zWDhWHfcCp6nacPRWQR/twVh4q1qW2pYT5g1c5MioxmDB3UxcEoi1JSjMps3+4+cSWBj
         iEXvYErNvcABIfW92P6AmBgUk/ZfsJMezdTHjY2bkvs+K9IZDhdwyX5LIRy6PF9qKoPJ
         eqQKgDzYmhTCsjrQ0siFChXTpQxYZ6w7A3QLjdMhnzF9wuyrmu03cB3DV779BDHjYK2N
         vKhOHKUn64uCGZH2CEALTCt4U4KgI4+++8elpWwmHeQc9vt9owxvAHUm5/ckbgzu+/zs
         pywA==
X-Forwarded-Encrypted: i=1; AJvYcCXSIv+sbppimm0pol5tSUM9M2GlgQOV1nwJrh1NbRsXVPzJiNP2eV6/0wvzzSt/YOsnbSiiAQTi4nLxw0Uet239qEwjk8okhdXDrlFzJFoZEWc=
X-Gm-Message-State: AOJu0Yy2f5vsuVptJafBil139wUGC/dxDbMtKeneezzqQlixO5hy6o0D
	BtWXUF8G8zBiJDiI2gunDEGj+sGW1fwoX4jSTfIwVkA6c2iSxEforHUzqClcpFU=
X-Google-Smtp-Source: AGHT+IGs6G2Dbixj4ct++RiAZaNlcAeFF+x9n4s/dYsr3NslItE/eDQWdXtV2mgcSiooqR1ukZaFbg==
X-Received: by 2002:adf:fb48:0:b0:33b:1823:284a with SMTP id c8-20020adffb48000000b0033b1823284amr5807851wrs.14.1707746622602;
        Mon, 12 Feb 2024 06:03:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0s1LuCBYrQfPi8TpB7Zi643w8nhk9MWn8/7690ls8R429+G8WviCV2mw8rEEOPiRXLeb6KBSVYdmxtEk0ZM5JR75szSXHuOfyOalc2rXUjEJGAjoKeRSu73I+xkiL7utx1bXJT1lpYp5pPZbhRltaLKksxN3uBwcmOCuoPEobd8b78gFVdXFh274nBi49hMoKa+rxCCyBl5a417sv4lTCBwRqpc8QyODjEYExQqE2NN3c/lmVAfXORcAEKUgs9JoGbN36vFGqY1Zxd7W3ukTFp6GR9mislxOyXZ0hDZZfz+i7eGuMVKt8owbrT9jyFUvMsuXJSYrh862UNEMJs8GtNaZsMY1qsJB73VdSOnL9qI31TTxN9kBARrr2/7gWaVVbG5WdfdIG8ax5h6qRlFK36XOwWh9Q5UapDCB3T4iu3Zr41DBaIT16H4UBjwmwaTKa8ulXn622/1aCGE8Sm2/MmhDqGhk/3tfpYbiUuKs0NDozV44B32u+rcKNvzjldLiYiNIQD/vskN4nX+ZGIY+jLUqXqJw9gxokfkgbRRo9JuVV5onr2uyAdjrBreLuAkAFKLT9cToxyJRvZ/bQ5dKiZ6VbLbLKqGfLD5F/0Hoo42w9yyc=
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d4b09000000b0033b843786e1sm2135356wrq.51.2024.02.12.06.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 06:03:37 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org,
	andi.shyti@kernel.org,
	krzysztof.kozlowski@linaro.org,
	semen.protsenko@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 01/12] spi: dt-bindings: introduce FIFO depth properties
Date: Mon, 12 Feb 2024 14:03:20 +0000
Message-ID: <20240212140331.915498-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240212140331.915498-1-tudor.ambarus@linaro.org>
References: <20240212140331.915498-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are SPI IPs that can be configured by the integrator with a
specific FIFO depth depending on the system's capabilities. For example,
the samsung USI SPI IP can be configured by the integrator with a TX/RX
FIFO from 8 byte to 256 bytes.

Introduce the ``fifo-depth`` property for such instances of IPs where the
same FIFO depth is used for both RX and TX. Introduce ``rx-fifo-depth``
and ``tx-fifo-depth`` properties for cases where the RX FIFO depth is
different from the TX FIFO depth.

Make the dedicated RX/TX properties dependent on each other and mutual
exclusive with the other.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/spi/spi-controller.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 524f6fe8c27b..add39884d226 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -69,6 +69,21 @@ properties:
          Should be generally avoided and be replaced by
          spi-cs-high + ACTIVE_HIGH.
 
+  fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Size of the RX and TX data FIFOs in bytes.
+
+  rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Size of the RX data FIFO in bytes.
+
+  tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Size of the TX data FIFO in bytes.
+
   num-cs:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -116,6 +131,10 @@ patternProperties:
       - compatible
       - reg
 
+dependencies:
+  rx-fifo-depth: [ tx-fifo-depth ]
+  tx-fifo-depth: [ rx-fifo-depth ]
+
 allOf:
   - if:
       not:
@@ -129,6 +148,14 @@ allOf:
       properties:
         "#address-cells":
           const: 0
+  - not:
+        required:
+          - fifo-depth
+          - rx-fifo-depth
+  - not:
+        required:
+          - fifo-depth
+          - tx-fifo-depth
 
 additionalProperties: true
 
-- 
2.43.0.687.g38aa6559b0-goog

