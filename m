Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4181304BCC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506858; cv=none; b=S4Z3xmJP7L4fVJD5Ba1od+BxyHeasPNpDBbzfAwaPTjLjcV4ROaeO/OdD/IC2b0h+4wCoLsS3qjCT93UOM24TusVW49i/ZdLtq4Ek8VKU1TUK+xvw6ovnvEtp7WTmOlx/dDyrFQtZ6tojk8iFGaRKH7wOKscYucfElo8d8MUi18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506858; c=relaxed/simple;
	bh=cfhhhzhQxZrXxPloRoYunXy+b+gOmZJrF1u84C5Mzbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n4+HIcR3V58drKjD1Vp8ypTa1mDm8gh21AChAdgTTBeb7Th8/lsc9oRfqjkCRvMSZM4LP99TPKIAqvAUSOvRuIO0OJBESj1r7NMR6W9YC2MaQkYB4kO3DYq5vKu3NKPJpxOtceg174Z4vrVG4Nwq7KVez9g010Lgcr33E1xQDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGlCf3RQ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGlCf3RQ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6188b6f5f9aso646243a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755506854; x=1756111654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=;
        b=xGlCf3RQ4OmYcH5KpurF2OaO1+xexpMa7V1UcD1BKoR60Qyf5OdIGs5eLIfRfjd8sB
         GwoJow6gXrqivJeYhMZ7n3IAPAwP1TrKollsllF/aqm5/S3fRQk8cklGJARp7VMDD7oV
         G2JZvvk4hC6VpCYnYCufufk3nBMESnf600hcp/o8imuSeytayRJgvB8DbsBkZ+FYvvL+
         S0+UzRXh4Sv4ztoWVxjTahRrVZIYAm03B9oWwVizrsxRxSfPvAOrqiT6E2BCMWFBeklJ
         BVuQAmvTlUyhngkfX04Ksi/ZaJq5TW+lWXjWy8tmaziLZYTSm3tbNR8pDoYsmIQHdO/T
         yDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506854; x=1756111654;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=;
        b=NaADfEKm20gQZ7m6aLstSIjva6c7an+5LUUhHqRqapQydQI90pPpFECIylFS8+o+DK
         cTOXbfnKn0aWMDnCO6trsscnlMuqXXuf3VcljMtF/H3HfwnhMGnzYtNHkJ1b7j6NOSN7
         qxonfEpbjLh3OT9YLugpBa/1AxtfiRmgrGElK72LRYRmxVR8/DFzfScF0EYwLHRv09yM
         0Ghhxb5rGo1MxRLvNepJyce3ZkZ9GIp0GzVjxOBW4KJtjbbvLnK4pOXgAu4pGlJFUnrc
         y+AoHXBMWCCM6oDSb1Ji9xZXvAUmmBuf7nW+RzmaMl+64jQFY/PvTfLlFmWHY0rUXnSy
         40eA==
X-Forwarded-Encrypted: i=1; AJvYcCUtMtc/6tp86HX0e0wR+8gBdXnGRaAh8S5BSxtwS1eaTo01ZEnxYnVE5x7QDVXXfRrbX+1nWxQKDCyX9DQBGnJv+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgYKsQefU+qL9z5Z8fGE61rg9eP6MSgvgMKAivMSwGCDY4r4Qm
	+VeCUNK3j8kHH+8CEFyIUp7XbOLpT9PUDNYvm1KLOH3/+cyFnsLbnUlDd8BinBJuzLY=
X-Gm-Gg: ASbGnctdBfG31Aq1jrlwgizgP/PQZu+ZDL4+x25JgyJOT71PX25szt5r2vsy5SaN64j
	QkxAmZONGFRyGA6nrcMEv9tEFab2AA8w5NG32+JhzxJ/eeySltEtmn+LNUTrrWWbiQIsu2dqbxl
	lCfrrlJWNcTLT6YEMIgywHnkuDgY43ajkT0BjYG74SXJmJKvT8jefB1xGW87erOiCoShNTJOgSB
	0nMIsfLh2pTt1f2o0kGI/gUPbA+O3Kz7eX+PANRrQbfdVfkRWmNZoIZ2Ueljkv5A0RVXa5Hpm6U
	ddX2tLmZARyebKWOvL5pRf9t/NLO5UiSHFuoy/Tfed1+Xq+Pbxtg2lAGKHWltITdOpvYjpGEm4Q
	AT8pqcn5tGPzzjlbcao2WpMymos5wQtGgSX2sP3Q=
X-Google-Smtp-Source: AGHT+IHknpi+jVcAiHPe7qLq8tMu11yKP03M4lXkXrorN3kjMjAvXVfdd/sJwjbdKxYg4VZrpI7G9w==
X-Received: by 2002:a05:6402:1d54:b0:615:5cc1:3446 with SMTP id 4fb4d7f45d1cf-618b0f1c504mr4641443a12.5.1755506853905;
        Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da68fsm6627647a12.22.2025.08.18.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, 
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org, 
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 ravi.patel@samsung.com, Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de, 
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250814140943.22531-3-inbaraj.e@samsung.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4@epcas5p1.samsung.com>
 <20250814140943.22531-3-inbaraj.e@samsung.com>
Subject: Re: (subset) [PATCH v2 02/12] clk: samsung: fsd: Add clk id for
 PCLK and PLL in CAM_CSI block
Message-Id: <175550685171.11777.14695565851704310683.b4-ty@linaro.org>
Date: Mon, 18 Aug 2025 10:47:31 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 14 Aug 2025 19:39:33 +0530, Inbaraj E wrote:
> Add clock id for PCLK and PLL. These clock id will be used for
> operation of CSI driver. PCLK is AXI2APB clock used for register
> access. PLL clock is main clock source for CAM_CSI block.
> 
> 

Applied, thanks!

[02/12] clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block
        https://git.kernel.org/krzk/linux/c/1a713bd3b0c60d826bdde633919bedc1fd38df4d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

