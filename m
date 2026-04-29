Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A73E5EE3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468315; cv=none; b=AnBSiR2OR6Uih3EhUWcxthRgj0RkjUrUr7RS5Dz5pr+pJdPucK4TVY1mZpVZ025Gq8NBEAv6tk+eFjpnepXfr9Y2W9e6nIiDfauIckLH2vAlUdxYjk4atElO0X/FmGeyeKUXC+oX76Eo8dXTNJqPk68vXSjB0HzRTVbtVwuyaAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468315; c=relaxed/simple;
	bh=O60dEyNAeg9/bJQwp+6nhzKbZ4rJnrr7+9Wd3xUIU2s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VJWfZLqhKWuPtSFShqwv8hFPXvXX7sfhnXgZ4Wh23E5G5IBkwGwqM8pe3iZcGwf2J/8VMVyhSf5GrgkXJyh/1mwsfbyomib/47EIa6BdPt7+yA4iwdneowl2eXsyvqv/x02nw7M7l7dzG9eRUrnNJrheJ9d8LSuCA2HItXcH+Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2PPIDSk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2PPIDSk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d70b3e159so6722048f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 06:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468312; x=1778073112; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qV0dHa1H26dNJYdioKxpR+rFrwvFtEas71faBHPqnL8=;
        b=c2PPIDSkSoRsX0uq+pdXq6oPFqObqHMvxOKRlKQQES+cYr1wBbP6Hf9HRKlUvYDBgg
         jJP88AneBtpG7PhxeMqCd9G21R/QHYAXZpaiyoQvsHrbs8K5b+XfGlK7zFKjJ7/rh9Xy
         dgXFtjV6RXvPWZpXkI2pkblqEzRaDbmJM4LYaV+EEHm6u/ajTx/jJe+2zpOBSVvVqby8
         A6E8IFRugXCo5YjyGKMVvK5LPWMaSI/vKFG74hTp1wGPjC+vQ/Cto2n0TqRhJJpQcr6y
         40xrx+nPwxFNCRIbr6DtGqCZtzLOPFIEKJUgqv0dKiaXxVifIBS2GTNv9M1/aaFJhuZ8
         xSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468312; x=1778073112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV0dHa1H26dNJYdioKxpR+rFrwvFtEas71faBHPqnL8=;
        b=Ng0pyISh0AwY19b5RRVUb9wlywnRRUh1c5YXVqiX0oDU41lur6o0anYkCKz/OZEX46
         OmWxYcrupuNOJfToP4WnOXD+xMmUTByMvb3qPxmNkRD0el/GM6MQPfLTVaV/wDLKBNd8
         8ZZBPBiVSsGC5TZIj5WkK/tftUZzfpBs1giEqSUTWZd1kMqpLxVxcjJnodwKgQ349xxO
         Qx8wD9MouiOa/0ofmSA3fWWZV70IWNjtI7GKo39Wtb9thiOsuykGrcgCmxw0de7ePfNU
         0v+oGSUEJiGor8ELJNalrk6DK6kTY3Tc9G5eS0OnutMDSIKbNFGa3NIYhmAMgrzBnISk
         goWw==
X-Forwarded-Encrypted: i=1; AFNElJ/qiw++n0CXq4JmYQAOezgXEBHszaasLD82LCAZ4V+OdZuDNf9BHtVcZFG9ECKtV8SKMpKaR2SLj7lnbpBpGfjTrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSX/KwPwalBH8IO8pAQzFMuzLYx+jcQcPDfl62MwcDjkOlOEl7
	ilJQAnECg6EFEerTU6wLRC8bVmSQdQ5Qlklvx53pOquk6g1Lk6IABbOjHDXBH+r6MO8=
X-Gm-Gg: AeBDieu4AItd5UoaisTs8F4NK4wVLa16qv3KoZgS1Y4n3KAlfB8/UnfEAgSBbK+lj2c
	AXH7Z5MUbN9KwYSpghhA+KnebQVidEuH9oBGw+q0oVzLFQzjcwI57k4QDJWq1YW0ZcoWVNB0Lxp
	jiJp/OcKtvxH3SRAMrCmy8I//S5H7LY9sR2Mcw8nXudCAymTTxWnbcKF3xkKnqzXeVW254R1vvC
	0gXF3XhQOE07L+abtEBiasmfar899fg/ud5iG3ps9dC0ShgrkhWyVRnv7aAFr1wj0G4fDBeNFKR
	n6xKU8sm1rMlsQlItPPDqAcvu/Fk+0R7zU0JoTI0dwIxCRRaAhQOmtRUjp8+xiBxasBK7nvcQE4
	cfzUdAd6qd9zrp2fvNGnp/4PqlrMDl1gxJIHWsGCaVxqlYAwnX0dj3WGZIwy5DE5yzdyXY3G3ak
	3F2y9gr6ILVIKJ5YN4WooqujjhI5iTdlwccAKo5cBIv4OvPx8/MtndC5mclagOfJDwH3jc3K7rW
	9u8xB9Sm3c/qJVYzQ==
X-Received: by 2002:a05:6000:420c:b0:43d:613:4036 with SMTP id ffacd0b85a97d-44649c995fdmr13980592f8f.37.1777468312077;
        Wed, 29 Apr 2026 06:11:52 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:51 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/6] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
Date: Wed, 29 Apr 2026 13:11:49 +0000
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUD8mkC/43NzQ6CMAzA8VchO1uzlc958j2MhwEFFpWRlSwaw
 rs7OOnFePw37a+LYPKWWJySRXgKlq0bY6SHRDSDGXsC28YWKLGQGaZgmukBnX0SAxse7M2Bp8n
 5mcEQVnVBbZ5XSkRg8rQvxvvLNfZgeXb+tf8Kapv+xQYFEhBVWZdaaszpfLej8e7ofC82N+CnV
 f60MFqq66qWdGa0Lr+sdV3fhGeJRxEBAAA=
X-Change-ID: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=2613;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=O60dEyNAeg9/bJQwp+6nhzKbZ4rJnrr7+9Wd3xUIU2s=;
 b=FCGUU44RTE/wiRQEp69ZEhQQ+fxvOozPURXqNN8E86+ml1DTCB3s3/1Cjt91nRXJZ7dmP5zkH
 vqHTqqZgVAhBVRn2fAnlbXv0n0hctdhA3YVK4PceOG7cl/7RhEN6u+x
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Fixes for bugs that were identified by sashiko when proposing the
GS101 ACPM TMU addition.

While the bugs are sane, we haven't hit them yet, maybe because we
don't have enough ACPM clients upstreamed. The fixes can go either
as fixes at -rc phase, or as regular patches for the next merge window.
If the later, we'll need a dedicated branch, as these patches toghether
with the other ACPM thermal preparatory patches will be needed by the
GS101 ACPM thermal driver. I'm thinking a dedicated branch and a tag
will do. I will respin the GS101 ACPM thermal driver series once this
fixes set gets in.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v3:
- validate more SRAM parameters and queue pointers (sashiko)
- consider/fix the acquire path (Krzysztof) - patch was moved
  last in the series to avoid touching the same code twice.
- Link to v2: https://lore.kernel.org/r/20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org

Changes in v2:
- drop patch "firmware: samsung: acpm: Fix sequence number leak and infinite loop"
  The patch freed sequence numbers on mailbox failures or timeouts. Because
  the message is already in SRAM and tx.front was advanced, a delayed
  firmware wake-up will process that abandoned message, stealing the
  sequence number from a new thread and causing silent data corruption.
- fix mailbox channel leak when `acpm_achan_alloc_cmds()` failed. Did it
  by  moving the `devm_add_action_or_reset()` call.
- new patches, last 3 in the set, they fix some more sashiko reports.
- Link to v1: https://lore.kernel.org/r/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org

---
Tudor Ambarus (6):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
      firmware: samsung: acpm: Validate SRAM shared memory and queue pointers
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion
      firmware: samsung: acpm: Fix memory ordering races in RX and polling paths

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 113 ++++++++++++++++-----
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   3 +-
 3 files changed, 90 insertions(+), 29 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

