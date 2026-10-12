Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AD23C278A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Oct 2026 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787421; cv=none; b=cQSOTbAWkYZZMBqRniCybat8VYm+JUU+ScPS+HFcy+VKrDVF/I2GilJJj0EHbqP1scKdW/b3oqFWqZGTA31ykhMT15LmKUtJy4hyAo9MQYhwZzja0tRvZza0Vz02hGPBSnFBNUVlQg7BbicfG14HbUUeS0i8k3NDCxaF1JUSP8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787421; c=relaxed/simple;
	bh=cWOtJ9ivnPMZ4LKGhvfJGXiokJaDFTvK70vYJtRzi9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xi8ZOj8B0BwIGr+p5WjkdBJpO5uCRU0p9sbBu8vlkSgMxlOVr0odBpDm2LK17DZCTlkWq75nbv7D0x/lNZMDzCFbYZx46jlpcL2gSHwA4GvBPV4Utu9bve9LcE0aLcQokdb8u2MS10mpRFUISqsUPppvBSnMhnC3EnEe0XEphRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuN6RKof; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuN6RKof"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so9894495e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Oct 2026 23:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791787418; x=1792392218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqWEUpOcbkCEI5wu3LVItbSlVvKJOnpu9ESLF/pgJIg=;
        b=BuN6RKoftK5Li5mFdiREe/3ES/0WnCT+wADFLbHwa02V/kAkTrNASmM5iLt5nfDkmz
         NFh1fiSBlj6hQfnxAePZaIyCxMJBv0ffg931ZUNmEMmkMBq73R8tY2SYqOiSQ3kgespw
         73lGZkGDb54LX8DFja251oUBQjqY+NrmlJZxwFvNOi8iKbC4mfWjo/kDYYLoMagbPOSC
         HgMrIQI7k6DHXprHC50FqFlU1F8EAQ/rGerBKxKVOoiOcaMU8iNez1EC2vEl+hLrqQX/
         RFozBXvSEyoNy+A+Sf24cNH9JNkw9GovOk7mUa9Byxs/Nm0dOHyY4O4ZYnNHIyczywia
         NVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787418; x=1792392218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqWEUpOcbkCEI5wu3LVItbSlVvKJOnpu9ESLF/pgJIg=;
        b=HahSBhHJtKdb7OysfPxV7e4o85y1vkVthZ0+vmZNBQShZeA2lwWD+HrmYeY6njZhPv
         7hnbbFwFcueRqkyUjdQQVzxoFuKzBh3c7CfHkD1R6K2aeMboxoPBW4reXi5DxuAhRWD9
         pWDrnmUZki6my3ca5u5UT6ogtPWLkWsNQapKIAgUt9XvZllINdR2VEDE1Y8IdlAe/YhP
         iYRAebf0WiUswSLddQYHi/DdYM44aA7ezr1vdK+q/cIOn51J4LarMwHjmi5b9FBucnte
         iK0B9MZehWLJmUu21CBTh5an2jjSF8Twi2XPPQtfUKyPopRyopyus8Ocw8GlxLhdER5a
         1OsA==
X-Forwarded-Encrypted: i=1; AKwUvBy/3MwLloojJOxVsV5k23rmtLkvDTMEG60RNiqvRrLAjIBDGjrpAgzaQ3Cv1xANmtIVoIp5GJfxB7F6J4bNtauXHQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYINEHijK4O0ZQK6WWPHsD5NiJqBQJCn9J6jPzwO4aB9t4z9jQjh
	KgXm1nRp7jwuIV/cLzNZARe7hoHWfcAThASEgIkctF3pXcq+FWFIKhwK
X-Gm-Gg: AYBFou1pe8qjOz/L5AWSCOlqv2UdPiVFgIcMrklfU6qSI6849nn1ekChpUiGP2vi91U
	f8KanJhe7Z37rn/8x51+/JIMoTXqfZko4QJOYp8yS+0VgAtquglbCK6qL6RjoxXvX3M3ZjitFas
	EEKwQvJe1xP8U6D/crNrDHGCyf1DTMP+4aZ8VtEROZqf3q3lWrs7ZYUqeOqc451NeK3Q5g1vI0c
	4iqu9dsSQifRdyo4hFbzLlCwmUzDGXMS81Rpe9o4vz5VTADOHvqs7QlWEjzw2uNe+Az11Za4SMV
	jimV4JJ4bwBCow29eAIiDFc/SY8tDbg8VtJVpQeS1uTWd25TUnPSE0/TwZjdJrx2qCHmPX4XjLb
	O66URTnkwX43g9ZIVwFoPw6OqYj+7nWeR1dyx3em9ou866/FQ3Izx3a3aN17KNaaBJWTtJZKT/b
	Dp8kBGapdohlC2RbizL/WX3s0zyHp1s8efHTvcbeogCqr7eO6vbOfa63hzxZjzYEHq8qWfRfz9N
	LD7SFGumK5DYncBfXr21d8=
X-Received: by 2002:a05:600c:8218:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-4a18e49d9f5mr153991385e9.9.1791787418332;
        Sun, 11 Oct 2026 23:43:38 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:38e4:cb76:562:f06e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm499586165e9.9.2026.10.11.23.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:43:37 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] drm/exynos: hdmi: free EDID on connector update failure
Date: Mon, 12 Oct 2026 09:43:34 +0300
Message-ID: <20261012064334.3193085-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If drm_edid_connector_update() fails, hdmi_get_modes() returns
without freeing the EDID allocated by drm_edid_read_ddc(). It's
an unlikely error path but nevertheless possible and should be
cleaned up fully.

Free the EDID before returning, while keeping the existing return
value of 0.

Fixes: f6e4f57fd90dc ("drm/exynos: hdmi: convert to struct drm_edid")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index d4fce39c2b61..386557a7f5e8 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -893,8 +893,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	drm_edid = drm_edid_read_ddc(connector, hdata->ddc_adpt);
 
 	ret = drm_edid_connector_update(connector, drm_edid);
-	if (ret)
+	if (ret) {
+		drm_edid_free(drm_edid);
 		return 0;
+	}
 
 	cec_notifier_set_phys_addr(hdata->notifier, info->source_physical_address);
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

