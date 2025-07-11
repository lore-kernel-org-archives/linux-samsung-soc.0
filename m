Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9160E28B50A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234454; cv=none; b=q7mcyMpYSsuBddjN1Tmmm5Apxg/oMU7+F1wgy3zHiW52vg5ohdMTO5nxOhteXY+SVwud13ASwNo0H0F9N1jsp+1+01Dj0JgZ+kojKUlyYseY/+g2S98bvtInTXa4EzRePBZtynqd3O26+0e6g2omyPXZfPfp2L26e0BW+DWFjHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234454; c=relaxed/simple;
	bh=QJVaK3OzonhM172ouy0CpSbbwuoG2dejA4OnkSXs130=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jyFeVdEbqgeh7WjDhldWbgYzClzw9Rs1hNHhy7YZjdagSWHl1DWrhmAY6pcqTizDgk2djCKPyrfbsWnpEDthujIAAuy90CeA5nffYesobuDk1F8GNaRZ5XTyvnE3leRA0oLKHf6zSetiyK/LrFMY0jg0b7TxrxVblGavlkRvPUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zomu+GvF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zomu+GvF"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55516abe02cso2005636e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752234451; x=1752839251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRhFukVlfvQMsLzBFVuMG+Qi50dL1WntO88bS057RO0=;
        b=Zomu+GvFGSHoNlAih7UVzXj0ULTVJF17s0qg7rIpqzretbLlc6nQ7NZ7kzlmNATYOw
         c5nq685/0LCfbCN852zdK3Al2bCRvN6/PtLiug07w6cbHrpI+owEqt3OBmt7Ln/ZtNZt
         BrWdYJsuYrDbfMq4llFGrLMiIjk5X/FpHxGytyJEYwrnmuQvFJZA2cS4fnGvD5gqOHTy
         3MAaZQqNivCl91EupaR7S2fbggnKnQ7HboCjIeoprFr6zMbN+kwDrAgEtVlxgtxVSpZ4
         y7pYUNCjAN31NPnCcYDxn/0KK+rwGnBRKepjzZV7kINpkCt2A8YRWJ106UTmqgGkVx46
         YcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234451; x=1752839251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRhFukVlfvQMsLzBFVuMG+Qi50dL1WntO88bS057RO0=;
        b=VbMmcc1kLYXdh4WaSQOi5q9x310PZU0EuWOTtPNKCBPGrxNWII07OzAuMFXgdgnFao
         zwexWevGhyJZ5+douT8uzqjbbIGoMQmjCpwo/WhxHmPAogyd2wNm6EubOfBKp+FxP8vX
         c3B5j9MP4qyPw6fxqITnJDx+OlGMy+au7Oc58WgeadoIf6o8OCsIvBdAsUno7q9wOWo8
         BdjHgi7zp9PxMQnaWB7ko23RSlNhOjFmqUtMTQtVT5ypJVgORZQnXJgPtoXJqonGid1r
         UHdK3DxPVpjrljt7zoMVZjdocPDfLLn45dGgoDdTuf+QvusgK5sjtm/4U2FqmoGTMCDo
         71FA==
X-Forwarded-Encrypted: i=1; AJvYcCVhC6j2FuzeEZx4ggQNTPy3/I8bn8IabWucDv8VSnTuEF3Fue9jg7clie/LBWj9V08MWJptvfzIVp8KlqPiVkRPqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKXdUZGBtU0vEl4vGwpbXm8L0+WNxIh2k4ZOFmOsfYNIDCkAUt
	mDV3KAcHRQLFn+PJP9DHn0dWWQcBFfks7De1UodrNHdDuMprBufjm2TyiLEd3Yw5AFc=
X-Gm-Gg: ASbGncuo44oTK0iSRQOIVkPxMR68AaVipKZvj3zF7Y7t1c8bN47ucfZyqbJZCmy8w/U
	eQ9ZCApYVrkG1jFbjB+M1ADoMsueVDSH+FSZoaki5Hix9e15+zUvUZkm3FZndDQyGCucktEL/aK
	NHf/wJSj6UHa/DiicpTQPtnOSO5OiC/pv2jaSoAw8OQvHRHajyV2oTnSkv00qvZrF3KrYAIMQXj
	n9hyP3hBmNg53NCGleNsp6nMdcOe4mT0+Lve/QuMmmOPMyNrzWPyuiq5xagYhrCVick/XTz31bJ
	N6iyv4fio+lbc/pzg0pvVqypGMFqab/51qmJcyKeyrnpJe6+NlPWS3L+jpXPHRjMnL1gjNBtQd/
	IE/LQ2IbwxkrvPi/l5eUXlFPydYHDNGDdqFIFoN4BTYHGF+X4aXXASLXmfGQXreDe9fR1BWgnkl
	czVAZhAsU=
X-Google-Smtp-Source: AGHT+IG12UDrTXalEDU0YKI0OWyt7RE273XbDSoBAUX3pRGix+0Sj5LWHFUpgBtVPKp9Q0+KnL0ueA==
X-Received: by 2002:a05:6512:3405:b0:553:243c:c1d3 with SMTP id 2adb3069b0e04-5590071bca8mr2492286e87.18.1752234449986;
        Fri, 11 Jul 2025 04:47:29 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b60f09sm915928e87.154.2025.07.11.04.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:47:29 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: samsung: Fix splash-screen handover by enforcing a sync_state
Date: Fri, 11 Jul 2025 13:47:19 +0200
Message-ID: <20250711114719.189441-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's has been reported that some Samsung platforms fails to boot with
genpd's new sync_state support.

Typically the problem exists for platforms where bootloaders are turning on
the splash-screen and handing it over to be managed by the kernel. However,
at this point, it's not clear how to correctly solve the problem.

Although, to make the platforms boot again, let's add a temporary hack in
the samsung power-domain provider driver, which enforces a sync_state that
allows the power-domains to be reset before consumer devices starts to be
attached.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/212a1a56-08a5-48a5-9e98-23de632168d0@samsung.com
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 9b502e8751d1..5d478bb37ad6 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -147,6 +147,15 @@ static int exynos_pd_probe(struct platform_device *pdev)
 				parent.np, child.np);
 	}
 
+	/*
+	 * Some Samsung platforms with bootloaders turning on the splash-screen
+	 * and handing it over to the kernel, requires the power-domains to be
+	 * reset during boot. As a temporary hack to manage this, let's enforce
+	 * a sync_state.
+	 */
+	if (!ret)
+		of_genpd_sync_state(np);
+
 	pm_runtime_enable(dev);
 	return ret;
 }
-- 
2.43.0

