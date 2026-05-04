Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1304C35C185
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2026 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889750; cv=none; b=nQx6wX5Dxbkz/fVB5Iny4ZRWtGgIYVWSekGX4PsWNzIZaG/geuNaakSbTT6tS9nbwxLljKJcE2l5XPEWaS8AmXMQrHHeTxEOD2f79U0FbI06XpFOaE2edVqBDhQmXCny28RslJprSPLnd6zs0bUvsk97IUXTS9zEnpFkHwHN6ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889750; c=relaxed/simple;
	bh=oVghwXEaGFO+mpqTUByC0AmUIQGtr/LpRywd/Udsh78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f7BxTpkRm2bdac85dCJGMzAKGFuVM185EQAyIbuFP4WCtm03k/+2WcucmznOPbMh0l0yUc/xbZNfL8vbvOcdySV3ms0ydkAH8nICXHL13hBS1dxZ3FobO0jKQvPjD2Qb7vLITkgG/RVBYgEwHxCyWJ7p9acnaUTAQvzAZ/7BoE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=csElEh77; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="csElEh77"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-441209fb77eso2204224f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2026 03:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889747; x=1778494547; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXPt5HpxBahR86o/HeRzM3lfXAfvN85/ZCFAeD5ZDhk=;
        b=csElEh77xyETlfa9q9KvLEwkAMir1NeBDJYiefJHTrMwwFu18N+NJADB1KOadzXJS3
         A/l5hv1ykdP77BxbEyx45Grbg7xU9nMKiTEtBVkKp6KYrSnJNQoIMLsUzcytGWdHliYu
         Oz/f8A5U9il0Ex7VHYR1d9RWxHpo2Kchjp9x+FvywN0eaH3XPSV6WLA+cwxQ3ax8npvF
         scIrNix6TlMJ51OYsbQ+kkvhLeM4DeGGkEKzlGqkuTeCuCkUIvrgAyPVr92wl4yBFHmI
         s/F0VYltIIDFjMoUCACHrqf3Psf7vX5L5qjvj9Qv1jVK66D1n7j7MyzNHSKiIaf7ouqY
         KjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889747; x=1778494547;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXPt5HpxBahR86o/HeRzM3lfXAfvN85/ZCFAeD5ZDhk=;
        b=KyFoslcYU9ve/CpO2izbXPDln6kGJYHvJ1LC3Dv3YzywBAU/AaXW35tZEl9L63JFno
         CwiIDgiKpoULFl38XkMtJw77xgcQXXzrNA0oQmqgf82DK8BVF9lCNI0u4TBof+0g3bP+
         Hj2h+M02jDfy4U6IBbHv/4gxhomsuWnVQa2KIaYzH2p2S/wrI7cQjnT0O/0z9m5weYKn
         +mfuT9zOBobyiMwD9354ZPbRikBiFER7H6zs8dyBZOj7iaoK/vgalaxJ3WlvFJ069q6a
         NLn0ML9r63BeAseBd0SHZ8ERriEvZ1SPI2SDSLZVje4aSJZFSQBLOCZTcxbzmPhidJKq
         OyTw==
X-Forwarded-Encrypted: i=1; AFNElJ8EStlKK1N36iVPcknAP/BGAKlUcCcxBPWHDwllF4sbag/HoxcWcvDGwUSeheUQOK5RPxJX5bmEyjnDo8whgZSX7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLw8ZUmUOOKqhv6SEVFADMKUDdDuu0GB1jzMjk/ch/3E+WEX6S
	/t4R7hGANc/V/VGdaPNWn7nuyqnuQyklF1V3pVCjZ/brmlVVS74TXnbAVs6x2bJeLf8=
X-Gm-Gg: AeBDiet1f4o0KghT3dDr+6COurnErkklfur1ZZvxCHmNrpup0GzPKmvBL02lJOk05zx
	h2KVlCPQxf6J7BGM5RTMvHI1WEQCPEYdPK4F7E4YIzLnTXtqqcWpY79AzV0G6xIEbkx3eor0yjt
	8pVIF8sOMAryoGNWjMRW4Ij9qJBxkx5S8YI4yZWpWVuQ+v4/K6bsqGp4Y5SNYlck0yxaucBuWIx
	iwwrl5jJxwlCBuh6L4bSkMsqm7hRmzYWeAJrZLv+zIVGHZqCSvc/XFobCOyrRenzLbXjYPLfHen
	z/dSq1xjjsQhj+a+ziB6Wl7SHfM7WTO7gpnXVc/1DFRWdFc3rFtXI78cLyGP/jKOypx9VH+r7SZ
	CR08zzrlZ2fqf1V4Lc1N/z4nJEhzyQf8o49F7nXOSkfRDEBcI+zDn3LMe+nrlh16l8hw/fOGY3P
	3d4/vzmJkbEba+N0Dv4LvmPhmTIDPsRgBL44LEOfiTLDCRgBnTLHxQn210ysC8aHUQA6B1v1my9
	t4raOmWKnMVNPkfPA==
X-Received: by 2002:a05:6000:288e:b0:444:2db8:d07a with SMTP id ffacd0b85a97d-44bb34e62b4mr14894990f8f.3.1777889747455;
        Mon, 04 May 2026 03:15:47 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:47 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/7] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
Date: Mon, 04 May 2026 10:15:43 +0000
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM9x+GkC/43NwQ6CMAyA4VcxOzuzlcGYJ9/DeBiswKIyspFFQ
 3h3ByeMCfH4N+3XiQT0FgM5HybiMdpgXZ9CHA+k7nTfIrUmNQEGBROQUV0PT9rYFwYadOjs3VG
 Pg/NjoBqhrAo0eV5ykoDB47qY7q+31J0No/Pv9Vfky/QvNnLKKACXlVRMQY6Xh+21dyfnW7K4E
 baW3LUgWbxpSoNKaKXkj5VtLbVrZckSsm6k0BVT2nxZ8zx/ALcAwh5dAQAA
X-Change-ID: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=3432;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=oVghwXEaGFO+mpqTUByC0AmUIQGtr/LpRywd/Udsh78=;
 b=voi8crt+8GfhFajHco5uShZAg9TtsMgq7FvCTHws0Ox4uzv85b6/H/AKZ9OX/bnVGCNmN/026
 WSvQjnVhGfODLDt/Z2xQYjglqoL157mZFKileoL4u1DzIBywuhNloqf
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Fixes for concurrency and memory ordering bugs that were identified by
the Sashiko review tool when proposing the GS101 ACPM TMU addition.

While these bugs are genuine flaws, we haven't hit them yet, likely
because we don't have enough ACPM clients upstreamed to trigger the
race conditions.

These fixes can go in either at the -rc phase or as regular patches for
the next merge window. If the latter, we'll need a dedicated branch, as
these patches, together with the other ACPM thermal preparatory patches
will be needed by the upcoming GS101 ACPM thermal driver.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v4:
- Drop the SRAM boundary checks patch, incomplete band-aid.
- Split the concurrency and memory ordering into dedicated logical
  patches. It involved reordering of the last patches to avoid
  modifying the same code twice.
- Add a missing memory barrier in acpm_get_rx() to prevent weakly
  ordered CPUs from advancing the hardware RX pointer before the
  payload reads have completed.
- Fix a false-timeout race in the polling path by decoupling the
  polling thread from the global allocator bitmap.
- Use test_and_set_bit_lock. address dependency was not enforced
  when using the plain non-atomic read with find_next_zero_bit().
- Fix kernel doc.
- Link to v3: https://lore.kernel.org/r/20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org

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
Tudor Ambarus (7):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
      firmware: samsung: acpm: Add memory barrier before advancing RX pointer
      firmware: samsung: acpm: Fix false timeouts in polling path
      firmware: samsung: acpm: Fix missing LKMM barriers in RX and TX paths
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 119 ++++++++++++++++-----
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   3 +-
 3 files changed, 96 insertions(+), 29 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

