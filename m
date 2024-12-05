Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBF81B2192
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733383998; cv=none; b=BlwVXQHWtiKstg3MO1vFLHrfGi+N3FLl7t4pjCB5iRvNwQJljQRyVWVWEQNC+ib0+ludkNIb+iZMKJnobEWW4hRWCdFTp9biRAX3TrNv3V2PzcM4slmJe1k/vkiI9U6gsa8iZOTu1b5NEJjVaZ1va0xdqYWDIgTdowNmtv8HN6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733383998; c=relaxed/simple;
	bh=Jp2ObEzqJQpaKbhTocAaM82TdjXKoBGT2+8/pE/oY9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvjm2TICCSXqu9jQ3JpVNfjshjZAVBvBlpsEYSw0Y9UHVIHGQzOUFjYthJCZbF7Py2KMrCZh/EHwE/1dTuPDs9QBGx3XPJ5zK/ZjEVmzvrcmA9tqSt4HbiMlSBM6RiMeYsVBs1UD84ClE+YI7qaKdDyxCUUqUu7DjhTP5UK6ZAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cXLASvK+; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cXLASvK+"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa578d10d50so82165566b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2024 23:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383994; x=1733988794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKgkddTbsb36SqzZl1dMALspeUepmvmFxGiaTIa2E3A=;
        b=cXLASvK+Km+N5kXgYqdRMahJFBxycETuH2gwM8NTOqkkpumbqpK4tcH3yspfMM7nEC
         sgPr0H1wXUzjLyMcVcyQlpTlePVU2LA8xwS2H9VpvyVwnnN181+7i7She3Kk+pbfG5/O
         z4ICU9Xj/qjDmsC1g0+munHBn2kDbIiKKatJPZUkWlt7ij9DmBYvH7ycFadVj8xkZP4d
         FJNxkFlOksBBYrcqPQ+ODsM/TR9OvWj3pTX8WOnwcloqEJtg4J/8KagljAvcBYi2jmTt
         PmhPhT+1VR6PH12FjhnmuhlVGIsg9vPtUyS96H0DdZza2Pw9Q+dIrWi9oEyBmUn4jsmu
         fIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383994; x=1733988794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKgkddTbsb36SqzZl1dMALspeUepmvmFxGiaTIa2E3A=;
        b=Z7n7PDuvyC4f+mpPzh6fwV1zZgFFjZCTd6sDEA1q2haAgVBrV6Xi/GYOOnibUks858
         W2xxjFSQ3uCnstMxkbtgWEUX00Itfy2Prj5NaAdMR3m+81PpTORdPdI6MfNvltQvV1g0
         vZJ+UB+i0j0Q1zpDWZcEG+86qBp/JfGr+wPUagWgKV2s2+fbrPinfLDrp4b+Cs6mxeZQ
         LrNsJrJK4L2K45BMN8mCL/FfX8WVvPZT3L8K3aIMBHJMGnQXHJPVtAqvVgMaAStiUPvg
         Ebj+G6hAg2uAVze9om0CdASAPfsvBHmTrv11UM+U9lvR2TJNQR36n4DzvKTZlHfJ/wwF
         B5yg==
X-Forwarded-Encrypted: i=1; AJvYcCVTcL9pmdWzRDWhxdYcED+eVoYl6NLrNJZs9ePBkYuBWbbp0b40edDv9IIDzxBZjZDYgpeCWUl825JG8tAbxuuYiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTc0h+vvnH8HyfBLGLy8PULy671HlhZOItA0+o6LKn731lluH
	rk5p8v5PTeriBbvf/wroEPNQ2TlA9m+PM1SbpbAFRpmi+i73HUCq+pNYCr5F19Q=
X-Gm-Gg: ASbGncuoM7/SBoGt4k+KKW/MkqXxd8/iEOleavlkHsxSVHCODnzDVDeCQ4UnqOvxwt1
	kKDcmqv1lpFiAGRpPG0Uu4yRa/RCF5YZH9+zwhns1imVoaPcLOpNIXOaZ+rknborLEn7Zd+RYbD
	nYqKCVYXflZwzaYJw37YGUiDMzMwHm/CbVDkWSxbflElfPGjQYzEQEpIOyLIdhmypSUfa8P0fRt
	5uKwwcYNgyb3NoS2fa046TyhpRjg4WQLGJ2mkZXSFQvkTNYlyoL4bwtHK9qUtPhoAUxnW8OGj4y
	yX+fQ0ZJFIikwMDceoZNd9a2oVU231BxJA==
X-Google-Smtp-Source: AGHT+IGYmzZiBrRm65PFSu05U4htcrBOv9KSue7aaItOd1Hb+mwmtbhHeeF7rqrAtH/3fEru33bthw==
X-Received: by 2002:a17:906:3d22:b0:aa6:1917:42e7 with SMTP id a640c23a62f3a-aa6191743fdmr306308166b.22.1733383994490;
        Wed, 04 Dec 2024 23:33:14 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:13 +0000
Subject: [PATCH v3 2/8] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-2-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

orientation-switch is the standard declaration to inform the Type-C mux
layer that a remote-endpoint is capable of processing orientation
change messages.

The USB PHY on gs101 needs to be configured based on the orientation of
the connector. For that the DTS needs a link between the phy's port and
a TCPCi, and we'll need to inform the phy driver that it should handle
the orientation (register a handler).

Update the schema to enforce that by requiring the orientation-switch
and port properties on gs101 (only). We disallow orientation-switch on
all other supported platforms, since other versions of this phy (or its
system integration) don't currently support or even need it.

Even though this new required gs101 property is an ABI break, the
intention for the driver is to behave as before if it's missing
(meaning for gs101 it will work in SS mode in one orientation only).
Other platforms are not affected.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* update as per Rob's suggestion (I hope :-)

v2:
* squash original patches #2 and #3
* actually disallow orientation-switch on !gs101 (not just optional) (Conor)
* update commit message to clarify that the intention for the driver is
  to work with old and new DTS (Conor)
* collect tags

foo
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 1f8b35917b11..27295acbba76 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -114,6 +114,8 @@ allOf:
           contains:
             const: google,gs101-usb31drd-phy
     then:
+      $ref: /schemas/usb/usb-switch.yaml#
+
       properties:
         clocks:
           items:
@@ -139,6 +141,8 @@ allOf:
 
       required:
         - reg-names
+        - orientation-switch
+        - port
         - pll-supply
         - dvdd-usb20-supply
         - vddh-usb20-supply
@@ -198,7 +202,7 @@ allOf:
         reg-names:
           maxItems: 1
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.47.0.338.g60cca15819-goog

