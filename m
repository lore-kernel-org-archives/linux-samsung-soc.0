Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CA51E4871
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Aug 2024 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723031902; cv=none; b=DirOt9R93fmGCvHYIYH3uXePJg+QP/Zw54FkMpgYhdBfspkDs1wiOqfqmxbJ9jGbMEU/bKFD+1KFK01a/EJz87YLS0Z7hRXwGJwCDerRAGGkMBs7vQEYh7z7rNix0Fj+1bYlg2umo4JS8iKmgevDxhzOmBv76nqT8uA2fSAk74E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723031902; c=relaxed/simple;
	bh=OFBYbEbxE7IS+Qv7SDH4FfPtfE7Rg5E1zGlU0PewGMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VKPPBxujG2X/iXSTTUZ4DwKoTW5+Jf/5z9gDbGNeJBEFbpCDhbRN5yGi76gf49Hn8nhcS1Gjy6KPWIIKjJEYkHM9HqObBP/+aAxm+PSgEAxPjKqJQIvbkcr2WoD1IMLmoXwOPcRK52DwUC6204sAPQfYW6kxdMpQ0y795jhfvhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=blJDFxq/; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="blJDFxq/"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f16d2f2b68so27545101fa.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Aug 2024 04:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723031899; x=1723636699; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QvuttAjkPLAVMHVOXYUgt5mVS3UMEYPJRu5N4V28dSg=;
        b=blJDFxq/ORTmJmQPqk1w9Avq2jTyUhku4gIdJJi+XXJxTE+WrkbqWk5m27q7bQa5Dt
         sqnkZyLiIHorhiCxkxlKytI8jaXyamYmpokBPlv5mefysHB3MFdD/w1sAjGl4tf3P/5m
         7jMMMP76TbGgqufgR1hkY3kmuA0HM4Fg6sF/R0i5sc8y/hNAmBBeg1NDFnFyKtbMEgBV
         DZLYtWbbX6gBsnF8V1eqxNqR22XcZm4bu2FoL7U61Ngt7sBWq6WD+TA3xNXDI3BWEpBs
         NdY+Lf8iXGRXQvQ0FMsmQvwO42bQBsRu2Tna+Y4Z2kVJGc148ngyrZzM37D/kgtK3QtQ
         maKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723031899; x=1723636699;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QvuttAjkPLAVMHVOXYUgt5mVS3UMEYPJRu5N4V28dSg=;
        b=U3wb+2RLQ1O22nWwD21Z+COJMFaEXvPSnrOVYCaOSlhdRvesKTtQuuDXnjbuyke0IB
         6xQmDNm79mJ5Gn+EvhCQKcQC9fUOQ/Lon78LWs0PNRETvZhethjPQqyKhGBLiNTRc/Kw
         dAXrpLj2jQLkEU6Vo07WV0XQS++KxoVXAihxyPNABG18rMLfs2g6lCtp9aCRNaM7WZyi
         T31sECAoUYIOXAFmmbfuFUCL64CGxg6emYmIfSf63eIjA0lM+RISokl9BuFhr4tQLYnE
         8ScEUHnS5YdME67J8HpQUUjQUWdr1btUGD3fKMjNp33QxPtGA/EDutpNV1RiPVqrDuXa
         b5lA==
X-Forwarded-Encrypted: i=1; AJvYcCW+40BGJfkhtfVFA8mrpW0RKu0diOvf26jaq3DkRtq2rtuby9pPY20NpL7d0szyDvJyfpSzSm5iOdyJw3VuAowTf6IZPoycgIbQBuJ+xO0gcYQ=
X-Gm-Message-State: AOJu0YzLzpGFJIWtInI3BLuaSLqKopl21QpoElsl1KVrXxH0RrfXI8t3
	gHX7HESkEYHgFtMb9vBXoVvMvyicDXDDOKdQjGH8K08mvpry4v5u1TxgQJbVkAU=
X-Google-Smtp-Source: AGHT+IFMahW1ZeQ+4SdbQZtKjEpytqYR6C40gi+5yPvZkfOWWpUhdF1d4i/TPsvRGYmNl8byMwOdqg==
X-Received: by 2002:a2e:b790:0:b0:2ef:2c3c:512a with SMTP id 38308e7fff4ca-2f15ab5cce3mr148444871fa.42.1723031898236;
        Wed, 07 Aug 2024 04:58:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d45239sm631017466b.119.2024.08.07.04.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:58:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] tty: serial: samsung_tty: simple cleanups
Date: Wed, 07 Aug 2024 12:58:17 +0100
Message-Id: <20240807-samsung-tty-cleanup-v2-0-1db5afc9d41b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFlhs2YC/32NTQqDMBBGryKz7pQk/iBd9R7iYqoTHbCJJCoV8
 e5NPUCX78H3vgMiB+EIj+yAwJtE8S6BuWXQjeQGRukTg1GmULWqMNI7rm7AZdmxm5jcOqO1xLr
 UJZm6gLScA1v5XNWmTTxKXHzYr5NN/+z/3qZRIVV1n9PL5trycxJHwd99GKA9z/ML995HELcAA
 AA=
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

While looking through the samsung tty driver, I've spotted a few things that
can be simplified by removing unused function arguments and by avoiding some
duplicated variables and casting.

There are no functional changes here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- fix -Wdiscarded-qualifiers warnings
- collect tags
- Link to v1: https://lore.kernel.org/r/20240806-samsung-tty-cleanup-v1-0-a68d3abf31fe@linaro.org

---
André Draszik (2):
      tty: serial: samsung_tty: drop unused argument to irq handlers
      tty: serial: samsung_tty: cast the interrupt's void *id just once

 drivers/tty/serial/samsung_tty.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)
---
base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
change-id: 20240806-samsung-tty-cleanup-ffae1515a284

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

