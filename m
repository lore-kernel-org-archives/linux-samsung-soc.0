Return-Path: <SRS0=iB35=AY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2656EC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jul 2020 07:07:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9AE92075D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jul 2020 07:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="btX23yxP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgGMHHU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jul 2020 03:07:20 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34104 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgGMHHU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 03:07:20 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200713070718euoutp01493f60d7cc035ff53a8eb738d7eff9f9~hPh1bBh380056000560euoutp016
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jul 2020 07:07:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200713070718euoutp01493f60d7cc035ff53a8eb738d7eff9f9~hPh1bBh380056000560euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594624038;
        bh=hSmfiESY4gB9ib5XNiqxLH81veQgiWoipvY19BxXQgk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=btX23yxPuieoNPrhCcti7vC89QOANmzRWaXM8lIUOV5o417CMaLTZMAhORq16DTwm
         ujgJJLCLQPeFAkr5+9SjNnNFYVlJh+yp72ol/LVkbgqA7gZDY3AjsELkLqjPRyFVeY
         C2+GdRHvm8nDXSQdgM11+2qpdP+topmk0IVtQuAY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200713070718eucas1p20bca8bcf67d6d1ff0fcf4c2e1fa34cd2~hPh1M-bCA0061500615eucas1p2N;
        Mon, 13 Jul 2020 07:07:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 61.81.06318.6280C0F5; Mon, 13
        Jul 2020 08:07:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c~hPh0yGHko2232322323eucas1p25;
        Mon, 13 Jul 2020 07:07:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200713070718eusmtrp1e6bc82ef7d57f4979b8a185c4f78dd93~hPh0xXmoj0058100581eusmtrp1_;
        Mon, 13 Jul 2020 07:07:18 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-4f-5f0c0826d5f6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 94.15.06314.6280C0F5; Mon, 13
        Jul 2020 08:07:18 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200713070717eusmtip29e7b1fa936192ccad8b1714ec3926541~hPh0Uzg1A3221632216eusmtip2X;
        Mon, 13 Jul 2020 07:07:17 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2] drm/exynos: gem: Fix sparse warning
Date:   Mon, 13 Jul 2020 09:07:08 +0200
Message-Id: <20200713070708.30828-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWy7djP87pqHDzxBg8XqFjcWneO1WLjjPWs
        Fle+vmezmHR/AovFjPP7mCzWHrnLbrHi51ZGixmTX7I5cHjc7z7O5LFk2lU2j74tqxg9Pm+S
        C2CJ4rJJSc3JLEst0rdL4Mq48/8+Y8E3noorv6+yNTD+5epi5OSQEDCRuPvhFGMXIxeHkMAK
        RolHzzYwQzhfGCV6ZvZDZT4zSrzpXsYC03L9QgsrRGI5o8TVH6dY4FoWdtxnBKliEzCU6Hrb
        xQZiiwi4STQdngnWwSzwi1Gi9+g1sISwgLnE/KOLwMayCKhKPJrwE6iIg4NXwFbiRVcyxDZ5
        idUbDjBD2LfZJP7cKISwXSTurd7DCmELS7w6voUdwpaROD25B+wgCYFmRomH59ayQzg9jBKX
        m2YwQlRZS9w594sNZBmzgKbE+l36EGFHid1nHzCBhCUE+CRuvBUECTMDmZO2TWeGCPNKdLQJ
        QVSrScw6vg5u7cELl6DO9JCYM7cD7DQhgViJux/vsk9glJuFsGsBI+MqRvHU0uLc9NRi47zU
        cr3ixNzi0rx0veT83E2MwGRw+t/xrzsY9/1JOsQowMGoxMN7QY87Xog1say4MvcQowQHs5II
        r9PZ03FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY0XvYwVEkhPLEnNTk0tSC2CyTJxcEo1MF71
        Tl9p9+fsahUN87Xvj56YuOj6qqcx9bM1JnjNqtqZ90FoyRx9Thn1ZNmYHwp/JITtWNjzn+6S
        qzv13KLWJ/dS2TaOCUziyfUfisK/W6/s1V12d8ZPniW5jcv7zTse9rnLz17zN33rw/ubrXfb
        vhDvmB6dtP3/lV/nE29fKIzIOcm15+fZjtVKLMUZiYZazEXFiQB6/YDiAgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCLMWRmVeSWpSXmKPExsVy+t/xe7pqHDzxBk/OsVjcWneO1WLjjPWs
        Fle+vmezmHR/AovFjPP7mCzWHrnLbrHi51ZGixmTX7I5cHjc7z7O5LFk2lU2j74tqxg9Pm+S
        C2CJ0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mu4
        8/8+Y8E3noorv6+yNTD+5epi5OSQEDCRuH6hhRXEFhJYyijR9zUEIi4jcXJaAyuELSzx51oX
        WxcjF1DNJ0aJCe82MYEk2AQMJbregiQ4OUQEPCSavx1nByliFvjHKNF1qYsdJCEsYC4x/+gi
        FhCbRUBV4tGEn0BTOTh4BWwlXnQlQyyQl1i94QDzBEaeBYwMqxhFUkuLc9Nziw31ihNzi0vz
        0vWS83M3MQJDcNuxn5t3MF7aGHyIUYCDUYmH94Ied7wQa2JZcWXuIUYJDmYlEV6ns6fjhHhT
        EiurUovy44tKc1KLDzGaAu2eyCwlmpwPjI+8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6Ykl
        qdmpqQWpRTB9TBycUg2MiY+nHJK8pltlyO53wDpRg+nz6owLUdymbPNcDFPvcylezFnNa7RX
        5fydzqvOwf1pO3eqdu9m6r+vx/7XPedGsLGv7U2NTfxM4lG3d6i3JlTu+dw14Z9vx6EVEdWy
        Gw77+Jgn7b56+H5iLqMVR5y/Fkv3DGEXgR/Ffh9i2Thk9lz7vnHBqbVKLMUZiYZazEXFiQAT
        PNKsVwIAAA==
X-CMS-MailID: 20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c
References: <CGME20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

kvaddr element of the exynos_gem object points to a memory buffer, thus
it should not have a __iomem annotation. Then, to avoid a warning or
casting on assignment to fbi structure, the screen_buffer element of the
union should be used instead of the screen_base.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 56a2b47e1af7..5147f5929be7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -92,7 +92,7 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
 	offset = fbi->var.xoffset * fb->format->cpp[0];
 	offset += fbi->var.yoffset * fb->pitches[0];
 
-	fbi->screen_base = exynos_gem->kvaddr + offset;
+	fbi->screen_buffer = exynos_gem->kvaddr + offset;
 	fbi->screen_size = size;
 	fbi->fix.smem_len = size;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 7445748288da..74e926abeff0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -40,7 +40,7 @@ struct exynos_drm_gem {
 	unsigned int		flags;
 	unsigned long		size;
 	void			*cookie;
-	void __iomem		*kvaddr;
+	void			*kvaddr;
 	dma_addr_t		dma_addr;
 	unsigned long		dma_attrs;
 	struct sg_table		*sgt;
-- 
2.17.1

