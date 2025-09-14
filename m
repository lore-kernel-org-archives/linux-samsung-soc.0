Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8D4245032
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757855791; cv=none; b=OYFIBIe6jnsrf0djbwut9JyOnD2uE9UiKNJT7hbLOyQQj1tAD9sHKTp5qz0Czo2vCCpPI3VU8+PCZNmVzIroZInBhDE4gLt23m7smQpviPz8rnOT1C9VCxUa+2afvtOwS4dTfe2hEHLo++9VfBA6fbgZUuj6APhasBY9nBopJQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757855791; c=relaxed/simple;
	bh=HQfw+08pmHc2Pan7DP4bs8Xiq8bd38U1jE7h+zbEfAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAMmcY6qx3AsU+jyHpXovNuAxT+/DJqI+B8+HfkOqHz+yVJef7365PwXJ9WLM/Ltf/UXI/tJQs983XfAa2Rxu8d+eNlEXdp+ZdXG0pl9G2+o9Nr5TfSVTE0aTlHLyBJq24jPb5O9N6XFvXVhM84+4qa2r4fa9uYbgST7YqRlZqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnLDNEpb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnLDNEpb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dde353b47so20243465e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757855788; x=1758460588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G1Q1wojRT+pPDpvbjQ6/3VZuSR/nnFa4c+/btLbdc58=;
        b=fnLDNEpb87wvqjUXHborj2OQdwukX/Td9Kk7zrswws1PcvgbFM/4M16PV/CLTOK0th
         5QVA5mOOeb7uhhGWU3HV6WnQ1orfYx5HbIwjHJKiPMveqkAXnPyoHm5EEVEcd20V+7WO
         RNdhB0gV1RrIjaoZjwPKGU3SHw6QcHzdMVJXb1Dd5H9hosix/9oh/wf6sjo7SMHPNCS5
         U42iRpU4hZkE0ZiHNqYbs92Z7STa4kwaH9e0Fsgw0BTb1cw3GKxnfk2SQ+JXsaq/fw5+
         N8O299NKFGKZvjOGaOp5bk+l+nQofNoMcVeXjwaoL/imlj6dNHsq75+/BMlntiqgwcuE
         8JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757855788; x=1758460588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1Q1wojRT+pPDpvbjQ6/3VZuSR/nnFa4c+/btLbdc58=;
        b=rKigWiW+aRaDJhxW2bFogSQDJjUafGVtUV8TPhFECKic4fPJpnZe8MOYDj64xYEwc/
         ZKbl/w2mNzvginao6B3b0IrD+jMu5a4BnLxZW6mKxo6sXbysdpUF7qwuCLvFSNzl88sh
         hvBPcACGplfqZO8hIXFXyjKvUU3dRlWSCAoCoKqlQRFEH0h/pqBVBc+0BQf6Yv/4Y0Hs
         8fGk8xVD4a2UQU3/2UhPdN/W0ZJXlxTJum9EsYCjhNgwu2iVJ243FmRteejPgkwG06LR
         uiBpI/wkpVoMFrc/QH/z+TV92BSfB4lPFmoSzU4nwxJJd55QQ2xTWYTnHqX+q9Kwr/tY
         3RVw==
X-Gm-Message-State: AOJu0YzfCbuKr0UHfcRx179c/MdTZI5qbFOqH94NB3gqQrCMkN62tyH2
	8dn4ZQof8O4Lul9gMUk8TXMOTwwbQ5oJgSUbc/FIdU7dAtFXWglOrpRg
X-Gm-Gg: ASbGncv/gzTGg8eH4TScDAtWfweou3K+8juAf4ziPH2gq3zq05q1w5m0OyBBDk4NNhQ
	/1DTC2xEaE/8M76bDwt1jMRD6UZ/h+A0bh8ICXHupcZ49V/dW9tcHjGkzO9LPYvaCXEtdUU5cvT
	yin+TOoZkBxYWM3TsVm5WtbhNJoMwLPun+74j1ezAkw48B1U/HmlGr7paC3BLz5lO3oJKR5o0bY
	Dbu8nkkszMEhnSEFlQeP+aWhmN7w4Kd3DyHlnaQ+kPdnkE+oFupxfu92yyFaZWbSgA7BpqzWe3h
	VgLIfgwUSvdsXpOKdU8M1YlL5dT6qt1sPaX+YS6shoM0MYf39zUu5O9/f90o2AYQtVRfjYkawxE
	KRbQuIxhWdTg9Cs6Q+J3fXrKaweIWU9GY6MxhMpOlRPjxn62wiSCNEZbIAaCkDW0/GZnaUPIC5L
	tJ1hX/Njnn
X-Google-Smtp-Source: AGHT+IHIQ6hL02vX6IP4GwQbuLCOZOqv85KBgOtJmDEVCj4YcKxCCJes3RvY9fUtp3IRzwzcuDbaqw==
X-Received: by 2002:a05:6000:2908:b0:3e3:5951:95ff with SMTP id ffacd0b85a97d-3e765a18d9emr7675234f8f.62.1757855787801;
        Sun, 14 Sep 2025 06:16:27 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd0a7sm13602468f8f.39.2025.09.14.06.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:16:27 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: i2c: exynos5: add samsung,exynos8890-hsi2c compatible
Date: Sun, 14 Sep 2025 16:16:20 +0300
Message-ID: <20250914131620.2622667-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos8890-hsi2c compatible, reusing the 8895 support
since it's compatible with exynos8890's i2c controllers.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 7ae8c7b1d..ead1818c7 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -33,6 +33,10 @@ properties:
               - samsung,exynos7870-hsi2c
               - tesla,fsd-hsi2c
           - const: samsung,exynos7-hsi2c
+      - items:
+          - enum:
+              - samsung,exynos8890-hsi2c
+          - const: samsung,exynos8895-hsi2c
       - items:
           - enum:
               - google,gs101-hsi2c
-- 
2.43.0

