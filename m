Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760056;
	b=b6GPLUucevkOPOZiNEVvLSn6hTAamX7HwfOaxzzsLWMPN05Kzh0t68wL3j9B7cnliZCS
	 Sv+o/wlxFIDVeIi4oFg4b8wBIVjzjvSs+irKbwuUNiEl3jP69faRpyz8G27aCpY0Cg8OF
	 cK+7tenYGoFTVN3V8llnWvzN2RO7RjpSkj2BWI4OvM0wxDsAvfxW7mYT1sOZTcS2tO8xr
	 UqdhUwga4MNBmc27sJsCz0DiFQ3KVCZ+7a6oMc3VaivCoP2Qes5a3QFbkDXvoeCosdqT4
	 MJ6Lf7w3LqhS/9EWmNJc9WTra35FvJtateshlHFYMaGkDTGcw131SfPNJmAiJcbRxTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760056;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=4LVdAh7jFKz1/5D+uYBEuLTvX7Jj6VNWI0HOhAsYnms=;
	b=VnPlC4v6Tgh5lEfEM/AebpZCuE3VtGI/Zp03Ai7jObi8dLN4WDsZZ2jaTFhH/MlGIg7Q
	 gxnSuiatBDUpahjQ+w+hDnJTj72wDB/Oou2mV6y624cQ8kbanaceLYuTwpOMK/GzC5ESs
	 yLxMHS5tjlN7Q/M1TpnSYElhaxkAOPS1U8Lm79tGCDRrr4ydIsGQwMne734IsWyclmLLj
	 5tybNnyETzYLaM+zZROb4ktJbA1F41z7MG8eFHBGeoY4+rf8H4RNUu8xcLqHeIvAhz5X0
	 8opVHcDVj6WfZbrleO5hAvAGms64zoUW9UgMmzfpzu6wY1/TDevkEBwQ0X0O1EH8Gmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52357606A31B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Nov 2026 02:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52357606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADnEPswm+pq5bk+AA--.9653S2;
	Wed, 04 Nov 2026 10:40:48 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: dpi: fix panel node reference leak
Date: Wed,  4 Nov 2026 02:40:57 +0000
Message-Id: <20261104024057.1508839-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowADnEPswm+pq5bk+AA--.9653S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF18GF4UXr1ktr1kGw1UGFg_yoW8WF4UpF
	47Cry3Ary5XrW7GFy0vF1DAFyaya4IkrZa9FZ3CwnrZwn8Xr1UX3W5ZFW5KFy5AryrGFyY
	yr4DJF13A3WUCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Eb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
	AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7IU0c6pPUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwYBA2rqZFjVVAAAs+

exynos_dpi_parse_dt() stores a reference to the remote panel node
obtained with of_graph_get_remote_node(). Nothing ever drops it:
exynos_dpi_probe() only needs it to look the panel up with
of_drm_find_panel(), and the two parse error paths return without
releasing it either.

Release the reference once the panel has been looked up, and on the
error paths before returning.

Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 74d3a2bebb74..b9417529b38e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -174,12 +174,15 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 		of_node_put(np);
 
 		vm = devm_kzalloc(dev, sizeof(*ctx->vm), GFP_KERNEL);
-		if (!vm)
+		if (!vm) {
+			of_node_put(ctx->panel_node);
 			return -ENOMEM;
+		}
 
 		ret = of_get_videomode(dn, vm, 0);
 		if (ret < 0) {
 			devm_kfree(dev, vm);
+			of_node_put(ctx->panel_node);
 			return ret;
 		}
 
@@ -241,6 +244,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *dev)
 
 	if (ctx->panel_node) {
 		ctx->panel = of_drm_find_panel(ctx->panel_node);
+		of_node_put(ctx->panel_node);
+		ctx->panel_node = NULL;
 		if (IS_ERR(ctx->panel))
 			return ERR_CAST(ctx->panel);
 	}
-- 
2.34.1

