Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616417;
	b=Yq+2jL5VXgOyTYCv0prgBwYWIUqR04XRzrWDOtua23R9YlT0c/5Z0uITNyM31HFt+Xsp
	 pY3qcf9rlmCcyJgWVI1+na8XAAfAB8a68gOCQBe/KztGHPx2VMiPPwDYhiTxwQPtmMIVI
	 k7EKGZ0vEVFbsr7/YJszaR1JFkzFh65ed5lr1iruo7ac+AQXjjhMfo57f3S34h7GF4EcS
	 mrfjiCJl9+0fKsHmOGwtMZauj8oA0Fgh2sDyhsYxkkkgh6ayWz8jUB0w1dRyFRy9bwEfP
	 F2rCPYsEijaAgOi0c5jl3+zeTyOjJNZKHbAzK4hR9y7oyNAMNudRnNYJua7fJ7dCKRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616417;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QNbxn5h8QNjJDlO/0mupScqA4MSrl0V3heOJR9Pyfuo=;
	b=PmyLzPAmntQe8EykoKEW1cuqnQWpX1huFDeIV9sMCpbsnb1YN1sOg24cIuPQmsJ5nxmT
	 JO6P6iaz345vNMqz/FrxQLTJj6PDGl3+hcx3vjN4mx+6RrjimM+P/XgTmenHIzMcsRrrv
	 tM9b+TUJHvFJm7SFb847/L1lYYznPVymTDiJ4Rmy56PoiJ21dvpnizNGlbAoGhImk1OR6
	 RRi1d60iJhRKqw56bU8dnvJqYNx9tvW4VmrDYaCCEXOqnhnQO7zlvUktXD5Ls4OVwzvcQ
	 8NUX7LjcbgrHduIR972LQel0WokVckmW3nvhn/ZT41HUZSQDROUifoY7i9RwN/aJ98w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0478606A329;
	Mon,  2 Nov 2026 10:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0478606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=tYsq9oqLM+7lQixDkQIKNZ9ALsqlBAjVve+XIkTCo+JGrX3FUzK6n+179pwhUDdGT0oMGSFz4bLc4
	 bovP/6OxE8/bxIetjBHmPVji0o5ySYe9wzVHd2lON7qoLwd+CJlgzJ5vkpOtP2snhJyj7sLFjOnDBD
	 zz2MW7hnTuYO2W5I=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76ae86a0e758-8aa82;
	Mon, 02 Nov 2026 18:46:45 +0800 (CST)
X-RM-TRANSID:2ee76ae86a0e758-8aa82
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6ae86a14bfd-7b547;
	Mon, 02 Nov 2026 18:46:45 +0800 (CST)
X-RM-TRANSID:2eea6ae86a14bfd-7b547
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] drm/exynos: scaler: Fix runtime PM reference leak in scaler_commit
Date: Mon,  2 Nov 2026 18:46:42 +0800
Message-ID: <20261102104642.925-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scaler_commit() calls pm_runtime_resume_and_get(), but when the
scaler_reset() soft reset does not complete it returns -EIO directly
without dropping the reference.  On the success path the reference is
only dropped from the frame-end interrupt handler, and scaler->task
is not yet assigned on the error path, so the interrupt handler will
not drop it either.

Each failed scaler commit therefore leaks one runtime PM reference and
the scaler can never runtime suspend afterwards.

This restores the pm_runtime_put() call that was already present in
the error path before the conversion to
pm_runtime_resume_and_get().

Fixes: 445d3bed75de ("drm/exynos: use pm_runtime_resume_and_get()")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/gpu/drm/exynos/exynos_drm_scaler.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index c8a1b6b0a..dc8189685 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -372,8 +372,10 @@ static int scaler_commit(struct exynos_drm_ipp *ipp,
 	if (ret < 0)
 		return ret;
 
-	if (scaler_reset(scaler))
+	if (scaler_reset(scaler)) {
+		pm_runtime_put(scaler->dev);
 		return -EIO;
+	}
 
 	scaler->task = task;
 


