Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E815274FC1
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 12:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458531; cv=none; b=qm5NIagATbduHciaQx8wPIR6Q/JYWZfkWS/L+rDNAuBKDicOs8CrlzqD2Mk7sCKclG29FAnd5DaLIwSYrnrjwKMMNsyriwn/OWR9byZ5rlJ5uHLbWHa3gONWfZUsJ+gPSVQLyrEhqeRL+L87nyKRPu6V67w/4cWb+L0HelZfZsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458531; c=relaxed/simple;
	bh=Sonnye7hZy2wt/2sdkee8anX7maKzoAKHEmbBG3T8tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FF4LGCCRYvgPolXur6GoTmlWobky7/w0X/lPptCj6ECEri3AFaAc9jYdQ1/xlZaCH5WsGMiKEuRiNcUTK0kAeviBU4yHg1CK3aH2cXX4ltdpNg2ZxcZfbRrv3h8NrX9OpYZwH1ptHTs6fG7PlM71DDIHe9yLY7QpxC1sfVm3b6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBJA5grf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBJA5grf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453398e90e9so35812445e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jul 2025 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751458528; x=1752063328; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x9pvwsjMWPA9nQD+iBKKTHpsU97t1wWZ+fWjmxW/6k4=;
        b=CBJA5grfPo7uThx18W4+K4wM2sAUrX5doEu77eyR6b7Akxr7rMCwfSHynjWM+tNklw
         +7c0DZrdi8mpCNtKjWS+XIXcQX6bk6yv7z7ncjzYBcfVF92VNhMpFyofp7bP7F0oW1AS
         YEwgEwQqPqc6PKBs519K3R1y9hY5RleQQoBrw+p7MAfymks2KAz9XES6kqYt41/6cZyS
         xZte1f23kIYlx/WLK/Kis2xZjwfY/fPd6lrMwRwuMPUG7BFrD8sO9LiVqRVSSDq+DJ3y
         hH4vEW/vzwy1nU/omZRP60ByaQF1DpQzziJ/nQkkdGxyRdwkOdWa+BINcVmD41HjtP4f
         5VDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458528; x=1752063328;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9pvwsjMWPA9nQD+iBKKTHpsU97t1wWZ+fWjmxW/6k4=;
        b=tsNuWu3hE9c+Zja/a6STiIRgE8L9cKJqJs0aLVkm9F9oJB6LnvncqkVx9NuzdcvocE
         MX2b2poegT+9o1D+SeJuXc0kSNsBJFi3mprKYS220CiB53KLHOMUbP+pFjaGUg4ZERve
         9lgc/hFya/MnGFCDpSluKHS72moGpGNigZf7RqAfJbYgX8NuUwFYQkk/cYzBg6eH4Oem
         lu8eifQfV5z+nAYX9TA9fB8LuY3zRR5eCiEiF42pG82o9WWrgtQFLStYtMQz+Ay1/sqJ
         ymhXQiTfMOJ6Q39SqnGrGjEl47iqNtvUqcs0PIisRfUcioqIxxQn99O2b9iYZXJ991Ai
         4dIg==
X-Forwarded-Encrypted: i=1; AJvYcCVzO1gh64+xpA9ZVToYVDmbfPoTB/0mpTAjKL5ZubiPWCDy/v95lirPUYsomq096PfI5ofKXCL2wjGJuz4dvC9duQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXxFFC3E8nYI9qOX/CXPLrBmIgMtpzLhTlOokCN8l2CMy63I1w
	GK0vGQPxyT2vJAwGV5s5v0kQmoO7u07oDC5BbDdn0851uiuF5O20i/5GihDKBIys59M=
X-Gm-Gg: ASbGncvNLfRpZ57xznW78OmATVkHLbVfkKu/JXEIeWc7f0CWf6S438DJeateim+1uiI
	MnIbBdBUeIldnaxR4InCkh0z6X+ExL6wL5EaeV2PENR10eqkolXsCk+yawZeSyw0sW+4CkUwQS1
	OTq9l0jdZGAScWctRE56R3UT64sfyI+MaIKfUezic5fb4rA7XyK2hgWw0wKsJhWmH+iLGeGHzg3
	aUn15ccQP2lz7vrmBMKqK0R/HAJ8SaHKIHTHBUgVRssgENTaFlrn1991Dtv0WHbOf10EzSjcbn2
	VA/7NoiEBEyrqNGYdCz9/rnljJVInoC4ipy5Cme2MRSTbXWqaHM+iaYDZIxt5Q9kFkOWVOxBlQQ
	e4YFks273S/3Xbdrg
X-Google-Smtp-Source: AGHT+IELgg5UZzqaTlSfiyc6Ytkoj6C/RHdaT40F4scmmqS3AYJLBC3dMjYCI068eBu4lplMXDVdzA==
X-Received: by 2002:a05:600c:4f13:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-454a36ec540mr34363525e9.15.1751458528249;
        Wed, 02 Jul 2025 05:15:28 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm228256345e9.22.2025.07.02.05.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:15:27 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 02 Jul 2025 13:15:24 +0100
Subject: [PATCH] pinctrl: samsung: Fix gs101 irq chip
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
X-B4-Tracking: v=1; b=H4sIANsiZWgC/x2MywqAIBAAfyX23MJq734lOoRuuhcrhQjCf086D
 szMC4mjcIK5eiHyLUmOUEDVFRi/BccotjBo0h0NpHGXB11SpFDiZbycOFqlbdNPbUsGSndGLtL
 /XNacPzMOKGhjAAAA
X-Change-ID: 20250702-fix-gs101-irqchip-8d12d369440c
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Sonnye7hZy2wt/2sdkee8anX7maKzoAKHEmbBG3T8tA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoZSLecwK0sxfmoygPy9wJSjKSBq78rF5mEbSPI
 jagEn353PyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaGUi3gAKCRDO6LjWAjRy
 ujWQD/9dX1YTX9ZBnRCltukRwwg2+Ex5ETtEJVtNrSYJtAj6JDjMCK32q+2ExEr8o4nxkdDbNZq
 tcQqwCP3OtUaNf5+cZALlUvIrAB9j7MfFyhCK+4V3um44lc60sulhIZZ9X427vxU6Oy2DovBzpn
 1/22Zjj3t2R9QmskA4AlInV2Rhr3PkPEeQGNS8xa5YGt0kV+oPVPJG94ckz6k0zUh2cvaFeuLfZ
 aPe9UVsynX81YvNMCyFXHB3aH81kI0VBciFnhcky7rL24T7ir+8tADpsIa5rrw9jFYrIWyRv5jy
 AgdOP44wde/WX6EnfhCJHFnQZG8LnefXO9dl0CykpuwsOXzssPy4QjFDm5ZWNHGB/K4t//kezHa
 9Z/xVRjGJrPI3aS5fvcIgx7kDjGkMSLFln7PadJmY2QzYMB8YJqe7IzXbu3jJ/lMBslF8K1RUNB
 6EQNW4j3/5j0SmdweFTVhgH6TmxLbKEYqblLtss4jgFvUI1d4eqTlYKzJyQoVsWOliXDsL1/Pa4
 NZSYa+eSrD0GMcItjGp9a6g4VPJcOG+9JgTcU+9kc5VzedjCQP7RrYcXkS2ysi4emDOh5K1sXrV
 bIYsUU73Un5KFJlI4nJsce3Zg58KY/Lm/r4SWokTVsUB/BaD4BGPkOl4lVPNR2nHk4NFvTe1Lwc
 rrGx4t9wNbgLsJQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

When adding the dedicated gs101_wkup_irq_chip struct to support the eint
wakeup mask the .eint_con, eint_mask and .eint_pend fields were missed. The
result is that irqs on gs101 for the buttons etc are broken.

Reported-by: André Draszik <andre.draszik@linaro.org>
Fixes: 2642f55d44ce ("pinctrl: samsung: add support for gs101 wakeup mask programming")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Note: no Closes tag as issue was reported on private chat. Permission has
been obtained for using the Reported-by tag.
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 5554768d465fe0d8bf6e423b2e835965cde5d8f5..81fe0b08a9af5682421e5a5533a6cb4c9561cd24 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -665,6 +665,9 @@ static const struct exynos_irq_chip gs101_wkup_irq_chip __initconst = {
 		.irq_request_resources = exynos_irq_request_resources,
 		.irq_release_resources = exynos_irq_release_resources,
 	},
+	.eint_con = EXYNOS7_WKUP_ECON_OFFSET,
+	.eint_mask = EXYNOS7_WKUP_EMASK_OFFSET,
+	.eint_pend = EXYNOS7_WKUP_EPEND_OFFSET,
 	.eint_num_wakeup_reg = 3,
 	.eint_wake_mask_reg = GS101_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = gs101_pinctrl_set_eint_wakeup_mask,

---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250702-fix-gs101-irqchip-8d12d369440c

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

