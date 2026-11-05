Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892654;
	b=1/bmXZ6DPUYzseSCOLYhiZkLFd36/iA7q3OhUEhiv+3YDmvV8CGkZsdHmowd8Iq5ip6b
	 23vK3YWUewhz3k6yOy+DSDGQQdl+5ktBKzDyTigSCd8AckdHNG2MIN/nE+xb5jAZXPqCn
	 fnn48IeYw0p+vgOGdGU4KHOJIC70CZmPsZ7koEy5TULmH485igP/+9ju9EKOKEoBwxtLi
	 BS+gtdFOVBbDDH1+Wb7i+jtipUtrM1ROTUCW5cVXnlDELSkWXldwA5JNaYHZEM2U9BwqR
	 CV3bCChHDSlNCqC2V6oQdSlqaWrItAfiPgananj2ZWskGDjhg3Fr+wxgMHAlQwjhhqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892654;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5JvB2ydpptjaMj8QshoeAxf3lBoJixgqnk8wciF6FqM=;
	b=sPuwIwIQs0we8LhcY7JiGvKcdRQk3hF5ceGrbxfAGcXjLDCM7gGlr2AaIhOMXWrIjwx6
	 590Kq5v3pXLzzQOH8yo3u+cBCgMyqfwfsp8YhZTP0X2MNlXTiN1IUUkw527PlMxUMFsh1
	 bJwTVhp6m5Ookr/BiXW2vs0I6+1IeTSh5bjS8FhIGfWdc3kxiSqc6RGVgfIGJRtM0x9s1
	 KrL39MM1kzkLPk462oKvavbWSAOqnPBmP0tDUwxzG3qh6jFHk4/mU157EY+ygwPs87263
	 e70IiJsfFHpoM4AUSZp4XOnsHm727B5sgm8v6v9g/Hl/zSyRlepbYfiE5msj7pdnstQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWCwZKVj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C068606EEAF
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWCwZKVj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431181F000C1;
	Thu,  5 Nov 2026 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892653;
	bh=5JvB2ydpptjaMj8QshoeAxf3lBoJixgqnk8wciF6FqM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eWCwZKVjCaLyLC6ekkUL3Zwgi+M9I4XsSrXLJL0wF5h/PBd4zBbzuRHkAqlkFBBqs
	 ezOex7GeIx44FIxyWnLBkLJ0+4xGtrB/1zU4rWFf7A5ni3nLQIoxRUV0vP73OegeI1
	 7GRgJlFi4AkCv34LRcqGcyokzZAqrjlObKYUQE4xqJmMpIA2lHhfMa24qVABmN2jT/
	 Ljr1odXCqiekPlhnPim4aZK2DE0EAsfd3ulQVRmX7w2PaS6BGyDei9iGE45yfutij3
	 gS46HZeP1quhP0zZ5a1gFjcczX+/ERzvQMWRK77hzJauRO3cFDtKekjX5asquYGRHt
	 33WTZGTufZnfg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:20 +0100
Subject: [PATCH RESEND 11/83] drm/exynos: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-drm-no-more-config-reset-v1-11-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Z6m5CWSEDN1ecRivxCANA95r2bovAvjS1vdylUnQooA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFjzq3GqVnlLrXTqlslbX8Wn/rG4JO4ljzffn3y7XF
 /CY/VOiYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkaT5jnUpjk8b9gKfbgnzj
 49hrpaY83e0dXpq1bDofG8O2R+9Ypga3POdhkbwS75HXabRt9s0kxvo6hoVdk4sv6b8QP37+BZP
 rxJy8d0JaSxh7rDPvF6q8mld1+93/4zNaf1wUOPvl9qev/k0A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 9ee30086879f..712e5ac86f50 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -278,5 +278,7 @@ static int exynos_drm_bind(struct device *dev)
 		goto err_unbind_all;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		goto err_unbind_all;
 
 	/* init kms poll for handling hpd */

-- 
2.55.0

