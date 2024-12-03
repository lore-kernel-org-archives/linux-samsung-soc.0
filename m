Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ABF1E4908
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228035; cv=none; b=lJT4wp85S+h0AVfvzkUHHc5+xfjG3A6SAR2LTbOq8lHOhShxVe65aEYuRfC/KRfmDwg5UL+SRcCU755p+Ndm1TfF0ZnIpaQAksOtMHeiY7Cmx/TCcvsaykMZF5R2PbAWzjVQyxje6SCnJaperAF6HpeocAhFga3jfGGiyNrtOFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228035; c=relaxed/simple;
	bh=8f1ebbMm0N0iPdui/HfTmFaUKVc7p+YLaRGLnewiZls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G9TgHLvlJcZbydselnMkPK4Yjn/2qvnS+31r/CbFqNEEmHeoc9ZszFQvkMKPz9kumuIN7roVKSWlnLeEsgop0WLowiJvcNf1OS2hepVdEkD+N4VB2BGi2ynHhdATClRHwhmTJ2nHQdnuIs0O3kp9O63lQjmfiRFi1rnOiFYhl/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p6KLJc8k; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p6KLJc8k"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de79c2be4so6499445e87.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228031; x=1733832831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxSILp22APpVBx5tHexHUV/Y8I0r0x3nASsEN7dt3nk=;
        b=p6KLJc8kycitWHgF6pf9n7BxxwlxjxDDYGyL8h3P7SWc56JugB4I3u46+eTDtnnojR
         KA6cxNihI6IlPj3nfwySEOTVR60EO9TIViD/oVCMFhSVDdHLJ2sOADGDgjPZTHYJLgbf
         FObkck/D4UaFGN1IjsOk4GLnBD7g4HSaFyboIivrOJ8OaoX9E968LjdEgA2z7Tm8c45t
         2jdF86rHxKSDPKAVK/W55Cj4rED1NmQz9ebkpdRYJi8d82+oABWiLPFlg8emlkQ7AfZW
         wQfqeuAiwejkCyYa/wQgWrZcfobeM25G2z680AaqUjdEnoBst1/4J3bh4H2MS7f3Eho2
         jhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228031; x=1733832831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxSILp22APpVBx5tHexHUV/Y8I0r0x3nASsEN7dt3nk=;
        b=UEsr+Qn7J43WBPWsfs++fqOnkrh36+jzXcFRb8zSMy4ZgJKo7EcksuIyyMmCxRpHqG
         erBpDutNqJ5br5u5hVrvRQVH0O8412EmT841WtpWmcyA/Db/iLJFKhKKtF91Hji+sjIF
         AmpedtccMb1dUFEYLS5DoB/sD0cUfGKVm1Jx/5UrCWzFWlWuGyvBUl1KzIMlnxJfMDaz
         b2fDqkcUpnAwNYq7te5r66Q/aH4vGTQQPd3fMwzCWlDkHDpddW1ADdpH9JfTLVMuampc
         5lk/zRIUxoVe+ZNEHNA/AhsoN5S+oV7XE0W6Kq2KuR0UbW5+sY9iMo5O4cRIgSuIu7vu
         eH+A==
X-Forwarded-Encrypted: i=1; AJvYcCXGkQELNPu26opBrkSEjhntNT9HSBMJyG8RwhaI2mHJoqESHh7MRdIKS7nWQ7edEbbgcfLvvLc2/eLxy+RV+P1ofw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnojXtBHbjezEEE4HUnTQoDR8DFSI3yMnVjPnrDM1jXL6piViW
	KVeQFKBKKOmR0/gD9wjNZD28usnwiWeTWyrXlnIoPvhpCVz8utkXkiC1lr3R8sk=
X-Gm-Gg: ASbGncuZ+0YiEJAxKzmm7tgFRG6F8Erv5KCJJq8hapFukBCdvD1Wa8itbZXTf9QVV1j
	5Is9JzbXmsAEeTlbzXx9TvemZJG2gqRnnjljsYT7Exd2PepujGfNJNEui3Aceeptt2/A/9wyZim
	0aRPYWETqTscz/LqCvazCGr4fl79pSe0Ub00yBEkAkBFPxf8pinob0BeGTQFIk/CF4PVqFDbYnn
	YIyoRCQY6AST09aKqSvBC+uDx7VUpm+pATz7icm54XMuRquiWAHpD2hFAhw1y1qALYpyxV7ERQe
	SvzZWT9PXKYErziQPU0AoK09XdpzNNBunA==
X-Google-Smtp-Source: AGHT+IGJXqz+bsjwL9K7fxpkACgJ7CUUYtTsBMRBB8QXiHvyZub3gqPv4SCB1Lxa7PjJlefvUOWsPg==
X-Received: by 2002:a05:6512:3e26:b0:53d:d58a:cb67 with SMTP id 2adb3069b0e04-53e12a26e81mr1428897e87.35.1733228031160;
        Tue, 03 Dec 2024 04:13:51 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:50 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:49 +0000
Subject: [PATCH v2 1/8] dt-bindings: phy: samsung,usb3-drd-phy: align to
 universal style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-1-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
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

In [1], Rob pointed out that we should really be separating properties
with blank lines in between, which is universal style. Only where
properties are booleans, empty lines are not required.

Do so.

Link: https://lore.kernel.org/all/20240711212359.GA3023490-robh@kernel.org/ [1]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 16321cdd4919..1f8b35917b11 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -83,14 +83,19 @@ properties:
 
   pll-supply:
     description: Power supply for the USB PLL.
+
   dvdd-usb20-supply:
     description: DVDD power supply for the USB 2.0 phy.
+
   vddh-usb20-supply:
     description: VDDh power supply for the USB 2.0 phy.
+
   vdd33-usb20-supply:
     description: 3.3V power supply for the USB 2.0 phy.
+
   vdda-usbdp-supply:
     description: VDDa power supply for the USB DP phy.
+
   vddh-usbdp-supply:
     description: VDDh power supply for the USB DP phy.
 
@@ -117,6 +122,7 @@ allOf:
             - description: Gate of control interface AXI clock
             - description: Gate of control interface APB clock
             - description: Gate of SCL APB clock
+
         clock-names:
           items:
             - const: phy
@@ -124,10 +130,13 @@ allOf:
             - const: ctrl_aclk
             - const: ctrl_pclk
             - const: scl_pclk
+
         reg:
           minItems: 3
+
         reg-names:
           minItems: 3
+
       required:
         - reg-names
         - pll-supply
@@ -149,6 +158,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 5
+
         clock-names:
           items:
             - const: phy
@@ -156,8 +166,10 @@ allOf:
             - const: phy_utmi
             - const: phy_pipe
             - const: itp
+
         reg:
           maxItems: 1
+
         reg-names:
           maxItems: 1
 
@@ -174,12 +186,15 @@ allOf:
         clocks:
           minItems: 2
           maxItems: 2
+
         clock-names:
           items:
             - const: phy
             - const: ref
+
         reg:
           maxItems: 1
+
         reg-names:
           maxItems: 1
 

-- 
2.47.0.338.g60cca15819-goog

