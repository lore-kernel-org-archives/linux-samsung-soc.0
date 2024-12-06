Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4981F37A6
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 16:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502665; cv=none; b=H9uuGfMnNdoiDJv3k4PAVWjUp1YYziC/N8lYOcCKcPzJp3U7C7dnt3ybWcLgRJe6z8xdOwENVBBgiIHD3V0hOde24cBZhmvPIfWG3n7FilgaMyAwSx9lXR/YhVq05fbIIj5IvZDu/ylh0CfHN8DJzvS4v+G3hDinq2zi85wKoK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502665; c=relaxed/simple;
	bh=4L1d1fZ/CUtuGNTGhkvnq4cl0ag43qy7j+Nalp/6Vps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLtlmrdmOxS/XTeKlhI2AyG3v61qUHTf4S06jErsKITgI/646lB9RgbArwCm2mXQc4sU7U6PKRMQq7T4AukGTv34zrEqgw4gacIBs3ax7kGhnT5bVkFccZG/MgI3K4R3Cqb8gfQT3CygjhqhQMR9dXxyUwpzwVIrqH3EPFbDXik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQVAlChR; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQVAlChR"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d0f6fa6f8bso3199382a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502662; x=1734107462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPcp32i194zjkohuP3ghdoazYclk/zwkpzXjsI6FYvY=;
        b=AQVAlChRgXD256vithgfZdOWYax8BX5V6ttuMFd0svMxfupIL8hUbsKe5pH/bF/PTN
         GmDWI2tF3vIO2KUnw5zi+EJKApBEEH3XxGd1cZgpyLsrqcAAtYLyq36ai9JscBfTv9KD
         WxJ370dL4+vJ4jG2p1FGLVYLBShcxmiYA64OGsVII6pclhczSaerrSMUOAofSh7MVSUf
         1wtQ5NCXYkoox5e/yoiK8/ux6koy+ZsImkKFwlxej9GuO9tDYSagytJ1gCsBlfa96rlG
         3BhMOfBun0qYjCbYoUpycaO8WDFs/UEKF6BJMOLEAkayl4JrJO2N6Cua+G4Rcv6EAfUy
         xBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502662; x=1734107462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPcp32i194zjkohuP3ghdoazYclk/zwkpzXjsI6FYvY=;
        b=Oaio8bGchOKfVkBHK3cvwbv1jDQiyjxpaM34L8ajFVL7sRUFMuh5Tx9WfvirCemZBQ
         CSSu8A1AEgyNdE1htufahBbFd8aJ+rqfXTYjUmO2JL3c6VtXDQSpXTj7PAON5fEaDwnE
         Whh2GYS2s8GJNG9bhoLqzR8MBOcr0RG+U8Z7zIApVMsAXryJK+fD0o0giotrsSJyMCyR
         S//QcWxuX/U/35qp03l3Q9A/lTz+vOodX2WgJeajf5i9WUDrgphXwl7HUFx/Sg14FzSX
         V8fY4bWJT7gFnDgp4dRLyKc1HosUIFdivqbr/hqJHwpkVnyDlHH3yc1p8t2/88jU6jv1
         3/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCX9GNu9Zkk5QxcqSLWYpHIaBhvMcS8e2kTUDxrE9cc8n4bONa8KzdHQHs3WIBbj5z5Nim+RiJWmVyJGYD2pg+ZmVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeEU5nRcYKCUeQ5XNx/qEDNyZE8vgAg7eN8u6UFatuiBOfAawv
	aFhUocpcE2tuJbhcl8elGGc2CWaZcoSIUriMwSxcq4p88KtY08OuuiCP0WRezqY=
X-Gm-Gg: ASbGnctpOVTCfYKA1bpUdh2wIOX3Oxz+wIbpk8aZeEjo1i1FBgaXXPD9UIhjtO5aVfk
	1HruhhKPG6c9AQqLako7d5U18PpcCXpx6i1dVS3OOVCOXUKiP9CN1vkyMxD6901vKE40Gd4X97C
	vNtikhVECz0gEAhT4GCiaViGCDrKSY0EbPx67J+pUGuzrDbSS4GIv6T8HGf+1MwBHA6PEHQQolp
	8Axsmn04/iSXytUn/kQdcLQ9HT7kTaXz0KW6izuc4T58J3muMghpuR2zGj5VGbQmeYi1aL/KctP
	eL5djWy+GrevzclettPvkEoe2VhuBzmT3Q==
X-Google-Smtp-Source: AGHT+IEYYMQ/h9d08asabi/0+odqzF/CyOlSqdYyLjSN9hUXcwqfK0GjZYzhh1sXE6LLkhg8iDS+AQ==
X-Received: by 2002:a17:907:9145:b0:aa5:1cdf:7c02 with SMTP id a640c23a62f3a-aa639fa52d3mr294338966b.3.1733502662183;
        Fri, 06 Dec 2024 08:31:02 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:01 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:01 +0000
Subject: [PATCH v4 1/7] dt-bindings: phy: samsung,usb3-drd-phy: add blank
 lines between DT properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-1-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* update subject line (Rob)
* collect tags

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

