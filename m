Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2792E424D;
	Tue, 22 Jul 2025 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186278; cv=none; b=UMJAlWozlO07QNzegXGBrPwhZA8U5M2yQTnklUCyGlqkh4HSG1rw1VNrLgQWt6YFH4U5yOk0EPej+vlmySM/cVbkTTL5NBfU3D71FDjAau8e9mqIfhftBRL1eFXG11YA3FxXIzuY3OU0X69qNtrM4eD7x1gmQFvtSlyWt3CRjxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186278; c=relaxed/simple;
	bh=bY4/gf3mnR9ugbzc4iSCLdkwuMxGhpaLeXXWldQr5S4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ecHJSfbnDthNfM/31CtBcwOD2WRDt5pkvUKuFWoiY5ungixhHzfcYEaGSY1LW3se+bAQTZ44mOwvPjDJjSbpg2T8AQBSZPuGSaxG/K2kLjshLZVa0QcET7BjKH8dOi6RqHFNDmU2Qm0JDP6skeYRg27i9tGqwD74JIgAYANt18c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OV1ZTYoV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OV1ZTYoV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so9644737a12.2;
        Tue, 22 Jul 2025 05:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186274; x=1753791074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lx+ZVMuygWM6iK3n5i4Qy5l+eUl2JVt18wiRP2PvZQs=;
        b=OV1ZTYoVfnzq6p9ck6+P75mLoLhdr9VlOqYAe7RSwmLf6N0msniLLXhNb0AKDY4UOB
         WjHP2PNAcE1Cae5g/EIjr/vZZdTKOVMJkSs6+tuTbn7dtsPSkPNxdKOWvZHZKO0bj18+
         2Erg5NrwV7NLu1P8Vz4+tgRwA4xXOmvA9tulPFuSaJ55CXP5cLd9I/Uu8Y5vxdBM5hWT
         8C/UMvZI1XEz1/eQw0HhCEYtq0QwQuQEjIAcu59VTjkmfAehi+9BNXZw5E6S/JVRIOEe
         gTOgVfjzybQ2lE1E8ep30i89QMBE0acVSZQiiVDrQQANCnuJCqqoWONqIBX+0OjWHBW5
         FzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186274; x=1753791074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx+ZVMuygWM6iK3n5i4Qy5l+eUl2JVt18wiRP2PvZQs=;
        b=kG2vYjoQHfbaknOTWDrSfynb2GLKKaI1DnLg6cdq3jGTKGDEUuPcFLZMEbe5Pd+s/M
         xx3iJZncuz09GNrhaYK37r8UcgTiHEou0g6jWBLnWpGVevKDm+ZAfwa/Raslc//rbqu1
         xgRQCZmVYFajKOyhVJINLz2oly1Ihefc33npBGHH/lP8LZGL7nlsABDciAEkVGAnskX5
         82pMdUFHps+SR/9UTbQCyRO5bDHuZ8dHe8Xxnv3RDQO24E0ZJV+qgJ7BJR3rj+vPbyV9
         tGVyoPzWCnrJi8uDRwLMXl+xKzU2o8hQAnO9DgtjMTNGL8iaqw0wx/K0b0b473aQxMU7
         hGBw==
X-Forwarded-Encrypted: i=1; AJvYcCWDBkuBuIxu1ikp5BH4Wcci6Ak5SWZhYZolRX4e0Y7ha6lLigqKyBdA6Lzqj38nchdF/HHb80o88XuX@vger.kernel.org, AJvYcCXDWOIqAEZu9wxH/fsLPilQnIi5CicY5OJ/etnuUXIaDAerRqPj75LTkYml4UPkxR85Bc1dafPVa/mt81ut@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk1RxYGTzFfd+6XPxGkoEC3VnabZAV1tXs49i+BLOxyLDqREGj
	1Hcvco9Lmbg6x/HOnQ7o+N1Dq1zSiAXPsu4WndRB9EZJetfu3iPDt/4w
X-Gm-Gg: ASbGncsicedcwPJPc/bEJH7SjO8+hxcQXtTuoiUVCrUqmCoqe+5gujxOe9Jx9J9xyMv
	1DzPmNzlG3rrQK+NXZXjI0XCBV2YNfyOLUll5Ir9hpl7PtM6bX0pyBqaSMCw2/WdVGF9YxvUhMl
	han1Bu4GbKrP3shzyZ/fG4gTVij2lbJX+YJTWl3udU+TBi38KK1tdUxf4Fc3aXkIMgH6TAQ6JC6
	RBdYjkJJXEkai6j+veOCI2cCkVXszkNR9H88UXu0Rpff1d1i34HGRqR534Y4QBnEVn50rMxpvbA
	Vu2CnLBj+VPm1eF45hVPl/x+4D53pP5lLKV+OfPnNzqkshSBvOnkcjahZQ2a7XhTzD22UOjzUuV
	+EAgfg9eEMrR7n8JI35BXWlV64r5Dko0R91V/5Ku9/FINnQFSPYLtx8dafrj+UR/PKASYwRBwMQ
	==
X-Google-Smtp-Source: AGHT+IGED88fhPyhrYgJcmSWIkwvCbWfNUN8i7LvAClr6ahEphO0Z2rfiWIHbCtX4nZVH0UIjwz71g==
X-Received: by 2002:a05:6402:2689:b0:612:b67f:d512 with SMTP id 4fb4d7f45d1cf-612c731f0a7mr14639047a12.4.1753186273485;
        Tue, 22 Jul 2025 05:11:13 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612f15f596dsm5090257a12.51.2025.07.22.05.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:11:13 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: soc: samsung: usi: allow 64-bit address space
Date: Tue, 22 Jul 2025 15:10:36 +0300
Message-ID: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some device trees, like the exynos2200 one, configure the root node
with #address-cells and #size-cells set to 2. However, the usi binding
expects 32 bit address space only. Allow these determining properties to
be set as 1 or 2 instead of a constant 1.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index cb2263709..4ce871676 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -57,10 +57,10 @@ properties:
   ranges: true
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
 
   samsung,sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.43.0

