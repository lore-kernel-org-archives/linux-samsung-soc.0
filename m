Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE78480327
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Jun 2026 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491625; cv=none; b=eojLEVQSqq7VQLs/Il7HO/FNxgCPlu10+oLBBvvffjqCtrkokYb0RxwGIjYItCOiya7iTzmdnUOkPW9uW0gVliD3Q40TJPqXW8bhkL1wwQiBNL6rSUJZuLCLc2uuVG7vNOK8L/C9DixMneF6TFL43TFA3p90EtUn96+CoBVAPZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491625; c=relaxed/simple;
	bh=BuCPimd0wnIGZnAHNo8kq3fbLznVxR/5ajKR3GVVTto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6pe7ynt61sxwnr/27I8XAZOnN3Y0urD5ZAJ/2b7+NUPPK+kS2vK5+6nX8zZ0FQCVi+pB7pQGUqtAYIt6viHp8WwmjQiUUzvySibue2cwjisO+p7aapk4FW07cmhp0nr7xPNmlT8WGtJ8J7OAlYnrJzo1HJI1mebqmeHG5yZ06o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLhrpkLz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLhrpkLz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso38748845e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2026 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491620; x=1781096420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sk5k1GMtYr/HULN9/BDkc9qWrRFDftSIlp3dBX3ccaI=;
        b=eLhrpkLzrMhpBdXJxSskzpA+dYNMjGSqQfyYFqyiowQZIeRUVXPB0uIBk3jXq2SCm2
         2k6OORU+0vzcoYmcUemsCW3ul9SHVj0NSjk/2sD7lPWMm5ztBM+UbK3WyFDX4UQUrMDi
         GRKKxmBJRGJvrSi/8ZcyNhGZdvKjHRWVfBoiEcpaXIYma7urvPGqWgde+veYcFt6GjXQ
         J3d76/oPA3EP9rWn9oXqEVsHu5/3rZ/eyyHxMF5v3hKnRCOYRfv5yRIEM5kujy2B/Ma6
         e+5ovPhP2Hjkh2RSqpWLN6hWRYrRnOquk5UZiP4wrDt0REWxEoXyxX8hAxv7Ilagunv2
         /FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491620; x=1781096420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sk5k1GMtYr/HULN9/BDkc9qWrRFDftSIlp3dBX3ccaI=;
        b=elDuU/A89UYE1SbUpy8UodHzc3AmcE2y5NegexC7d+yPM4ojUxP6yL2RYFP62ki5xB
         Ow9vOLWFFfdCMHKTBT+lzoco5GtZpnIKaCjkuqgSuImFUdpOtorOV5xHEz8t+brpUZAH
         6xetIIsyO9qwJYeeWdrGy/IQRfCit2yv9DJSeb9rB0EN3fa8mmPIb5thO1rUIcQiq75M
         8KXr13JR5XmvjPFB+rusT65/w/mPaG1Zw28PMGeiTrJPOg6x77NGoIOkObeNGsnHmHIr
         8BLja/C39uYXS/mebB8HENCu/6kKZfTaIJFPgGQBQpViQg4Ce9K35ojsqLXrmnbp2v31
         +e/g==
X-Forwarded-Encrypted: i=1; AFNElJ/Lz72p9zdTcWkDtQOXvJqHF6gdoZrzcnJdy89YctImZwzpYwCj1ELAz0XV3sVpCY1NIeB1f6Xu5jOsorinfuhwYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGo88t7LvDNiQcA7Bp0pJK9mjNqSVv3JxdbOfg7Rlc7ukzA1mR
	ynZBDxVvsE8QW2iGskEbbvZf/7VP4cutrXVX8rqiFx0OJbeM9dH8/qSsHeFa80QgwQc=
X-Gm-Gg: Acq92OHex80apAhLP3eNy01L/BOw15df6TR8DLn1VRsGXu+wRW37SxVwy/KP5ekN+I6
	WmytelH3VRAM3xdgAWOtgCPJ7DZzJ8+7fFjMCiMT1mYYvhO7QE4Y25m4kM2OtjuzAvZ4eOK/66d
	xeRn55G9R84qgcwFT6sZukC6LFyV+DdzTZJWj0pbZlunNLA+fubX6k48NcdJ1YuyzJ9rM0NnSXa
	hbdPOUk2W/WP2yY5ainMcx6ejcCgiL09yl3vu4R4Ie/eLU+iBO7v7SfUYwgQguoSFojP6DnVNgw
	PhbALLqdwDI2xUe97+8cNFnxz8Lfl4rhAwWYN9M0iidYDnMmwiIubF8y+4lv6V89D96MeBhjrIu
	EVXB1I6lhuxCcZOLSDRkK9GjkfxknM+VKCZq3kqqweUJv7DqLREv9rKR3vSQe4wmE/A7SXf2ygL
	pUGct+O06myFEt4dqG7jLQAFy8Gx/pWrwmiALYJud2BvrdQ6gXmY+pmkpCgQAYdzxobMKiaiLf6
	ffM7Yrdbo4SgYk=
X-Received: by 2002:a05:600c:35ca:b0:490:5527:3be2 with SMTP id 5b1f17b1804b1-490b60e3d76mr59120555e9.32.1780491620405;
        Wed, 03 Jun 2026 06:00:20 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm149179045e9.14.2026.06.03.06.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:00:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Jun 2026 13:00:18 +0000
Subject: [PATCH v8 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-acpm-tmu-v8-3-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780491617; l=989;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=BuCPimd0wnIGZnAHNo8kq3fbLznVxR/5ajKR3GVVTto=;
 b=DDZhmy4QEP4ZUJ3uSYAEbuRQYdLBa/kBCUb/9RRroulU8b4Zq9zpGbgR2jB1y/YeZYSXwq35u
 DpIMVH9L39wDoT0TXUDdgkEeWc0sFgtrSbGO061VKn883T2zS0XCYWP
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

