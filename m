Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE829377023;
	Sat,  3 Oct 2026 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015011; cv=none; b=kfrIdSDI0ClWFz24/fHZLSxofteSsQAIVi6rgSNwjc8qYIg4TbuV/rHG2DnUhcW2hrhwjOzekBIJXfVTZAXZUZuVDbba4NDobAdhut31qUxnsPYjyURY7z9UZeqJaJ4jfOEtaKsA9st4hTTNcFWl4TXRkUk1Vo/3DbD0/s2H5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015011; c=relaxed/simple;
	bh=qjEKhCqE+TQdyjHSzr+nF2KlqSaIdjbbIWUHI/erXPc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mBDExcAk34awRTks6g9l2Ex0K3xEry2xZMxVKrSNQKgywoaWuGEbs7C4nF2K+FA4wkNHHjnMjA3+kPXUh/z4sxvt1VyV3Mw/EkdY4B6QOfasmKTP7OoJC/Mx6SnMKFXcrBcYF735BImW+36D56iJ/BVQsnScjnOtFcqv5R/yx+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QQ31iLkW; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QQ31iLkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=If
	IDqJZfF08zWFt0Zzta+SmkT86Z+9Yztld18LGVYf8=; b=QQ31iLkWuxrMMLO7jZ
	pvmDiuBrzfRF7idvp/0Z83/yMUZTBKEqpikvkZuvX7GR8LFTFzzW+KX/MSTfYMMK
	kuMNas13fFH7FolzBOFKJI5fzD9mAn1HgWNVOAoMffV2ieCOalQU5cVyBF10f76/
	MXMoNSt8vkS/VxH/O6owU3tEg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDX37c4uMBqHTY2CQ--.51768S2;
	Sat, 03 Oct 2026 16:09:29 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] drm/exynos: fimd: handle runtime resume failure for DP clock
Date: Sat,  3 Oct 2026 16:09:26 +0800
Message-Id: <20261003080927.430719-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX37c4uMBqHTY2CQ--.51768S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw17GFWUGF17Cry8tF4DCFg_yoW8XrWrpF
	47JFyFkrWjq3y8KFW2yF129F98Ka17GFW8XrZ3G348uw1UAr1vq3yrCF1DtFn0vrZ7AF1j
	vrs7Ja47CF1jyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piX189UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhkHQWrAuDnOcAAA3E

fimd_dp_clock_enable() ignores runtime resume failures and still writes
the DP clock register and updates dp_clk_enabled. This can access an
unavailable device, record a state that was not applied to hardware,
and later drop a runtime PM reference that was never acquired.

Return without changing the clock state when runtime resume fails.

Fixes: 5d91394f2361 ("drm/exynos: fimd: Guard display clock control with runtime PM calls")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index b6abdc4f2b0a..ea2b961f0cbc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1049,12 +1049,18 @@ static void fimd_dp_clock_enable(struct exynos_drm_clk *clk, bool enable)
 	struct fimd_context *ctx = container_of(clk, struct fimd_context,
 						dp_clk);
 	u32 val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
+	int ret;
 
 	if (enable == ctx->dp_clk_enabled)
 		return;
 
-	if (enable)
-		pm_runtime_resume_and_get(ctx->dev);
+	if (enable) {
+		ret = pm_runtime_resume_and_get(ctx->dev);
+		if (ret < 0) {
+			dev_warn(ctx->dev, "failed to enable FIMD device: %d\n", ret);
+			return;
+		}
+	}
 
 	ctx->dp_clk_enabled = enable;
 	writel(val, ctx->regs + DP_MIE_CLKCON);
-- 
2.34.1

