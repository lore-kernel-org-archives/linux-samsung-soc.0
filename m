Return-Path: <SRS0=l8hj=AT=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6ACC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Jul 2020 15:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02DF120720
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Jul 2020 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594223068;
	bh=LNiLAZUBeUzQmxzaDeI4EkEX9Ch+UJWdsulMeVHPu94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=AN6xGgGVTJM8iR1Bro1yMDyEArhiUwIVv0Wva7NHv+Yr27PtliL6tjW7cUDqSV865
	 cyebKLht5uDQR08tWQPNebNMaKhKtpJrJfJexrw71gDvHJQWg3DmHSwEIJ3RrKBSS1
	 ChMVqvL40ld4MdKtT2QQGpgFICL4lguGUjyRes64=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbgGHPlZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Jul 2020 11:41:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:47814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730395AbgGHPlY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 11:41:24 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FB38206DF;
        Wed,  8 Jul 2020 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594222884;
        bh=LNiLAZUBeUzQmxzaDeI4EkEX9Ch+UJWdsulMeVHPu94=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AFotQp3oqnVJ/P3qjSi8XENPGxD2Q1iIfStNJfl4lPJyXHt7L2UApwdqyDUXCL7qp
         3crLU/dQYnDDbnXpE1cjE6AWf69D4jEaNrkUynCVJEZON8wjfL+6SOFZTH1W+SAuID
         Py9U7s8WC+lWWp3E0jbHiw6cpM5wz6xW/vuQFwWU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        Inki Dae <inki.dae@samsung.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 05/30] drm/exynos: fix ref count leak in mic_pre_enable
Date:   Wed,  8 Jul 2020 11:40:51 -0400
Message-Id: <20200708154116.3199728-5-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200708154116.3199728-1-sashal@kernel.org>
References: <20200708154116.3199728-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Navid Emamdoost <navid.emamdoost@gmail.com>

[ Upstream commit d4f5a095daf0d25f0b385e1ef26338608433a4c5 ]

in mic_pre_enable, pm_runtime_get_sync is called which
increments the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index f41d75923557a..004110c5ded42 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -269,8 +269,10 @@ static void mic_pre_enable(struct drm_bridge *bridge)
 		goto unlock;
 
 	ret = pm_runtime_get_sync(mic->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(mic->dev);
 		goto unlock;
+	}
 
 	mic_set_path(mic, 1);
 
-- 
2.25.1

