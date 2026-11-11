Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434502;
	b=J483aZnB10/PhzQk9oq9pPtUAC27Vn2iX9+zRbRUPuyJ+bLtvvA13L5HXlOml3PVMID5
	 8OFyo8WsRCcBsTHulPR4c/1gcurI3JWd7jiGSBRA+JwyQWMlJP616DnNgLESmcqbVqFSn
	 MyeZ9z776FVTRas1fSaT0MNo1rMnb1vGKgrUuYsNNA5I5B27kdeNYNYHkaTBiW8iK8GZL
	 fsJv7OCgJrY92FHbGNbSxDSL0hO037HLcMaJUert1KpAUABYJb/vz3B5VZvQ74FrnFgsj
	 ShfMNy7L44NTqIAcxUr+vOd+7tM8QVUlaYzxv6PLmhKdNgDoUh2g5WmwJ9GwO22LGQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LOO2h5QK8CfY8Gg/3IS9sOkN8AMCYlWmi2Pn5OTG2Oo=;
	b=yY10SNncFIg/Dsm2an6E9nqrtzqN1vHQDbtozuvLupFBx+WhseVwDLeFrrYXaP16+bCJ
	 dam2i0SZoc+sPBXVyYww9DjXiOBr6rjA5ZXalzDHP09az49zBZQABQDY5BfZsLzCGtTVu
	 ANGZzv1iVUrWuXWkbaQRrCR2ju2Fo44X+MRkrTxQrvF+BVkkmb8Vtse7P7FCVqwblMqV5
	 M4sfjyyJJIRIU/CIqa2FaFAimA4QHhsBjKmNme5AgO31ihVgeD842UvDQly/C8LG3mhsd
	 yqaE3rYqXhTHCHMRq2QOvaXbZwnaI5zyjt55UWMDO4vPkgHHEFncEfir7lkMB9Mi5aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yP81/8gz";
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4366D60A5BD3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2026 22:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4366D60A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yP81/8gz
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6aa9606ddadso2101624eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2026 14:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434501; x=1795039301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOO2h5QK8CfY8Gg/3IS9sOkN8AMCYlWmi2Pn5OTG2Oo=;
        b=yP81/8gzn1Ll3IwuLCMoEbwPV0nMk1P0BANs+bgr5w90XkSeiq9vbfukn2+cw0IvPw
         BELqNQ/UghmV3vPpfIY8uKZTgtrVbFpFkqvuwLbl4B39z1o4mvXXvXHXaX3xYTjqfuUG
         mnFO6bx6foH0Is6jPiOc8vt0FWnJfcsvqwWjoaycm002osiIlKozAjH5bDuNMVpk2i36
         ZKOquwGqNrRDElTVfKSsv5qNhdEKrOxkDeN0B4q6wTQo1JzJCCbtVdLyqjZXiFINhoY3
         lZMcZnlzozw93HATT0hdeTPHF6qmMfm9P9J0qG0s87Dai2dmov4rGZOMxhx6gRoRlWDA
         ekMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434501; x=1795039301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOO2h5QK8CfY8Gg/3IS9sOkN8AMCYlWmi2Pn5OTG2Oo=;
        b=YSMw6WIfmYUc2s2N/iKEw2cRBARH+V4oNEKKBz8+vuor1Y64hfdVK1R6FCRCeI0g0l
         mWgHEMX4vA+BGL1fsEsAq4T7mgO6akXtBVZDUhTQxUSS4DeEaXbvZhH87Hnq0y5Sh/co
         ZsWikYSfPhUYruec1ZPmeniGougDJTfiHks2f14g0h4UXWS9ihE6rs4zcMSxwUN0x/t+
         8LoXeHztkTOla6h9zeqHFu8+u0IfrDE/1PfyqSqQIe5fYVifk1NlJ2RQ2+/0z+4WMENu
         TSZdugQygIutbNRQvoNIbgIeqFM46uw7EF+ba/TnLULjLPcyHv2QDDZt59N3tqiML8tf
         6qXg==
X-Forwarded-Encrypted: i=1; AL+hErE1v9SMXk4kKc7DWrpdj1NqpOXvFOrTn14NhJ1Ja/m1ZBOSNBvACKCl983GLjCisUdgaZFl2UsItc/mkN7Vt1G/3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ADaus64GwMu1nKxxwMlJ60jvPqMmhLp0DwBdDKGwDI85YoLdD
	gjPkSPW9ZK7XqqXRRkWWQYSBMUBt9GUTkVYYRy6tZnZ/ulmzaYtOO31+
X-Gm-Gg: AYBFou0mu4Vxp/3bZ1A6Yb129MoBCPOtrn1tGn0Srn+3sgvWtwmFgtopkneAjkDN4WC
	wEfYlqZe1PSRinhGa10FHLlk4XVL8HZ132bzFvIFo40VXpucYBaL0GhllEA4kOy5UUvK1hRA8uv
	DbtPfT6wNlsPsOJPceQHQXM8n6MWOjgXF4c9M/6gF1gdfZp9qkkxLs52CDC2jYvmqPYZ/+zoP3v
	m/qSvpr+YSuw4Z5XUqH7QjZCkJiVkDKAoIr1UsU87K88MGFP95OZMSBIkkYZHPv/FqJ4WvgLW5s
	Zm/JbrFP8kvCZQfNr1d34DAzhrArQsfHrizO6DRsURdcIoZhuXmZSu1Nro0tWSAOPC5dYQG2u1L
	qoYFdeXrKVFWPn8ByyMJJbTh22heh3Nh/YU5J6G2VZPXSn6l0il1cW1SwRBX3RTJHDLEWpIrAQm
	iTka+elNZm3sGR22YgIsocBG57Vo1IOLC6oYY0A9xp5SBhM16biRfTkJ6w4Tc3dKmTsGdpnhmBE
	+t30AN4Pro8wEUfsqe+xKoj8OkxsYRk/Vejo7k9xTykD9M6rIM4Nf+KytpqVr12UUXXpciOhpx3
	MxuwxE8ZDJpSKQH6lsts8Gto7KEuNh9wCtZnOslKOvOpMz89cfABf0nql/CtsYgxqE9gB7ReXWM
	lSmhAINL5qQULNvQm341KlZRfF26migTP2ShJPya4upqwpqTueXIAXGnW1kd5ebZcw8+OQLRkZM
	Hyrw==
X-Received: by 2002:a05:6820:1ca8:b0:717:866:abef with SMTP id 006d021491bc7-7191789058bmr2582841eaf.34.1794434501099;
        Wed, 11 Nov 2026 14:01:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c5csm4206140fac.16.2026.11.11.14.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:01:39 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Kees Cook <kees@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] drm/exynos: fimc: allocate formats as a flexible array member
Date: Wed, 11 Nov 2026 14:01:29 -0800
Message-ID: <20261111220129.12128-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The formats array is allocated separately with devm_kcalloc() and only
referenced through the fimc_context. Make it a flexible array member at
the end of the context and allocate both in one go.

Annotate it with __counted_by(num_formats) so the array accesses can be
bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use devm_kzalloc_flex().
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 9c2ad95799ee..9233cd3b2f04 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -99,7 +99,6 @@ struct fimc_context {
 	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
-	struct exynos_drm_ipp_formats	*formats;
 	unsigned int			num_formats;
 
 	void __iomem	*regs;
@@ -108,6 +107,7 @@ struct fimc_context {
 	struct fimc_scaler	sc;
 	int	id;
 	int	irq;
+	struct exynos_drm_ipp_formats	formats[] __counted_by(num_formats);
 };
 
 static u32 fimc_read(struct fimc_context *ctx, u32 reg)
@@ -1273,19 +1273,16 @@ static int fimc_probe(struct platform_device *pdev)
 	if (exynos_drm_check_fimc_device(dev) != 0)
 		return -ENODEV;
 
-	ctx = devm_kzalloc_obj(dev, *ctx);
+	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
+	ctx = devm_kzalloc_flex(dev,*ctx, formats, num_formats);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->num_formats = num_formats;
+	formats = ctx->formats;
 	ctx->dev = dev;
 	ctx->id = of_alias_get_id(dev->of_node, "fimc");
 
-	/* construct formats/limits array */
-	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
-	formats = devm_kzalloc_objs(dev, *formats, num_formats);
-	if (!formats)
-		return -ENOMEM;
-
 	/* linear formats */
 	if (ctx->id < 3) {
 		limits = fimc_4210_limits_v1;
@@ -1319,9 +1316,6 @@ static int fimc_probe(struct platform_device *pdev)
 		formats[j].num_limits = num_limits;
 	}
 
-	ctx->formats = formats;
-	ctx->num_formats = num_formats;
-
 	/* resource memory */
 	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->regs))
-- 
2.56.1

