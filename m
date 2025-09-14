Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F3189BB6
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757856226; cv=none; b=IGl7pFJL5RS8iwvyi6+iV5jGNtKG4qBeHuxAAm58WXKK8nSFiS++nHAnI9EoHNL+kOFMPh7nAy4C9SMUEZluATI4NwCylp+ZUoBBk0+ZeT6ok1LOlDtBVpV3Pw8CyDhC3HmRyFSMiZA8IHyR1BqcLvaSsCFuRqI7zOHH7s5tXx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757856226; c=relaxed/simple;
	bh=noXhz4Y24g4PHVqA3gPgMnDwLUm3u7HC/TSG+gMVjrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZuEJKkk5Khy6R44K5vEMNRFFszYhll5QZ4N2rgFkEwbpoTkDDOPO4nRanetMtSnFaCIxk5OWYlyjT+3wRMOmr11pXVb/ShF9WcekqgwzzwkKRdu+jfFL47T23cOq5EqUSEf6DND6Dgh/dNQ03HhFq5OhteLKKkGN8hSrMmEHsnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvMmUtNl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvMmUtNl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dde353b47so20262305e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757856222; x=1758461022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaljxPkcfQHPyVYy5h8ZrWxk1AbMPnNmiDPm6nh1Er8=;
        b=PvMmUtNl902pqZ+1PCWZWhFfD26WqEdkDtx5KNSHi6DMvpS+qGn3Lmdi+AHAl5dAMO
         pQc3OHxArbWhcSv5cDNq1og4WbP4HMYRXMVsB2WvxccAMBVJxCAC4S+Id4xnVeSy03CY
         gYUx9Xx2uPUnEnA80lpLNMIVKcOYANPovYfQkcNwl+s+xxpO6x9wcINV1nFG6v47vPKq
         JMyW3Pld9PXmyGWrcV4E9eOaO7AtbS0YiPQOWHVgSGzQq/UoU2EUhjr4QkU/nKmecVmj
         zLW+dT/j+BsDIdBSPd1Tw/N6dPKy/pqzmKyImDhkv4uQyCpcWFjJhFU/Nq7fkV0HQnR4
         WQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757856222; x=1758461022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaljxPkcfQHPyVYy5h8ZrWxk1AbMPnNmiDPm6nh1Er8=;
        b=dWVPdgtcPb2cNH7aZH60XMVKnhsqFe6WjHcti+2hbFHgVwYnl4itIu+onGKXn8wJuv
         eROqINZc1A4dghfMwoCYGDeF//uN/REzw+2JHxgW0ucm5bSRNZa844b2cHAEsJ2HTHke
         StTf4pE94lOibxHlnpetehzCrnXVjO/lYen92lzzpZI/nyItLScXQv5DJpxp+rowwMnS
         sIMf9iYXGpApcIdPFwGpBq7vWz2omZQ4u0nRPXpwaFIuWeZWFey4xsNxsr6tFwxjSfWr
         xQ6bEhGHTm5vlvf6msA01KfXwxGrKRkLrUDhYDRXn5EpO1pNWjqugrm4dfuF+7MKHULI
         vYZw==
X-Gm-Message-State: AOJu0Ywms3tUzMuM8zcL1IIx2yIuCkchRx5sdn5lm/nB90FsGM3LXGtJ
	oHy8r3A/IKvjNwf/DaL72iY21v8UYEi3s+x3SJ0/xIWZE5F4WC6q9bXF
X-Gm-Gg: ASbGnctgi87PsWkCQ5QraG/fMz7FGvWUXTI8JfX9tMRbfvyzhKEbtLdDX2qqPAcM+3j
	NBi/+PK/jRF7AztujYsI+/bPXVPBWwGG6CUXK3W8sFunbVpVeOZA3FsmsN4MWLQ0/pQl/JtzFtr
	J8eOgHO1yEUcdeeS/pJvaHtyDyIfoglm6ImxcOtsxiQarUuX8Yh+Dxxq9lqr4PlKyJYIu6ecgoX
	h3CQ6ykH4AxQoi8zWIJcJpNL1Xw9ykjtLQtZ2TI7c3lLl8sfOJKD7E8/QqR8yEmrgCDEIgpL5PN
	4nlnkkdFsYtDekABPLtrbc4uWa+ukTQWbgedivV9mGfiBDa+d9tep7MzvjeEPoFabPCOHYU9O+V
	tmhLFog88JLCuZwV+Do15KjW8jayE3n/OVYz+m/iQD2UJwjt2ifEPzXOxXGzHyGbsGx3y+HpARr
	BBRu+9WWqn
X-Google-Smtp-Source: AGHT+IEDzY27XIjmb+pnfP0KAuMr1rdHFrYSHqkjaYiv+DONBXw4koHR1jE3FQkMkK1VOsljfrgsZA==
X-Received: by 2002:a05:600c:1c0b:b0:45d:2ac9:4240 with SMTP id 5b1f17b1804b1-45f211f7099mr102931935e9.17.1757856221985;
        Sun, 14 Sep 2025 06:23:41 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f27f44093sm61736025e9.24.2025.09.14.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:23:41 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: timer: exynos4210-mct: Add samsung,exynos8890-mct compatible
Date: Sun, 14 Sep 2025 16:23:39 +0300
Message-ID: <20250914132339.2623006-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like most Samsung Exynos SoCs, exynos8890 has functionally the same
multicore timer.

Add a dedicated samsung,exynos8890-mct compatible to the dt-schema for
representing the MCT timer of exynos8890.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 10578f544..2c01e8bdb 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -34,6 +34,7 @@ properties:
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
+              - samsung,exynos8890-mct
               - samsung,exynos8895-mct
               - samsung,exynos990-mct
               - tesla,fsd-mct
@@ -137,6 +138,7 @@ allOf:
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
+              - samsung,exynos8890-mct
               - samsung,exynos8895-mct
               - samsung,exynos990-mct
     then:
-- 
2.43.0

