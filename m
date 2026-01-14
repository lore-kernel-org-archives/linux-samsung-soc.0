Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3CA2EE5F5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400241; cv=none; b=Kk+Y7Kf3oop+EixXVXyH860awJFDlTQxIyveF27elDLUYYqedHGAAKlk87IPnVPWvqt93dMPbstlW9GSD2SA1yXe08QpdPlV5RA3zT5RuK2s35GSxTQAleRIHYAciJKl0QMc+Q/tpThE1lzU0VU3L+j5uKtY9ZUMkBJiKCR7Hng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400241; c=relaxed/simple;
	bh=7HVJFrG3U/QwDFKx95QyYbsMuRfAm1hbMd+GcbM229I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHX3NdoN2keKGz6OBmxw9amAQ1KLcuGaMNvnLD1TpmlK7HpgNKnzkZfXGVTe91x67v4noXHCAvd7/xYAGF7raop7zPFy4k789XYR5+0bNRFZrFyer+gzWH04IBONbUO/FnNkPGqrfmQdipr31QkcQ0sY5HP3maFjW8AxarSPylo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nuL92y/R; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nuL92y/R"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47796a837c7so59830755e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 06:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400237; x=1769005037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDx8GJwGFtxKfvZU7MLXX1ujE0p+LvEQKHj4ysnyPoQ=;
        b=nuL92y/RyO0fqNxiOicmIEW1aX2Ns+jU4To/iVBRCBti4aD5l56mJZP8oDf4GYNr68
         PYeB3ZK/O6vNLTZ6YVFOMp3S8PzM0B/PCriopBKjDTo9xt2A7re13AS7hCsAH/w2ThcT
         BhK2EBNhEPe3IAwphi4IIbPPKDenXe7F0FvRP+jJxJAn8jxm8ZFChexF3lymH+eId8/e
         t2MbR1pHa/RpmX/wY2l1P8H19Lhwcfb//cyMKrV7WulCvE7+BZmE8oltIVU34q/tGz5h
         aNoz+bujWlIcABYuIDjf1qI3mDXcrb5wtYjNQTqCR9btD3oaRPNqnCVwczw2R54boV+n
         LYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400237; x=1769005037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uDx8GJwGFtxKfvZU7MLXX1ujE0p+LvEQKHj4ysnyPoQ=;
        b=aL9HqGq9YOoZGgedNxEEzCeaq1CANjp6QRx3sM56xd5jTnAa5qFLE9cxrp5SR2VTK2
         lDNkNXT5u6zv9ekPIAfZ4i246d19Itmb1cEgLNNDX5fSw2APefPfblAS1GOx1VJMrVwa
         ti1FEfv0ThOtqct75zDF0VCtZlMnOCPEFIlM2aZ8sLG8tc06BcwvuOYyT/F5vkHKJVG7
         1qxv2jcuEIMcU1XALJYrOvSo8GohF2uWvwAeX0PGzV7pt+2gqHBjvmtNo/7cykf3oXjF
         tf2IWoWwt3p4JvbG6Shi0OUHFT2Q8GNefIZlNRCThQ//VPgQh9mlZVzJF5hedP0OqCSg
         h8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmSSyBmPXXJB0zjcV6kNTqH17qYEwUW6wOg58zH5RPzUSS4y1A1zivirC9DKJD3uc7oXhW7gqOypOZhuHnV7Cflw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2P59T1v2lOwJKxheiE8h4wiUNQ2hZ38bej2ms8xSLDLKrAJZu
	POUORuG2GmIKzIdEtmVxlyVIUEbQN2HvQSfiCEDZBBNdb99F8eWQVYu+yfTZrse9XIo=
X-Gm-Gg: AY/fxX4asop6nxrN37+XV5cwfiJA8Xj3USLAjCCvZd2T7NKwNwT8M5JYTKSEP7v4OaL
	+vn1zGLfQEnhn/AxCNvocI1oRI2Mk9iOrh8JvZPoZGWsJPrvA/wLmbJ9Wv2H4Vc37LuL1e02nKi
	r8gkeSI0iEvxM+4AnsfBZFcyCrsxITVYnJLtGC1areu8q2mGs4IwRgNZzn0nXfyFNLdlU8tGtvc
	fndmpWs5JBEyQ3lE1Qp/cd6I7Zi9SkuCf1OK9Fy9DIBMePsA+6z3CFvzJv9YC1i0+n6SvzL2ZPU
	Ntd8moONViH7bBlHzW9OAcrN6iUGN8idZkV+VVchE/XMCx7m/50DXVxTdYtzG8CrYeAZBEQvQIl
	ZC0ry/shfa3ytnPGR42jiHNwCyvfY/lNt2H1oWgCrhGz4ITrhkvSjOQuuBIjPaXHVxRdG/wB33z
	4id7h6GcUc/DRJUw+KANs2YLJRH3j/4fdAjpQ3PsoqA8ac7r7jfw96NkCxvVnVPNEVk7pcUE8tA
	L8elRU9
X-Received: by 2002:a05:600c:4e4d:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-47ee331937emr30654025e9.7.1768400237015;
        Wed, 14 Jan 2026 06:17:17 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:16 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:34 +0000
Subject: [PATCH 6/8] MAINTAINERS: Add entry for Samsung Exynos ACPM thermal
 driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-6-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=971;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7HVJFrG3U/QwDFKx95QyYbsMuRfAm1hbMd+GcbM229I=;
 b=pUkUka+ewej0krIsviJjojhdqN6KPY64IUp5KIuBVVECn9qSsLgLN4eTbUtjxiRCJF+4NmjV0
 aVbDoNVDAOlDzQjkDBwgjyH42sK2PdrvjnCTG1nPFaq9xixN3Ygv0sh
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de1e9e43f63787578edd8c429ca39..ab44f2de8e8e03ad9bb022ebdf1b6c0058fb0425 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23171,6 +23171,14 @@ F:	drivers/clk/samsung/clk-acpm.c
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
2.52.0.457.g6b5491de43-goog

