Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F35258CD9
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Apr 2026 02:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096428; cv=none; b=k9aScBEKcYsbf5yD5urB0bxXwHgKtck0scwYjfy/AiW3xW/0WKSaVayUXmqdd9E4uj2mFo3iCwAE+8EEqlnftbjGAq2kJiVPBn1X+OnrnSxrXQYWG9fq+GYg35JaYJOguofeCb3R05HfnuGMrqaGMPgeGk9+cBWAJr1+gY+9nf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096428; c=relaxed/simple;
	bh=Zvygghc4U1zVfy9V6MoGOwCMqNRKWIORDTl32yEIMvk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tvWO7AAt2WAS47BhEP65TwxqwcwFWosBvhBwikvIWzhEqxx7S7hLkCFKS02XQcxr/4TfOqX/r4fP9B1xF080TIY//KT4QK8evBgD+wm5UkGuF+aOTttxDdVzkAuHdhbAYjLdWfLc+WsYa/GA2phunob1MRKYla/OFHj3Upwsm8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+lkYKzW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+lkYKzW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so213331f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2026 19:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096424; x=1775701224; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLOJdGh8Zj4JSEdcQhNVsEs0aSOI1jN7IdBHD4I9ibY=;
        b=A+lkYKzWK1zURO6QTRm2HwB9CzRfMzsfl2vDR9KrXBqhGR4Db8pu89x7Q3DmpWgI//
         J7mwg9PWxGivTgoHNtTQPs6SLCkNrRWG5kUpurhb51WmI1tlpqsHnHJG/IpAcRsiYUgT
         /KqJJzpWw2/bllWhLYydbJEbUx8j5bbiMVFvqJJcdz3SdLVH9y9+jmVMEVsurfvb/35f
         L6OU7R4vQt6isSvUMqEwLh4VE58b1NJL/lPeL5vx8yNdHIGJZ+SUfURQGQkqMQK6cU29
         fkF+v4oXYKnHaEr3CFTdPj1dROsflihy8vCsmjI3nIoyyog8IqPTTTBfYmZbLgRSJ4a1
         gTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096424; x=1775701224;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLOJdGh8Zj4JSEdcQhNVsEs0aSOI1jN7IdBHD4I9ibY=;
        b=TZHiY8GUBbL58V8oXTOsM56B68q/6fSx71K3/Fwg9UDFqtnoViyJcnG4R7Ds+be5re
         H/ou2E79TuKe4QbBvu+qJqVrwlCVNHspK7qvQc3cVjs+j3OSAlbx1zf04UQy7zUoF7Dl
         UfEFLTreXDRGfNawQqr94A7zetm1ImbTORTn/UiqmObM8gfzoj+SCGH1NbkkNkC1tIJm
         qTvpZfzdPReEsa7rtn4Y4lEFkPuFUmg0zJC224JsxI6R+g+EQiCoAwxdRuN9ktc0rZXE
         h+yqTX/vBSvB/0KffvvBmFODKAToZtWUx/riUWgeyg3geGj6lNLcS77VrgClnc2iXonI
         JiBw==
X-Forwarded-Encrypted: i=1; AJvYcCWt4yzRZEpHLYRnqyQ93fvJAppXXyWKk6okPHQl/bv+n62vHgDziGthslzfMm3FRoPeAn4PltDlGO83PeS8YdgXEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3K2sxIjonJJ+CrHOYyik74TRi11YsKAT4FghgfK8m3LQ2BQXM
	BLJdkaduSEtKTeSfqEEluH1TU5fHpka6k4zEms/yySZdsoOc3nBrl2NQgiMZ4d3TD1k=
X-Gm-Gg: ATEYQzwhOZMutk+4tsDPpB7RfLCnNB9Ksb4WptWQdDOXNDRQ72fgPuI4InOi2ktdVUJ
	AEcTz7KQeYO1hmYQ/TWVEegR4gRuU1vJG75vH8jnHNf1EQq/4f60hGOf0gGO02gX8TvTp9MWCCV
	jZxIXwXx/DImxVNaavGV2rxEPbhEca9fTnCMeNX8vY+o17NdDg7g4YkQ+qvc3ATcYF0WlxJ1Ynd
	wb7bp7/xHGI7iuK1PVCoyVHxsxeuOd0XRmz6t7XOM7dPLsOBl3BBAvEEdHuZDiIQ4ZNZO1Twj90
	k9GfcGnoJHX7CtKmU2c8L3f7a9FauuBMXjY41k7HE/mkezBJ+od5n2SXm2MfHyyhxwU/hxOe66v
	Ds/Qwn8fTgJCFJc+SsAbNcQHB1rjxccjnlGzeIw875ETc9FTnfmZ/sm39YTm0FiPq70XrrvbQWP
	qH8nNLrppZKTUgYJ/kDyNdUbXExwWvGWcM+oeWn7IT0XHUMhBBRSk9KMS9dyXb/0azq4B73Qs+j
	s8MyKIw+OshV5qO
X-Received: by 2002:a05:600c:444e:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-48883569e3dmr93027505e9.2.1775096423942;
        Wed, 01 Apr 2026 19:20:23 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/3] Exynos850 APM-to-AP mailbox support
Date: Thu, 02 Apr 2026 03:20:13 +0100
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3SzWkC/42NQQqDMBBFryKz7pQYqSRd9R7FRYwTHdBEkhIU8
 e5NPUGX78F//4BEkSnBszogUubEwReQtwrsZPxIyENhkEK2opECadt9SOoh0KzSrAsuhuc+bGi
 dE1YNrVZaQZmvkRxvV/rdFZ44fULcr6dc/+wf0VyjQK0a6hsndevsa2ZvYriHOEJ3nucXsOEZI
 MEAAAA=
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

This patch series introduces support for the APM-to-AP mailbox on the 
Exynos850 SoC. This mailbox is required for communicating with the APM 
co-processor using ACPM.

The Exynos850 mailbox operates similarly to the existing gs101 
implementation, but the register offsets and IRQ mask bits differ. 
This series abstracts these differences into platform-specific data 
structures matched via the device tree.

Also, it requires APM-to-AP mailbox clock in CMU_APM block. These
were marged already (thanks Krzysztof!) so they are dropped from
this v2.

Please also advice if mailbox change should be split out as a separate
patch.

Will be appreciated if it can be tested on gs101 to make sure that I
didn't break anything, I don't have dev gs101 devices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- dropped clock patches (they seem to be merged);
- patch 3: updated commit description mentioning that
  exynos850 is not compatible to gs101 mbox (as suggested by Krzysztof);
- fixed comment description for struct exynos_mbox_driver_data
  (reported by kernel test robot <lkp@intel.com>);
- Link to v1: https://lore.kernel.org/r/20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org

---
Alexey Klimov (3):
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox
      arm64: dts: exynos850: Add ap2apm mailbox

 .../bindings/mailbox/google,gs101-mbox.yaml        |  4 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  9 +++
 drivers/mailbox/exynos-mailbox.c                   | 67 +++++++++++++++++++++-
 3 files changed, 76 insertions(+), 4 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

