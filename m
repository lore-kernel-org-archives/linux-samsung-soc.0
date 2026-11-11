Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434607;
	b=cYvVE+hk/yfvDOPulJVeo39gGOyhkwNKKofBHQKhnng5WSU/zXQ8E6n/kJ6iRcl/ZS/v
	 oZ9UqH2o+6Kz7Rsh55IKPkLMCF024qX1L18evpQRgixeaFtYh4iNtw8IHLeM1d5HFQvF7
	 rkQM53snkTP5RMjixdPFtXR0D0wRrchPaWZqATsNcfv4B0/PslUar02viGrmhVhT7Wq+M
	 rFTWMnXHyk/G2rBwOrx1HO1vXWZ6s3wfU7LRrTldyTWRbzANGJU1Jjycfk4zZdXtEit+r
	 a9nPQU/T09dG3hh6pLn/qqN2F63vJ+chPwNIPTexN5CfsWe4ibL1aw7ettfqiczNS7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sPfQCcrAfCjRkFz6L9qyGHzK9Ch2pW+l+JfxC7qRxyM=;
	b=oCHT7Cyg0c/M5eP4GGhs4Nx0BkubVlTLUOdBUaqzlu7AvODYdYRPS7ChR0nbNgCJrDpL
	 J+wYSzrT/6lu2jPKtXdg7cAGg4iOb2AVUGsUj+KqwBG9vxLpyMPzVokBK96IimusL/hQm
	 cCoIVyB/+yGHmdRHzCPKlz0sE36eFFQZAWrBWcwoFOQ9dHKCOzdpcpR+JeZwMhLu4ASNE
	 hn2/D+pio1bXir7R072TVNnQTutQPCE69VR2MKYAX6FsL8ET8AKlKRff2KGVjBBpombhD
	 v+SM6wt71eZFtm73rDZMPNs1SUrqRbM65GwZmSvKtTRutpdjQSLPzovbfJ63oWlykOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iooi1+fh;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156C6606B350
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2026 22:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 156C6606B350
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iooi1+fh
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843cf077f10so4476866a34.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2026 14:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434606; x=1795039406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPfQCcrAfCjRkFz6L9qyGHzK9Ch2pW+l+JfxC7qRxyM=;
        b=iooi1+fhTQ0aUOc32ZhKgkz1O9UNMa+zxevmLbOPBz/mEWeXMHBi2BqC1slYqP/9/j
         H7AjQat29rhFlAvCMNtz9PLEjKdAzAcOZAIexQNKZmD0Bpo5ERjr1lpFdkzHGD9Cfzhj
         98+MetX7Clz8uHu9SGiGrycott2BLCOhVtNZMS6bRmlTfTF69bhqCZGk+gWC4Ns2a9L4
         LaHllhjjqG+3SIhrH/f3n4ua40qMEOXVft4F03gTp4+5OBjnhEWCsvO9hg0VUjEGGcUW
         Yn2x89N/4He4p0X1ApEbGP0/Tu760MYi4+LV1wrXVVo83TznQ8CHL+BqBdZ9WvI9+fsR
         TgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434606; x=1795039406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPfQCcrAfCjRkFz6L9qyGHzK9Ch2pW+l+JfxC7qRxyM=;
        b=V7OUGU3s8Abw7hX+G3bsiv5nZac8SLeAE+3lCN1tbtRHYbThsKrMD2g9a8GFc7WiRD
         whx+jV/QtjA4+R5U+v07AZ/s3jrGM0jTs9huObElvryoctfBTumWIyn5rIE+2I/ILkMh
         b9lyX9025m6pInTRbJEWiQ0Z+zW45Ek3CzuMvkp49JpHAeSutyZ3YpWo9Q/KwmgQGdsn
         i4RAYXvmEfgo5Pk/5FmKC6pHZHwTb9BqIakVIfKaQTJTP3RdPTAg160BOIX7x4DZLmTb
         RLuICqfPB6W0gUwGuqmyeisVcHnU8OCwVjf8oRXSY7Rb9O4KQ38AvNoLY/SaJyN7KR0m
         fbeQ==
X-Forwarded-Encrypted: i=1; AL+hErHZmye6GqbjRRtVQzfzYgtEo2CMofnnOUSmDoI35iT6BqQGiTGNO3mN7UWN3Vj5TARF/grRwwbIwfzx1PvjdMM8mQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z96fN19H+QL6u4xT4dOpDVREmDFaOE09IcroLVsVbzyqroDATXA
	ejzec/uvzXLwTdFQVKWJ/ymOgdFgpll4kZ7N8GnhcSUE3zO8KSh9QCb/
X-Gm-Gg: AYBFou13IkQe/Gm/qaD3gPKF7SAUrwnMEnaZZ8DRkvwyJkGOV7gK7jqIO7kq04yjSGA
	wqRAfxSdB1irh1Lxpal3woo02lySCoCFCK49hkmcbuTc2BbA3znlAWXBkmj6eqDqYjR8KFE+JcV
	4+YDf+aQW6CrpepVxw1y/ap8XqgXZkrg6EN/ifTNap5otWTCnidZAxU7XwLAw4FXAZ9gIAFc1T5
	0sdEr+dj0triw96XRi8QeiKsfUSV1mQWHzJSYcOT8iIoJU+g0YJMkHVfhJ7RDRpPPgsfA3L7yeC
	e9Wa8b4h7R22Rc1jgPiUrJ89K7tJh+epsmrAA68w2LvtZwdiI1psj2RWN12uDH+VN/PktK7bUTa
	TAI8m2T8YtLI51aNDv5yaOMGU4tqDiHd/Qqui40HkyB5pUfHbYM4Ctq+dBeqA20++637ofm50ii
	yMotrvxjgzXe1F75K0DPCRcWzUIYxA9IL4kG8iKQeU18E1vQ7uWLoUB5djxg8HrfqBKNL2DQ2vY
	u09PM1i9RVOK8mvanXFFZwjrsrNK9A0IDNUTrTmcvc2QlX7SQ5gT6ptJDhfHgxB4AT0JwSwrBjr
	a1mMnB9Ko0PDFAl9GHqi8yQEG0REAZCSMi0GPUN+X1ZtIgTVy3f+pMx1W22nPLHpEeygoTP0fnW
	X+1a3UR/GhkAQgrO1NWn6BQQ0w2kL8dK5zixJV36Ak+dk81cEkSnEufgGhdhY2kSlm4sn+ZNbC/
	RY
X-Received: by 2002:a05:6830:270b:b0:822:b35a:a2c3 with SMTP id 46e09a7af769-860f25eafa0mr3652101a34.3.1794434605465;
        Wed, 11 Nov 2026 14:03:25 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8615518d641sm236715a34.21.2026.11.11.14.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:03:24 -0800 (PST)
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
Subject: [PATCH v2] drm/exynos: gsc: allocate formats as a flexible array member
Date: Wed, 11 Nov 2026 14:03:08 -0800
Message-ID: <20261111220308.12684-1-rosenp@gmail.com>
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
referenced through the gsc_context. Make it a flexible array member at
the end of the context and allocate both in one go.

Annotate it with __counted_by(num_formats) so the array accesses can be
bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use devm_kzalloc_flex()
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 4a07deeb382b..303e94df632a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -99,7 +99,6 @@ struct gsc_context {
 	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
-	struct exynos_drm_ipp_formats	*formats;
 	unsigned int			num_formats;
 
 	void __iomem	*regs;
@@ -110,6 +109,7 @@ struct gsc_context {
 	int	id;
 	int	irq;
 	bool	rotation;
+	struct exynos_drm_ipp_formats	formats[] __counted_by(num_formats);
 };
 
 /**
@@ -1222,21 +1222,19 @@ static int gsc_probe(struct platform_device *pdev)
 	struct gsc_context *ctx;
 	int num_formats, ret, i, j;
 
-	ctx = devm_kzalloc_obj(dev, *ctx);
+	num_formats = ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_formats);
+	ctx = devm_kzalloc_flex(dev, *ctx, formats, num_formats);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->num_formats = num_formats;
+	formats = ctx->formats;
+
 	driver_data = device_get_match_data(dev);
 	ctx->dev = dev;
 	ctx->num_clocks = driver_data->num_clocks;
 	ctx->clk_names = driver_data->clk_names;
 
-	/* construct formats/limits array */
-	num_formats = ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_formats);
-	formats = devm_kzalloc_objs(dev, *formats, num_formats);
-	if (!formats)
-		return -ENOMEM;
-
 	/* linear formats */
 	for (i = 0; i < ARRAY_SIZE(gsc_formats); i++) {
 		formats[i].fourcc = gsc_formats[i];
@@ -1256,9 +1254,6 @@ static int gsc_probe(struct platform_device *pdev)
 		formats[j].num_limits = driver_data->num_limits;
 	}
 
-	ctx->formats = formats;
-	ctx->num_formats = num_formats;
-
 	/* clock control */
 	for (i = 0; i < ctx->num_clocks; i++) {
 		ctx->clocks[i] = devm_clk_get(dev, ctx->clk_names[i]);
-- 
2.56.1

