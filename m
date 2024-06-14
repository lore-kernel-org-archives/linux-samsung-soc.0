Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBD9199EB1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358413; cv=none; b=gMRYT7lHTPXW/daRRJn620Qhg0hHyH+7RsBRGUIfmniwqkkKT9m8o4NkRIYp0fn5zy9bvtHYb34GMhEkXU7A46dFBGktzdHbueQ2Jgu7rxGbDGq1yRzZM8ryHHbP1RHulTjlQfm5V5yWWNM56IeOVOuQK4B3rAlmjdYEaalMBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358413; c=relaxed/simple;
	bh=VJPDXpI9a+tnKsAKTdkikW8im2YdBEsD1YQ0PHQTdfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgsqwvK0YcWOv8iog7lhc+w7p3YtCMFfVCquZQScahSWY05pyhoQlfzpXQ2quP0X4sMxwK1BlStnpymomsaXOLf5KgMXEYTwu1lN9KTCwpBFD70WzZAofw3e15EqL13EQdmK3yRZMlxH9GNzYpzHQvbJeGCLsUbHxcE4k24xj2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gVxQ9E0R; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gVxQ9E0R"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f1cf00b3aso309755366b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358410; x=1718963210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3IU7+TXLvfDkHuXEh0I9tjkuQWX38Z7PszEGMh/894=;
        b=gVxQ9E0Rla19KONn/JrJQ7zATHUrmxWrDK8ASjzZave3BFoyO+xayWLXfIFL7qNFaq
         /KoolprXS8eNZdvBMlRYq1Cf3H3LEP1JKoRUs53RQcOvpcWkADXM2fo9cJH1OaL/+GOx
         IkFH8Q6NtgZOAuG7sgHtf+tTAcs8+/PFlxVydMYNohyomKcwG0l1seMxNFClqtIed2KS
         ceXQsLr6iA5zEv90nJNVLNaXPveHTRlG6jkTyViJqtAfWiZJJvlmtxPXLZlooA3B1aMO
         vne/YcoHuXD+K+6Tw9wto8+L73aSkzBzzQ6LQq1Is1Q2NK0sed588edBXmBKrDavEnU7
         6bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358410; x=1718963210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3IU7+TXLvfDkHuXEh0I9tjkuQWX38Z7PszEGMh/894=;
        b=kLAuU8H07/j31GWLAGUzFtr5miGkC/niPK9Zy1osAvaJDta+yZ6FHmXPFzLG819tyU
         6ykWP7xK3Kz7q5wCSQHESxhAUz4wvOTGi66V+g2e9AEgGjiVFFmM/Z6IMg9qjkho93GB
         OeDLdGmaWwvmyJEchGPoJvrkYmd3YQEKvqJRS7ZkPBsrzkKejxCE0c7dy07SkV8dqAHG
         ZHQqF6vSygQv8PVSqroMY+pUVYIk3f0U6nV6VQL5lB7LI0n8bWrl1ltFqdC6apGv5jFK
         +oUfqdCGvZFTup+CZLEA8ScllHXWX5oR5JNQrC4xkKpdG9BDMcBhPVd6S+DU1MVk1d+d
         I98Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9aeJepAaI321hV5BBrlLEKBlKkT/RIqxQg3XlonqxKnTd+PwQY3idSnU04QvV3bcIRnyO8XSv/MmGBWstT4oGL/LGEsuU9ttkF7L8uoKaAJg=
X-Gm-Message-State: AOJu0Yymn58pWdCRVS2mksnefbrBLCQ2qrKsIW25uAEU/IpY30QT8KCn
	HUw2nSEo5CuJ1zhKTIq8zLB5aPD/V+FaVxIwcndE/Vuum34IZ0OvCTE60qWj3fk=
X-Google-Smtp-Source: AGHT+IHzJUpHJvBzO1v5iLmWnz8CRAittbY6yI3kGFRmVAHwcqWiqXe7ztIdEf/PB4A+9kWWiM2SYA==
X-Received: by 2002:a17:907:c302:b0:a6f:6337:1ad5 with SMTP id a640c23a62f3a-a6f63371be1mr141309566b.27.1718358410044;
        Fri, 14 Jun 2024 02:46:50 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:07 +0200
Subject: [PATCH 08/22] dt-bindings: thermal: nvidia,tegra30-tsensor:
 reference thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-8-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VJPDXpI9a+tnKsAKTdkikW8im2YdBEsD1YQ0PHQTdfk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFm5f4tbEdT6Hj9kos4aHIzliPjW/NKGFDxx
 Ipnt4UnJqyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZgAKCRDBN2bmhouD
 108SD/9u2rmhmgwy0Iz1Y2lIEPUPCrVcvZT6yoWrfj0wgLw7Qozmtm5AmkEjCDpLjfJ0jn0Pqu3
 KmauRx7VbqoERst4rURkBcYMHLAC0w3Zu9vxRa1RTy5YiVouiBUrD5PCMYATOck/MYTTtkVOfW4
 OJ7LkFnf/Y+0CtVMtdYcN1F4/vdu9NG2saYtCHkAlaKJbb9WM5cdo/4HjDrgQXMAxGlSi23rsPs
 RBU858AEvvdeIaDL/d/1h+dtmXG8FqdhOrknzLOj0AABWGmpZCrrVHw4XWVGlhcNHHRiZZy0GPR
 YRWKGN3ptlFG2yMoUpM0bfupahX60O8m3ivmBzvk6QGKdF88dXCDP1YmPqyWRJQv1szVYj3d/WK
 9O6yKUknXbaNp/s0LvfthEag74z249rHMFB/5AdMPnlB1hKRY2PFRcOYBuL38lL7AfRgPesk5v2
 m0doaOAEtBfIalCR5zavBZndHesTpQcRLybosB3oV0eEEp8d5H1+M8UImCyUIisdmO//fCQsnTK
 gFveqBq94NauRZXVPD7mvqyNpoysTViIAQKDTKiw80/qqy6Wo8eHEd5VCfYXOEPNBjCDZY0PdhY
 vFo+tFSggr4iLZ2hdbNMoK3U3rYVOTmozWqyyamilhIEZSgZ5tHcGmTmEEY8Xk/rEZefiRxoNIw
 6rrAEJr+a9MpxJA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
index a35da257b070..972d608ddf95 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -27,6 +27,8 @@ description: |
 
   TSENSOR has two channels which monitor two different spots of the SoC.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra30-tsensor
@@ -56,9 +58,8 @@ required:
   - clocks
   - resets
   - interrupts
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

