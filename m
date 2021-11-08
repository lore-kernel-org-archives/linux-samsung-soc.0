Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D541C43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 10:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7529C61242
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 10:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237959AbhKHKbg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Nov 2021 05:31:36 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:34408 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237950AbhKHKbe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 05:31:34 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 8148121B03;
        Mon,  8 Nov 2021 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636367329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eXCwJP3nKtLP6aoK6DhOZgWRdtuHuI7e4M/Huhos4KE=;
        b=17+YmRL40GX5f46x3uqwIwEhhEYqLwSJAYBMccX0iVx2j8L5GiSIgpcec5Ag2hIlhXYAxV
        iNYon9cd8f46/K5r0pTWu7vMwnvIKVmUlbvN1RcEZqrixBLMVt6MV26ArB2KJA6UfOtlIM
        JxezbS5BCS17By4LPhksfiiQme7Z2Bk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636367329;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eXCwJP3nKtLP6aoK6DhOZgWRdtuHuI7e4M/Huhos4KE=;
        b=QUsSfucOeEsmG/jVSS9erx6cBxm+p/DRDb+jcqAsfz2DLziF3VFkU9hZfF3nqzIonnH2nu
        MuRcqaEu70FNZTAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3135013B37;
        Mon,  8 Nov 2021 10:28:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id KL8hC+H7iGHPHQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 10:28:49 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, oleksandr_andrushchenko@epam.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, xen-devel@lists.xenproject.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm: Update documentation and TODO of gem_prime_mmap hook
Date:   Mon,  8 Nov 2021 11:28:46 +0100
Message-Id: <20211108102846.309-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108102846.309-1-tzimmermann@suse.de>
References: <20211108102846.309-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The hook gem_prime_mmap in struct drm_driver is deprecated. Document
the new requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst | 11 -----------
 include/drm/drm_drv.h      | 11 +++++++----
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 60d1d7ee0719..6593c4c4006e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -268,17 +268,6 @@ Contact: Daniel Vetter
 
 Level: Intermediate
 
-Clean up mmap forwarding
-------------------------
-
-A lot of drivers forward gem mmap calls to dma-buf mmap for imported buffers.
-And also a lot of them forward dma-buf mmap to the gem mmap implementations.
-There's drm_gem_prime_mmap() for this now, but still needs to be rolled out.
-
-Contact: Daniel Vetter
-
-Level: Intermediate
-
 Generic fbdev defio support
 ---------------------------
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 0cd95953cdf5..a84eb4028e5b 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -345,11 +345,14 @@ struct drm_driver {
 	 * mmap hook for GEM drivers, used to implement dma-buf mmap in the
 	 * PRIME helpers.
 	 *
-	 * FIXME: There's way too much duplication going on here, and also moved
-	 * to &drm_gem_object_funcs.
+	 * This hook only exists for historical reasons. Drivers must use
+	 * drm_gem_prime_mmap() to implement it.
+	 *
+	 * FIXME: Convert all drivers to implement mmap in struct
+	 * &drm_gem_object_funcs and inline drm_gem_prime_mmap() into
+	 * its callers. This hook should be removed afterwards.
 	 */
-	int (*gem_prime_mmap)(struct drm_gem_object *obj,
-				struct vm_area_struct *vma);
+	int (*gem_prime_mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
 	/**
 	 * @dumb_create:
-- 
2.33.1

