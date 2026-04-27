Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53FF31F99C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302253; cv=none; b=fFvjXrq38c/qkE6/4mHc/9F5t9DXtkd1uq3vr8fVoGQ6UIlGztTqNpW35z8vOXq7alP2/goRqO2NCNGISg2ta1wY4KN7zc2rGB7fk+gl8syeyxQaqIO1VhdRXLG+l1Kj3UszAU1qlpE8Oo3weqEXnQmmbXCKxVEb3tRt2w3gflQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302253; c=relaxed/simple;
	bh=FkIFbqu0c8XIHL6u/4dr6OiK07WQv3wNMNPw/3F+U1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CDYSNFkQ5pCRN6fbRKavyYOy9nfB4HBgqkTZ/VGERsWRoH9+nfYxX+IhjoSNuE8a4n+u5iG6T+fT5Nz59Q5zY121C9ZBv30WD7IXQ4HZ0HhAk7xftegDTL+4Lo/DDFBsyOkRR1EHZ3g4kX1MxJoSlwu/DENA0844MPYeEhEnO9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ub76ZJLN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ub76ZJLN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ba840146so94333575e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302250; x=1777907050; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QR1R5o6VCM5Z4T+4o9C/Uwm/kY5zS3IqERo7Ty4MIk=;
        b=Ub76ZJLN8jCWrfwdPHYwwsJbHLPSwGB9CBg+zM9SN6WYwo0otVneI5IAjB1yMnD7oL
         LuvGOHOL2eDKqqA8pTMgInnoWiiV1RcPYTDP5IHMdZEQNA4fV6H53Dx1UADRdcp+oddo
         4HXiMHDPJNV8SDdBqVewBfBMJeMKUInOPk1mNnsBlM8bEo5/jz1//QnIuGmZizNir9PJ
         VMaWvU7ltk0ulFnNyQmWuKDwI8eaioWPxexQmG2QxvImOOii5DRsYmX0irxJkcyGnBi8
         1MOFrPKLYVAp3oq/+xMwqLMbIb8S4bKbo3sMfkLYorXSbSFX8RfGNGQXKbRrTJ9PdGe4
         OzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302250; x=1777907050;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QR1R5o6VCM5Z4T+4o9C/Uwm/kY5zS3IqERo7Ty4MIk=;
        b=BPK4nhvMG5ck7AtfVjapLoOSsU0gUzGYD451SVUWFmNDM+VcDkgrbCnJRp4l9RneoT
         Ma5IO2Ag9CawjTiCB6Z0PQ//+/RbUC7zPgD9Ahs4LvQXZGYGZMvAqq4MC+woO44X/Gq3
         77pRYOrqx/Kl7BbfaOJoGRseTd8I5deRq+/3wh7ns40qSpdc7X5+uy+Rfdvdc60rjZXW
         eKLz5a7/GP581XH+LIM42w22TCFTpKTKGrKfjeIiOPjzOLPmMSI0xtnQDApREXdqW08/
         l3j5dqi5d7aHHaTP+rpMbyksobE4q4BWNhlnNlp6e4BzQsuOjMyc/r+io/59yPGdpzDG
         C7hg==
X-Forwarded-Encrypted: i=1; AFNElJ9nfoDy/Bt0n2rwmpULaFciE2t47JwP5k0tcxNwPhjySfSQH2XD8J6ICUIlxhNxja2grctgijWuIH+ujjpmd7x7Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPziwzdLkFedTvy3TJy7N5ryZ76G8Gbz3qLDghnJmToxYNs86/
	F8pBVN8KWmk63hHLQwcTKjZageFmjgBsoR0QFhPmQ3GcNdtrNFxuOLg13AE3wtzpfX8=
X-Gm-Gg: AeBDietJV5It6a9nVw1lo8lSxi7UST4WYPjdxxMRyPDeQShqAxlWGd+8kDR++hJ0Uk9
	icRAbUCOR7pXlfpC06Bv5uWbAQOUi7hRGDxMyUCpWGqT5pboLMgW5lYKuCbXXLPJGz9ZXxU/DRd
	VZ2OL1cQitNIqHtwculeejiHqQ3rKOTTNmIAJ5TgImG2Rbx1MUiXIeXkD6qxZAeKurMtWAE5/B5
	P2V/G95TruSyIgJbyW+yyQlWBhXez7PxUdGAFnqupYtHi9dP+l0OVAZI42AjBhKcoiNG7sLgJFG
	C8CPY3Ce9/Hg8vCLbBuLRkSCyLeIdRMtxssH/0lF21SuU2HeBTUnSKceE40xaeGyUMsIhH8Ivpd
	X5B0UfFvcWUefMUfFL0hfaqFmcpWipkzmPO39eA6UXcLmTiFmsL4LSypQ7qt4A8W2WJksLM5aj0
	U3CSTpB9kaxxk9zA33HhseQOVf9pupftyy/KbChZcj5wyWOKwapC1cUPzXsI5iaQfu83ktFgJlt
	QJ4lzG7A55RnAcRbw==
X-Received: by 2002:a05:600c:c101:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48a54a6b3aemr309871915e9.17.1777302250228;
        Mon, 27 Apr 2026 08:04:10 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/6] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
Date: Mon, 27 Apr 2026 15:04:05 +0000
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOV672kC/42NSw6CQBBEr0JmbZuZVn6uvIdhMUALHXWGdBOiI
 dzdkRO4fJWqV6tREiY1l2w1Qgsrx5AAD5npRh8GAu4TG7RY2DOewHfTC+78JgX1OvIjgtAUZVb
 whFVbUJ/nlTNJMAntxbS/NYlH1jnKZ/9a3C/9S7s4sIDoyrasbY05XZ8cvMRjlME027Z9AUguS
 enFAAAA
X-Change-ID: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=2292;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FkIFbqu0c8XIHL6u/4dr6OiK07WQv3wNMNPw/3F+U1Y=;
 b=MixsNd6wkgvvQDOhSDRPyCx4QCoo4FWY2Wr+553OosW0lyVFKYqMz0mugD9UWVPKnlCfr9Yka
 +reAExTwe1fCmfPhWLr4XOxnRsRzANdmqq9eAyzbaFJK7dBW5ZpAgkX
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
      firmware: samsung: acpm: Fix memory ordering race in RX path
      firmware: samsung: acpm: Fix out-of-bounds read and infinite loop in RX path
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  3 +
 drivers/firmware/samsung/exynos-acpm.c             | 77 ++++++++++++++--------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  3 +-
 3 files changed, 56 insertions(+), 27 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

