Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434CB423A64
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 19:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489234; cv=none; b=efmtoKOKXK5Ti/qQ9q0iMXJEJ0HAjvDn4xcKhPACEHv7nqKOFmBuS9Hdocstteg1cBV6TGX4Ssj2mDpZi1LkJCj/gNrc4rQJ1c+h8+8pTw3gBhptnqEWM5HxmqoyeIbQN3d3fiHli/ZbMIq5rFuDVHEMGvLVKZZIdkBTJNLNmcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489234; c=relaxed/simple;
	bh=zG+o0MhzCy1MhAPEPaaXMKj2DtTAIlj69kKyo11vWYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Retj/Ba8pIZv3VZhmtyjvi3+RejSsPOMrA4SQKI8xB9EvQEw4k+cBvLaszhpRSjiwr9M9eoBBQ4D/vu+fEHl9QY1TxkyKSQU+MrG5R6iOyN1KrL/JLgfmProbpMNAQ+5nKC03WmeSeU29ANISanUdkd6bquw22pnK+sPbjjQVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=olGne8yx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="olGne8yx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso449455e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777489230; x=1778094030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JAhGZcmG5DTNoPpP7LuatJXcV6lbxNbVHpf0DkS0EQ=;
        b=olGne8yxcmCXqBWeRmexhG9r2AGiZXQVItjA7r8YD7IJvxKP0pQMi2Ki62l9g9TIYK
         W9ueDVmUiNmdm4u9TGg7SGif7Gy2We4lC0XJumLSEfHNQFb7DFQJgcuTNdxpwtjCvdmI
         Y9PTBGkHzkGVEUw1TtVlo/sZU/VQQTQmfypUn0b1p3QqWym2gR7pg04RJDhMLv+rurK4
         Z655C8YVdRRYWUmIaFbgE4KllW1f1K98Kjs0ixG5A74qFmOrx5AW5rOfW/CTCKOEmEJJ
         FS8orPv/PLPQF8t71t+x06loIUIil6v+GgCe3470RviGEUwgM0uU4xFGgEIUsvZy6IqQ
         aBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489230; x=1778094030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+JAhGZcmG5DTNoPpP7LuatJXcV6lbxNbVHpf0DkS0EQ=;
        b=ozfgsbiYKTrHangwOFpnHbQf/jHGF1GfD1JuTNMX+2ckgcOv9RiWekgXH+YV5Bd/su
         yHJPTgc4spDiwXiWHaj6H5BuLH4Z4mVEdvNhUooOF4aGmd63aNT1rsXe7KVufxwwAbXk
         p0A04S0vx05YB7c6nVEQKAh3EU9tKjwq/Gt2qVll5aj5XQetBYxZw9xDMWQub/N4SPgy
         1/YloYyzAe8FPBmpyLMlW2/lsXSiTjQfeKgXTt7i6H/MC7ROTBzTkmJDZLJwP1zSnATV
         EU9cl5k7XrjacUK/tlHGm6jjtVmwEcZfjAsTvvMxQ6mrhpaxBY4J6eY2kf8H8gBh8qoD
         ICKA==
X-Forwarded-Encrypted: i=1; AFNElJ/9dkdn5H4AT8MC1eD435n2hGAQ9kgm9A6by5Yo5UakJ/05WiiL8SAIhpulCQ2fWTDKK4cLEXovBXcUGfIwLE9Mxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jd/IPYzYNq22iw/3g15E5cssDGwZyYyJb1+hBO1A0ltY39DL
	FiXAzpNYzHBRCG/iwYxbqeVqBeG8uQJGfyvGHJ/Uje7Vh5DqJXJIHAssT7SDFOjxIiuhy/B+Wjr
	hLOxtL5c=
X-Gm-Gg: AeBDietjggBvTymebSrIgkEL686y1aGVX04OpOce3DxNorzwUUWh8lLDcyfM6ox7nHn
	ZA8z1+xBXRHJfno/hIwb2RjIobgDH5dP13gGaCjQuPu4P4MRa3PH97+4oaGKZOrkjjjZyUG44vJ
	dqKWE/V0Zd+SggExe1VVGDBx53ciATJNMukY0pcRpZSaFlQ63go9fjbv7goIWAb4HP2zjQo5xVO
	ZdPQjVZp25eu8DKbSGpO4LEMEIzUxzIGy6LsmnvzhR60XR+rNaNFHhWoRm41csv3ab9QWlwozRv
	xnB42bO67ez4JpEZRvlat/Fu869j0A9rhNrCiU2KqmDxSB1x+cqNNWAP/LKRjZiNhJO5tOsMcOf
	TjRGoncFppwWMNRkCaQ5heX8uYds9358+4xmqQZN6eWkT1sqifqM/A4CmV7gAgg5uFE3yQd+LLr
	nOjEQoo6JUoETxPPkg8jjkUdl2u3FRPkzoIsq1fjzmV50cT/mOBYSEIGyPG/OrRCvdmrhe4mxsJ
	JFhmCyK3Yeyj9uX8dI7YUfXats=
X-Received: by 2002:a05:600c:1396:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48a77b1b85fmr145395505e9.22.1777489230144;
        Wed, 29 Apr 2026 12:00:30 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b900b40sm26187785e9.2.2026.04.29.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:00:29 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 29 Apr 2026 20:00:24 +0100
Subject: [PATCH v3 1/2] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org>
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Document support for a mailbox present on Exynos850-based platforms.
The registers offsets are different from gs101 mailbox, but the
workflow is similar, hence new compatible.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
index e249db4c1fbc..c109c1f7af24 100644
--- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -20,7 +20,9 @@ description:
 
 properties:
   compatible:
-    const: google,gs101-mbox
+    enum:
+      - google,gs101-mbox
+      - samsung,exynos850-mbox
 
   reg:
     maxItems: 1

-- 
2.51.0

