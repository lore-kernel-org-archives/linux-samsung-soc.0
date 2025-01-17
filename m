Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952E19E998
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jan 2025 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133801; cv=none; b=Whwh6I1E5Ps1UHF/d3pmrQnyNeThxGmcOMyDvqyZPnqu6WO7W38/LMNqccvyvEj+96l+rnH3y4/qt90Fb8vlJ0QcBNGbXizfVCrnLbW0BoFcaTkRx7YH987EG2SX71Yh+ODk1aG+T1ov5jJTU0qDRk5b1ub0qCNGnFU94cuScMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133801; c=relaxed/simple;
	bh=QUweSS7Ezk07GROe4ptc2JCbOPNeoO1DPWPu/QS6yU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qg+5OX2Ih/XRf7nk11YwoVgJZtU1Qe2qLUK0ckm1pd5YZKDrYCQbmFuMdZp/ADqNazEqgXakmjUwGcW0wTwk4bjFvMOzCJjIpQBPjV1AJdLZRInCwg6HEHqPrSJf1O/iITsnj9oZFOffbALQT9BcEI39RhhnKzK08d1/OHhT6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j3xDIggR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j3xDIggR"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so406174366b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jan 2025 09:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737133798; x=1737738598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWj3M8A+8QkmZTCPt7r4bM5zsk4erApcDBVhUj+B4N8=;
        b=j3xDIggRY/fySTQ3youNGWQlqFcHgy4wol/PyZq9NBv5euBr6ULML8Vqscy13+N0O5
         c3mBPPoJnRKwDVRqhux/7UskNZ/ITsIwPpxxbAHtAFUWQMrUQHM05D7KaJFKfxs7o0Mh
         fWN8Hqk2uGBOpGr0TYJrlOkHkmQW8x+3rcz5FZK49Csz/Yt9GhNo9wHKPe1HrXSI1KBj
         zHJ8WssJrvYr7ClNewg67+2NxUBH9w2VOVdWYs/Txxo5dDXn/Xr9X6O/nMCJ30ySKV2J
         BYsW61kp3IjW2lLFiixnK5OCW6gEe/baK9qBh2KDWjkidkUTAKQUB2JYxEvgDwdfAA47
         n0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133798; x=1737738598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWj3M8A+8QkmZTCPt7r4bM5zsk4erApcDBVhUj+B4N8=;
        b=VEte/uFcMruXYz/fkd6b1fQxyBo8pXEMQMQ22HpSW+28rbaKsVTWSxqr3yQogTjBiF
         4ueyb/JLJzwkCqBXfwqoZ7stqq5SGYxlDl7xoNgmf0/g3JTNBByC1Azu4vS8yzNc+wB1
         dw3UaXRYQvPpBZpAmvbqJJqGVv2OdGMvvajItzWo7WGznmKhftM0t7qcQOSYM5MkXQsz
         2i4OZ+oGfQRDmk4h+s29tk0kOAL+tHemb8GQLNMkYyXdkyDtkvFNUYssD6vRafOj9YuZ
         bpDq+NgKh9UtMl+w0/CxpKunF+Ub8QfvXy8JrcRTE+MTA9MkYdpM1vbST1UDuBCLNNWI
         VZCg==
X-Forwarded-Encrypted: i=1; AJvYcCUhvfDKTIkv11Z6FHq+WXUedBgDaCgJcnLTvInJAVVx/3XL/L2tlebbj1c8EKlz3pKy0mRo8vMSW+eWxiUdXGtmxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7RD1QJ+fYL4UYVPPyLJA/edcPIboviiIBCDpAGM4qZeS0zE0T
	gVIEX9/Eoaxb7bO4HZvEWPsu0dm7pJSYsB+1XXShpjrc2Ih1zE/HS5V5vO/wiUB6SnPju1s3CkP
	YX6s=
X-Gm-Gg: ASbGnctmHxoGVPk4gjJaaR5517odoFC/b9EyMTK+xhxTqmbfa+RjLMzaRah02zwI7/Q
	ynZCBvzMgl/bMX+nKCdzmNVO7Vg9F3sjwbzBKbZ7t2G62BVcv+a74wCX0a2YsVLISdSqkYBuXPy
	8b36xjmz6uERCGF0204Ej5Zzunwt5N/ZJVNOoEqkZYBChNNUMZxe+izivnl/aQlxW3noIxJnrXv
	p/9wTTcmurLxsfnaeoLHQqemHzcZPISAQvsuvGts1/NgF0Wzo+yQ240Ye5fNAjOSHbBjiiQZ90L
	pBSVO+/ehQjxlfRWhu1uYQhj30jxQTI6yaXI69ru
X-Google-Smtp-Source: AGHT+IF0L7i4EpVSgd88RVC/tmSVBf4b8zhHMKBwJVkEIlZvmd5oRM2kNs+UPF0xzIQ5t2bc6BiNnw==
X-Received: by 2002:a17:906:c143:b0:aa6:8cbc:8d15 with SMTP id a640c23a62f3a-ab38b10bacemr299713366b.14.1737133797895;
        Fri, 17 Jan 2025 09:09:57 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87065sm199197966b.133.2025.01.17.09.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:09:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 17 Jan 2025 17:09:54 +0000
Subject: [PATCH v4 1/4] dt-bindings: arm: google: add gs101-raven
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250117-gs101-simplefb-v4-1-a5b90ca2f917@linaro.org>
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Raven is Google's code name for Pixel 6 Pro. Since there are
differences compared to Pixel 6 (Oriole), we need to add a separate
compatible for it.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/arm/google.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index e20b5c9b16bc..99961e5282e5 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -34,10 +34,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: Google Pixel 6 / Oriole
+      - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
         items:
           - enum:
               - google,gs101-oriole
+              - google,gs101-raven
           - const: google,gs101
 
   # Bootloader requires empty ect node to be present

-- 
2.48.0.rc2.279.g1de40edade-goog

