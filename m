Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025281E0E05
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705099; cv=none; b=Qv0JjtxjqzXhgFRFCoxxvrVQqgXO5s8pYxmx3z54dbU5DWDNKGwj3HLuQOi8Gadrr2ND9bm/UTADie1BzBH+mk9xUEOOi2RDaDESTqjgmulBk/AJFdBp7REGs3nzrS1/Bj3Ox7XXAcYMqYVWwsQ8Gswb7gEwOXCmNPCqx4tPrFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705099; c=relaxed/simple;
	bh=tKaJ8XmsgFD3GQxgQIZteM0dQdO1QVEogrJL/zBu9vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FK6shknN/mlo++l57rZL/DrdNVdF8sPgEEEAMKWiB60lknytqaIUNooPXyX8vfEpDO6Gp2cXFzUjaoxdBwGJFApVXWdS3z8AHD4iNrZN8iizFUwyo+dpSQedPQZB4gDFti3BcfREqyt3GER9OF+5V6gfah4Sm/bXfk7IataNdxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ujw/fRqS; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ujw/fRqS"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffc76368c6so50055491fa.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705095; x=1733309895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9Ja8bSv98C0dnIrT5U7vJcSaQnvSrF1zZ95Z+KMMq8=;
        b=Ujw/fRqSokWUTYujzyoPLG6nTy50DI2hXvfB/p3z7pdWNRpjEZsR5uERnSE5uJ9tDa
         3tDDiRsBNV12ceYCteeplalW7ZQ4sDGWQlTmSGJVb0W0KAShBIK7fdr+BF9GKL+WBx9x
         +GzXm6bxQcFNJcQnwLNFKTCKy0PzzOv0LvX7roufg+UE0LM0co64qIXxrwYybnxhedAh
         Rb9xZ7kXlQuC/JA/3eObN36b/9X5GWZgTzF1IerRldiLlX/BPfuwDqdO7I0fDJu3qFQO
         ANCuIw1zd9FRms5bAM+yguVJctxLJC/mWulb28TEw/V8DEOGCaYj8W5Aqwv7Fg+0dL7+
         IB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705095; x=1733309895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9Ja8bSv98C0dnIrT5U7vJcSaQnvSrF1zZ95Z+KMMq8=;
        b=orEGkMfFCnPnI3mqfSBvx3ObTMaMA2V8rwujHLIbtq4n2GeLuh6DkxvdBAy9G5G2Z6
         gRzsrzguzaP3gX224N4g2wFz4WJuh6SqobHfoNpIlrA4ejstWBGdRwFJ2wsnzQeAj8LM
         TDGkXGw2Sc8VupF7CxHlRjirSewJ/ti98sSzu4iCefZJuGXPXSSfA6CnwtZCQ4RiNudZ
         8A3Zam+Yu0yCgQj36moLACvt2LaILniSqIEllKGk24VnUtxCjc/3htWyV+Ngvx6ug5Yo
         kSrUF5wGZjsGlyh6dmP9yyqMzip1ICcQyaKv02RASx/2Z+o9Mxl2F4EQqrufDOosnhSm
         xATQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8xD/RkahAlIwC2FmZ03nUomWgTRv4Du+OTXgEq/6Wl+30EDpnJcCEXYoEJP4Qxk7xRb6g0gUnY+a9hydYoMtq6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMzzcxtEGupQ9Pxktfruu9cK4ouDIAFmtMxi4M7ejWPGJxPY/k
	4yVi2oBcD9c0pO++r1bwtc+G+RY38kcC53tzMcopq9y/eG5frcciOkJxBKh4rS0=
X-Gm-Gg: ASbGncuO80G0szGJ4lpOEQfRsp4xEGv19sLXm6OGNt+KieDn0I8Jqz95EZJd3cNVttV
	I5yhUhvmlh7gai9YMl7t9b4+ZfplKvp3Yz8igEyPTiJJ/amRU60k3q8oYvzCMvAAbddymCx4nt7
	psfXJyePFDDTIJCdU3Ajn7EcRzGoAUAclKw8Zy7nyRRyMoyt//4XCoVFaBUS39fiEGvc/x7RBl6
	ZpUOsUEqPM/+U1wolnswLTc2wsns/G2uoiL+GQoRSP3VtuGfY45yvFIIdQpgVpaw8ncxm7LPPXm
	wpTqonaLON9v4DEfeUalfTJkaEFszVBC5g==
X-Google-Smtp-Source: AGHT+IGFJqt4+X9+b9OZ9iJ+1uoSSp1Y782XmdGaTyXXLw7W9wq9YHlHSBg308ZxZ/fLYqnCqQPhog==
X-Received: by 2002:a05:651c:b24:b0:2ff:c4b2:496b with SMTP id 38308e7fff4ca-2ffd5fcc1c9mr16671261fa.7.1732705095196;
        Wed, 27 Nov 2024 02:58:15 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:16 +0000
Subject: [PATCH 6/9] phy: exynos5-usbdrd: gs101: ensure power is gated to
 SS phy in phy_exit()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-6-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

We currently don't gate the power to the SS phy in phy_exit().

Shuffle the code slightly to ensure the power is gated to the SS phy as
well.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2a724d362c2d..c1ce6fdeef31 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1296,14 +1296,17 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 	int ret;
 
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		ret = exynos850_usbdrd_phy_exit(phy);
+		if (ret)
+			return ret;
+	}
+
+	exynos5_usbdrd_phy_isol(inst, true);
+
 	if (inst->phy_cfg->id != EXYNOS5_DRDPHY_UTMI)
 		return 0;
 
-	ret = exynos850_usbdrd_phy_exit(phy);
-	if (ret)
-		return ret;
-
-	exynos5_usbdrd_phy_isol(inst, true);
 	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
 				      phy_drd->regulators);
 }

-- 
2.47.0.338.g60cca15819-goog

