Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BF513D88E;
	Sun,  4 Aug 2024 21:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808531; cv=none; b=m2DeiUZMWnWWEhhMb3Uo9Jh4Yfln6SkyngRqdV1xouK21WlkBl1JdUFl1zqhKqg6TIHTMT+/eO7bGHxl+dOI0wdepqgXX15IvhvYIKX9E7HlqFJ52dz7CkwkHvA1Nrd256IfZk0hHZAo+9zccW+jvcpyxgsSH5+J65TfyolL+BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808531; c=relaxed/simple;
	bh=UFAXgvS1WK54eYyJDw6+03pIZJT23LNgfhEJERwCZiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sfdwle4EPBeuVvZukrjNodLK50Fqno560C7x+XdRdtUx/1X8F4bRb1ghANPc/LVCZKNMqJMRrFGcwJMnlc3vUDaEYtZ4m5cSDBF9Nqqzg82LdZeumGxPOYu9UYG7crImPQxkZhvpoqZDIDFE2NNI5F/P0dP0H9tjbbNjXIcWr/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNA7xVqp; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNA7xVqp"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5bb477e3a6dso719219a12.0;
        Sun, 04 Aug 2024 14:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808528; x=1723413328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxB3Qv/yoyAeLg7hVfHKYNZIp49LSkeK6anrEzvSYjQ=;
        b=HNA7xVqpU8RYgemfr+g1n7OgIvlxMCrUcMFoqWxMftBMH2TJfS+QtYlM6FG9IbQPvn
         YD5Re8Eto2RY3tDhHhEx5aC3ToWxD4qEh/lXry4b+hPUy4Uqhk+pskldwJH4bkIyhq/S
         rY2G1RPj5IiyCDbPkKxAmX1vJanLcjOpCAHOdFdqWqtLWpZs/eLrnrUUOhZLfAq+uKqS
         NnK7fCFv5QTcVDFeTSWvzfED8NxmAcQXbxd+Df7gWBORo2mPxo4aUtx/8dSiZDiIyWsM
         m64cADrHrqOvdU+IKbrNUEoT35snsvITdeWrjSJZ/aG9TBpGmpNJc2e36BcK0ncwZrK5
         Tfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808528; x=1723413328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxB3Qv/yoyAeLg7hVfHKYNZIp49LSkeK6anrEzvSYjQ=;
        b=kk+JWqiVRNODnvXrCeWncby3q4qhc2LeDiqqI1rReQ/X6LmV1k2jVihRf5KGN0YDZV
         YK8QSJvqSE2bhShemcpU7GmQL1VTqpvICwhY8rOxNKKGSCKpHwLrgNH5VvnhydzR86vc
         NLYK233akWVJJE1Ru8kZc8vU79QTGzyFkw9tsaZJHhzq+9EM102q4OL2Y+HPxJ34oCUr
         FG6tDa0GcNAevawSS18zr9Z6s/X4XjUiFjhe1MMOup13gAyfWVE4zF53EzrMSmMSRKvZ
         yATTyMfSKanxdWWgyPj/Gk1EakG+hoPi3A9BUJB8Xt3cwjfaVh4fyO9X2T0+47ULvWTp
         O2lw==
X-Forwarded-Encrypted: i=1; AJvYcCVd4CHZhqReLI/DRZdu2gEzGbM+MLddRXGyOYj3DYBrNcR3sUOyYtHO76nPsr+MurGURis7WYU0DASs4y8FNpFj4iEs+bN58Exn4Jda1wnTLi2+NkiM5TdYuyXZRZXSClpyUivwBX1/W772zHzmhhNryiexcZEDE+fUXLa+/HdCl+3Wr7CiNRMPf36KQvPZ4vFraz0X4OkcmmwThu7elKNFXzRGP8DVnULKQq106Qy3kVwAn3G+ORBmTzYKjgzYPh43
X-Gm-Message-State: AOJu0YwhcM/R3bGBo1K6ZLJukBJOL/mrF+p2e4FOSajFDF94kO53asOx
	XJEeeHt9hScmeaJxD5dcqdLxL9tLG1hfxyWiGHpAgI+fNSMv59yipeLyF9Hk
X-Google-Smtp-Source: AGHT+IHyAbzAXerxEkx8MrhGM6CW/olnYbonBveOzbLRvGzA8ruC1oS65RHulC1eLDFEDhBwULvQ1w==
X-Received: by 2002:a17:907:3204:b0:a72:69e8:f039 with SMTP id a640c23a62f3a-a7dc4da6ef2mr775771366b.12.1722808527755;
        Sun, 04 Aug 2024 14:55:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:27 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	David Virag <virag.david003@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 05/13] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Sun,  4 Aug 2024 23:53:50 +0200
Message-ID: <20240804215458.404085-6-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240804215458.404085-1-virag.david003@gmail.com>
References: <20240804215458.404085-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. Clocks are the same as on Exynos850.
Document Exynos7885 compatible.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430cebe99..3ec849ef4bdb 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -16,6 +16,7 @@ properties:
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
+      - samsung,exynos7885-dwusb3
       - samsung,exynos850-dwusb3
 
   '#address-cells':
@@ -124,7 +125,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: samsung,exynos850-dwusb3
+            enum:
+              - samsung,exynos7885-dwusb3
+              - samsung,exynos850-dwusb3
     then:
       properties:
         clocks:
-- 
2.46.0

