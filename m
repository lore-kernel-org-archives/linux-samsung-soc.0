Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112805;
	b=l2642nJOIb24swz+F//SjIkpAnPiOtxRN9rqmxkHbJQaHSWOYotbcbegddf/bTCOS4Em
	 Gz9ZrJ3LM0oG28Bq6h358kkTq5oRl1d9pwneF8T5smc1e2+LG9iu65FDIJPwGlttsrZR4
	 lGym8NhB0ohZfCgsOQ4mQFd+HXrhvgVs72XmF4qxxMghU5sgp4VGjLdBIqNXdVESCuPFn
	 DRSXTywWkuLBmqcljHDXphU3J6MrHmJ6rFmaDsrKYfm17yppvgbJe6dVprzAxmN22bQb4
	 zQh4piOkhBxXi6NmHcgKwNvxiQRa1Duxt3gxXhEdFfS0UfdUlzbDEQCC+fJjvp4ph8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
	b=xyRSrRseEadS7FqAHBsUTdviMdDptF4pVUKkgzAxXWdrE04aDLE6MgbP3Oc++TWz4PwG
	 y4Zp7Eh0ivDDhXsZG+Ox+ZFttCch0D4aoabmbtxLvdjS7SmDMQzH6dyo0q73fmTx9eeq6
	 WpPR0GrO8mmtGgpsfsbp1QrrdtPwTaxGc3VSABBxlgSkyIPx/LcSKwOq20KWBsjS2L4ZJ
	 p5Wx66vaIpfVNJCXlj1e8hqRT8heCPCGe7Hj33gIP7WPcZqnZaCG8/h4xAlJgaDiJShsz
	 XlY63wk8HHn1+/iqDEFniwX84GQw+FVWVD4WhsxUaS8+WR5zLGm2q2jsEBZqCtMaVdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PL0uNvOF;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9B9606A31B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 14:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9B9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PL0uNvOF
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so15054a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112804; x=1793717604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
        b=PL0uNvOF6KtmytVx/LyM6gB7gFM05V7MDTXiIU/jNVGVrb8h0a4YBmqrVAgfzJYkM/
         XIIlEJw0YrfmwpzCxmxqRPuPBrSO/A+mN3FRztpVogzN5DyzY3Sq8CWDatzUvbLI2rzi
         PEoaPyAY2SHhTTr0iu4XDHOxPytwusNn66/D7hbTLGkaFvARqeP3wSVvxPrg+czWBFbi
         RvThogGY40pn9hSgBkEgfoaZM+UFVgqyOpQbxAV+BfMI+qMCM7/3D1R4tD+tval28tEb
         ebUXb/xw8hrtyeGU568eNfHW+R/Qs73nxMAMBtE4IOYI4JVt4Tzz/h41aFppjGK698YZ
         ta7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112804; x=1793717604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
        b=wm7l2UZIPoArhvGWI+S9LgQuU9mFYGpbbYne/Br0kqjD2A4ecyWZ5wbpK3LVOmj+X1
         NvCmDjbnrtOuQ6tiodkp6XM6lGhAoZFN5UoODbn/9cq8LN3IRUH4HiXu065tluGqKsZI
         70pXL0RJVDEO5wxpy/ifFMpKbJeygP4hqW9E5uJnr6RB9PR8TNTVdnBJEWzNC7Mn4LCU
         4d2JYTSwJ47Pc7Ra5d8tvufJQoZDtTC8WsX2bF1aODQZ1vzzjuFO1ah2T/v8zsskLcKj
         2lM7+Y09YewmNXa2hx508wWJps+Air7lv05Bqq70Smk6xddZsqCSRWP3H/EpHQePMf1j
         k/aA==
X-Forwarded-Encrypted: i=1; AKwUvBz30XBksAZy0eHqr1tgStsB1uurWEUNRFFE/qE/FfM8K8tAns0KC+Ocifvx3ljRReIAbOUNPShTz1GHnbDvtLmZLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLUwQN9xyRmmT6N+fKYz3mpwFgMNRJu01r7t1AOlqsSgtyZBvp9
	tV31LD0K7U9umuhQ6E3sglFEpaY46HgQUp+9Ma3pRm4hx8yvpjg+EY/q
X-Gm-Gg: AYBFou0xkqD0TOH1ZZmjXbzS6OuWILEAECpS69NwXIMTyHtESzmx5yQ2ZoiIJpVFgj8
	zLjEJktqWXnRpihWHZ++xt9+h8VS17E5GkRpRHERKX//7MnEYnKNA5cpYtob//uh+j9ktB0zOqc
	hpWetUGOaoCpnDaiK0XDHt55GXW4r+RwUa1WV1QuQ4i+8s7JdrVzuaIvNh244zbg8eGVdDLpl02
	wWQ36M9hAXGmqZJ7agyAUwo7UL1gysCVEYwYxU1ycoHIimnjWFpMeppcYn3BYNowt52mdFw7+GI
	QrhEWPLMNM8XnmAAzJuR1PnPTQcLLolg62SyEPgp10OoUJfrSLVmTpJTHG7RH5kEcLI6Svtouik
	GEEJbg1MWd3J+ehMXUC7RlaWu2rgR5/g9dMAI2IeRhbnkC01dEYkY1SXUojmR1kA5pTjJkdbJqq
	KsDCOugLAPDb/75qdJs2cFcf/KHwVL7pnyNF/RYLqdIAVloupHFNeIiDDnjq8a2H51hC3R01NtS
	EehJi2NHErxR8fVv+8dQntAsocZCRS1vjA8IV9FcGYUd5PBFKFD4Q==
X-Received: by 2002:a17:90a:b896:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3adead4dce8mr5470253a91.46.1793112804486;
        Tue, 27 Oct 2026 07:53:24 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm4093349a91.3.2026.10.27.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:53:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: exynos4-is: fix DMA memory double free
Date: Tue, 27 Oct 2026 22:53:13 +0800
Message-ID: <20261027145313.136305-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

fimc_is_alloc_cpu_memory() frees the coherent DMA buffer when its
DMA address does not satisfy the firmware alignment requirement,
but leaves is->memory.vaddr non-NULL.

Because firmware loading is asynchronous, this error path may run
after probe has returned successfully. A later remove can then
attempt to free the same DMA allocation again.

Set is->memory.vaddr to NULL after freeing the buffer so the
existing NULL check in fimc_is_free_cpu_memory() skips the
already-freed allocation.

This issue was found by our static analysis tool under development.

Fixes: db47622c13ae ("media: platform: exynos4-is: remove all references to physical addresses")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index b7d9bfedd590..9fdc352abfe4 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -346,6 +346,7 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
 			(u32)is->memory.addr);
 		dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
 				  is->memory.addr);
+		is->memory.vaddr = NULL;
 		return -EIO;
 	}
 
-- 
2.43.0

