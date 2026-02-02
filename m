Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998B33624BC
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Feb 2026 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770031961; cv=none; b=PyckG7dGs1d5+NTGqzaHEROPpamp9PHzM03swaL/vyq7c0tqFpBfwaS1G3mnbRDGvZT+H9Py8X8gXXrnlKL5zSuZ4RsW56ILzz4HXR6KXakkJBuWIrScYz5wf/Sdh/O9tafEt5PYiY0BIrFC6MZ6oQiA8pQ6lbW8gb7dcd1jgH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770031961; c=relaxed/simple;
	bh=w8UP13amm384XzZzCwddmrnWJmCBemyZWN4IAg9GFDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cP9Nd4hQsv8dm7lfE5/aGAoeoMiliJLmNncmdgj3liyS7JqAiLAeOOcGhBPdX6Tkh3XDriPMzweFpq7Zuwvj4+T4hSF9lSn9our5drY7k6O9l8OHt/xqmEcqJdugA+prDoyHvzpxq5NpGxKfa6R02oM8deEMg0Zi619O57kvOrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtHGk1xa; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtHGk1xa"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c636487ccaeso1781314a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Feb 2026 03:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770031960; x=1770636760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
        b=YtHGk1xaYtbWpOLCi3jmu8A/foZn/jeUWbLZmqCkBlb34T7IaaPAjhCg44blYLBGXW
         cSfgeANYgYc0l76MGcBIlLXpZaGBpf3vvO/haoTCykjwzvSp2N6Gs4a1ZCWLCUdcaOFu
         pabXlZ2HY+LZ8r2dObXdXKF1O0mlqvXSRYyHiLUj+83uz2803BjClYczkb7AWFrx+63b
         btVs/97NwxEMXzyCpEJzeze9+QsybarfFBene1+NWoN4fLeFjVtpUJeqRGFJAIAghs50
         l3DzKE8qzQ7oBBbKaRwZla0oD2b53A+zldo/w4zRsUBbJQylLcvtUhAsDiNCkrYs8jCU
         AgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031960; x=1770636760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
        b=K7i6xOfpjBxteAbpNwLcweRqKya3rOQ200qY7J4yItgVpxsnxngaBt5AXj8tGZbnVL
         axb0WXv/kjjOi76UuOMoWgq8IzZZbukx+gIhLFofzcz6iA0n2yG2vjFSSSAeTngazHJU
         hADKS5VG8l8lPcIXQO46Sa0s3B/M7UljEeSpUtNh1ENny5jUNN1aKPFYY8IUvVe2wbJH
         FekGEbOcyvqSwGIVOIX+3s/GsknomKYse+WDmulstMA3r1K3FG7xp2UqyA3FSyADAl5q
         6h29Mi3Zk/dOL0SjEZXTp1Qf32kd/E98mh/FkhTOIE+dsng0t/mAb7s/1uNHU3VPCVb8
         SJVg==
X-Forwarded-Encrypted: i=1; AJvYcCVnHeASWsQJR6EVGIHPASmTe2vAhRw9sS/0fTnBaUCFofQz6lCyIjJvRq4XkdzJGEQbMjhEnzIA8pQQaq3P0Hwt1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA8hbhl7xWcT9Mvy9Y3edpvEErc6WCAHwHozYg0wFGMoorZztI
	7xwj1zHucRtpxtPt9/Fum8CGKE7+f9jvWbjM51A3HnzTquhDHDBUEE6Q
X-Gm-Gg: AZuq6aIMSaOJeyNwy510HRTpeNq01DyOFmcTNzLI+PBbSN90lP757JmIuS3datAFdAV
	/9bSg6ZemFo2HMV7Hn0YXRxQQjrU+o6aK8d8gQ5mEj0XqHX+mBFCJbr+L1m+0JapgplXDHygszn
	Ir2HwhN04Z+bJj1PrMxJ9+kBYh+kRUe7Df2AIrKa8MrQHaCih+SW92V+xZDJcTXKGu9PVs2vaS+
	ZfNXYTRNMlDvLD8U1G/Ee+uKUXXQgCuSQmZwylP0CpH0cVLToswNY1zdXg0RVFLfPyPDfwCEroC
	3hvOztmmkuxeCq9u2AkEbzWPweFBDlrNH0Ay/fCeVWxDtzajEfpuzBVBfBpgOWbGrBEHt72o1dJ
	ZL3NJo978f5ZXKgJ8akMPmztGhev1QbK0vRTc3cIM7++oPIj3vjk7ECcqATKUYWkvhXZhLkkNyx
	kTiA+NDkCS2DxFufToWnzmrF6D3FvyajLMYxE7tQ==
X-Received: by 2002:a05:6a20:6a11:b0:38d:f405:709e with SMTP id adf61e73a8af0-392e01097aamr11107034637.48.1770031959822;
        Mon, 02 Feb 2026 03:32:39 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:32:39 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 0/3 v2] drm/exynos: vidi: fix various memory corruption bugs
Date: Mon,  2 Feb 2026 20:32:31 +0900
Message-Id: <20260202113234.183393-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series of patches that address several memory bugs that occur
in the Exynos Virtual Display driver.

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 11 deletions(-)
