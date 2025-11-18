Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBC3327783
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 02:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763434106; cv=none; b=n1XOA4+40A+DNxg367q/pqkjHW5QqfXEXCRp9ncVwGrEaR8VbZjCjC1Au6n7dEo/zew8rgFwpPs1YC+OoRoQwKePQeMWE684Vp5gQQvqjOSPC9Ihzu7bUXwMtUsewx7a5hptL+xZlqjWryu8ZCpGMPBxvE3X2T79KrgXNns1+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763434106; c=relaxed/simple;
	bh=0EsSRgGPdKQbPvgWVcWDyZRWeoYqgoHBnCEgKHLIRHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uxl+wRHcaLybrM3oGn9DDpswD/Qe9r4m0Hh9/Nnq4LkwGtrfPvYxCMoS8Lkgt31W01xItx8bOiIFAtadvVSc7Cn35xAsy+yiFsmg/RlORNrHhWRJZ02zLpxNODqqJ5ZL67jWt/Ccnor7CsI5ct2dJPrKSWPkbjKn0ytGcCwqdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XW35zg1i; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XW35zg1i"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c701097a75so2330491a34.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 18:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763434104; x=1764038904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K5Hp059A5Uei2IffQzjxZlhfXpudEyod1/uzyZ2qBEI=;
        b=XW35zg1ivNVt37cuRebuiKOIA+C96ltuzB/B2SvSHTJuZLwH2VGKAgQbFaTEcHsI5i
         E/4z9BLptZ1+aNJDNv9JyJVS7F88LlnDUBZh93Lotj+mth8xG+41F4RHCrVzkZhJoHMI
         9IGpCkH7GFuo6OrqHF9/lco7XiJYF0YUdFNFn6HxAQHpZ4tSZGO+f9NLa5EuZkJ/l2Hn
         v+nDYWup5fSnKyWK5URFkRqEgJjo0AkBy/z40wZqQ0TMT9Y5/oVZwptsamjhhnuXfDVF
         6oe73iiuH/WVRQG+Ua3nqbKGn93FBnFJ+wD7rVxfsmzv5nQjLq2P9i7xqk5r6M4ZIg8o
         0bZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434104; x=1764038904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5Hp059A5Uei2IffQzjxZlhfXpudEyod1/uzyZ2qBEI=;
        b=ZWZAt0vh71lSZhfQQYLgLnpzDUlvoSWo5+4vKkWZwRe5gYJavnTzOPYnLXTWzMLcSl
         LSEcWXCV11Ahvjk3lMp2buR6HatL4YkeBANu3iy1fICckzOF2NQnc5p2w53LNawP+6b5
         20htiBrBpUm8dkFlaxGisWbWCjdWlPdW9tgM+Y+l3B8XicJX//v227RyGCUeU0Mh1tbJ
         icnkk+zf5oh5XKw3rVLyrkwFt5g1F4Q8Hv1cNdctnZv+svWbtxNXNtLEF7Fzif9QLvGR
         MrHJZgukIyu8dNO0c5tQgIq26PN2L/qM/pE2I0VxP77rWIX4ctEB3hxtBVib4hLV6Pst
         qgEw==
X-Forwarded-Encrypted: i=1; AJvYcCWFkyuTpND/ZcAxaj1N0kuFCEtYnGmNJKlZakGRELESgH4cIYY9Cei8aEWyz3GJ7/ALUhs2F1pnbISHQrzFL+a02Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXu3Fapq5EwdN/wlPGohy2R6iW14SEsa8ZptYZz0QVxWdHT0AL
	twGp6Pm2zg+L6LpJ3QgFQbJPJGIYBIiT5Vz0fP7EbYrPJIf3Hu9zcibXICpdVljn3WE=
X-Gm-Gg: ASbGncuW7ISLLaviwVu9ySZISBPZASnRl3oIa3OPhDQGII7SV/D3crHOOFc5uMLd38/
	tmwIrht9IE7zfRA4juXz2PHbtui79At1PZM7w49IBfRjA455iEuCKgtp2yZYgAmaCLy0qzW0b4C
	x8Oj/Pn90LXRORxc0bmj2XmdbKYYB2h/H91ah2aa5AosvJKT2/PI0rqymHZKAVbejPY5QUGeKX4
	cZVRiLUmWeMEows1PvdvcEePD4woTwZ6lOZtCAKr7chFrM/JkT8O8a8sasRmvfqTj5RzB7YNVPk
	WxcDXmclK0Edvfc9VmmQUowLSfugHpkgiNay9dvVONXKedif8Q50GbbQnclqwHqsV5XvnS/zLoR
	scNco75We3bGuC4iC2Wj84ZMLHVkvdIE6IO67jFOIRqasA9zn+9RzBNIGRIa3DGZQTp4+B5Txjl
	G+oMor58Z3zQ==
X-Google-Smtp-Source: AGHT+IFhHfyQKNAmkKCUvpiYWdk49opO+ptbcr+IJLwiDT8vc7L+R3s61PznZxMlKVdQi00cNS0QsQ==
X-Received: by 2002:a05:6808:2183:b0:450:45d3:a50d with SMTP id 5614622812f47-4509746132bmr7150898b6e.30.1763434104168;
        Mon, 17 Nov 2025 18:48:24 -0800 (PST)
Received: from localhost ([2605:a601:81da:7100:264b:feff:fe59:d7f7])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-450aadd23ffsm2501610b6e.0.2025.11.17.18.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 18:48:23 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] tty: serial: samsung: Declare earlycon for Exynos850
Date: Mon, 17 Nov 2025 20:48:22 -0600
Message-ID: <20251118024822.28148-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It makes it possible to use just "earlycon" param in kernel cmdline
on Exynos850 based boards instead of "earlycon=exynos4210,0x13820000",
as described in [1]:

    When used with no options, the early console is determined by
    stdout-path property in device tree's chosen node

[1] Documentation/admin-guide/kernel-parameters.txt

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 2fb58c626daf..c1fabad6ba1f 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2830,6 +2830,8 @@ OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos4210-uart",
 			s5pv210_early_console_setup);
 OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
 			s5pv210_early_console_setup);
+OF_EARLYCON_DECLARE(exynos850, "samsung,exynos850-uart",
+			s5pv210_early_console_setup);
 
 static int __init gs101_early_console_setup(struct earlycon_device *device,
 					    const char *opt)

base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
-- 
2.47.3

