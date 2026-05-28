Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAB23E51C3
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779968187; cv=none; b=BvtqQARNMPXq6NTwziWATfjscDVLWxSNm3wX3Fe20H/lpoVq6mNsydE46eTLWA/GVED2EtRq4M+EBDSLtJYiCiZj7zabHtuKPdVJpIEEEMnfS+ssFtvd7cUQ0TU65IC7QiY+HwuzEnwFizERfHxDfgx3ggxAho3d4ueLufXPM0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779968187; c=relaxed/simple;
	bh=xJKlJC7dGl0wGAvaj+do2NaPXo539auehvyu06PLQZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SOwZOi9/QipFg0yg7dS0g8OpIeoqcFecze9CSLgIgDK2eu+/iYio8gTgM8E6exkFcCPXuShE9f02qQUXmUBpaOrwR6Bv/Ll8g7D0ddfZse9EGfEmnNP5nHDLrgCLi+hY+Zl0abcduqbvb0+ClwS71ZL1zXAoVMp/LtPN6H0NcO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6WaRSKR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6WaRSKR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49041e84237so52836565e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779968182; x=1780572982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BekxfQF8PLQVYHupI67TdA6JhqhQbbku1rpfflIBCq0=;
        b=X6WaRSKRsbGXDV8YF7KPF4mNShE1bdhYsuKSHf+d6GZZvfds8tC2lWHX3FfjtEcctH
         nTYNwDd+5atzb7ffM/+PScAT2V+0o/bJBmUrcaW7iHdTAZl+hnALWlm6zBNP35TM7XtW
         NoiZBGhISuBGUgLsiN2tdkp3LuopcMvPqWSW4PiAmelR/vzCr/gFFNYMzIjDCK1WvewB
         LVMRLFpoGDIer3sRvLohHUMiv+Mv9wYFP7WS8Zqvzx+APnBxLPdHebFQenRxSONJQREl
         yVvh+stSRD14nCfDSh0gTR9vJxx1IsBbtXHZ2u1S/4TLoM8VV3fk6xRUCrNPo++xMUSe
         ek4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968182; x=1780572982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BekxfQF8PLQVYHupI67TdA6JhqhQbbku1rpfflIBCq0=;
        b=fQRt3WaNfy86EZn3zbDYdWp7S+aC8Ybq2xfWShhlnC0FwTyT0OeuyJXuAMyi/XjMGw
         rBR6Jumo1aNqi+uLT4t5ABJe4sja40D1JC9wlsZKqk8sinb82dWX2kQcLrF5ho/YkrSg
         gY+zx9q0liDdqrVXJtI2Om+mGpZ8yQv6uc28M6W88WHtLVkpUmI48MIu0SfEkPvP5ant
         u07FQzMzohV6R9Zw0JTNISImC492BPYQv92zYtEQaL6tOpyZNkYZdP0oitPFFUp8KYz9
         aF/fp2ncJh3knMEknSdTeSHpjF3oSNYTv6gKz586ezmf9Ztc4SpeW+pzbaT9e+MKhuTM
         M8NQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CPWux37s5Rj89ttV7D7d8p0wQGOHwELMQ0tHn035cMIuXkBk72F7pk5tyZEHkO6vxMefmcgzskNT6wMWtabDMsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFiBKm0o9QvXLK9ws0SmxjibqDPxJ4MbVyo38ZaiyXgtWbWPX7
	9cnKK+mptVn7rgB4PlCm0kxFBlB87aQZ7yiXUOE0gYuFNn3xJoUbZcO2TaF3CVYIH/Y=
X-Gm-Gg: Acq92OF1tN+mFkh8hwjD33KGtBRX7AjsEZ+o3xSLh+J9YpnQ4qnrx6UONVpFBUOA9Vp
	ZcXWP172ODi8tVonhUxJ029pQVcT8qIcJ67pvjLVtZn9UakPEyHYK+ZxIjMua6QJssr1NJ6f5fQ
	yMF2rmIfk8E74U5PJPLBhqVs0DMx2bckkMg4eWe3MQ357HAamLWQTW5DZKMtg71I2tZCF1T6pGf
	jTzkfNiBhMrWCGOtXD6xkxlv5vfarOxOeYNr2T/5LuSfmUZhzczq/996RG6/mbzjFQRfMxhaFKT
	WNu1FZQnzrNgtFvcoaVI/7QQbrJGB9M8KQISDaF/DyEZdVWMbBji/UtXPREaeElcl6ASHHZAN5f
	OQ3JxkhBubPl6IvVq7eESARVnqSOOs18sFE2e3yvquu/s+MidBP3yEpIBNR1eqHe0xanCxQeiJh
	eTvBUtT3H08g6IWkSihNlSns4j+2kAn9jyLy4nx3RJZI8zPzDxRZRnRoEJNOiNjCqFZUkSuhvGH
	t0Zstdbpp48wtymEA==
X-Received: by 2002:a05:600c:3ba5:b0:490:8b0b:d3b1 with SMTP id 5b1f17b1804b1-490947b0929mr17354425e9.12.1779968182422;
        Thu, 28 May 2026 04:36:22 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm60385715e9.12.2026.05.28.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:36:22 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 28 May 2026 11:36:16 +0000
Subject: [PATCH v6 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-acpm-tmu-v6-3-b4d7ce57594b@linaro.org>
References: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
In-Reply-To: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779968180; l=988;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=xJKlJC7dGl0wGAvaj+do2NaPXo539auehvyu06PLQZg=;
 b=/RrV08zJwcGs+ddtnbcR46GfaRC7OfWZyTRmTT0RYZwhRTifb8P4BFHNCQhv5h1Ki92YZBkoZ
 NPR7YdMiLPgBcKDzpqdf42dJ2N6zsZtFSV6gfm3ESwzL0rOq/+LKlIW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..7ea3b9d95ccd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23660,6 +23660,14 @@ F:	drivers/clk/samsung/clk-acpm.c
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
2.54.0.794.g4f17f83d09-goog

