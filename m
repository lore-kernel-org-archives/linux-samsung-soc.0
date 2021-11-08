Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59BEC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 10:28:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93F6F61352
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 10:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237941AbhKHKbe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Nov 2021 05:31:34 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:34342 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237913AbhKHKbd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 05:31:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7500A21B01;
        Mon,  8 Nov 2021 10:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636367328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=/iioiyH4Q966bbevxkXK56U3XXUi7baEWWvNDv45N6I=;
        b=y2mnRHjthYiK1CtCkk4q71zzlkNuHVsebrPumY2Fu7DDVSrRnyO5GaTNtLwTi2xWYb/BSb
        Rn69kVxMfbCSXHyInCxS9JxJMQIiUWfoMW5FhckULdu7fjBZqCfQJ/lUzBzsWz9gwqMxp3
        lTFCBh6nknNSMYVqqqvdqFAhESuSw4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636367328;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=/iioiyH4Q966bbevxkXK56U3XXUi7baEWWvNDv45N6I=;
        b=EwpwY9IHQCBU7TChVkU3KtD5D8ovEskvbAZPMYTuu+tpo3oPg6W7WVj2uxGV29yONBwiA5
        uYgsfCzhBUU0XvBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D7FC13B37;
        Mon,  8 Nov 2021 10:28:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Y+crBuD7iGHPHQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 10:28:48 +0000
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
Subject: [RESEND PATCH 0/3] drm/{exynos,xen}: Implement gem_prime_mmap with drm_gem_prime_mmap()
Date:   Mon,  8 Nov 2021 11:28:43 +0100
Message-Id: <20211108102846.309-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

(Resending the patchset from [1]. Most drivers have already been updated and
only two drivers are left.)

Replace all remaining implementations of struct drm_driver.gem_prime_mmap
with use drm_gem_prime_mmap(). For each affected driver, put the mmap code
into struct drm_gem_object_funcs.mmap. With the latter change in place,
create struct file_operations via DEFINE_DRM_GEM_FOPS().

As next steps, drivers can be converted to use drm_gem_prime_mmap() and
drm_gem_mmap() (e.g., Tegra). The default mmap code in drm_gem_prime_mmap()
can be pushed into affected drivers or a helper function. The gem_prime_mmap
hook can probably be removed at some point.

[1] https://lore.kernel.org/dri-devel/20210609112012.10019-1-tzimmermann@suse.de/

Thomas Zimmermann (3):
  drm/exynox: Implement mmap as GEM object function
  drm/xen: Implement mmap as GEM object function
  drm: Update documentation and TODO of gem_prime_mmap hook

 Documentation/gpu/todo.rst                |  11 ---
 drivers/gpu/drm/exynos/exynos_drm_drv.c   |  13 +--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  20 +---
 drivers/gpu/drm/exynos/exynos_drm_gem.c   |  43 ++-------
 drivers/gpu/drm/exynos/exynos_drm_gem.h   |   5 -
 drivers/gpu/drm/xen/xen_drm_front.c       |  16 +---
 drivers/gpu/drm/xen/xen_drm_front_gem.c   | 108 +++++++++-------------
 drivers/gpu/drm/xen/xen_drm_front_gem.h   |   7 --
 include/drm/drm_drv.h                     |  11 ++-
 9 files changed, 64 insertions(+), 170 deletions(-)


base-commit: 215295e7b0a3deb2015c6d6b343b319e4f6d9a1d
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
--
2.33.1

