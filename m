Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B3231717E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953950; cv=none; b=YMqHePNjV+Fa9YjPLVigzsh6O7SZ21fox3Z2nzTKwPN5mDPb/1nTQ/7niy7lyTPN+MFtY7Zmc5BHlaHP50d2MUnZWjextl8im7egLTu0Zl5baW5nRaiIGwE3pxQlQlqcRZmY1sX0NQ3NQUW/Yyhjsgqq59OQCouBw3MB53CpHMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953950; c=relaxed/simple;
	bh=Alq+UFc8DGGiXf1MTbZh93F2hTozhdw1uQQbLdnroEg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s9QRYIGf36FC9x8pOP8qsIPPf9nCZ0i9JvnqCMnd44Cg1l1syRG1U7ConEuTKM9Y/sMiI11Ae3kKEBroKXpFQh6wfo3JDgn7xNnpSYvpLWLCGysXbWgNYSWj8X//de16yuYHMXxoPfYkfCZvDNI37up9SJi+M29YrLai4mtdIFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OVmuJglw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVmuJglw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfbd17589so5344332f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776953948; x=1777558748; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+eROZPmLE7RDR7HyOBddBTk7UV5IVzr9QqgC4DMrC14=;
        b=OVmuJglwJRfS3rzZCLqMjq1scgfn0TNZ2IbIbOY1G7xo2tpg2VfWDKUfTG+4DrA3GL
         Xg7fBjXibKHXbUfL1mpkaMqRvZ3632EFDJ7kWeyNw2usuqgxd2xz+j5xQ93VJlsLsh5B
         GjAzkC8PFmk5xQlQ8VR0JGF0BPQkP+aOrThw0m7I8NVCOEA1d5yCAiWI/Y/wIV4WIU2b
         6yfDfFNfOzbaylTwgMg9oo6vpp/tYWaJDTrYTDzIJPQcBiQngjxZfhevbE2OhP+fE4MV
         2ePXfaco50gTPza62s0Hi+9gmZTkEPTspO4OQjR9Nh7+oN+HsL0tszzd1HsjUyxqpbBv
         qBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953948; x=1777558748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eROZPmLE7RDR7HyOBddBTk7UV5IVzr9QqgC4DMrC14=;
        b=XcMw/deI1VVvIdzy9enbVDWhAMAf6btB9QwGFVEMr9S50Pzr9L4+uOajHtmedL739y
         OCW6r5uo7xBepzcQMc9rb01eQ1ZIOkFWaGfqUFViXjk+P5+vB76QfCTKFEWb4+0sSVnc
         7jAA2AccP98VhVRCjK40Iq7Mtdz9EPmVKtsms+Ycji9/hDCDqt8mFC8/dTmfVx32gIj0
         YEMyb5EPSNzLqMir7/1+BpQNP0+3xB+nVAJbpB6bzf5muKkURYiRLi3//0nHUWNKLXoA
         pk2cKVpt8AnN6ohHoXtbbeSemZ1BS2O/ycjhzOV4c8Z3B7KbNsDgYridb39qrY9K5+lp
         PpAw==
X-Forwarded-Encrypted: i=1; AFNElJ/CDwgIM0ncnWO2zmw0e1sofspnLRTsO6yyH/g6hFRaxM0jX6rkPJtO/eiDmgmu7zbsuj17pM+eu4XKWgShUJ8yXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+af8N27JnIp7n2itcRF3Ix1nXTiwcQuCtXEE2P10Xou1smgC
	N+OiPvGlIbnvfn46apTF+UrCHHm8SqPeNTcWgaRYcYlQXId7pMc51JRuFUiG5d1EOmw=
X-Gm-Gg: AeBDiesT1XPkoB7tljvDFEJ4BZmhUoBXV3xvg19koX8s/L6HACtC5GCDzud/AusbCMG
	NBEnRu7Ikd02eamOyZ9I4FdZAQglHnPFjXq2BFWTb6dEsyq39sB31oZjT9BfNSEDfsDKcba20Su
	zki2wP+1tgkyApxczIkAXtD7dPKYR6CDYuafecssrQqrffgbwOXgEApnHRolpaewu1hC82c/D8S
	ETHNZa9ZKb+A3MLiMwz5Tm92KGiCB5PaX4RhxIAN3BbYdmtafwjHgV5veZ+cHrNLMUbad1INmRW
	hjuNdQIQNiT3XC/K5gu25jNA14HANqqxIJjjSQGLpa6A4IGGPCyrKki8uvTSe5883JfjumrzQG9
	zleKS85ymDgbWY6af2tNAlLd4ry0Ls2ut/eyQfJmxyJZ9po1/SXKRdOS3aH7xTBCHvc5sR/rdpV
	Njsf2IBk7tTTNNYHuHLwQQexk127zuE15zG5OSDBv5bUmKd9Tk0zRv/KkfR4bfXwNDC35TxnD9S
	2vk9Y1NsE2swnOeNw==
X-Received: by 2002:a5d:64e7:0:b0:43d:5ec9:246 with SMTP id ffacd0b85a97d-43fe3db2d0fmr42764796f8f.12.1776953947709;
        Thu, 23 Apr 2026 07:19:07 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm51107483f8f.31.2026.04.23.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:19:07 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/4] firmware: samsung: acpm: Various fixes for sashiko bug
 reports
Date: Thu, 23 Apr 2026 14:19:04 +0000
Message-Id: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgq6mkC/x2MwQqEMAwFf0VyNqBdFfFXxENXnxpEWxKRBfHft
 3gcmJmbDCow6rKbFJeYhCNBmWc0rv5YwDIlJle4pqjch/0Yd57lB2PztsoWWBGDnsYerv02mOq
 6LSkNouIVU98Pz/MHNrxb3WwAAAA=
X-Change-ID: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776953946; l=984;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Alq+UFc8DGGiXf1MTbZh93F2hTozhdw1uQQbLdnroEg=;
 b=5DnC1cyhRATJzyqTxlio1EYxDf1k9YJhfl5xiAUbAVVIwIPmD7bB8J3dqNBJV0meH2h8Ki8ik
 SFDjLBuZFdsAHwNg4R6zvzSOZ/46k36OIzRA7vcVEJFamoTEXFT2y0/
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Fixes for bugs that were identified by sashiko when proposing the
GS101 ACPM TMU addition:
https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix sequence number leak and infinite loop
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  3 ++
 drivers/firmware/samsung/exynos-acpm.c             | 32 +++++++++++++++-------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  3 +-
 3 files changed, 27 insertions(+), 11 deletions(-)
---
base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

