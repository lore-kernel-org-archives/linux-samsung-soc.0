Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E4CC77B6E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Mar 2023 07:36:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjC3Hgw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Mar 2023 03:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbjC3Hgm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 03:36:42 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7B54224
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Mar 2023 00:36:41 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D9B831FE92;
        Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680161799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MEZaVpJU3qEkKtywxW07EVAjjN44se8OWxU4qiBKPog=;
        b=TsZ2FAgX82lFatsdrg4OpGVjZFrI2WU4BAYD3WaVxDs0PItqtfYTnYszKrK2k8J4tp7fwm
        Jg+GxVbED3DMwTRU2NV6fDWAqmdEMnkYwlPKHdOBqXBa4QR7U4i8MY/1K6gXTT1KkEHK8x
        OXUMDhU5ov5LyUPpAgllkihYHie656E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680161799;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MEZaVpJU3qEkKtywxW07EVAjjN44se8OWxU4qiBKPog=;
        b=uDUZexHfMT7UAHgAyGfYYHe1YY2N01EqHQ/upXChU2Lv7KrVc2Bv8rT2M7OSz/G/9rxgm9
        qRadHQTc5hIgmODQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E76F1390D;
        Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id uPtxJQc8JWQJewAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:36:39 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, javierm@redhat.com, airlied@gmail.com,
        daniel@ffwll.ch, krzysztof.kozlowski@linaro.org,
        alim.akhtar@samsung.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm/exynos: Remove fb_helper from struct exynos_drm_private
Date:   Thu, 30 Mar 2023 09:36:33 +0200
Message-Id: <20230330073635.7409-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330073635.7409-1-tzimmermann@suse.de>
References: <20230330073635.7409-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The DRM device stores a pointer to the fbdev helper. Remove struct
exynos_drm_private.fb_helper, which contains the same value. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 --
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 15 +++++----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 6ae9056e7a18..81d501efd013 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -197,8 +197,6 @@ struct drm_exynos_file_private {
  * @wait: wait an atomic commit to finish
  */
 struct exynos_drm_private {
-	struct drm_fb_helper *fb_helper;
-
 	struct device *g2d_dev;
 	struct device *dma_dev;
 	void *mapping;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index e7059850baa2..81f909cb5c9b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -137,7 +137,6 @@ static const struct drm_fb_helper_funcs exynos_drm_fb_helper_funcs = {
 
 int exynos_drm_fbdev_init(struct drm_device *dev)
 {
-	struct exynos_drm_private *private = dev->dev_private;
 	struct drm_fb_helper *helper;
 	int ret;
 
@@ -148,8 +147,6 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 	if (!helper)
 		return -ENOMEM;
 
-	private->fb_helper = helper;
-
 	drm_fb_helper_prepare(dev, helper, PREFERRED_BPP, &exynos_drm_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(dev, helper);
@@ -172,7 +169,6 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 	drm_fb_helper_fini(helper);
 err_init:
 	drm_fb_helper_unprepare(helper);
-	private->fb_helper = NULL;
 	kfree(helper);
 
 	return ret;
@@ -197,14 +193,13 @@ static void exynos_drm_fbdev_destroy(struct drm_device *dev,
 
 void exynos_drm_fbdev_fini(struct drm_device *dev)
 {
-	struct exynos_drm_private *private = dev->dev_private;
+	struct drm_fb_helper *fb_helper = dev->fb_helper;
 
-	if (!private || !private->fb_helper)
+	if (!fb_helper)
 		return;
 
-	exynos_drm_fbdev_destroy(dev, private->fb_helper);
-	drm_fb_helper_unprepare(private->fb_helper);
-	kfree(private->fb_helper);
-	private->fb_helper = NULL;
+	exynos_drm_fbdev_destroy(dev, fb_helper);
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
 }
 
-- 
2.40.0

