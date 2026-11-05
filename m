Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866054;
	b=AZtD4Pjuyp9Vd8ucNoDr0kbUtehBEZgKvte9t6snzmeuIp9lk5pm1HNGOFted+A0AfEU
	 /iuYHj3HO8peuPdoDaCdC2pTGfDTwNv8TOfIxwoRoBHRWS18tzkUjxUg/RB/pmFICxSrK
	 PRD0BKEphTu6/A3AAjGHXq3oSqfEiPHHqowaJ+DMLH0yV6031T9jNebkDTia1L8KPar5v
	 4+mdrj4NTqAGMH0N3YTrOM6cu1y4NKphsWMclh/C5NNE6ZM8l11tELn0h+B4ojf3wNGtN
	 /TYnnfdB3C4NiO9XxIe0ImIKzQYFfosnIAZFpkrR/kFkZ1sFG1radVFWHgIerUYAgKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nPodO5AP64Dsdsqfhq9Y2o6KomJ/G83kxL2GrW1whbI=;
	b=yKtOl0E0kpCknx0Kv/52oz5bkfuaF6G93JntBfhJXXDs4qxH1CVxXaW3fLtq16/bdzv9
	 KIOKVgzaGwZeAozgqcV2ET5cZbewamSwDQahVp1mjXtdKgli+Vqq+a6XMycLivI4owa5L
	 G7oAdyNQgwXMZgphMyxawRpIY4XzTCo4aN4hQS1aHW9aU3C9M6jOAvj0+0AdZTg6u94TV
	 P6Ow8EuVS1DPi0L+qzBS+YBZqvtLQFV6WdM6VJSl3W4HxfB/GF0P2cQU3Gcj904ADRtXp
	 94Xx8q7GV01LUdjIY2Rxd0Pz1VwiJdH57+PE7GNbJCcX5Hn2lzlfqKjOBiPOOK3WRFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="obgHo/27";
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1068606A31B
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 08:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1068606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=obgHo/27
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so673871a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 00:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793866053; x=1794470853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPodO5AP64Dsdsqfhq9Y2o6KomJ/G83kxL2GrW1whbI=;
        b=obgHo/27Mf33/82GloUytydDpOzpgOlb0c1XcPjktw3+jGctX+yuvBF9A9TkH5QMeC
         g25Mg9T3Xr5ASXhh0bYYjex04DAL3MOjzSwIod4Sw3ueB+rRgXAX1T2twIWGH7AQ6bFC
         CF2syxyVDo08BVyst8qbbIg6huRX6856Yzx1suzJSLCGoZHnYxXVmhkusZ8koM/i5fFl
         9GF/25kPeihmRyFBj6Z44mXq5wwaUaY92M8lOTa3EBZY8hGTtdQzE3FU4YPz4GfYUeBI
         Z42fsQB3pJLC/T/D71kt1v2fn9Oq1BArt93UhgluzvPgwzKUEq4IIaZtAgapy+ZRBRB1
         vjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866053; x=1794470853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nPodO5AP64Dsdsqfhq9Y2o6KomJ/G83kxL2GrW1whbI=;
        b=Xw4oCCxGzxoOr8JbY3ANyJQkB6tmmbDTFJ/ct/Y26talyaNLSJxUJ3ZmxYMq71cC8r
         DR05qOoVkJvw0yTV/4noi8NKflqN5jSrYwjieDnFOwe/48W4XCWvCGS3ayfy1SPWAigG
         YlPU1qTDBnfrNVytZyLQ8z7WH0kEzJMHStQwzPOhw8MWNeNVeTAvmPird3a73ENwW4Tm
         K8o19RIwyeaocV6/ErYG/bEV0zjlF4Moa6uDc76ns1kshO/sUin1rkvgbZ6ofW72XCSG
         M3Dh5woc0E4XfJtMtxsPfcEavaLkvCSoGNljHcXFaxjzTSs0BCUQZ2zZ8MbUbyrrUSZi
         jjyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+UbxyCxiEZ8q5n9nk1iSoxkcnni1UAo6p/WfN62Q4hcMnM75eb6Ik4RQvNd1t4u7yfOBV5LxHyN1x5K3zj7b3hA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+WWc21H2nFkmD4Bh7BJ8dRPKB7PKSMoriGoJbiUUwI2t/cB5rA
	OOMZQ+RkKet3TWcDeLNJ/1ts9ccSm3AhS5kc1RzI7TIuU3nDOPJDFco=
X-Gm-Gg: AYBFou3QFBboDbjwPN+oKMV6+JGIrtojePfQX6Vo/BC0h+uzr3lDlTMGE0psKNl6CZT
	k/3+lSYv2i+VyXthiRWGtHd4+WiMohgcyO4odw0loGB9M+yv84JkMcksMSuf67w5P2Q7fAz4Ta0
	rSIxpmrhTLASY3VNJk74EqFLKbqpV1dUKv5O2yEwtSoGdRdb7FUXhd1/uDJJFudgkeHtuD0DTAk
	8LeIgKse61oGZ2TbjXJhjLPZQskBXy2lV9gpyyJxc7fsREho9pNJTc2xhSBoAxtblzBT4fmIoR8
	CqTfKXAx4jX/EmQspcoxCk6v1RoGKgfU/L3WV9gyskfKGaxf2n5ztSyL4j2KH6cTvrtLsPNXHHT
	BAz2zpdLT3AiM7VB1YQo1053IxxdInVTNePtpNyMjIhwhSWH0eH14pVxd/UFtL2h1ps3sv2ohSq
	/rDLQEPiLhncoiKZtkefiIavw8tzY7lAA6iwt2krtmP0g36cA7g37BGRZfqf/YcO0RreWpPrIOK
	K4yfr8u9FTZfcJbzw0zNJgJj9uHjI5XFlnZc5F5YjWS5LKpxEDsdb5j0mmf6fJIhEaEznWiqm/G
	av5YxroS/ZUlaCdo9WY7TvRGyrZWJmFkXOUf6GIUHW0Er9RhoRlD4JsXjg==
X-Received: by 2002:a17:90b:3bd0:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b0ad59732fmr2113248a91.32.1793866053007;
        Thu, 05 Nov 2026 00:07:33 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3163383sm2689684a91.7.2026.11.05.00.07.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 00:07:32 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] drm/exynos: dpi: release the node after looking up the panel
Date: Thu,  5 Nov 2026 16:07:24 +0800
Message-ID: <rc-review-20261105-14-00955ac4adbd@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260916072012.1967169-1-vulab@iscas.ac.cn>
References: <20260916072012.1967169-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

exynos_dpi_parse_dt() acquires the remote panel node. The posted
display-timings fix releases it on that branch, but the panel lookup
path still retains it on success and failure, including deferred
probe. of_drm_find_panel() does not consume the node reference.

Put the node immediately after the lookup and clear the unused
pointer. This covers both lookup outcomes while leaving the
separate panel reference and its existing remove-time put unchanged.

Fixes: 14b6873a0198 ("drm/exynos: restore parallel output interface support")
Link: https://patchwork.kernel.org/series/1166158/
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

This is an incremental patch based on the following posted fixes:
  [PATCH 10/20] drm/exynos: dpi: Fix OF node leak in exynos_dpi_parse_dt()
  <20260916072012.1967169-1-vulab@iscas.ac.cn>

 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 92e8bbe9d35b..e98a9be0a705 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -243,6 +243,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *dev)
 
 	if (ctx->panel_node) {
 		ctx->panel = of_drm_find_panel(ctx->panel_node);
+		of_node_put(ctx->panel_node);
+		ctx->panel_node = NULL;
 		if (IS_ERR(ctx->panel))
 			return ERR_CAST(ctx->panel);
 	}

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
prerequisite-patch-id: 8f90819fd9f71f55560dc3af57c5a0bad07bc568
