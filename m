Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030493;
	b=jlJajDCBpf5ACuKdRG+tlGBrt/U8TjmGNFsnrvCRueHYDL3U9V2LPW2Ve/Hoi7IRl2Mv
	 6oO7+lTmHMSrz/i3eQpXv/yztKzBrybncyaBk4R7F56ZMmrUoNSnuvqXhNYSEOLoONrQM
	 Gj24WWTivD3ulkqHpZhcsoAHocaXYnpKehsXUUU/jWQQYWxcia1ieydGVKghaI8iEHfHc
	 ooeZFeX1uNzFXv5SbzAE3jZym5lSv9Pfd7GdrhGpoyx0j9Oio5tx/N8mJYY6fdMHFuVSS
	 U9pOM2dVI2z9n9CuqUmdD6Xof/V5ezDbrNr8zlK8z4boTDXRI7nuIlbhJSy9kF0A8/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=G5mOJb0RnfSFctotyurw1MWzkVYTqMttYi7YnmnVgyQ=;
	b=HqdLQIsBNpn15hEyL5mFRdbWnYruIi7rElvDmdn6FWpB5lesUQLkYV1pDcIYiR7d3o4B
	 6l6yQp8FEoBDPmuSB8R+K4Cxnosoh/BnqFAnX10eb1kTJNqg13x8Aye+o5LitrVq2r07k
	 hwxV3MRsSfJAAZgi6KBWWMfohxiJiEbkFG9x89Fyk1bTV2zcyoPHSRzAur056CmGtvjzG
	 Co572OUSg5bUVvmeKo7JA4Hvti0U8ASenXWoOINf9+BiUpHkTcKfGSwUVE4xlp5xeW7/O
	 yPtsQyTFuomJ7QWangmwe02dLZRtMAz1dwAcqGfeHCdeiyNSxNTiW8+/a5BQ120bQCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dW3Fc24n;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A3D60A2617
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A3D60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dW3Fc24n
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4322d310e7so467120766b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030491; x=1793635291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5mOJb0RnfSFctotyurw1MWzkVYTqMttYi7YnmnVgyQ=;
        b=dW3Fc24nHwm7RX4RtLNqTM5TYYHXznFabtwjEmnDJBOV0ztb/htbS668pgH+XdCeDb
         ss9PL8XqeU4mGTspAXLGVRtIE2oPt9TSPKdW9BcEZnPG46g+TA6jB0ogpTd3atRSFWaU
         ddsrmUeb1fVu4rotrra/pP//4B2YatJB9QUhTqnCj8hYYXGofjUyFtglScfFOP6tFyLd
         rAsy+t6ehs0dhjvOMxC0EHsbDYLz+2vXS1gdnpEaeCMkserfcwPRuXAO0r7/W6FqxAv5
         07LJRDKiYFrilduw8Y9WjZldcwhov715zOcrax2BqNa4jRNWYHgucCbMvj0clGub9Sqf
         p4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030491; x=1793635291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5mOJb0RnfSFctotyurw1MWzkVYTqMttYi7YnmnVgyQ=;
        b=dJ64U66Gxj+5KMU6hkZXvZrNRkoIr/L0GzT0AX3i3ndLciz7WOVImKbzKYe1HHfhPS
         v9y/nMUEbvqWE0XVqhgnmhBWIWUN/4LhAYZSFUmtyYHd9vLXlhj58jkvgg4BoMLTqh/j
         CXZLbT38BBdX9DFT4urPT7a/WwVZlEVWfsnjMx8wuMppHqZg7ZwwY3m5T3VunSKCNoFH
         z6qLXZTW/CnfNmz6cZoH0BI32dpI+P3lIlUZAulnvNdNNU20xRXqrvcNDr7gbNZKAw3P
         /O6kFI/UqiejAfClAMuAu99TwdnvqjbcrhgqoPn83nokufigNGdD5SjfQlYoO4JTPRbl
         XUeg==
X-Forwarded-Encrypted: i=1; AKwUvBzfgqoUDu95IImbySTDtIFJjFgBtxqSrFkCjovClQPmbRkxH1ctPRaW5tDMVwF7WN3SvOS2iG/dUcPUQkY4VCFbTg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLEupALWvKjTWRTuradubrV4uWo5N63OvG/P9W0rcxho7EIpJfJ
	/mGfDtQXZGhWN6TJdhN3eggwetGpotdMn1b6qDLXFSN0Rpt3/M5UH/DBLpdiHlEkOeQ=
X-Gm-Gg: AYBFou0fskK7ffkrpw+r9FIsq3pEyTZ14X25fbjcx7KqNM61yIW6fuL7msunkBBJQy1
	gl7E1wHLoUrwDdafqU/Ft9jZLhhWmDU0ck+qAruN2Sn0kF+Ba2eOL2vWt89xWvFJytI29m8iQ7Z
	UcP2YMheEflSDJ6Rc7FLRtQ6A/9+HHCIx1/vQyA1yv01sWYE4BzzKM3rkfNhEQDR7p0JpqW4moH
	WDNHiObFJJ4Q6x1fib7meAduSQke8iNRqc8Q2684W9B/9tviwJz+kSo1x7iyOJZ8/OckUzvee5/
	/Yi4/lFVfeJjbdKXwkJhT+KArqjGEf+yahByDLNDwn8tT6S3FezF9KyGdPRRvAk4rowD5f6Vd/Y
	1Eqn061q/Z4Ib606lhUrS0jC8VyekDroj13ADwJ9MEx9sdDP2L1uTWUs1qBFLjNzdks1Eak2bM0
	q8mleFFMu58jj/vDqeOuGtuPuCBrqRcZlOLBNZ+LF0AkFj/8uB5hPpJHSBCw4qedSA+7BkGNSd5
	NCVxhiIfcuQM60ToptO/9x0HYBm3Eqnn1ioTO3OmQgx1A7e6BxForfLkUi33YpuPDArnMYIyRFD
	U2u+aYUGwvlArx5ujb0Zi5yecgHm6cCuT32yPGup/IyuN3Y91EZz3xblJP5bPpDt4veOgbwMzrd
	0aIH/t08hS+0nOtR25Nc9N+z5AMKot6ua
X-Received: by 2002:a17:906:dc95:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c46bde24eebmr834629766b.23.1793030491260;
        Mon, 26 Oct 2026 09:01:31 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:27 +0000
Subject: [PATCH 10/15] MAINTAINERS: Use linux-pm mailing list for Samsung
 Exynos ACPM thermal driver
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-10-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=927;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=BUTSbzEDMtAp9xedXXWiQmdqZWmXBU0Yaz6LK7Awqpw=;
 b=QC+yB04KHzmX5XUlB+M3WHYVAVTzsEU7atGXSGu9B/dV19AW24NT684VZEvIKwYcRbj6F20Un
 wPF2S4wqf9pBCDVZf1GnUpDmH22JyWeQwySA4zYEGDPNhN/tKZ9uvFY
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

List the power management and thermal subsystem mailing list
(linux-pm@vger.kernel.org) instead of the general
linux-kernel@vger.kernel.org list under SAMSUNG EXYNOS ACPM THERMAL
DRIVER.

Fixes: 05657c7822f2 ("MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e9fe9c2a39b..6da7c884373a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24382,7 +24382,7 @@ F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
 SAMSUNG EXYNOS ACPM THERMAL DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
-L:	linux-kernel@vger.kernel.org
+L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml

-- 
2.56.0.257.gf7497c7d27-goog

