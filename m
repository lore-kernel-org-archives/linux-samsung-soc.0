Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50252C761AF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Mar 2023 07:36:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjC3Hgv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Mar 2023 03:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbjC3Hgl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 03:36:41 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC4D171E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Mar 2023 00:36:40 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 181151FE89;
        Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680161799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=ySFeAxMChdgqaB3/9bDz46byvGcT0yeTQSoZkBui9wU=;
        b=FvrvL5z0mnIjpgArU4BFEdsFV4jbyS/TK8ZGDY4KcpI4aLRYBN4c+XeOGE6gO/q5z8y3oo
        jljMrR3Q++VJ0s9Fytjt3YPFXwd6JRcM7TK60lUqdPbcenLZDBcFoBSeyedpFfD84YeEUS
        WolmAjn4ViOmUSfuPL5No63UfoWcOK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680161799;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=ySFeAxMChdgqaB3/9bDz46byvGcT0yeTQSoZkBui9wU=;
        b=1lBGykyg02W1gFkoLQxWY2NnSgr1STiliDM2I1QtcX7A0rvi9E6r0e8EVjk9fT9Jr6F20x
        30VzUzu2yDf8e8AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE09E1348E;
        Thu, 30 Mar 2023 07:36:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id hitaMQY8JWQJewAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:36:38 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, javierm@redhat.com, airlied@gmail.com,
        daniel@ffwll.ch, krzysztof.kozlowski@linaro.org,
        alim.akhtar@samsung.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm/exynos: Convert fbdev to DRM client
Date:   Thu, 30 Mar 2023 09:36:30 +0200
Message-Id: <20230330073635.7409-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert exynos' fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. As
with most other drivers' fbdev emulation, fbdev in exynos is now just
another DRM client that runs after the DRM device has been registered.

Once all drivers' fbdev emulation has been converted to struct drm_client,
we can attempt to add additional in-kernel clients. A DRM-based dmesg
log or a bootsplash are commonly mentioned. DRM can then switch easily
among the existing clients if/when required.

I did the conversion from similar experience with other drivers. But I
don't have the hardware to test this. Any testing is welcome.

Thomas Zimmermann (5):
  drm/exynos: Remove exynos_gem from struct exynos_drm_fbdev
  drm/exynos: Remove struct exynos_drm_fbdev
  drm/exynos: Remove fb_helper from struct exynos_drm_private
  drm/exynos: Initialize fbdev DRM client
  drm/exynos: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/exynos/exynos_drm_drv.c   |  13 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |   2 -
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |   2 -
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 174 +++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h |  20 +--
 5 files changed, 94 insertions(+), 117 deletions(-)

-- 
2.40.0

