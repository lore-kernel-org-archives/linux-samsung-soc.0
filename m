Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C750D37D13A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 03:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782703545; cv=none; b=aYioeFVBoUjyFhg3QpBFhPL7gBy7gMd6eUZwN4X6V3oRjaE2ASpu1heRAo6raRsyMWTSIRMCA5Ge0jhg5wAmnhctXrzUBEO2pfLXx9zJ77hG8vb11iNPgLNt9Z8Mg4Dyis7c05GDst6WArTfUjRIafM/gp31ckEw3y5R2we+ED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782703545; c=relaxed/simple;
	bh=sI235h7NpFG/djNSPowZLUqWUmqwyCKk8vSphw/WAWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s8PeCiwWqT3doaddqqSRmjcxBXYr7keBPVqyhzgZROue13VZCvnAwusA/TjYuhZ4Qcmyuz9B6nxluJq065O8Ide3c5QISuZDoWLsJlJrNOx78vHFN4qcHMvnKyT9/y59XwAbvHKGjqeSFram3DkELP7g2Bif9H7kYQSX4QcNCbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dpa/wsrf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dpa/wsrf"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8475eca3a66so639122b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Jun 2026 20:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782703543; x=1783308343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TyaonlxlnRA1aHNz8FZIRpD/+0hZdshlSVPR6i+Frcs=;
        b=Dpa/wsrf74G1iCqVst8sqMLODNH8A+VzJywCrClHac8QgbFW+R75VYnxqIee+TVKU2
         dwhSdewmEQbLX9O64v1fPnJktHSogsukQC50NelFozd9xZRJ/7DSRQXH9xfuGZdnbTEL
         AsdNyFqJchck5VsQ2UldwetybZ7kA5lbbxarHjfWDNF51WVUYWk2eldSqcqM3lVKC3IQ
         2E1W0o4dV0KNWZOLp4Ryc4ztaDtsJHodMrtD4eeZy46iDmR6y/kamfCscjOLpTZNlLDJ
         +TY4Y+srnt5FyCGUlsGvJxGKCnRQ3l4R0iMnjvRX9zWoWGCsii09UayJd8KFiWsDm/lf
         NM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782703543; x=1783308343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyaonlxlnRA1aHNz8FZIRpD/+0hZdshlSVPR6i+Frcs=;
        b=so+9jFxycb8KsjPpkb373iWEzNLAKvPRnHf0O0Wy9Wwg+945hW0OuFRvHtpY2PxGvK
         fgxPx8QU7cQBMMShUh0lPqAqscLdbchUfpZCucWVVf7ImExJ7v9SP0PzpOnFc0n49Qpu
         5sIciZWTHPQjQzpLkTef8EzPLvgvKGTfY1UXw8NvNy+J/OdT1HvcIV038eabaMQ3WqDX
         9AdB+1bO/cybR/ioGb2N7S2sTTAsgGeLNap6jZlOOJq7dbRmjMyNAHDlFfnTtDGSSXY3
         G1YF04QHCp28r03DlJV0MQkwVVWYF9TTDf5TYFWipr3vGa0btuLNzd0aOkb28EqVZuvG
         F85w==
X-Forwarded-Encrypted: i=1; AFNElJ9hMZzBIerfQ6dxD4G7+Um7VInVPYtgXlaCjpWhZqaUsdlNVN2gGaqOA9V5HGh5YU9Nw8L8ofOxhKgLIDfvUpeG5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG5qWoHJcqWhAWPt1D32TwOSHeG1bVq1uNxCW6XdbqWHKaszdv
	6fOqj/31R9Ulj3R1dPrCvqm2/Al05ue67ECnprhZ4wGvh+xdglCscMqa
X-Gm-Gg: AfdE7clk+95lccRU1QGkEZscfmNbnAH4R7DTl1AiuBqwNM3Eh/Q099TKNIehaLXEuAu
	SORvWa3kgsng06IjRtjudKvYesWWC5tZCtWK4gGKvuvaFbFTJf17zHAwZrqp3rbNBOclXAc5JnK
	qmssXMkx+po+y5jl2BYx0kaW77L1A92RznKkhTHShAbgJETZBl/mIVdlgFPlNkNEjYKPnqD8lwM
	ifp6OzOm7eRH2cnxZMfeDr8Cwa0x/mGd643/do9+MoyNzT/Kv/I8praY9Tu3oG30GbZ7usR/C2S
	0QQ0D4bmb1Lr51glaAHBIjFnFeVWW7+BXmhpayDZR4OmWojFa6bzPFOdr6NXbX/dTSWX95KxRq5
	fdR4iBcmGHTfkxFX6Uw6m8rx/VdOHclBo30PBQig9JwZxWsZS4uwve0JEPwZUe5r9WYH0HORovQ
	ACy/uYnI62roiuCO0AqyCN4WjaCk1oANlMJRhUn0uulL4hYk4PzRG2ZRKajaUV5KYWt7NxySSW9
	s4fZoM3zHfyPnIZSAXP
X-Received: by 2002:a05:6a00:4c19:b0:845:cd69:bd34 with SMTP id d2e1a72fcca58-845cd69bf6fmr9304863b3a.28.1782703543034;
        Sun, 28 Jun 2026 20:25:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-846c7f659ddsm1921771b3a.32.2026.06.28.20.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 20:25:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv3 0/3] clk: samsung: use kzalloc_flex
Date: Sun, 28 Jun 2026 20:25:37 -0700
Message-ID: <20260629032540.2331559-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch three structs to flexible array members to combine allocations.

v3: move rd_num
v2: fix compilation and reword descriptions

Rosen Penev (3):
  clk: samsung: use kzalloc_flex
  clk: samsung: cpu: use kzalloc_flex
  clk: samsung: pll: use kzalloc_flex

 drivers/clk/samsung/clk-cpu.c | 34 +++++++++------------
 drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
 drivers/clk/samsung/clk.c     | 11 +++----
 drivers/clk/samsung/clk.h     |  4 +--
 4 files changed, 48 insertions(+), 57 deletions(-)

--
2.54.0

