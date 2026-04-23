Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484CD37DEB4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957793; cv=none; b=j7suJqjZUs4ag3AlfNIflyL5E0DcBpN3/MSFNY5RSJ7wrdpO3CFFu4ESc/7WGfMoAef1Xo+yL8Az1Nh47DbD+luA/0fztheX6fJFzNwYOOhbYrO0KWo0cSy375h7CRh36qboJRYyMt7uv4InOmO4tC3reUFtUj4GJP1M4pKnSmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957793; c=relaxed/simple;
	bh=FWU5VNsYMZRRVGYIioWPuaaPLaZNzDvKQUDpPiPlMQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLPg7J1ZqRgpbDA6wm4eQ7IuL3egxn1sctUGplMciD51dadNJHGytAOI8o7o+7ICOFnVdjKXQQwrgW6my+tALt25gVk9mf5VeSgJLxFub4HeGEtAjyvkIgyw6nXsUvtlXaZJWVrM9bCQeBNgs6TxZmYMAniv0I7rxksHqdhcbGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCAAZbYY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCAAZbYY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso92380935e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957785; x=1777562585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2rw/F+vOuT6UFAdYwCBkXsXOmQ9+TggXzaKDVp2DDM=;
        b=GCAAZbYYy/w0aeRmk5QZsvV5wURYbYWtVTwOAMINonLeq5HBbGn/Av0cd+ba/u4LTM
         SN2iOemM1vnNT9JwCPtIvNL9WlrC1X4pRpJqEgZT0VAnHRq7podSz3q+QPuMHrVOSDLH
         TWEEuBPfpz/3d4HqBZ2yz2Vo6tvlOX3U81by3UcDU1jcJGjqh88gaEaetY1CAtWsQOUU
         2cN+TAJVM8/Wimal812AvM7qIoDyuQAe7/YqY4bG6Wb99um1MFIEJI6HqxrQjG2+F7dh
         6dsR0bOh95tRe2qA39DhAiheNmE/SP+0RPwHLfGMJuCUrP/jbtZz9KhmUW+5LafOkxh1
         iXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957785; x=1777562585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/2rw/F+vOuT6UFAdYwCBkXsXOmQ9+TggXzaKDVp2DDM=;
        b=tLefp3dQam72wdLdF+5C8Sh3Fj6oeTMfVTlLjQkRyNZ18QR0YtCMltDnDuYjpTxN+s
         WBoUDrP4G0YiQQmCUnHyUOHaJQRHTZFQh7aM1XyyvHC15KyS5qsEB6BwOlhiMR+v3diD
         vfDmp4ZHA1DpfH0wp//yAXrNBx6HSrirRnWwM70Za7sYuze/ANE/CIXgA2sKIJogd8R5
         uVbcsTYr1FzCAgaODJkiD2gXiKp+s1fsSBTn+3hG9HSWZnNV/DhOOgtx+4FOYX5QDC4x
         b2oEPvMQBXnpV44qEeczF5o6yB4DcUQjQkUtwGu4sK3m5MdBYwlBDTKWjKSy25IC1z7U
         PvyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5FMDPvnmvFA81jogbYF68Tcx9WMUEKcvQ7sh/yX3VDedo5WvvY1O0L48qKStEXgliuWvS7N6KX1SZictZ1Zo3Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxStw2uPc4setTKRrHfkq4UrtmcTnuZ84UpL35oVQ7IDnXlTSgg
	FTdGBvECtmC+bQBe6NyydOuWAYaGdMY9MDEqaM+VApL6TuIK24/JDNZyJEtfsYJ9DwE=
X-Gm-Gg: AeBDietq5AvcK/Rg1AtqtyxkZCcLn3uM+lV5DtcQnUYCz8kdBa0souwvdnxTpuNM2dx
	AecfKLQiPhVmzbfsnTsY+V2ay6/kxhG6BNrtC2iP6k8PMTaJuju+s/jbjxD2zXRPzC7MpMkWp/v
	Mh3r/Euh8iyJ6/9RIB9Uq7awzmqffxhLoEQtYX6ad3QKdHwG34n5U8pWsMYDld5bKouwEaDilCk
	TPj4YIWFw3S2xI77EeuPLhrvQN8CdXjXmRM5K6kn/9BwAM0xWWpTSDnk+qO9LUXmrypcuz3e372
	1AalPlPYzfqSLysw5fHnlIoMPknBXavhfLO7MxNIxz5EVUexguzG3TIAyeOaM5wU7XWaEZy5aSX
	LGI1MxLaltD98xUG607u2b7bjA7WfsYmAGiKki9f7tfcMGPQRuKZXdraaJ2Vyq3ItLogK9S6oxr
	12Fj1IzuNh1HdWolI2tELmLiUe0fwo0towAHeEYl8vsvUH0NUWVROSvCusXPQcf0XxfO//FGdFv
	2/F20IcuTFEQqNqBQ==
X-Received: by 2002:a05:600c:4fd1:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-488fb78ede0mr397227715e9.29.1776957785364;
        Thu, 23 Apr 2026 08:23:05 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:57 +0000
Subject: [PATCH v4 09/11] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-9-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=988;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FWU5VNsYMZRRVGYIioWPuaaPLaZNzDvKQUDpPiPlMQk=;
 b=oGan3n0YDDTqNrNPvT5e5tY9UzUuAumcLznabKnHsbyyIVFfufKds/6MUWf1Xq0V0ycSAXT3/
 KZjDYxlqCdNAPXdbDR3RyrFMLbqE0LrVkmWv13ndxJQsDwP/6anSJj2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9b7b6f9828e..759c05bd0004 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23693,6 +23693,14 @@ F:	drivers/clk/samsung/clk-acpm.c
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
2.54.0.545.g6539524ca2-goog

