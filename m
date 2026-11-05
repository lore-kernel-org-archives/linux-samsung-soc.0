Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887725;
	b=IZ0pLU2NAtsCcM16MTPAHNQzm38BnJfgtwKFhUfYxz2fjeTCOI+4M254gMSe3KCyUETf
	 vdJHk/UA7l/skrVO+P6X5W5TpLS57aA3GBfI/zJfZZ4G8IaSdRRNxI4VxpTw0ntIKinWV
	 f15x9Elhe8uFgd4wmavbAkjjq6XNoopmYxcjGXGMqpQpFY47fioamHQguuOYBa3QaaEXn
	 Z7ISzzteAZSGtROlj84wpXLAuuk8WWgpCWd5CFBzCLMkimRIMoqdaDNsDqlEa0yH+3S23
	 iBXOEKWrl7vN1CwntEzQ+nJ4FQqNO5IacPaXsxAfyG640EFH+PA0WT+EH33Li8Os52Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887725;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5JvB2ydpptjaMj8QshoeAxf3lBoJixgqnk8wciF6FqM=;
	b=DXBfloJWdJtIpphwvz0HjZSCQFR20fRLgwyRhPZ3YNOU1QU/3Qplk6KfWW8DEF/reWi0
	 7W+pzPUir4lZvwPzAWkvqvSNUvaW3qJe4LuNtpk8O7+gPVm1v4DsEdWGaEIJ8KrSDUSc0
	 ssspp7sBQgFr2+zm7tW1t0dHNqayLHb6bNarqhxVv0o00dh7Co+aUFCpTkB6UbS5IxdBd
	 Ohi/9trCkpOUruuImRd9jPltHYGNR8XYaCajipP244o/HhaOtiZRExt/Ss9hCT0RUozh/
	 Oq0VGOsbYv1q18ISuueTrBbXiEU1yWCpLW8biaA3qdKKW+SalpAwwUi5U1YOvI/M75A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2fP9sVl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C9A606A31B
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2fP9sVl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0021F000C1;
	Thu,  5 Nov 2026 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887724;
	bh=5JvB2ydpptjaMj8QshoeAxf3lBoJixgqnk8wciF6FqM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H2fP9sVlCndmMtGoEgEKaA4gWvSrbGnT0xoCm2sqg8pbwaoDcY+t77dRUeHJ1THsl
	 8IhUKUrqv+5Hb2GtCXXDBHMnwirF1vMnlcD+M1hQRdFzV3DPSwpVw53j0pVB3hVGlA
	 qqXLF40fdaXML9w/mekixXr6LhegcYBgUFwebcbmnvskpuOYZaOPIkZYxlq5MTPvQN
	 f8Cn0ZV/Y4NBcHzvvZe5iNOWCr0RrHBIgtaWMpNx1aSdmaz34eNY18yE2/yPh1/aas
	 45hC5MeZHa8QFezdq1YWuZU7CflU4X323rL9xYfhpFsOOG5VjK/vrv8GTm1tbobwCi
	 TQbvEdWV6gZmw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:28 +0100
Subject: [PATCH 11/83] drm/exynos: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-11-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Z6m5CWSEDN1ecRivxCANA95r2bovAvjS1vdylUnQooA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvehccu7A5mJmbTfXK5cN7FiTvdNq03Hlnaq7mVH2r8
 n+Or3NPdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJiOUz1oqsjXsq0DUp78LV
 v7/a4rtlm+I0PzUxeO/qco8yOcW7Z+futn12jyfL7KuxeXQiKM7SjrFhx0z2wNssMx9dsXmjec0
 okTWDryRotWbD3lMfTiv+3XPw+hx9Di4Z/5BAzyMn7r550/IFAA==
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

