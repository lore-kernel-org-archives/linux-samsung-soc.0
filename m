Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8C73DA7D9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 05:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170409; cv=none; b=ZKwT6vEkVD2Ihc6zahii6IWEEVKQoUwAdCHafhZxpO4nymmXHWFeIf+Gm9LzcNPHxW4lnDQmtgtAVW9mhtnX3NI7q5gOkUR6E4L307d5NtaHPSZ2b8oU9FhO+YBeZQLrf2ePap46oF/SeAWqpUkWRNJs1NZ3UxsMljwdl0ZHCgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170409; c=relaxed/simple;
	bh=0V9TfcF0jCfymmrv79UOCNsFP+ZBkFqnn+Tpw8wkDGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B9i6d702O1VXqtEOzmOPdd3t0wPrMLzuiUb+kHxSkIi5HuqztPq/KItpAwwzaagGJa9fN92l52eQupNvUcz4kj4wpO1id7MwO/lXWSHuOSwMQ1g3p0XaU+3+nTevo3LfKji9SQCgrXm4psuPFxKKlv3zU6SxJmylz/qbsUa20nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acg6Dy9r; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acg6Dy9r"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82746ed8cb1so607315b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 21:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170407; x=1772775207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=;
        b=acg6Dy9rYJBVhQUCyjvRLXGmF4w5MOUCphXKoDzV4l9UwgfzfJgN0FWcoR/rVExRpI
         Rz12p+1rGH3cB32IKGKQ6gcdxhx0tM6IhiZgCWrRif3kEVvZXqxMUtAYt+cZ3x0lnaNO
         3OyfYExciJdkSCXfIktIpPa7w1v/iKrssyfoKcIM9lwOvTbqheqCSBOKKRd2hM6GLrKt
         Y5FteuMBTIcA4jp9blskAynrodmVdT9oejilEd+4ZwSvYLyHJKbBn2rP1eEng7ZddaPp
         ebkFOinMqPFxnw69bklrO0BNva4QSjo+kwwcZLMN14Ha+6EyAm8OuUp2vWb1d6Zq9quy
         LhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170407; x=1772775207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=;
        b=no5kgG2Xcfgntfda5Ae6VZdZ8bOgSsONyrZ822tG4PS2MEdDyUgE0j034Ryx0pam8G
         xYTvZc577NWXQVrW1BnkOk2Sn3pZPeJcY9jRWclEXsWvcAwZzs73l1wca8PSRAePaq3W
         I1EGVoBQWdaK7fy294wgXk4dADYhMzNZR4ndLTHanLaoAzWSgKortsYsia0Or2MhIFcy
         s2zXB18fAMOn78C4nnh6U7n1fxm+ZlLyyYqkp+8dyxgIDGraCHeoCZXpcozOQ+qkJKWK
         sAg+X/YYplwrv0HIl62xn8t4VQBVM8UL4YeuuMk7G+r/jpKZeUbqyWF73XaSN5mlICTK
         9UBA==
X-Forwarded-Encrypted: i=1; AJvYcCXVTTOV1sSm8zDWH5RYOA+gsC0JNCuH4CGzXCTi/nCDESMxJUCAKP6219niyM/VgcC6lRvbk4OL1VH5wmzrV3jdLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOXQ9pRPmH+mL7ndIlCktY76MGIVWfDivKj+r+WPX/8IkDsKjj
	mkTSflSzYrRb55SPythSidpYf+mYw2yRQh4ZCLOXC78VkVqwQSVsbaJr
X-Gm-Gg: ATEYQzxiaf3tolIywj5WwwayOxFr9b6r+mEW1Jp6yui6tAMusYIPyTSsAyrcw0AKH4P
	TrhAUW7j1K1gX7kiTl0oFOapyS5MISFg2LYRbDnXo4Gn1JGm7+wW27x4kRib7MuOe9LP5O6pfQM
	Mc//6gBeqVs6Ot+2qc5MHVoNjRSzOsx9sXjIO/Gn83uowfTJQOIdGNX9MEMlLawcYi/5HqLu+lM
	0Xy/TRJnwvkA7YugDl77pvVWkL9HTW6hGfiL5uaYhmCWVdqoXjc+68B/mqCV3OH75CHCX+0MzO5
	zD8QVOCZIriCwz3frl5uxMDiFjMq+0HSOuB8M9v+xAPNBj/42xpBY9lqYwnSVQWwPfk+XKh2nsh
	fhrP3znsz/ZN2zYKjf8m5DqanBPSJV4RcwfNdwcsU/m5R5rlh7JIFcygilRd/LAmsgcUICp5BtB
	o+WJhX4r3F5DtCOBiu56fvNf3FwlrP6w0YOpOnYR8sujd03j4PNA==
X-Received: by 2002:a05:6a00:94c4:b0:823:c59:9cb0 with SMTP id d2e1a72fcca58-8274d93b0b2mr1369523b3a.1.1772170407236;
        Thu, 26 Feb 2026 21:33:27 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:33:26 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.1.y 5.15.y 5.10.y 2/3] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Fri, 27 Feb 2026 14:33:16 +0900
Message-Id: <20260227053317.426000-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227053317.426000-1-aha310510@gmail.com>
References: <20260227053317.426000-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit d4c98c077c7fb2dfdece7d605e694b5ea2665085 ]

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index d0e394397eca..576d79ebe9a8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -252,19 +252,26 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		struct edid *raw_edid;
+		struct edid edid_buf;
+		void *edid_userptr = u64_to_user_ptr(vidi->edid);
 
-		raw_edid = (struct edid *)(unsigned long)vidi->edid;
-		if (!drm_edid_is_valid(raw_edid)) {
+		if (copy_from_user(&edid_buf, edid_userptr, sizeof(struct edid)))
+			return -EFAULT;
+
+		if (!drm_edid_is_valid(&edid_buf)) {
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
-		ctx->raw_edid = drm_edid_duplicate(raw_edid);
-		if (!ctx->raw_edid) {
+
+		raw_edid = drm_edid_duplicate(&edid_buf);
+
+		if (!raw_edid) {
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "failed to allocate raw_edid.\n");
 			return -ENOMEM;
 		}
+		ctx->raw_edid = raw_edid;
 	} else {
 		/*
 		 * with connection = 0, free raw_edid
--
