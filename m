Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE34D3E558D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781354201; cv=none; b=bgZHwC8sFXmQpitBUz7jZQ1JTwL501XbRBAWXOAtzbU2N5vnY4xH/WZvMZtKvoewpuH3x4KMVIBczVDD0O+tCLGfUwpmQi+yzpEU7Bxb9JKzkm4cRyOOCG3jy0iE5S/efGbn4IdFP0AcFaJyL3rVmnSxzRXayx3kUJxAxX/pcx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781354201; c=relaxed/simple;
	bh=WAkp6NOqHTQF9JqXMs+Q8InAsPduDAdJGM1CNG6S2qs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OomdzHZS0+3mpTBFkWFuqMciLn84CQcOcECZVyZx5XlFf1wdZhjRtYUHvjYF4mpo8f8QbNmABaVgplpyk9i2QKpp88l3/z17aPWKGi5Lb2OPzst4bel/bT4i5/JkisS0thx7TxfjGI9sE+NO9KXGtt5lpvT9hO1kF4q7G5zQvbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEcWHEQw; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEcWHEQw"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3078e0dcd67so2137539eec.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354199; x=1781958999; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nJDFZ0RQJ1vXb5m3w+4361WDqY9OZe6RpHvJSGou50=;
        b=HEcWHEQwmxDrmrew3C07vlVxU/4oGgVOV/9L8Y393uuBvECdtYoziFp+iugNIz7FF0
         jkbLL9yLGyjnRxsjhziEONyG94kaHhz8EaRTtdznSNWJjtWGtLgpIM+qmJg4DzIEU/hl
         dTdROEaQkFbB9n12jeKfp9zVKiuPBjQX7Nq5bpT9ALLVi8DV8BA4GZcxcWsfQCFmNHuT
         J/YUb85JqEtytJQcNOziq9TqMS/vaYQxvpdXTi4x+9mYE+ScJt2M/shv0wcmT6eK0WTk
         n6sSf3k3HNNcc8nB7SLOeZT1SUNfePdJIVbV0QjVQnfww060fpBvh8KGpTJCPTZO8fev
         dR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354199; x=1781958999;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nJDFZ0RQJ1vXb5m3w+4361WDqY9OZe6RpHvJSGou50=;
        b=E6zj4SUK8bUYtzNo15PgYkQvkgXN8uKTqweKo5ND5FNHte2/VqMMYIaTf36HU85qRl
         eUiutZ2vYtjx80dXqAP8s+X1uID7EjaHOinbtVeqtE4/PZNnSk6bMARgZDXt+4LUkYOP
         8tEMuK/jRp64iHKquew6U5CDr0jEvBcxTZX6wmX9ZdEn7zTL1oOY5aeHoIkHexmCYLF9
         26xrMAIP5DKboc0Iz+kB4ivfXyqHSANW1MGBVih+qV8UPL8T8B0CWoCiZ94XoZOQEy7j
         RWE/AHhnzhrsNpwK5QzpXbvada8pX5K21jnS12y4TTEOd1ON6dLc+9lQQniLqfcboslg
         cQqg==
X-Gm-Message-State: AOJu0YwPfEXxFQxoCBn0ZjffJgbzemJHYj5f23yxW7FJ9WbCOwOQUkqL
	hxC+9gi8DUenqmypNQ01cx9aLSXUTNohdMEgVLz2AuKAX7SLDsjP6Ixk
X-Gm-Gg: Acq92OHyhnF68Owr3+Lwri3dfpEhtWyazrdAke/uJY6XKaqzFVa6szKdlTKMvXdboaR
	kF8uE/43OKed4E71RclNFihvo3/1eho3fWS08w0T9RGq9lr5dG9FxHJ/iU3Qn33eZY8+VwF84ft
	c2O2ASDCKq442952J8v1t6xmicy+zMq+oQmO9NIMiw48624YPUg6wneLW/rbd27U7L8Fg6f54Wr
	480xk2DAuvr2zBSLqcb5yJBmQrvGzB/m5VpZ8wmxG/5i1qtl9uLc76XsE1IBxP0gV3vPhBuXVpD
	0dsBFIwYeLNaF/L0OUG92UtF48B/jk7eJMXvicMSl3/0ci2sdPk1ltcIZnGAlbdJabm9HaUlDKg
	jBLoRJyuuYjViGG8NYYhsPwZu8B2umxjisWRMCubbR/XHXdbkfRBb8xWaporHLy/LVzDWx2y5ev
	oKr0y3FSDocq/K2PLYzYeGyhHmiRH/
X-Received: by 2002:a05:7300:6d21:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-30935239b09mr1654447eec.2.1781354198696;
        Sat, 13 Jun 2026 05:36:38 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm9176630eec.28.2026.06.13.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:36:38 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 0/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents and add TMU_SUB
Date: Sat, 13 Jun 2026 07:36:15 -0500
Message-Id: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9OLWoC/yWMQQqDMBAAvyJ77kJMIBq/UnrQdG3XQ5RsFUX8u
 2s9DsPMDkKZSaApdsi0sPCYFNyjgPht04eQ38pgjfXGlw5p3dIoIRictBTsecXFYd/GMnR1Faz
 xoPGUSc1//HzdLHM3UPxdNziOE7hRLWV6AAAA
X-Change-ID: 20260613-exynos990-peris-fix-v3-fac19b879206
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781354194; l=1267;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=WAkp6NOqHTQF9JqXMs+Q8InAsPduDAdJGM1CNG6S2qs=;
 b=ge4xC/xkTrmRFZwUxQ3xLwJohhzxi5kZoo5r4alnDXRKRBCLCvWbw6d6atLzgZAkFVx9jMxiT
 ba+T7t2FpG6BvzZmRKoeZttk5pu4O0nXWqNd+GfeBywsrRv4c9H034W
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Fix several PERIS CMU clock parent mismatches and add the missing
TMU_SUB_PCLK gate clock.  The dt-bindings patch adds the new clock
ID.  The second patch adds the TMU_SUB_PCLK gate.  The third patch
corrects eight gate clock parents and reorders the GIC mux parents.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
v2 -> v3:
  - Split TMU_SUB gate addition from parent fixes into separate
    patches (Krzysztof)
  - Now three patches: dt-bindings, add gate, fix parents

v2: https://lore.kernel.org/r/20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com
v1: https://lore.kernel.org/r/20260528-exynos990-peris-fix-v1-1-5b65aa7def2d@gmail.com

---
Denzeel Oliva (3):
      dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
      clk: samsung: exynos990: Fix PERIS gate clock parents

 drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 2 files changed, 15 insertions(+), 10 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260613-exynos990-peris-fix-v3-fac19b879206

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>

