Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB801E0DE2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705096; cv=none; b=JnUQt50p9a5EoyoAJ8e/yUrD6MkStf8SxaU+FZifeKHhP9SySRY6octJVHCIvWn33Ysy6R05XDC/kEGiyA3OPU3Q16l6/iqd74xBtGUbyYUQvGDt9E6Nqc0vSSAcDWCq+picRnbnUbZju7yt7CfCwtZ2IpSdhFrKGqRNGwf8DV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705096; c=relaxed/simple;
	bh=TfasP76fahywas4AK7WSi5yqPxkwwsGkTVawo7HIu/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GphhPtZnpBM8O9Y34qYNhgt6V3suVsSh1U0njiZKrO6JWGt7dnBiITII05dVWcNe5nbr3ewAOaouqKLNpF2/COqcBk/4zQ1HSlG5sjTsUYz0rm5EcRrEOoN4Q+K/fGNqk7RWbMeY/2WDLy6rWN38YRnlIygIdMQXTZZ6A+r/KA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H9AtM3pn; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H9AtM3pn"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa53ebdf3caso621930766b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705093; x=1733309893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3bheMto3E1kl1HdoApxqJvOhczEZkMy970AMWo89Pc=;
        b=H9AtM3pngNBTujVz2aYeH72mK1naCxWw82J9A04+dpIanOAW399zVQ+C1A7GIkIW9t
         V7tqy+kGGXyBDT3hMPztQdDRVXmOTd+gVhFAjm/y2dGk8y2plcmKOqdDyCSA9QHE8DT+
         l+k22raOnG5d0LgjYgLcXUfJ2ZoWsU+DfLJzlq3WuWmUfjiyob6hz31WFnHw88qtM2PP
         CCPQsuaz8G76D3rZn8WwU5tAZk7t1dL5jiPCz7+hp7wnZxE7Jtg2bMWtLtRjZNSu8dRe
         JO8LzSHqViLyq45W4RAb6TSsFN1Wc7AxrolultMoqS55Xs83mETCXYieW9cFR2OYPVKz
         7+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705093; x=1733309893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3bheMto3E1kl1HdoApxqJvOhczEZkMy970AMWo89Pc=;
        b=IJhh14ufZ8Y22n+2R6wvvaSd0lGy+rOPJGpNNAFy3MCmAJV0OgpT7RdVJaYUb1H4jO
         8tzOvNKh2yhmcQkAagAORmcs/n/fnfRqQlwRnTj6NZtg7+D+2woFPhEuc1gGK/nwZdpN
         494G339wc6wUUnP+rvju6ezOG8+/4LC3t3QqelHFyJ+vEop5GNWINb4sNhWqEkeeVN4K
         +7SC/k6QCbfvokX/Wn6aE3UdOO9cc/ZSyoAIVtfdXWG1OznkaGvUCX3yUYvnbf5iaGoV
         KqNm1Susn2SLguNQyjaUHyN9gDJLX+5XJ20YYPwcun2xTDtlZ4nx6SoQA41QHteNqVlb
         amCg==
X-Forwarded-Encrypted: i=1; AJvYcCW3vVU2gwadOx7UMkpY3L5nzESeqKxzZJ3/OPmxzYJNBLSovcfgGLwAn59geFjEiWRXRImSHcp72OIXIN84DS2P2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+rtMsWFf4z7MPQZZ7lHLJr9N6Bv9n80G6wiwfE8OkH28T3Bj
	/1eBRR7Eb8tNniLXkkfa63DmfzlOYOu94PHlWtJaYvqr5g/EvoH+HhXxGudt/Pw=
X-Gm-Gg: ASbGncuuNQqtQ5XX+XFSzHblP+Bb2ZbM359bYfVT1gXWHoob5OPkRCcw4h9MG3QVFLn
	BFiW8YGwOzCIEc8rn3652kXwhMuXqPIaNk388sVzz4gr9+PbZKxn+XBldGSO5OAJXYJZ1ngQDrI
	UH6OKq3YYJUVPdhwVStL/e2Pqzq+tPTgxakEXMsWPo36vWgNUEtixnTtPIeIUeK/zkddV7XWXOI
	RHP2WqMtTAmFRxx4Zs1OKibe9KPVjA/jMR4f0vYGOWBlLP0AfQVij3Ay2PA87Lw0rjCBw3BFD7T
	8Ur7e5PwDzpNftHIdzwP47g37ZoyjAqo3g==
X-Google-Smtp-Source: AGHT+IFtopTo1T9muj6iS22tvZolqFiyxg9o/3wQpSGJ1mFMEg0qDXnVqCgHodOTVAcp8106njbuHQ==
X-Received: by 2002:a17:906:3d29:b0:aa5:63a1:17cf with SMTP id a640c23a62f3a-aa580f23e33mr198057666b.20.1732705092771;
        Wed, 27 Nov 2024 02:58:12 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:12 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:11 +0000
Subject: [PATCH 1/9] dt-bindings: phy: samsung,usb3-drd-phy: align to
 universal style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-1-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
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
Signed-off-by: André Draszik <andre.draszik@linaro.org>
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

