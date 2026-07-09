Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BD531F980
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597969; cv=none; b=rvNRw2c8lghNPR7jXhlX0vZTbGZj1f8rCZRwle/6ydREJByot554exIXd2tyCSrp0NyYyXM9tnVzX6KKqYLvSeCeWK9pwOXPo808nH3Cey+NmRKhz7DeF21kZYxsqEHWv7LwTnpeIXdkEpMpqMa2ZagJbo2bsU1/fEk1Bw0eMuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597969; c=relaxed/simple;
	bh=KZCoqn1yRCF8W5hnNVKwVofUWLSDjGUyjnseBy0Bn9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRP6N6y4jpjEzknV21fFZGtkzn+tR2MFVKUWCGG8aFTTk0w9VQKSpaPX6wtgyjaj9/7rFTKg0OmsPvwQ5pvcum6ueGxfXQN+ABBcLa+lRPYU648Ap8pWqs7iW/KAvesw4G3LHhaSHYnlmEWqiT4QvHxJ7G6j8A96apaKzJoL5qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTStCIgP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTStCIgP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15501F00A3D;
	Thu,  9 Jul 2026 11:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597967;
	bh=QYjtvbYiS9lpZxH6AQgd8xcVjSJjJIx0nPSC0UpbZTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OTStCIgPJf5w1KXEb46/JyKsG+9CAOWcItE/xkp3Z5JvOR/cE6ARWZFGhpqvEcmJ6
	 ESpV3WPP2GXVInacIzu/ThP3whQl51ZNEf1cx1o5petPm5eQKnbPt1MyNTbmbDCPOJ
	 NxpwmM+b6hIrANNhAw7kuhvrMPVlncTW6OM3xR2cxZzEBdMSCPYKfRrmebO/FrA/F6
	 HOuJBvTaC6HNqhV5ns6jxAklYooRSAW05t6yF/37bu/GBCOTfHS8l9iw55d9oH6hdQ
	 veurli9IcY11CcZmtKgNHP8z69TtD4mgUwngFJ6U0l5Mzy9SJUJoYAFcxldSto25OY
	 ArYw/K6736s7w==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 09 Jul 2026 13:51:10 +0200
Subject: [PATCH 44/60] drm/exynos: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-drm-no-more-plane-reset-v1-44-302d986fe5f0@kernel.org>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 alim.akhtar@samsung.com, inki.dae@samsung.com, krzk@kernel.org, 
 kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, 
 sw0312.kim@samsung.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7333; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KZCoqn1yRCF8W5hnNVKwVofUWLSDjGUyjnseBy0Bn9Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFn+3TK/Z0m75Qv6/b56vnzSx8jQaXuuBUnk8no6h5Q8m
 qrxXTWmYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzk1D7GGt62+E3mdga1UssD
 yy5K9rps9Vj+O0v8/UdHweatL2at7jCf22MQb63E01rwbs5RR6ljjA3LFp5JyOV6qXI0TDqsWbf
 u6qMKgUsaV6VnPtqavezfpuh+5SkTL7564WD3Mnbm7V237i8DAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The plane reset implementation creates a custom state
subclass, but only initializes a pristine state without resetting any
hardware. This is equivalent to what atomic_create_state expects.
Convert to it.

The conversion was done using the following Coccinelle semantic patch:

@@
identifier funcs;
symbol drm_atomic_helper_plane_reset;
symbol drm_atomic_helper_plane_create_state;
@@

struct drm_plane_funcs funcs = {
  ...,
- .reset = drm_atomic_helper_plane_reset,
+ .atomic_create_state = drm_atomic_helper_plane_create_state,
  ...,
};

@match_struct_reset@
identifier funcs, reset_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .reset = reset_func,
    ...,
};

@reset_uses_helpers depends on match_struct_reset@
identifier match_struct_reset.reset_func;
@@

 void reset_func(...)
 {
 	<+...
(
 	__drm_atomic_helper_plane_reset(...);
|
	__drm_gem_reset_shadow_plane(...);
)
 	...+>
 }

@match_struct_destroy@
identifier funcs, destroy_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .atomic_destroy_state = destroy_func,
    ...,
};

@script:python renamed_func@
old_name << match_struct_reset.reset_func;
new_name;
@@
if old_name.endswith("_reset"):
    coccinelle.new_name = old_name.replace("_reset", "_create_state")
else:
    coccinelle.new_name = old_name

@update_struct depends on match_struct_reset && reset_uses_helpers@
identifier match_struct_reset.funcs, match_struct_reset.reset_func;
identifier renamed_func.new_name;
@@
struct drm_plane_funcs funcs = {
    ...,
-   .reset = reset_func,
+   .atomic_create_state = new_name,
    ...,
};

@drop_destroy depends on update_struct && match_struct_destroy@
identifier match_struct_reset.reset_func;
identifier match_struct_destroy.destroy_func;
identifier container_func;
identifier P;
symbol drm_atomic_helper_plane_destroy_state;
symbol __drm_atomic_helper_plane_destroy_state;
@@

 void reset_func(struct drm_plane *P)
 {
 	...
(
-	if (P->state) {
- 		<+...
(
-		drm_atomic_helper_plane_destroy_state(P, P->state);
|
-		__drm_atomic_helper_plane_destroy_state(P->state);
|
-		P->funcs->atomic_destroy_state(P, P->state);
|
-		destroy_func(P, P->state);
)
- 		...+>
- 	}
|
-	drm_WARN_ON_ONCE(P->dev, P->state);
|
-	WARN_ON(P->state);
)
 	...
(
-	kfree(P->state);
|
-	kfree(container_func(P->state));
|
 	// kfree is optional
)
(
-	P->state = NULL;
|
 	// plane->state clearing is optional
)
 	...
 }

@drop_destroy_mtk depends on update_struct@
identifier P;
symbol __drm_atomic_helper_plane_destroy_state;
symbol to_mtk_plane_state;
@@

 void mtk_plane_reset(struct drm_plane *P)
 {
 	...
-	if (P->state) {
-		__drm_atomic_helper_plane_destroy_state(P->state);
-		...
-	} else {
 		...
-	}
 	...
 }

@transform_nv50_wndw depends on update_struct@
identifier S;
@@

 void nv50_wndw_reset(...)
 {
 	...
-	if (WARN_ON(!(S = kzalloc_obj(*S))))
+	S = kzalloc_obj(*S);
+	if (WARN_ON(!S))
 		return;
 	...
 }

@transform_kzalloc depends on update_struct@
identifier match_struct_reset.reset_func;
identifier P, S;
statement ST;
statement list STL;
@@

 void reset_func(struct drm_plane *P)
 {
 	<...
 	S = kzalloc_obj(*S);
(
-	if (S)
-	{
-		STL
-	}
+	if (!S) return;
+
+	STL
|
-	if (S) ST
+	if (!S) return;
+
+	ST
)
	...>
 }

@transform_body depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier S, P;
expression PS;
@@
- void reset_func(struct drm_plane *P)
+ struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	S = kzalloc_obj(*S);
	...
(
 	if (!S) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (WARN_ON(!S)) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (S == NULL) {
 		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
)
	...
(
-	__drm_atomic_helper_plane_reset(P, PS);
+	__drm_atomic_helper_plane_state_init(PS, P);
|
-	__drm_gem_reset_shadow_plane(P, PS);
+	__drm_gem_shadow_plane_state_init(P, PS);
)
	...
}

@update_early_return depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	<+...
-	return;
+	return ERR_PTR(-EINVAL);
	...+>
}

@update_return_plane depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_atomic_helper_plane_state_init(PS, P);
	...
+
+	return PS;
}

@update_return_shadow depends on update_struct@
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_gem_shadow_plane_state_init(P, PS);
	...
+
+	return &PS->base;
}

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: alim.akhtar@samsung.com
Cc: inki.dae@samsung.com
Cc: krzk@kernel.org
Cc: kyungmin.park@samsung.com
Cc: linux-samsung-soc@vger.kernel.org
Cc: sw0312.kim@samsung.com
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 5c04ef87e400..8d859b0f7712 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -120,27 +120,23 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 			  "plane : offset_x/y(%d,%d), width/height(%d,%d)",
 			  exynos_state->crtc.x, exynos_state->crtc.y,
 			  exynos_state->crtc.w, exynos_state->crtc.h);
 }
 
-static void exynos_drm_plane_reset(struct drm_plane *plane)
+static struct drm_plane_state *exynos_drm_plane_create_state(struct drm_plane *plane)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_plane_state *exynos_state;
 
-	if (plane->state) {
-		exynos_state = to_exynos_plane_state(plane->state);
-		__drm_atomic_helper_plane_destroy_state(plane->state);
-		kfree(exynos_state);
-		plane->state = NULL;
-	}
-
 	exynos_state = kzalloc_obj(*exynos_state);
-	if (exynos_state) {
-		__drm_atomic_helper_plane_reset(plane, &exynos_state->base);
-		plane->state->zpos = exynos_plane->config->zpos;
-	}
+	if (!exynos_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_plane_state_init(&exynos_state->base, plane);
+	plane->state->zpos = exynos_plane->config->zpos;
+
+	return &exynos_state->base;
 }
 
 static struct drm_plane_state *
 exynos_drm_plane_duplicate_state(struct drm_plane *plane)
 {
@@ -167,11 +163,11 @@ static void exynos_drm_plane_destroy_state(struct drm_plane *plane,
 
 static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
 	.destroy	= drm_plane_cleanup,
-	.reset		= exynos_drm_plane_reset,
+	.atomic_create_state = exynos_drm_plane_create_state,
 	.atomic_duplicate_state = exynos_drm_plane_duplicate_state,
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
 };
 
 static int

-- 
2.54.0

