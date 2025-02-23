Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7244C7D;
	Sun, 23 Feb 2025 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313851; cv=none; b=fUMrB/quk3FgXB3Ir92ujBEPUCF9i3F7GYDhd1RQvcqlwmAz7pRBnCSHTLiVfYRWGClvdfrXcELmssU72L7BvrU7C/VjqHhUdTeQHBs0jLCl+JPFnhZfXwamB9vH0mR650H3z80c1BHCtFOjGLoZ8rqCEfh1lIf1Yl2AuoUEymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313851; c=relaxed/simple;
	bh=5Y2rWrPByplM9s/TOvWue3bi1TPuQhufG9cJL4qpa7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwF0/9bBxNQsc5Ng28GnJa1QCRDLbLJ05RhC2nBxWNVENB8WzGOBprhU/bxay5aBP1/rR+gR7rv2KmtHHYPEuerG2DRGLnY2QSXhwR1OYkMf3OpwW396J52Q2fMD//IAzCWAtTiKdV/7HMvBPF/bLVsozIL5iVjJ1C+mDXSk0Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZLbosiN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZLbosiN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4399d14334aso31147755e9.0;
        Sun, 23 Feb 2025 04:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313848; x=1740918648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7pE5Ysu98qvM8Dtr8qK+BXt3i2KN5R1lxlItWkqUL4=;
        b=LZLbosiNPr7SoVwpiq8o4ufdmHMCmmkTm2jF7vavG7ZybDIdF5Pny4pWP3XK9hoEn8
         yoxJWw/0i+z6OYrpr2o5XDpMHFoX+Aaj2WMWYao0F7BU4kC6WM6FgTIxt0XvncJeDyZ3
         tMJMTDkIx0XbY+IEauSmWHPScwoz+04RLyj7Dl+GtHZtIP29YIzfnJfSm68Kysy7ZCQ7
         XioVnaPLL86viwCeEcDWDTwLJ3UWT+ii2R6Bdynj6dAXKwpmiBk0VkmLNYin1qUGoQef
         hJE4pyQsQGEdXIzhiIw8tgGkeNfdT9sSGGGtJqqMgNe6pDfaFG/FYe4/V+kyxrt91mBP
         irvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313848; x=1740918648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7pE5Ysu98qvM8Dtr8qK+BXt3i2KN5R1lxlItWkqUL4=;
        b=DBcUdJZ4zdOSOuQJepITEneT/LaCjmS/AZqG9PdTGpsdwrTlQvDNh+XrmMewtcaDZa
         dMh5TDpZPJb5SS8QIi6AZ5JiA+0wjpSERW1nyNPVZGUrk6Iovc8G2MWnrR8QLAKEA2nW
         esB228cch2P3r1mp8IYlwrxQPWoh4iTkpnnJc5EExAT6sf1SWlmNy/lcJ37sui+kKW/G
         SIHOgPHNg/t0z1r41RHRb043EU0gzayrasZbiGn/vxp9lxFoRlItumj2KTEejT6NwwK8
         Rfan9rawbwA5DeNNLOOCAej7QgsAXNkq7IN0t3p46luvgcIF27mE9/Wkdq3PtD3eXOLr
         2bfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX54KBJ0H9EZVMzcwVK/cLS04eKUbzX1f8/vjXQYz+4iiqD8C/jYN0X4QYbebWHRVWL2tJgLKGtGMBE@vger.kernel.org, AJvYcCXl6R3DpKx3u8WLiYXjBvXDOEYtHopoycVHc5Y64dpPYLcYCXwJ52Yutw52d4GT7Q2HmivkuLbNO6hxDkx/@vger.kernel.org
X-Gm-Message-State: AOJu0YwQTINTpMHUNtaTd5ku1Dr49UBaqAEglRPEhnxRVgcA9UYxJA4+
	uKIcdEt/sHxlhgDTN0D90/SDPTazJFJLFbS2ZlQC9aVZ5G7DLZVQ
X-Gm-Gg: ASbGncu/ItIDokoy7U3DERDc6WYmr9QUgCYgr1dq4Z5Z9Ec4CBet1ckfwfw7HD+uaX2
	9fiuhAm84JUscG2PdcHwZAOxLK4JlL2dr2Sj351lRw1AAdltWIg9G/+AodwT56D/MUYd3+Wh5KW
	dfMEawCspPJYvY4JJlJNAezg293E3rqDn8aMad7EqSGtd0okMekJ9EKVmFjHbxp3KY+DJbc3kWT
	sb6imuR5HLzmwAgr+MfhfuMYpIS/qhWyF4nQjnqD+2LuEVlJGYmj14B+6d1TtQgRUq+DJBs+1je
	ssCJHxs6rrZUKdH/zyLsNDHjCydNViMd3xWqcGIWN0RX6t5Hi63kiOtRLj2wmp/2hoi9kN/3a/X
	8wg==
X-Google-Smtp-Source: AGHT+IFyAFhdaYbgObByL5o2erYzL8TE+I6wyAASx5P6UXLrNX2c/m8NKIgThwkM0kZ48S1KFiiKAQ==
X-Received: by 2002:a05:600c:468a:b0:439:87d2:b0fd with SMTP id 5b1f17b1804b1-439ae1e8dc2mr81335095e9.12.1740313848074;
        Sun, 23 Feb 2025 04:30:48 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030b2c8sm77061935e9.25.2025.02.23.04.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:30:47 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: arm: samsung: document g0s board binding
Date: Sun, 23 Feb 2025 14:30:41 +0200
Message-ID: <20250223123044.725493-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
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

