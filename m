Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1594604C5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706607510; cv=none; b=dy7luuxumC0nrUmRrnGKIj+BV6TSg+RnYpUdqxGcc0F0XqrjY7tMKYOjWg7fF2U0dZ2RS/LNKQundBltxTOV2yotZTtCoVDSr8eqo6GV0wbRXChTY/IF8sdcDcUxWZvgoskzLVHkVbJtrA2N5vEdC8PB59pQMSQhEEEGcDiC9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706607510; c=relaxed/simple;
	bh=IuA4mLN6900oSwbnRVrQ2gi7SLLO14ryO68RT0cNCnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=emAx0ZpNwrq6eqHjDDTi2UzoEQhuWSJ+zNZKORlLvIqoDK5JAfRriyIIanFzemqWlYNl7IdrqbCV++PRXvauwH5X/b+wNFKl45onMAE4Ec3fD6flsHC6UyDvb1f42aBstyp2d8xZEK6l0J5OtpGaLU86g2lYrLwJCq+QxwWZEZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYQSvgVu; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYQSvgVu"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55f0367b15fso2378965a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 01:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706607507; x=1707212307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HttPdQ9wtHT3O36QTysPFmeFn2Ai+flVcwvN38lZlLs=;
        b=BYQSvgVugZxNB2yblYoGsQjNr5q1/6JuhyOFlsS48z/B/dKxVZYOugf7oGIqkq09mu
         wOPQ6LHyhnnTW/7AUsrCHKQEwoCoh4yXgoXsuHYshJi2tH/V4FzfxdosIfZkKWYvxk8/
         Hab0o/nYebqVzwFivBdep44/Y2dMswEaKCoTS/fRRuHGkw/C28eMwRTL6/fNJUsa/JlQ
         dlpktPdKUv1qmTStgGTpiyHnX9HCsndq8HhYys07WBR8iTyXMl2tJRebVXULZ1VLL/T/
         9B7Odhl+aWM+24JXJUT5sGxpIYnfyRyEhsebGZ06YnjKovfttJILfdgTAxaXY0r8FpNx
         yLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706607507; x=1707212307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HttPdQ9wtHT3O36QTysPFmeFn2Ai+flVcwvN38lZlLs=;
        b=PGGn25vbGfUAgEABFGsenj3bShPeCeWtKpMIL6Pv9axQA6v2bV31EVCyl83qwRRGrv
         GVSalbAAAICYkER+6P1s8hiWctzv1BXxLvEKkQ3pu0T4EyNAWppdf/YCgipqhps8gyKC
         6SIziod5fjrXpFV7osf+l/zfQyFXDOFE/aKgy5bNFRC68ZaL5XiJFuyoeDbZxsEEW96M
         CkB+FUOaOlrXaJdgQcxB5mxrBZoawmbjhyzl8OXKPwDa4xtkr9fSY0cwPMJdSTdNgwn3
         VWL/icgOp5b89B/kH9Yqox0k0TEEpdoNMkn6ohnG8e6iif97f8fbtFnn/bwTJSsEtjq6
         85/A==
X-Gm-Message-State: AOJu0YyrOWqJjNHHu6DHY/TrljNjevsoNA7whGu/iD8V73yOtfQyS3j9
	GF2pP6RlVO0JVwfAI6v4aArjJPurdGL9lvrUxiVoCPyp7+Qpx1P/mCY3GnOA3Ho=
X-Google-Smtp-Source: AGHT+IEA6NxIu/ED4iTEyJP4pvq3EJXhitTD70xShbF+2OaIKJxva1ufNrR7WYdOyG8FHhNLevhi9w==
X-Received: by 2002:a05:6402:26ce:b0:55f:1ef6:48dc with SMTP id x14-20020a05640226ce00b0055f1ef648dcmr2575893edd.21.1706607507072;
        Tue, 30 Jan 2024 01:38:27 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b0055ef56f4575sm2281225edt.39.2024.01.30.01.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:38:26 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] gs101 oriole: peripheral block 0 (peric0) fixes
Date: Tue, 30 Jan 2024 09:36:39 +0000
Message-ID: <20240130093812.1746512-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

While working on peric1, I've noticed a few issues in the peric0 area
and these patches are the result. They should all be pretty
self-explanatory.

Cheers,
Andre'

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++-----
 drivers/clk/samsung/clk-gs101.c              |  8 +++-----
 2 files changed, 9 insertions(+), 10 deletions(-)

Changes in v2:
* new patch #6
- fix a typo in the commit messages of patches #3 and #5 (André)
- add some empty lines to commit messages (Sam)
- collect Reviewed-by: Tested-by: tags

