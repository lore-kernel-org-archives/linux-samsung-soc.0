Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F65529B22F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 21:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143067; cv=none; b=u0JeUtnjgn59PQH4E3wWezd/dV6xTO0WwjnnpS0SJSrN4t8LlXBScsvcmaQ0/406KV+JyzJtmFEpslpaSPyhBMWdugGzoTw4/NHQJh4Ec8DZZXSZdIGDLl6TWuQYBAvjBPrbB8rAZSaF+0YrN/S9guR5KHbfAsUvk2ZBhfmeUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143067; c=relaxed/simple;
	bh=XU1ekLOUNIJuvyNVZ49DfP0GKjHnS4C5v3J1EnzRwMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wrgu3UI5g1r+aW3h+BQIShbb5ijMHl8+vjdriAW2GZv2svNqU9e8TwOyklL/5MuCOaitoPbI9lfXD+OgP/qu0/Q8WcRy2+JI94PxxvSBoYBgz07WbWrb3E6i+fYLSVhAhHpn5H7Wl2E1WtJaLn40Jn677ta2YS/1BxLNJpSI6Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sl1BYcI5; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sl1BYcI5"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-829243c1164so30385685a.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 14:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143064; x=1758747864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=Sl1BYcI5v/y1tOBssAu7aur7SWSRTrpAgZ6eXe57QHCEmO/alfzf/qiBAoO4YvDnW9
         deMcPyaieRxEkz5RYpGig39GupK3Cja8td3kGx77tA5jVpwNIBJdD2P38TvvblhZAK0g
         bgMbhI1lxT2L7pIU3PAchv9fk/lArarllEY7Vyt7csVOoarxp0zRw1cpb5aZsUdU9f9t
         uaKUO90WRC/3YqRp+XGZDvUNwakNHjhe9aNfdZylRi6Qe6DkivoBU5peUf0s+4SB+w13
         w+06rAOFgl9JCyFN0g6hNNaLq/LzD4TADv1ZBx7zqmQeGP2sqVi3i9mpWvz+zPLuDVzP
         4WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143064; x=1758747864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=o+taOKsRnSeUNX2nxSGAIzizIdBJ2g7RPOYzSIbtWjfAEmYniO0CwHGhtGMbm4BkCO
         1ZyBaLSkS3YTcvg/iDn0R6hqV5kiYAXYkpwKCmp26IPrSFRZvTsJ5ck/9GIfF8ELLNXd
         Q0toMVp7jQWvs45TnGx0KU4rXVCEXn4gAhbg2IidgTP7a3YbSnaFF2Xy4XtJMLvxCN8A
         i2xdQ/U4g3I07b8n9zr7FsuqaIGunKG5v/22qbuc9k5k8EOrlKCDvTYMMRmnzU6QvBvZ
         vbQ9NPzNlM8WzB9I2zqffDIx2ffy3C9HgX/jeo6sxXFaM3cUb2ZaDstsTSTPJ5Vjkh0/
         VUwg==
X-Forwarded-Encrypted: i=1; AJvYcCUXwH0EsyFQ/duW2+s7CHBWKBGNLjrhmT17dZdkzG9qqZY9StMSCBg+aLpwNwokewlff1l31+f0W5dO83qnQaYWZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhQXMv+N5zZZYCUR1hjY2YSCx8l3YSAGzET+iijFlXAqjcXPHh
	NypC0k8+mKQP0Di/oT+MOKEaqQJ06tlPntD10OOPkf7hVRyccpWujDYM
X-Gm-Gg: ASbGnctgfkKc9SpyfrAiUDMuHG1X6U7BE+vHJ8s1L/8wtX8+LkjJViGMRlxCM6uLqa/
	ztS803FRevl9ssfZD31v+94GQjhfTVK2XdPJIfTEZLum8/Ijeqb9VOT3rcTh57bg619VjESQP2v
	3bjsRAo6otMhXCIcHmtKGwRIYKag6kKrepXdl7dJohYlJr8+iXE2umniDEWQ5wdDdJghkfJtmDo
	+VrwIqSfG2x0WTkfeEzEYLik+2g8ltinbQSLWok/j1mJojEyc6aKWeOwHLXZaamIXHBtnGz78cU
	rVl6t6+jqOJRg2pMeEKhddXW3NNFSaRa//MK39d/21IF/rMCmQ/shbCQnIjJoIPtF7zIYt4iejw
	z5FW1Y1t521gsKXZjpOWXxx/zliKHuF5QpQo29ZzvIG4E
X-Google-Smtp-Source: AGHT+IEFvNOShzKL68uD+NxZ49K1VTzvBYDXSCZdxnB+s1jOD/P17yqwToxMfbv19rJqIh6/MPoAXQ==
X-Received: by 2002:a05:620a:2a07:b0:822:f45b:a5ef with SMTP id af79cd13be357-8310a6416admr415410285a.29.1758143064276;
        Wed, 17 Sep 2025 14:04:24 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:23 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:21 +0000
Subject: [PATCH v3 1/7] dt-bindings: soc: samsung: exynos-sysreg: Add
 Exynos990 PERIC0/1 compatibles
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
In-Reply-To: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=1475;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=XU1ekLOUNIJuvyNVZ49DfP0GKjHnS4C5v3J1EnzRwMc=;
 b=qoi9lCpJ8AkWkqZ81/EvZO508mjaU6R+Gk9C1QakipPbjB8q7Q823odRC/wj3PM0v3lQ7YSMD
 4IM/iE8VhokCRIYYXwA20VgPFybc4sLeVrGugmXaVCYx7xAp7nD6t6s
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..173c51b17d9684113bb8254ee0c83e8e74de2fca 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,8 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-hsi2-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
@@ -93,6 +95,8 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
     then:
       required:
         - clocks

-- 
2.50.1

