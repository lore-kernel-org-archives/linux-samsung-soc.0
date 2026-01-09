Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CE5365A1A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Jan 2026 17:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979649; cv=none; b=s+NRoDMECc7tvkiZlA3LhGZH5FeJD8hR8FOqDnUhDw9QzMcjdfH5LPjWvdtv9x6orTWCOQvQsHBxC8R4ekopFodptsdOvWr43ni2GAkc6T+NoaPGPFEh2/i2DXd0guaENB1Uomm0qqR0We3fcVPUT94vrEmphrBcDcdbRMXpjrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979649; c=relaxed/simple;
	bh=dkgDqQDED7M/RU8r+s1m6wozOnvyj2Uj8Ri9obOedJU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bw3cNqKXH0WSeerFCLST4fpZXO0KK1QluBYpHRDk+LPKUhej/d6lBySDm/XPRBjpOl01GMLb7s+p86fct4r5mfERvKcQg3g6pw2Z/rEcaWCPrgSpqda9tKAPlYLCpp0GJM+KzlyyG/eywcTTYzwtMVlWUseZ3tscgmsU1qoHTnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEfDg0/E; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEfDg0/E"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b4b35c812so7189405a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Jan 2026 09:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767979646; x=1768584446; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pN9eq3+cVhnAIKFHkpVejmwpQ88kILrVS2yMNx1w90=;
        b=hEfDg0/ENME73K2SofvqGzRbqTtIn56p5DEKkycDljmKHpG9dO2bvfYZJlO92NSQRK
         KGYis7WFw/bW8jy7xmtWjNVZnevagGbmS7SoA9JpEO1iSnXQccMHRv61POknhStsxEew
         TJh8Cxe3dPDg7HrUInF/6yx3MRZdzxq5aZo1RZjDz7HU/gOUx8iU4uvOoMY8cwIdm9ur
         z+tHwd/D82pcovJAV5OV/Bz+iWavmy8lGVOsvPFT/NJNUiTP4UUOiLyiXzqDf4TudLCk
         Ylt1QIxHOLwVuUT9I9/nKl39FW+lBIS/JubvOUfmywA5uLCeHlzbldeOWl4aV9Y2JWqA
         DPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979646; x=1768584446;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pN9eq3+cVhnAIKFHkpVejmwpQ88kILrVS2yMNx1w90=;
        b=Jy3yQL1ezZ9lfAw2pbx5u4wJrwXGji+NH0yu+Lnq9fIIaUD5h4EpA9zuXaiH6qpl+W
         iEud+v4OLCVfCwQtyGBdR5wuqBOJInc0nzY4j8+kpIZX+fW4Kf8ghgS5ZIVpYhlboKyn
         72WwW3F/kro0WxgHMo+rz141XB4rGkXbTjNkn0VvbJLAFrWz6+X71hI/F/E3kkGNDUh6
         DJz3q8Ww5hpoqLJUMpxAUOksm+ZV/449BLvDrQ/y0Jm2BwiS0ReSw5Le8hD70qSUR0Ad
         pLoagkPnNN2MqQReQSuNt7C3GKsBZk+RZ3v774FSf9WTe4ExyW4wwn1ihETFG9K4G+7V
         Xzvg==
X-Forwarded-Encrypted: i=1; AJvYcCW2O6j8f+8u8h3Kl9GVgMooK/hX41N86eORNG5AewLKDbnBPtKfjXsXU3nAU4ZANZoGd9cOk/FRCFU+qKJMU3O4aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMkjl7xrpm+0fXT2LwPOH+rFWUG7ISF7b1Cmw+XJnjjTMoOk1P
	gnClTEPKsj9y6JvlhlJEzGGvwPWLaN3so7YnvD6thyl9meaHNiSsTvQPIvAjETw8+rE=
X-Gm-Gg: AY/fxX5KEsLpnIHHdt+jOSbw2JJaWF4q0hQj62Xa/CxmmAujnBR/dpqQJ2tuC3AzZ4K
	vpklLpDEZuHrVZyOdXDjhphTLWhhAfLnUypOwas2GqADYv6jGhqCZ+He9iVzpwUQbFRvIA7o2eT
	13OglzvfUl6xktcXY7UYPciDPNCo+oNVdkGuyNMq5BUi53INJ9cNe3UwsNAn3A23DU8xN1Hddft
	xWaYpnWT6hUYXawwDXEo5CU0Wcb/uVTDJ68ZJdYg8YjX2irw7afX9USIQlf8XyHLpfzXHQTemHp
	uJvicbDuva3/vOD/uTNgQlVeP8y2bvx+b355WhbiBeNqyueMXXC0/pZNe90E9xiGfrtAP1poXhQ
	sG5vfHCdDOm0S+kuRRqoKGmYnfh7KmyybXUchi9lQt9B+3uX28Q5HABR2NhHZ1HnHACIEQOrJ4b
	Nin4ZktRmqJDfyD5YALOKoPrG1sxEG5BUW3s+IGKpvAOa16fwkZEb6DjAkQBKgV2i1NDNANhPPN
	FS71A==
X-Google-Smtp-Source: AGHT+IH9konNgysfE6y4zUj4SQTFh9V4mtJh+h2X4vh4dTJ6V9ARUJBq5ibv6tNKqQwIVp/z5cofXQ==
X-Received: by 2002:a05:6402:1ed6:b0:649:230e:ec52 with SMTP id 4fb4d7f45d1cf-65097dceb1amr8909108a12.1.1767979646034;
        Fri, 09 Jan 2026 09:27:26 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be651a4sm10642182a12.16.2026.01.09.09.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:27:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] clk: samsung: auto clock gating fixes for PM
Date: Fri, 09 Jan 2026 17:27:22 +0000
Message-Id: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHo6YWkC/x3MwQqDMAwA0F+RnA1U3Yr6K+Ih2syFaZXGiiD++
 7od3+VdoByEFdrsgsCHqKw+ocgzGN/kJ0ZxyVCa0prCNDjOH1RaNPoJKe7rz3FztLMi12Srwdn
 6YZ6Qhi3wS87/3vX3/QXF8JL1bQAAAA==
X-Change-ID: 20260109-clk-samsung-autoclk-updates-e8a63bd68405
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2

Hi,

The attached patches fix issues when CMUs have PM enabled and also a
needless warning message on older Exynos platforms relating to
automatic clock gating as reported by Marek.

Without these it's impossible to enable PM for a CMU when automatic
clock gating is also enabled. While currently no platform uses both,
patches to enable PM on gs101 are in the works but things stopped
working after the auto clock gating changes. I've verified that with
the patches here PM and runtime PM work again.

I've opted to add Fixes: tags to the PM-related patches even though no
current platform uses both, auto clock gating and PM, to ensure the
code is correct nevertheless. Please let me know if that's not desired.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      clk: samsung: avoid warning message on legacy Exynos (auto clock gating)
      clk: samsung: fix sysreg save/restore when PM is enabled for CMU
      clk: samsung: allow runtime PM with auto clock gating

 drivers/clk/samsung/clk-exynos-arm64.c | 32 ++++++++++---
 drivers/clk/samsung/clk.c              | 83 ++++++++++++++++++++++++++++------
 drivers/clk/samsung/clk.h              |  5 +-
 3 files changed, 98 insertions(+), 22 deletions(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260109-clk-samsung-autoclk-updates-e8a63bd68405

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

