Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A5C2253EE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018403; cv=none; b=N+smZuWBtekJew5UvbPG7ziEpC4aOeSDIOxuTHdiwY40CHeZpFhpDZZrj/sw8Pm9eeLSb6ikArMoR5xG7oZEl+sCdTCOEadXkTwLirRkoIxeLRXShjI2rfFiOKvwlc9o8pIZTfVvXbooDb9tX3z9VmZn/YVgDixHiO2pBiRyt10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018403; c=relaxed/simple;
	bh=0x417ocgxZZ5QKGgDLukuXtP9oxD0Y9ZNW2Fdua1JWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOy0ytNhTo7EUjW5fWIiRmXUZPnSwS78vo2z68gfxX72REev2ovelj7byZ4uY6+Tmyqh5b5KcoQqnJjnS976uagYg8YKmWLCpzajYF8JS86qEHHs1OVbgjbX7djKR9pFXN9siEwBILwfZ6RsE8tBksVMheBlU3pqT0R3Yq01u0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+J3FWX3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+J3FWX3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a766b475so7807695e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 07:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734018400; x=1734623200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVrRE6XW5rU6HifNvQnEFiUjGXhcl5ON9ZAwVXIWqo0=;
        b=Z+J3FWX3hJtd2hQ/Yt+3+PsHSHljLLpoBNf84diMgtxChfBDDEaGvr4HHjGGODQVPS
         tj/FHEAfdt32LbIErhZPzoFjZACTFJ/npnmWJ+V1DMZj5eGsvMK6Fl0yFoNWuas+1YeL
         e+xBXdG51y+To7Cto38CTvkJFhxghHUByeJ/fkGHaXCKfLNxOmvBpy+Of/1a0RezJm7H
         iu/G3fQxCQYmzXvmVm2loCNba9rLL+4IJpqewl7kWjF1LYRc17nBzkQW5z+afxB7Tl6a
         Q91poTdUMsY850MWAYF4QFoMpR9Sk5XTt2IFEltRFcXFeR+bIi7BHIRcJtDQyyvLd3US
         QC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018400; x=1734623200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVrRE6XW5rU6HifNvQnEFiUjGXhcl5ON9ZAwVXIWqo0=;
        b=rIjNBanujIX2yqaURYNCLdAfZXdN4SZ/2NQqgI/ualfjyFImnT0uv6nOQpEXoARfQ7
         KDycbKoOs9TxBP+OcoGn/EZKaUwbzbVPmbJK/liSPfH0pohn3Uu8nymq+ip9q6/g2kyN
         pNoro9+oakyxyHNaDZrq2Xx/0OzU10GX0YlJZ8zLpODAAVDCCg5bXAXofuiwmbOsT8oF
         UzYlhRqrbPbp6Nu2igiA94uVmguDZavp8YtdoP8wcO9ms2eU2iusnHTAWBZlT5FiLcSS
         PamUbjzBHRfgljTe8CppxPiVBq2QCGmYIl072NIMxpYdE6OaObBJWC9qRzxsXgLUEK3f
         Delg==
X-Forwarded-Encrypted: i=1; AJvYcCUA3cWsC/yu4D2iy8rYNDLK/RbVvaPQmKZy4BokiU3wypJkvM6ThukxOWJFNjd9f3uGIoOzlLPkSbaUWnC6ZjqUtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5X9a/cbeew8taPso0WGPlFB7bKDCy58+3vipPuzKLcK29PweP
	K+Y/LQXfQ2Fq5uYYHrLgOGtW56kTpp/7O3IxoAtsIuokapurk31bIWCK72T2MXc=
X-Gm-Gg: ASbGnctR8Cj7WZJkktg+SBIkvNaKJGtQYPT2XiCILnQlu6d/IamxX6U1cFuTQi13CsQ
	ndVCGrbzPuzfPAocXe9b/fZ84boXzZaHTHVKuOJhhYRVwedgsPT9Rf8WMXForwWxj3cUIRRppj/
	5+2rjzEo2Y9hpd7fz+TXTscblurEYZgZQuTe9dGqtsMBhR+X/M3Kuyyl2AcB0QBVKWveQXOkA77
	5fssNJHdaGG4eIVLBrK7hNbS8pKPVSqG0ju9xe4b2sivl9TOr35ctENFsGdgzmAEVnCS6K7EEmr
	N57g/DawNsI6WvUzcw8FjJYUgMz6AMeRRQ==
X-Google-Smtp-Source: AGHT+IEmv9HsSiHLxj+MbudLFonDKiv9j3QNmqqpM+EEqlwltO/STEVmjTawSTry0YWT4U8rduGL5w==
X-Received: by 2002:a05:600c:4450:b0:434:f871:1bbc with SMTP id 5b1f17b1804b1-4361c35e4famr74531555e9.10.1734018400236;
        Thu, 12 Dec 2024 07:46:40 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550518sm20273075e9.5.2024.12.12.07.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:46:39 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 15:46:24 +0000
Subject: [PATCH v4 3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM
 mailbox protocol
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-acpm-v4-upstream-firmware-v4-3-3f18ca64f1b9@linaro.org>
References: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
In-Reply-To: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734018396; l=1244;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=0x417ocgxZZ5QKGgDLukuXtP9oxD0Y9ZNW2Fdua1JWo=;
 b=npKxLebFrLzPiTFZxw1n5VtEgvFMwfWOTW7YSWg3qGnbPqy6agTmOeiCk6ysOs7G/4dXNELLx
 9tyEx0yCfyJAiSvUxmtXXrSGhms4XoyEnKcP8VGMLVkjU/FhIFOyE7w
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add entry for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17daa9ee9384..07d0a360cf66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3023,6 +3023,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/firmware/samsung/
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20715,6 +20716,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+F:	drivers/firmware/samsung/exynos-acpm*
+F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.47.0.338.g60cca15819-goog

