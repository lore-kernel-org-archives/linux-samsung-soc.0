Received: from msa.smtpout.orange.fr (msa-211.smtpout.orange.fr [193.252.23.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C351BDCD;
	Sun, 14 Jul 2024 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720942664; cv=none; b=B8jn2Q3G4Kt1rL5N8qfK917HXJtSlyloK7bvaTovwQqti9bRm1cVhIbgeb3jMmCXK9zsiFzBYz9UfFo+VZOqS0fT//RxKq0X21+5Wzej78Iu1lLZ6Q4FyJDUHKQoHDDQZPy3iujbSwklyQuMaRg4RasywCpZ0mEf0jlGVh+fcyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720942664; c=relaxed/simple;
	bh=nq37sIkuvaBRK/8tbljabKRjSSyojeugxyXMGAf/aa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s39m3N7+QFizIiEnUDMc9GG32PKV0usfFGyIDbUj4ju12imO7aUK7xED0pR6dw2LlOWtGqRAoZC5iPQ8t3Gwj4isXgMZut0OHI8B1GfrS6cKowD2BOUvqyuMB57KQimPyuKvpOBvFThLJRLOk51NI3RUpE9NkJX4cGQLFijTIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=AXRo7NO+; arc=none smtp.client-ip=193.252.23.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="AXRo7NO+"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id StnYsEflQwxoIStnYs4c19; Sun, 14 Jul 2024 09:37:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720942654;
	bh=JiF6rlqsmKD1wAOp9hDzYCiLWPlf9kUDYQw53qiLvCc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AXRo7NO+P0TMlGtigGCaWrJERsqN5Bf7rwQAflRz7/nSk8X/PkTiZNjlYXZBh91Bv
	 jpT1TyRE5U/s7tpIE5H62zQzEQhcdy3htE/keeZEQVgbceWylPmJwWho9DbuuniB3O
	 MsaDSfc+d46qs+srFaJO8pLwxYJcgr0hZjjIh5pgfitK/xRIeW4Q0RhhNHf1sDe7vm
	 ZlR50ahvaof+exNxkgGbcU0wTaV5HUfs9G94hkQ9gh0E11/c+LKeYvTnTGKgIDA2XP
	 NZHp/IdqMDNWnU+XbBUMnX0qfpH3Vj89RzusRSQ7W/wNaLaiUzCSha56/UhkUNYXVs
	 gwutLJ8PyeTSA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Jul 2024 09:37:34 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: Constify struct exynos_drm_ipp_funcs
Date: Sun, 14 Jul 2024 09:37:20 +0200
Message-ID: <7c4a1ca4525a1d1429c9f16ccfc6d8bf80fc2b63.1720942618.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct exynos_drm_ipp_funcs' are not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  20446	   1746	     16	  22208	   56c0	drivers/gpu/drm/exynos/exynos_drm_fimc.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  20446	   1714	     16	  22176	   56a0	drivers/gpu/drm/exynos/exynos_drm_fimc.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 142184c8c3bc..4d7ea65b7dd8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1125,7 +1125,7 @@ static void fimc_abort(struct exynos_drm_ipp *ipp,
 	}
 }
 
-static struct exynos_drm_ipp_funcs ipp_funcs = {
+static const struct exynos_drm_ipp_funcs ipp_funcs = {
 	.commit = fimc_commit,
 	.abort = fimc_abort,
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 1b111e2c3347..d80b0d1eb734 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1162,7 +1162,7 @@ static void gsc_abort(struct exynos_drm_ipp *ipp,
 	}
 }
 
-static struct exynos_drm_ipp_funcs ipp_funcs = {
+static const struct exynos_drm_ipp_funcs ipp_funcs = {
 	.commit = gsc_commit,
 	.abort = gsc_abort,
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index a9d469896824..2788105ac780 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -403,7 +403,7 @@ static int scaler_commit(struct exynos_drm_ipp *ipp,
 	return 0;
 }
 
-static struct exynos_drm_ipp_funcs ipp_funcs = {
+static const struct exynos_drm_ipp_funcs ipp_funcs = {
 	.commit = scaler_commit,
 };
 
-- 
2.45.2

