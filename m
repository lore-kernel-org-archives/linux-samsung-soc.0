Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29937748D;
	Sat, 15 Feb 2025 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739623176; cv=none; b=jIVR4unUdAGDPLfQoiKH04tzCqdypYsIRoMC5iCdsxK1IEj8/0/xCWdyr4CbBQyK173WFpYdRm9jt5t8dNQe+tgZhJlB+pO/QNMwcATWguRXsq/Xc8vsiKpvCG1fiO7wRe8Y3wPRHjH/lEPNSyBKQqxsZrGiB2Ud00kjZbH4rxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739623176; c=relaxed/simple;
	bh=OsuOE1LzlUrTN5kX1dUSPK9jRgh4rxbgfC0a1NCoMcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DLQcirTTVpJ+g1+dDVL8pcGTbYOuH74AhcHCtxWYGE4enANevj72AFi25nfkYMdfhPeEXgF0fd08AZWT5Qk+BYcAJQ8BiWpiW7W/G3A7rUKcmIroh42/QIuYdtjFIk20I1PQlTem9jDp/BYeWF/Xs4ljIAAh8LfLqn+PcRIVe6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRj1imaK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRj1imaK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38de17a5fc9so1519593f8f.3;
        Sat, 15 Feb 2025 04:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739623173; x=1740227973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOzHbiOoS5yihAuEFC/WAZMn5LqH9HEiJMUp2IVfaik=;
        b=ZRj1imaKB8ncPCq69nU3xp1iFj0X7H4hNDD76Wao1/rMWIT1K6hFTL37bm/WZC9WUr
         kMoHxXzZuYv1GGMUBJUJk/c2NWYWALDyeeXhdjeiPHOL2E9sH3R9Q60IRq0HonT3/bJk
         PrFgV8deO89oIvnJkSSHT0g+hOC0j57/HkRgOmSCPGG5be1P7+88wE3SB0IkE8xUdZoI
         ZRQZqSo831qf+YgrTWnywEAESKf+uMb1y6/as2ayLGXXOLBtuY/GSBE0TRijGxcBOpSB
         fSSxwwFNilBdt8M2b0lsmU0/s67P+HDURIn3WLa0YCn0p58FaneqMEk0vEzDb0bbmB61
         AEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739623173; x=1740227973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOzHbiOoS5yihAuEFC/WAZMn5LqH9HEiJMUp2IVfaik=;
        b=vX3An0KnqMyWrbaXGHpEfcmUWpiWkbPfTu/ebNkm/EGt9nb+Rzro9K/YPP/X9OPWG5
         Ol0v+8OgmwuKu67PTNoqBgODWHw08xSa9NBVviphUhp45Wl0VOwjgJghOQx3tGNsoCZC
         8JFR5uxqEoxlHLC4fuKwq0CR3yrv6M817CTcFpRJIpGchICfT3yLkbSnrDbv3eS+HorF
         NDADTTJeloo60DSiQJt7u9ZJCCxNXaOFORgnFJt4/jh4WfkTymvetiFVVKS7Seuh+JS1
         61JSj+Ze6fZ4/ljFXL2x8e0pqF/ADCsMwmQaG0jrXl9xWVAzOR4vpKrcBKrTeKhwt/Zx
         UxRg==
X-Forwarded-Encrypted: i=1; AJvYcCUvTuay0dMv+0A5hw1Uc8CTlGipxbLbw2Se0WAqNCjPtDO/GxzAP+ZIqXk+lF/QvPpP6VdP//qme5k1WNrz@vger.kernel.org, AJvYcCVBXg4rpTISqLQ5GO0xw/w4JY6o33qDKV6i7AEeTprr7ikrPg6MgkcC4QL88qFe9LANCK+/kLdZZvrO@vger.kernel.org, AJvYcCVSX5kHZLZnsLbPDyEPoa4vWwCrykCQyI98J6zl9uWE7qxLKEa3SFlfXaFdVALrZca7DYN68kIE+vtbMzu+hxFhzok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5dl7UoACYa452CvxqSHGoeex2TcOkDvhRz54LUL+e0GPoXgXM
	fvxU/eSiSWyLdDMjAxM2a2ZkpIni46ogDnf42YFdcVfHPVqHR+Mm
X-Gm-Gg: ASbGncuCItqOTikzvkeLBOIoGGfOl7sqxiL/86GJZtxuZEl4AtmXJFFM5yW5kARbBKx
	f7dhbzB+3PHVnHcLwfBv9DN9hbLCXiEY/8huHSKaT7zu6u5LwDO6bKOaXkhFtLZaWMbRFy6+nWt
	O3V5TW5W1wxdoYc0xCUVAH1OcFLhFJ/oW3RdcrIZWxRsHFG4BHsYgnV3e5dcC/7ZxPBFlmAXnFm
	TkY7yIcJ2DotX21vEqHUnl/i4sThdlZcpUvbPXyQMDpx/74x5MBm+eu04OJPYZmlB/ddvBGZtV4
	KcwbAbTlqqeGR1Qcx2jEw4NSizZNNRG9Lc24PVJcgO9L8A7RPDacKDVXgXGgoTZchBM=
X-Google-Smtp-Source: AGHT+IG7zNrA01xgjYEn/MTIJYOqGw1HZPW6RPoPt4xc17909V642AX/ilwKBKzO9yBWRkBEkSVrLw==
X-Received: by 2002:a05:6000:2c8:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-38f33f11861mr2472767f8f.4.1739623173271;
        Sat, 15 Feb 2025 04:39:33 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7156112f8f.5.2025.02.15.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:39:32 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: timer: exynos4210-mct: add samsung,exynos2200-mct-peris compatible
Date: Sat, 15 Feb 2025 14:39:22 +0200
Message-ID: <20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Whilst having a new multicore timer that differs from the old designs in
functionality and registers (marked as MCTv2 in vendor kernels),
Exynos2200 also keeps an additional multicore timer connected over PERIS
that reuses the same design as older exynos socs.

Add a compatible for the legacy multicore timer of Exynos2200. Rather
than differentiating it based on the block version, mark it as the
one connected over PERIS.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 12ff972bf..10578f544 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - axis,artpec8-mct
               - google,gs101-mct
+              - samsung,exynos2200-mct-peris
               - samsung,exynos3250-mct
               - samsung,exynos5250-mct
               - samsung,exynos5260-mct
@@ -131,6 +132,7 @@ allOf:
             enum:
               - axis,artpec8-mct
               - google,gs101-mct
+              - samsung,exynos2200-mct-peris
               - samsung,exynos5260-mct
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
-- 
2.43.0

