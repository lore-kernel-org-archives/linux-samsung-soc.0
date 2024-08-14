Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269D21B4C24
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 15:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647873; cv=none; b=TJ+g98Zmzt1DiPFS/LOCTeoTZt06nmkHedJt01u9HL9Qh/vIrTLx8DZrXA/DTpluZuCJhhnemr73WBPklatSR/1TP1KH8t68Q9hI+BNGHXYTgF8M1JGFfULvVmmh4/AV/3bd1FAZjSlXceSUrM2FlX+kgPoSlz7ji/ylSayECxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647873; c=relaxed/simple;
	bh=OoJl37VhWa2/ok3yWXn0smE+qe2VclKzB2yD7J0hAwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0QZ8XWG+gOmyHwWoZleTn6qep1+0x387dN7i3pX9GZrGLCba0rPPMSzvzkcdo62rK7Hd68GJeHfwSvyEd65bYpr0qQg2QSFiFRg05P+1qw7KASBnJRnB/88zQosB+dmPa96U/U7yc7LavOPeEaTRZUDvwcIxGkADwl8ygkkqJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdS568tv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdS568tv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-368526b1333so609335f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 08:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647870; x=1724252670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACUznNue5Vc1PvREpF5uL8d3frSCLJ2XL4UNUgbbF6Q=;
        b=pdS568tvUza2UEI4RAWVRTasjZ4Rk2RWjZ/u9U5hltwn0ye8WDmEAJMPTu/Dn9UNS5
         XS256qiK8h4BKzp29peHYAgJc/yH18Nmoz7lTmJSV+rOeXgHZvkIsps0K+1H8muiLZUf
         Nvpnp467wUma71cs7GYegcX0TG6Pb2YqVNvZmNRcqwBgzf0rtDgISBUfR5g6PMpNeijs
         voI7Ynvs39+fuBgED6KMqvHmsqPWiA0Av4zwHaIf6ExEbuRyr61RQ/fOPleKkltRtwOo
         rKdkGj55it/rtP1GJF9rD/rasTv3yl3ADgBWnUW7WwnJS1I7is26aLbP2xO96B9rYLk9
         Enbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647870; x=1724252670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACUznNue5Vc1PvREpF5uL8d3frSCLJ2XL4UNUgbbF6Q=;
        b=l+j2GWiNdqC+9QVkLCvtDz/6AHydTgEoWK7lBAqmda4JEz5SPAC9+beDShnm73aDkq
         7giOzXcjQWgu5jkNVZ/7LjliTDnJeWWfmzFehpVbkILurphkyw6FzBx0or5z0+fAEE1S
         vPQLSBazNa4LFSv9cLgcZwAQ1N6UDDdwVA410RKDlj+vIEunGRc9mr0m8XKpQmDVd8Zc
         X+k5a03OEDYRU4tykm80mQx2XPemhs0dZT2/MLiKwuu8Ij+3VUF364T2mvCDoTLCcroa
         DRjTJ9F10o9Dsd5+mXTGUnnhWqe+4mPjewv+ZblWIB41t3q2Rm6mU0itazbnRHVQHI5d
         S4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDRheIbUu5OYc/s1QiDFwY5jnRIoqswDevUDECjhYie6oJxF/eGckpjzwXs5m2wiZfvn80faxs/Km1IaYNeNZ4Auj2r09P8umVrfqX0XWo2Do=
X-Gm-Message-State: AOJu0YzaTbK/bijwIhhXz68tm+LvS8rkfC6FHfBmzCTOXOJarkEuu7AO
	rBmDNr4C3gq2eH7oUtiuKEVtCL+EqCyZahhY29GHIVEq0a5emhwgzIvK2UiuhUI=
X-Google-Smtp-Source: AGHT+IF+u9tmYTlfOnF0EY/D0BDpgP+0OTvzQjNTeJeoB9+1fHj7S8CddXYLDq5O/F0RKg2kn5vuxw==
X-Received: by 2002:adf:f3ce:0:b0:36b:bb7b:9244 with SMTP id ffacd0b85a97d-3716e3eaecamr5350141f8f.1.1723647870395;
        Wed, 14 Aug 2024 08:04:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm22313425e9.45.2024.08.14.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:04:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 17:04:11 +0200
Subject: [PATCH 7/7] regulator: scmi: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cleanup-h-of-node-put-regulator-v1-7-87151088b883@linaro.org>
References: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
In-Reply-To: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OoJl37VhWa2/ok3yWXn0smE+qe2VclKzB2yD7J0hAwk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvMdt9P9crcfh3Lp+LZmfqSw+yRnKP3vsTTgTz
 4j9XGKy5+2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrzHbQAKCRDBN2bmhouD
 14guEACS3kV18JgvbTMljOcJKLNuprPK6EWt3rzyAwJz6S/prQ5m8/dJcjR0LfXPOSIKpr8T07P
 RjGOLmrYXsdGs5RKuWilAcUETR+HBy75Fd7L6qWKvOgiEkF3f/zxxnrGJr1TywAhiJzNyZxnc7e
 D1oX9a00U9Nq/G7TzzId+WggIZVkMhVb6Wjvy6bMT13co6O7OJ3S2DwWuqW7vrG/rt09V6amwTJ
 c6fr5IINXgPXbfdgZMIlT3hSoZP5vCY+3hIUGQgFPNOtjR8oFIR7BHtnTgftiqqg2U0a2B7RdYv
 PIRFwmhK1wP5Ld75kd11lTS47+YajB59ydM6XTotcBcPYK5fTlwqInYN2s6SX1igw8axui7mYsT
 X8kDCi6zpnihNFTmXGZlTK5gqt+yZrPnMWUGyBl54qGI8nTq9zw9zGGNdp2ZAFPUFU2ARCibepr
 orZZAgeDiuFQUSQaaHd5uYLBmthqW3vWYl1uxEpgbX6l+0tvLNwN2//N9rM9sEnvHkwbLkhunWV
 9gw9jKHQVdg4JHI3Fw2hzYoFwshNDapb7HWbJa0qU8g0nyVCFAvdfJix3aqSJwiQIkLO5dAbsJI
 l2VZSD4h0HLaesOv1QiiAOvn8x5X1Js77S24usuDWoCHb0yL60XqMFejLhdxqcKPm+rWOYnvO7r
 HL18HE2d+32PggQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/scmi-regulator.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/scmi-regulator.c b/drivers/regulator/scmi-regulator.c
index 29ab217297d6..9df726f10ad1 100644
--- a/drivers/regulator/scmi-regulator.c
+++ b/drivers/regulator/scmi-regulator.c
@@ -297,7 +297,7 @@ static int process_scmi_regulator_of_node(struct scmi_device *sdev,
 static int scmi_regulator_probe(struct scmi_device *sdev)
 {
 	int d, ret, num_doms;
-	struct device_node *np, *child;
+	struct device_node *np;
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_regulator_info *rinfo;
 	struct scmi_protocol_handle *ph;
@@ -341,13 +341,11 @@ static int scmi_regulator_probe(struct scmi_device *sdev)
 	 */
 	of_node_get(handle->dev->of_node);
 	np = of_find_node_by_name(handle->dev->of_node, "regulators");
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = process_scmi_regulator_of_node(sdev, ph, child, rinfo);
 		/* abort on any mem issue */
-		if (ret == -ENOMEM) {
-			of_node_put(child);
+		if (ret == -ENOMEM)
 			return ret;
-		}
 	}
 	of_node_put(np);
 	/*

-- 
2.43.0

