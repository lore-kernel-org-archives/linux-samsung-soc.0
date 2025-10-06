Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A862DCF4B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759769012; cv=none; b=JxGJVwT4kFVSMzUnW8mk4yswzgEsGlA2tx/2WownVrUrvzIS0rYqpu+0kvuadRBmBfcLsI/nBcRewFsGvb6ub0xlAM291dJyCnK67cfuljVutVVcGJb83+m4o5DQXdjHk6eWyKAj1cNG6uDSg5E93liBisyxD2BwnS0WrFHMUQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759769012; c=relaxed/simple;
	bh=HMtcLDEIKjq6G2Zgr0JytIoIw9ewVlt1cHK9VF+l//w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QljOfTGf5OQ2pd9SsWiwT6LNed8FBrCPHkLfD97ioPbimblMemvmxnWv5NeuQ7wNHfhgVDdUD0sX/0DEbWAHGfv3Hv3hd1wFN6wssj2R5SPVa5uM2GKS8VJEvEtM36lv6Z9JhsqCzVYUCuXvw4Axb4EVXihxHdUy+hxjfBpz7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMc9fMnW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMc9fMnW"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-634a3327ff7so10616214a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769008; x=1760373808; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKtphuJ/4di9yNIsz6yNlkrtQKgCMc1BLXd/ATWAWto=;
        b=tMc9fMnWJiszVnxWCzpauPGyIxTsvBolcKNfpM2X6yK1w79upYCSF4SuOdm78GkLbl
         8uTaAwDZziqJrKughTM1EUR7cR5ztBLGVBlcTT1iza5Tvt4l+ZC5ENf2pjHYvhqv3vub
         7Iqcu3KhnuCzkLuDSf2s+lARm11qdCUgqY2AjXic4HhKgHeA4Y48MkQ/S68k3kMbFoCl
         Ha042F+gF4iJ3wHFXtz2lMrFMWH38w+6JpSkqGIVYZTkrSwfK2+5h1dmqDUHA4E8Gudn
         eE+a/972ST2e5F01hWkVBbZR75stysD1C33NDz+paYOYmFYzBZuRLz1W386bsZ79QmVl
         7bZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769008; x=1760373808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKtphuJ/4di9yNIsz6yNlkrtQKgCMc1BLXd/ATWAWto=;
        b=A5Nc2HAYTac5BtNBG//w1LDP4fZVLB1G/SxesB5/aFNMddMV+sJ72NsKMBIlXSmqvY
         Nn2O1J+E9GtXK2VZ/q149T1mUo75ChxDzoLz/jVrFnUAyZ85rrLweQhxexcOVkC9GDTh
         Wi09JmecDwlyQzqXRv8OeyRK1lik+0UfYM+QNGZ8RWs74arexMMahB7XwjZSwTdjL88O
         u1GmBKg7CnS91RufPSLiYFijdUDCjgkXU2nu2XZEr+9VAEjYTI2jjtVl0yvBBNczLRse
         rzKcMIqaO7V1kMofxLmij3lEOdFiC37yOVoD1QLppkVIkhq8YL9iI2/YV5P5hGt/iuQo
         FJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNCPQV4qe+eSwnXFUUlqN/Ab3m08hGZTN64mDOMKTH2Hi8ArnR8ZUj0IEVA+tg7JKufkmoDKytWZWatUcigDk4FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpLL5qn8J8BmzIvLCTrmAM+ih9KnoJQzKihH1pElz5GXpJnbxv
	XNVzkwSi5EqwAk/U20YjU6zOP2/7z9VIW0cZpznzMUnymQiySLnY1Ja4HCJNGgCXD6I=
X-Gm-Gg: ASbGncsIesz9VK5BPKIzNFVAOf+wr7o3K7FGoVy9IoVlaPtPQ4fZCiPHe/H2mcf4Z3n
	g5d4MYSmpseBF5GptNwidofsciSmWF2yYQaVhFQyof+6Bmecx+k6RsAK2tLAYTu6GhY8dJTw1xV
	mgtb7DU+ZCttzM1/tZQ992pcxgxQQBPv4vFXd3SCvBPDhtNc9TEc7HpoA1LC/rzGGnWhPnolmtT
	7QpmeaS7SagcP1OznsKFbEKNw7Trkxt5f5bVOAwVBXymJVSR/PswQ0if9P3D4guArTaFVJ7gvOJ
	ChtasrzGub2m/klCewOiMMRrbuvIfcd7NtXsm0u2wKa9CPS/PNeQdaP24R/J68i+schxddnGIXr
	J/5snD5QF+l0iWC7f9a25x4khz3IkhCkeWXpA/7XkkvtJfUt7cmoB5fSgrMi98SqemhKj0VIVkD
	fYKGuPEwNG4TZFvMZsept06wycc5TpeoqgJyeiHJqd0j4dhUgZ/dE=
X-Google-Smtp-Source: AGHT+IEH9sBJd0VNAAJtz9rRu8u+k/yXhel69FaA4JYwSprBvbLGJFT33oMJuv5fmnK6KbnU7ExmwA==
X-Received: by 2002:a17:906:7951:b0:b44:7c83:cd9 with SMTP id a640c23a62f3a-b49c47accbdmr1839696566b.40.1759769008357;
        Mon, 06 Oct 2025 09:43:28 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 00/10] pmdomain: samsung: add supoort for Google GS101
Date: Mon, 06 Oct 2025 17:43:26 +0100
Message-Id: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK7x42gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwND3fRiQyBZkKKbYpKSbGmeYm6QaGGiBFReUJSallkBNio6trYWAAe
 OGYtaAAAA
X-Change-ID: 20251001-gs101-pd-d4dc97d70a84
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

This series adds support for the power domains on Google GS101. It's
fairly similar to SoCs already supported by this driver, except that
register acces does not work via plain ioremap() / readl() / writel().
Instead, the regmap created by the PMU driver must be used (which uses
Arm SMCC calls under the hood).

The DT update to add the new required properties on gs101 will be
posted separately.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (10):
      dt-bindings: power: samsung: add google,gs101-pd
      dt-bindings: soc: samsung: exynos-pmu: allow power domains as child on g101
      pmdomain: samsung: use to devm_kstrdup_const() to simplify error handling
      pmdomain: samsung: convert to using regmap
      pmdomain: samsung: convert to regmap_read_poll_timeout()
      pmdomain: samsung: don't hardcode offset for registers to 0 and 4
      pmdomain: samsung: selectively handle enforced sync_state
      pmdomain: samsung: try to get PMU (syscon) regmap
      pmdomain: samsung: use dev_err() instead of pr_err()
      pmdomain: samsung: add support for google,gs101-pd

 .../devicetree/bindings/power/pd-samsung.yaml      |   1 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |  53 ++++++++-
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 126 +++++++++++++++------
 3 files changed, 145 insertions(+), 35 deletions(-)
---
base-commit: a5f97c90e75f09f24ece2dca34168722b140a798
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

