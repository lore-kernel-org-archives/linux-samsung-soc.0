Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9273F44C9
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Jun 2026 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419656; cv=none; b=SdrVX6FjAe+xoh6JbOvYvLKE0lKfO+aa1bzSCP5Jk6nXnhMgFYQh6jBxA25IgP81rx4uSo5WGVN4NQadxZ73ySk5CSLY9IQ/HC2LPMlTtLuHqU2Ysa2YSkMg7OafmrpWCkF2JYbx/mdaVn/PsUZxmkcCPcIHT/V+KHniIrNYnrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419656; c=relaxed/simple;
	bh=BuCPimd0wnIGZnAHNo8kq3fbLznVxR/5ajKR3GVVTto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlB9PNehYj47IsSJheoAf5CktlnPZZMGf6m8X7Aj+sGhhytk6VhEt3LMHi4rhtj0ZEKCBXtyufPFu1u4AWcttusPUH7P4ysHNRwFFhriMSgN8Km8QMx/6D51XUpKnvcDFpNWrsuAJbCd7Dbqn08qerHL9l49qcGj9I17+i7nCf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nXboYM4b; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nXboYM4b"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso105658195e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2026 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780419653; x=1781024453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sk5k1GMtYr/HULN9/BDkc9qWrRFDftSIlp3dBX3ccaI=;
        b=nXboYM4b8XvbLxCAaXPYo8zfjj1h2KFZp9VwGbPeu1Iudw0YBinpp7AXmyP1ZBhwTV
         Gxj4UuCwPOHLwhxM+rseksuyBpwM4HRgB9Qkhq7c54yjtF0M1E0CahadISvx4gKDBbZK
         2pRIW4qNvqINyrKeL8mDYi2w0vfTOPUVSZMBqV7e4Ism/Zmd9vevIPVvJfPH6CLHja8G
         FVUJ8FJsgvioqSofG6TuTFl2Ghu7kVhn89wzjn/VhntR1SfDtoX2xg+yvKSJUmYDXZ0S
         igGiNLKpaY+4hay9h9GOgaF+5ti+m+CcaTW4K1S776QKn0NCqdIYdyLWaN6iTQctRVya
         Nveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419653; x=1781024453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sk5k1GMtYr/HULN9/BDkc9qWrRFDftSIlp3dBX3ccaI=;
        b=Gq7Jxm6WNGCiPa2p0ZDUXbwocfFYNpG3YlXWRLXOKFBaZ0ppiHdoOFMWRmcmBH0ZWS
         PCkj4sZiA9PRIGyyeQtjcsCVNbeX+l7RBlF+HlkNBmIF78NDIQEPx9kh1iYokTO0MWeW
         Hrp2ANWw0zYjInAahC8f/9XA+yqS8LjXXbbzbZikfeFq48RH+PtW0aWryFPEzG1w5JPk
         6+UPgTi4s1B8Tx1HPnNTe7JrFNo6lAAv05skPpBAhuUrM2K9FDXCjfJ/Oj49K8iuPVd5
         cst5snzgR1Q8M3qzHQ9PZMs7Lu3xMCEsrjWTzPsln5SISZlPmf8A5wBlQh841UhpzUtn
         K1zQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VICuwKk2p1MQgiN6Pn7mz9NkDJztB2qr+24EdY9Ol5WIZ0BqoiAM8LhytXWBPGFfnWvr8Gdq4iH08eDJBSwaASg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3hEvZVNFt7IUpL61TdOb0tD3t6ra6UhhmuyboZM/9ZoJBIOjt
	maDfy+HEZNPwlm2r7oSSOB2Vi8aSYC+f8TxvKzHulrpVPd0ApTYcP39FRw4y5+qlE3E=
X-Gm-Gg: Acq92OEo7GFsZl38tNyMDNgRJD/wJnR70kxyN3tpKJldKwrDndocSWG1rNu64MOQlVn
	ii2HLBD7KFwlGK0w3v8lCTdiHWtebUpNyT16F1dXUgNdI4ljlENMybsPFD8yzc9M9c5TL7fhwzA
	ixPcwpjyDxEiS311QEvV0FH3aerF9Hu4D4rn5mM2j390nDgFUL2YfALEhamKKTrbsaCbv8rPxzq
	pfEE6MaPbnSTpFDy0IP5z1Ml7IRv37nswv3ne3iW3y9u8GAvYagbxMwGCp0bAVTGIUXR7ay74Vx
	s7bftDvKAS1kgeyj9ldnChPLU++pt9p7A2Md2mvBg8KOJnrgkOkv5rT2ZhmxYJyi2BXidQHi1ZX
	b1PeP7o9so6Doj8rCjiduF2YgAqIYgD2m+kDG8CTdxYpWyRViinBc1mYl4T0FgY1HHQuNHMAOGZ
	rhHUKmi8M+8YnEO0xVQklBCL4/Tr+rxvj7V7UbCwiozsb6KGB7YzzzcDAlm2yTK0S8Ezaz+R1Uh
	Z+k3n9phaMMCpLbnYPMRMQRqQ==
X-Received: by 2002:a05:600c:458f:b0:490:b27d:e852 with SMTP id 5b1f17b1804b1-490b50b9320mr9331175e9.30.1780419653563;
        Tue, 02 Jun 2026 10:00:53 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm541156f8f.36.2026.06.02.10.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 10:00:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 02 Jun 2026 17:00:49 +0000
Subject: [PATCH v7 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-acpm-tmu-v7-3-8047dd54b0e9@linaro.org>
References: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
In-Reply-To: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780419650; l=989;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=BuCPimd0wnIGZnAHNo8kq3fbLznVxR/5ajKR3GVVTto=;
 b=2qpm+leQ5BiHyed1UhFlsXEUso4OD56cdRmtkZsjvj2beUooulxoeIa2paOJsetkWrE2vyngA
 ih+5udRiTgIAl6fxu10x6wGK2hbVqp8S5IXkteJxVbMjMf147Zw4/l5
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8218c2749b7..6a8521270daf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23661,6 +23661,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0.1013.g208068f2d8-goog

