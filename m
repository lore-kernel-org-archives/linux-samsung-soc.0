Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B92EAE7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Feb 2024 01:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706835910; cv=none; b=eRnLwkFTsfsRw7E1IhJGW+uGa5KtPDNMObbCBrhb3MHXVnIDA6r43rnJ5n8s/BlDafFwa/YTqMYM6N2uhGhxJR7Ot3zzTuXD7m/m7PeSS65Bpk7wDLjdeXhPkHOAPdEkwKsRLWOFg0UR2OE0QLkhGlDcbkZ4wn7XnXKPNwSuMaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706835910; c=relaxed/simple;
	bh=7PGtiOLQjanCi8F2lUfCU2lTtZMSLUVGqrAhBRM1FOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uWcyLHfXNHNMHT14aXJLL3SJ2W7Cp8QlGYlIYGQN4Cy0rk0xbG/eFTPnPbhayaGBOiW+D00I3W/pnFeURhGOyNsUqKKAzO7xdERCqHs7ksoq08uXq+FILkyvCRH9bdHVr73Vt2pM5KJ76hUAk9eGuHUHTcrxU22N67/3VhuvOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uzsU+wtY; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uzsU+wtY"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-210dec2442eso908200fac.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Feb 2024 17:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706835908; x=1707440708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1SwapE9xLdXkr+1FZM2yZImYM8kfTZEX3iqcU3VUeD0=;
        b=uzsU+wtYDGGXhPKLI28SmCscN92VLwtCyhPKDVcPbgtFAROQ7WqnLTi6fxqwg6PXTq
         rCJEAvF2g9H8Oq7gPJv5LMBw/xMvW6yPijLZU3XyQtswkpSslrPefqd5o6nXMCVxA6iv
         m+u/gfVw2R7mpp2CQCnvgoLBMA+SWDo2WkuP1mFBhrsT9qN4phiHfy/UvjNU7v5aei22
         EdqT0jXYE73cRQYka9uCbyBo9Ucb0PbB9aPOI0RqxwiTjW5kH5ag5xdb1VqcFRQ/d4DS
         zRXOp6ZYUxRkqBcLalmilnbmuGPu1zVkNPq5E4dmX9LqBgvpGp1fAauxU6pQ0S5R8iIh
         wN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706835908; x=1707440708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SwapE9xLdXkr+1FZM2yZImYM8kfTZEX3iqcU3VUeD0=;
        b=PgWq+7gf86ccILM+qvAOAA8QdC4+y3Ikh1DRbWrGr6bF6zfy2isUOPg1HzYbsHWjPU
         Bjo8o0Vie732eAVecInOGp0FDsxMVT68ZjesLBwdNdfNKTGtN2bu5dCIyjScjc3O6Yq2
         hAtlNVeNKHAM5ea5zMsG7EqjccC2ErnkRwO3+Icah+U49VHRDnjPapd5THRYjhLc634T
         7aKBt9+yHQ764/EQXVg4tNHQpaJSqnpxO7az4ZGlKZe2idZMv378RMKp6/gZrhaH3dYh
         9h8iL42zk6HUxGbK5o238yxIAOakOx4oKlJ0opTvRtbur0pZFHDLwnY4POzAthh5K+X0
         HSAQ==
X-Gm-Message-State: AOJu0YxGeCdraO5RRJAZCoYpwEy/xujQV98frmu4A3gZevO/TeolwHTq
	jDQi/RzCchn8eHxlKxCXXP6xd/tvdUyvM2fmhrAGamH3SnFH4bGeOWi0dtocEKg=
X-Google-Smtp-Source: AGHT+IHHssTzP7MXolDOLkfQGC5ALneKZAZicvelx4/ifGxiL8zBzKn0w2ESMFFxOFjxQIO76cQMOQ==
X-Received: by 2002:a05:6871:4502:b0:206:c520:2811 with SMTP id nj2-20020a056871450200b00206c5202811mr4865347oab.2.1706835908098;
        Thu, 01 Feb 2024 17:05:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUQDuJuCrbniDvpUfQ6lL+8xFL7Q3VSs/I+mnU+pKKO5ifo8TpBvmZ3Tk05LFi+zq4+CoiHahvPWhMb/h72W/xpxRAwgN7eEArtvHJeEwuveMGeV+dQ5oOgNNN0dn3DxT8qSvFXMduAHdj/hzWkjmPsVFw758tdJzK/PHu+hTArsZhhsvN20QmcVJo2KKHHpjA85Ky/sVVobTLcIhxlUh4v+5m16G3zfAKGl7GjUNcegid5qHpct07cIiS8i8uvVMg/b24ZzqMJz0JMqbjoxsI0liL/zUHJwYDfwZK/96pvkyZOPDiS
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id ds43-20020a0568705b2b00b00218e9960187sm229534oab.13.2024.02.01.17.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 17:05:07 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] tty: serial: samsung: Remove superfluous braces in macro
Date: Thu,  1 Feb 2024 19:05:07 -0600
Message-Id: <20240202010507.22638-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 59f37b7370ef ("tty: serial: samsung: Remove USI initialization")
removes parameters from EXYNOS_COMMON_SERIAL_DRV_DATA() macro, but
leaves unnecessary empty braces. Remove those to fix the style. No
functional change.

Fixes: 59f37b7370ef ("tty: serial: samsung: Remove USI initialization")
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index fcc675603b14..23cabdab44ff 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2452,7 +2452,7 @@ static const struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 #endif
 
 #if defined(CONFIG_ARCH_EXYNOS)
-#define EXYNOS_COMMON_SERIAL_DRV_DATA()				\
+#define EXYNOS_COMMON_SERIAL_DRV_DATA				\
 	.info = {						\
 		.name		= "Samsung Exynos UART",	\
 		.type		= TYPE_S3C6400,			\
@@ -2477,17 +2477,17 @@ static const struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 	}							\
 
 static const struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(),
+	EXYNOS_COMMON_SERIAL_DRV_DATA,
 	.fifosize = { 256, 64, 16, 16 },
 };
 
 static const struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(),
+	EXYNOS_COMMON_SERIAL_DRV_DATA,
 	.fifosize = { 64, 256, 16, 256 },
 };
 
 static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(),
+	EXYNOS_COMMON_SERIAL_DRV_DATA,
 	.fifosize = { 256, 64, 64, 64 },
 };
 
-- 
2.39.2

