Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B050622D7AD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 16:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742575281; cv=none; b=hsxTyH7p5Itfutq+QsC5U4JaIwmuZAUcRN8G3eYP0U4W+k7DLzQ0r1nBl1g5imciEwigUADjXhSsgri1VdMsFGi/Hi+gqaFsRJ1rjlyP7iT+WbNme4Bm12WkZxl85JU3k2q8AZGF2qQ5qzpc4MFYb8WNIP2/FI4asbaZjS/9EWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742575281; c=relaxed/simple;
	bh=bkMwgOdDKThxS1Ispd/jVtTHqHiO70yLIJOqvzWYhE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BUtg4dXRAsi5WMaWyMn09WrZscMWS5BW+1FEZeGvyMny2laMibpnCT8SnST6JqC9sJP7EEJCZ4lWmGTNPPR4i9Xfwi/eY8oeR6yLi09MV4drTgqQOB1mPCZJrRLdlYyU4tM8tukncrTQnWN/hrfBsfF2625QxJ/8mIouH9i4m/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rtuzh/M7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rtuzh/M7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso374985066b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 09:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575278; x=1743180078; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/7lbrLsVGX6maQoBKXKGK0v/L55Iip7Mn2w3HMZN6Ds=;
        b=rtuzh/M7LbT2FrWQ1o0cvgtItLQAW0CugZdMBCoAg+vxKeGypF6Ah3b2Qr6qYwarmz
         D/wCe3vOuSqIRGhMkHfdrVH8u06zMTiBQ8/kAGFNQZfqmtRd/IbGcRq48S4L5KzdsELu
         WGphS0xYoURpPZI79wiGO1uzUJGai9f77l76P1I3ZmUOr0fQBiG5M61a5oSgF7hXHta2
         eGU4wnNqAAB3HO4byRLqzPgeP8/4lWaGdBPOXiwTzQ4nRLYitDOE9/ZRfwsZoUvLGlXf
         g/4NkulLQoSz8VOwh6IsvY+5j3/HZRRwbEmF0u06KgfTIzMOb+5GWvZfLkk3ixIqeMyX
         sjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575278; x=1743180078;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7lbrLsVGX6maQoBKXKGK0v/L55Iip7Mn2w3HMZN6Ds=;
        b=F3MYhvPr7IBfJ2Ex0i/+08MNn87BgxURaj8mgfbUUbJd8S5wrefr+IN1FOT3huGdo8
         fec9qQl6O4n7DoNaOAgSPo3/V6fxBtvw3KBas8D9F6AhNK3JPdwJKJwt5HyZHi648/+U
         9xoJ8ucGcTJvHJE73CmGIdAsuWvHzSXu8WlnwGyYkxC7G2Fka6hjPRqZsEh2OgfVVqTF
         Pyhy57vRBhkQyKDv7st2h1tJlwYuu7nrAgfF+86ReXoPdwOWS42Zi76eFCOImheYk9Sj
         ooI4pA5lDjqPhqdQjyTGP5+FdqKH2GZ+Z8/ZEMXH6V5XPKvBVU62xTJq80QCrLMBxxY8
         ZBgA==
X-Forwarded-Encrypted: i=1; AJvYcCV+5RIhSv8vfx9mA/8gUBww2VDw3lxWPiNUuVQitAw8QN3JwRYL/rQs0TKeEtR/pFjtMQ6Lm3/bohs+dlvsG9jWaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4/dHmlhuqpQ8y1OAi38raykild4bV6p2G3HEzPHohDMro2+RB
	nhxnX9J6/QIh6jbszJfndDfOHz584zQPL+1YQCsP2e5OfTLezthaN2P7jvqUPMOEQxkfYeoVDxh
	l3o4=
X-Gm-Gg: ASbGncsGIB5OHVDEQr8KaW8EPArV3cqPqHuFx5VwPhAN+vEiIP5gfQ6WzmspGweeq81
	rzSRN7RsKuwZicoB0xsOywaEvcIEnxMRbVujSyG6xiKKdNhre0Mbo9DKrGtqXDJyC5eBhEh7YRs
	FaCVfC4YxVNfUnVyV2mnoiJccc+exX5mBfmcOKOkOtx+5HjwlYgYlG7+m2CvwhQB+YLURha1wSR
	N6lWKqrvO+MGGGu5/3/EarRQ8ZL54KwsQKeEoSVSBBRKzVyMrNq6807Tb9vaPQUVt/1Vm4xn9N5
	pxrKCIB8M+KKpSXgDJFHrvBrVcW4U3a4516GYh3+eXHV0ZN6kqTCb09U4N4RmtXwUsiFa8ZAIK6
	v7hBgTO4hI097DZGjAJWj9nhWasM0
X-Google-Smtp-Source: AGHT+IHh8NWOl362k+c3d40t/J+WkLnIig/7cGdwwswOV+7z2+Wk0kA3DxuBF3HLDuyvLxlH3NNKMw==
X-Received: by 2002:a17:907:ec0d:b0:ac2:972c:f732 with SMTP id a640c23a62f3a-ac3f22b13eemr457901366b.33.1742575277903;
        Fri, 21 Mar 2025 09:41:17 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdc78esm184015666b.134.2025.03.21.09.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:41:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] firmware: exynos-acpm: allow use during system
 shutdown
Date: Fri, 21 Mar 2025 16:40:56 +0000
Message-Id: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJiW3WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyND3cTkglzdxJL83MxkXQNjY3Nz0yQDU8PUNCWgjoKi1LTMCrBp0bG
 1tQAfgEpcXQAAAA==
X-Change-ID: 20250321-acpm-atomic-033775b051ef
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

One user of this ACPM driver is a PMIC driver that needs to communicate
with the PMIC during late system shutdown and at that time we are not
allowed to sleep anymore.

This series address this by switching the code to using udelay() in the
specific case of system shutdown. This approach was inspired by I2C's
i2c_in_atomic_xfer_mode(), which has to deal with a similar corner
case.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      firmware: exynos-acpm: use ktime APIs for timeout detection
      firmware: exynos-acpm: allow use during system shutdown

 drivers/firmware/samsung/exynos-acpm.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)
---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250321-acpm-atomic-033775b051ef

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

