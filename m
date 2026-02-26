Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB338A73C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 06:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772086259; cv=none; b=U3xHO/rPEnVupAq2w8KQ7lhP/jK2nmuoZu0ymvPz5UwRSkmNW/fSQAnK+PjjVD2AWppwpU5/awRP7AI/5BIo08iZ5YJmh5gZSSeLjRATo8Iyu6sJyp2CML1a/tI2xiX3wOF3TngOpBdZwdbiAoMYc5Uc3fDbace/juryLy6wSHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772086259; c=relaxed/simple;
	bh=pFZiHnkBN5Lio39P41U18guYn6en/j6L+UEYS0RuXNI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uGCKqsaHbwvuJXUPIP+gD5AZ5ODGitZyvywOJ2z3kXI5bo/ZCDUBavqqPg9K1MYvKgNpnC9MxWCAuEcRm9fJKD5J7CP/awvw5EeGqhrGUSnv08pNGvpoi5tnFCPc0oO04i+XAxptfd0AFqFVHfxwjj0EpzqznXFhRhsFWUzzTNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oM4YYV13; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oM4YYV13"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1276e71652fso860390c88.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Feb 2026 22:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772086257; x=1772691057; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fcVZ4BQFpRmLHwxh/g2dVLrCTqrD1Ac4Q97XzCkzEyk=;
        b=oM4YYV1366RmzHXAG590ORLBCEGHT/jeSsUvZTWYnL/y4rT13mPnrwEkC+mSSvM2iC
         5X+ahGExCMxOqsSLKES83mxnIzjz9Ln9JKVAEgwY35ijtXL4Q9FzijuthWTACM4eiA0w
         XbtIzeSrsuzjoi7epR3XKscWGgZNYURY6H6vAoCvaZ8hL0dSW0KH0hNw3qK7oonCH3UA
         XeTP3N2CKf4s9Fgti/8VzcyYQJg/rx92QdmUnNQlZnk9lVnLoH8QMURVDC77sp9F6QJ0
         IjqowKHq3oD1I9QGwaB9/xAsxnDYu92diSzdcGiUlxHQnJRXtXhEje8lIYvXZIyLyBPS
         KL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772086257; x=1772691057;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcVZ4BQFpRmLHwxh/g2dVLrCTqrD1Ac4Q97XzCkzEyk=;
        b=JkB9YD3GRWCvBFghCOce32FMxnRoVTemWWMpM6FCIbzOR5UcOWXiIDKDawrDI6mrH2
         Hrtg/FGo6RcNv0I4MAizs4PhMLhXAgrAW6Ob8x17JGbahkv3UOEeJPV1oYAWXZW/W7oD
         1YyLUbtPrqYAI9KTFS9JALV2PIJlT1KUL5jOJ8HtjDhKpgYOj37Pc7s97HyDDO1p2KOV
         5Q9ouCNdJ0PItWIMQHQm798OhI5ZivEypYDiOu+7LoFXIgy4sYQfvSMHJDmeC+tckvZU
         VvMo8ALBV/xXWPdbSzCNvuP/Ap9ZDNP8UcLYKxIRwBSrSlkj+MRqaHefuoXH+LM0zs0r
         WNiw==
X-Forwarded-Encrypted: i=1; AJvYcCWgPh45LXeFNVB0OHk6f3QWl8E/Z5IZ3xHqGPc5JgwKXGwyz0k4ZKwtipMmgcPpa3BtO3lmphEE+44TIl/lYfDHSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDFxm9NjD/ILrpltSZCeWfCzstZd6bA7Bnqe2/ofKG/n6Dam/s
	5XW8gfxP1CKo+jmJ4Qt1NpvUcg00E9yqekwFwmn0L9UF/hhIp5XkKOlLRT6Beyd+yseLI5YBkE+
	FCclTIA==
X-Received: from dlbur21-n1.prod.google.com ([2002:a05:7022:ea55:10b0:127:8aee:c50c])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:11c:b0:119:e569:f61b
 with SMTP id a92af1059eb24-12786963bc9mr1496401c88.20.1772086256595; Wed, 25
 Feb 2026 22:10:56 -0800 (PST)
Date: Thu, 26 Feb 2026 06:10:53 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226061053.2596167-1-badhri@google.com>
Subject: [PATCH v1] arm64: dts: exynos: gs101: Enable AVS APDO
From: Badhri Jagan Sridharan <badhri@google.com>
To: Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Amit Sunil Dhamne <amitsd@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"

Enable USB PD SPR AVS for gs101 by adding SPR AVS APDO to the sink caps
pusblished by gs101.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Depends-on:https://lore.kernel.org/lkml/20260226055311.2591357-1-badhri@google.com/

 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..5a689be61432 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -174,6 +174,7 @@ connector {
 						| PDO_FIXED_HIGHER_CAP
 						| PDO_FIXED_DUAL_ROLE))
 				     PDO_FIXED(9000, 2200, 0)
+				     PDO_SPR_AVS_SNK_APDO(3000, 3000)
 				     PDO_PPS_APDO(5000, 11000, 3000)>;
 			sink-vdos = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
 					     IDH_PTYPE_DFP_HOST, 2, 0x18d1)

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
prerequisite-patch-id: 4dacd8bc550e317d67134d030814765fb9f4c6e1
prerequisite-patch-id: e863378fc602b6bee2e9fdd8c568003c00b2a38e
prerequisite-patch-id: 202a9e1e9cf27a0b9ff7ebea76eb45cdac2cb581
prerequisite-patch-id: f3817c560d0e701d7499fa1fb9ee40d22816c09e
prerequisite-patch-id: c071913307a6eaa417d1345485d7a9c165d40834
-- 
2.53.0.414.gf7e9f6c205-goog

