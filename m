Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F001C860E;
	Sun,  4 May 2025 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370770; cv=none; b=ieB6nJDWKFPDwuS271NgjuEhBVbr9/pKaUj+Mjykig951l4giseHF1G/VyMhBAaJC8O0nxCMey7sa3uk1tbI15PiRjpa+5yHIG8FVo+l1C8oo03dwcc1VnSlCU7xjpt9P+VZ+0f5qhNl35iAmBoZNN2XU5UVo0Ntk3Iall8FdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370770; c=relaxed/simple;
	bh=B3XY0EtCEmalx3sXMcHgKYLbdCeihiG432N1DLy03iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDw5FpeLa25gCl+SECJPUI8rJ6rFeQ/wi7FINZITg3gqrZZKQs+ST5At3NjTV4AXENgpswxZYLGEnv5WL/evYcdDI3obU7jUNo8VHt+YFiU1RLv3rWBM66YGjsEO+1RU92/hwuDyKY6UocQR+IteT/ej3IvbpOEigRdg8tymaeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S21BRQDZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S21BRQDZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac25d2b2354so542710866b.1;
        Sun, 04 May 2025 07:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746370767; x=1746975567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e5ctpcFMmBIn03UnhR6Z1jPX3bgJpEPc9I+cnX4xlM=;
        b=S21BRQDZFfZ4NxjWG/IWqwHeq67MFWg3KVxCh0jRMu3u0uIH4MILDtZTSk3jWQXLBF
         3FLKQ3Ihtojq81WfddXSzDuuVKEhJB2ZUTk1WpEZHJe6wlrIcIlXg/IScc45p/28DBgt
         7tXzViKKCbzlIFarX1ldjnZRGQ8cSyFB6aXFlyeb+u87y220wiF9nZQNbYJv/5S8TkJd
         /LfQ7hq7O+FGFw3E9l6TXDNz2PPF93rAIxXo1gPhfSKmZRmsv2G11LQRKsyvMLOf90eX
         glfG7++Kekeal9xgHaOHrHLdw6wiIXFSgBQfoPY0e3Ag1L7DU+XeOFF+AKxvBU6lCFul
         QWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370767; x=1746975567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e5ctpcFMmBIn03UnhR6Z1jPX3bgJpEPc9I+cnX4xlM=;
        b=m1X4gh/b9TbYOyhK3+z0X9ql4J3m1TXisPF6hp6XddP5hmQ+rrwH7iWnenjwqaOpsj
         t1ZCCwdoXxpflO/KPyu7RP+fXAsBgtcRamPv1OCm808OQpRNfvM0ADi2AJDZJXbONmDh
         RP2h2o9JxHl1E8wvodl8wfxJFPh8qpd9Nx9MmpFnY6T7zGvEq9HfzgZDXy2+wa+gP9u3
         WODjr6M1kMj8VFzIIwwZk5CfZjS7WY4maw/10NEzeok4qTpQELdJSs6LWKRl+SiaORhg
         BT17Ogv7UWy+rwLrSfxN3wb1kVN1cmW6WuiFy9RlY6P2n+m5dRjxsUDvnMM7vERfMj4Z
         5jVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN6OCB61rKdcKJQGuEyGe9pjN3zblw35bMsIkl6mJdU6zrOUJeVT+cYz4xkHXiJy6hP22pr4gq2s7t@vger.kernel.org, AJvYcCXaiO1nl5DdTZ5Q2RVm82xUvNnOGH8LUjax98+81QM5cw/c642Mk5abJ8MtkjDZeqsVj5/LfWTuS/v37MKv@vger.kernel.org
X-Gm-Message-State: AOJu0YwgKjJTlPoO0uZISqp0A7r3x/NuKWiq/+Z3WKMn2NRP44kgcbb+
	FvCVWlGzO6angZIq2DvgfxEQYVM8Q/2ETS5DAS6d+TZaPUAg42CM
X-Gm-Gg: ASbGncsK6lrnCsFWW4sjWtko7vxtqjPn0LXbOP4MEHAlXReCrFGVi1iFLPNHFXuc9TN
	Adol0Iqg4w1whlKBmQJDbixW8srG8iou3LAfFvUN8ojGb6sWC/NB/1ccp84HAOgE6hUZRMDTvdk
	Ueg3ObELJQE9YMjuNq5TLzzGe4RRS845Ismrka9YJYrxX7PdXLHFidDNLGMlQ3L87EOO/DpByfe
	6KBpCX7x3XLVINBu5P6Kqv5fNjXGVdzFfp5bO8lVD9UiN20fBZWp/EH+3rHyBIdwO4yMAh+/GNw
	M9xmqV8z35zeLSkX9MMlbP8ib3tbeAByEF7LQyrdcqtYfMAsGLXSYSa6Dex/FKSfbYycq9OF48u
	5rMpJ81ObaJrVjEWw
X-Google-Smtp-Source: AGHT+IGBnWq+blNnaBtTi5tQIOBEgh61djrHUMp0C7i0GrGrmyg+MdR+NIwVCpYw1jaW2xKME9p+Pg==
X-Received: by 2002:a17:907:8990:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-ad1a4967118mr340023766b.28.1746370767409;
        Sun, 04 May 2025 07:59:27 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm336614666b.138.2025.05.04.07.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:59:26 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: arm: samsung: document g0s board binding
Date: Sun,  4 May 2025 17:59:04 +0300
Message-ID: <20250504145907.1728721-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy S22+ (SM-S906B) board, codenamed G0S,
which is based on the Samsung Exynos2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d..bb3f6a0e1 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -45,6 +45,12 @@ properties:
           - const: samsung,aries
           - const: samsung,s5pv210
 
+      - description: Exynos2200 based boards
+        items:
+          - enum:
+              - samsung,g0s                     # Samsung Galaxy S22+ (SM-S906B)
+          - const: samsung,exynos2200
+
       - description: Exynos3250 based boards
         items:
           - enum:
-- 
2.43.0

