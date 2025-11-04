Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3DF2D2488
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Nov 2025 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762255782; cv=none; b=Ozapo4rLW913LCNPLbXDMYZjy9gTVU2HloAw3gas6GXUCgWclmEHa+l36Vp4Et+LtsXCxZqRqI80GbrTY07WG2L4IibNzj42/mb4Ah/WiaCtrlQHpAaekVXCRVIqy4XEfrO+wlv1xZSja2yvddDjvX24BAbSoCqF+d0KqluwC6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762255782; c=relaxed/simple;
	bh=wyu+RYWCNS/h85oh6x6201n2b4N20mGIx1Xo71VnQMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SsKmpeM8H/FwlR8VeN/dRIXmS33ko9Pvx6bp8jC1KmYPQHOH53cxAR4i93EARQli/tLdX2oFl+6isqI2Bca1UYFO1hyk3hshFNCHSEED5/zMVI4Tro59kzb5jM9+xODlpCuSYxMQg0E+wonZIFJn6jug8taMTYsupddOJHtuDIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EsxR5tmn; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EsxR5tmn"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso5223090a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2025 03:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762255777; x=1762860577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6U30xhVv6V/OllWka10lpmVdIsxk7KF/mWNRD7vXBM=;
        b=EsxR5tmnegjb81RpjEbPmu4SumcHDqxzR7SiABr7Anwm3SazEbzGVBi3didtpzY+0N
         tWSys4MLg/s5isT40HtbMfve0nLsB6OzasXL8u0aSXjmUQlOG7pCyuRI/DVa5fgYHJFM
         4ivRYTN75OkLbgV1JpLOHoSQ9FttuTqnsBDTihdASeXk45YeSgUSmgqJ+OuVHS/jDes8
         dYCe7PH/JXkUoy+M686vWUpSggR1QJwV783pSbVFlOuosJtQw+PZsgxPr2xG5XUT3H79
         KjylqrVaz6Qxy73Yj+QZEO967cVddmcRTLiiiuXI4uMlxzb4GevbBc9dmYnFVjjtt/cB
         JD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762255777; x=1762860577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6U30xhVv6V/OllWka10lpmVdIsxk7KF/mWNRD7vXBM=;
        b=JoUwvyixi1NOm5atzXYnYLQVeAmfFKRZ9xgmH8DfMsbsv0mRoPDAaVt7HEWl2msJXO
         +7P9x5d9P1ob4N1h6ofacZns7iQ9VlE7loQdQ333eAwqoNujEQaZRqntRhXQOoSL7DUt
         b+xFuD+SN5YqRSlZnqCctEowccFTioIBTvkcAcg8SgeHgZIAbkUiP4orUt5RSNeUMrRM
         /KWQABD9RYXxsE++wodEQVMc9ZWN/F6SZRahKBMwhVi5QDIpXIw/4IefwcBKk5nKipv8
         cl74Mwi1cK6GdkT6hOOxGmsJ9fDMIQvl2scqsDPZAYJMYdgzVZJtnMG8OUEFRJlNnLSF
         gQZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuVBCanWuw1bbiQmLujxr9totU1nX8c6dXbBlhskLuJttF7OHEtcUJIM9FDMGbu9ol/XRizzq8f9hBrD4o5YPgxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIE0UXSL6xPg1w1ofxqCSRfbFR24mNqdXNnyhozZxK4ntMBi8f
	aZj4FZlgmmW4lB24tsigP6yg7/bOXXnzFTGd5a9YZJ4hkmjYSPt5bqvFPOLc9oi51fE=
X-Gm-Gg: ASbGncuS7UdtZ3LkB8KZ75rB6aFCHHvePMdZYN10N9jCjE8hB7mAklwlnffjk5JwFmp
	3B7/qjKf/sUsmUFPLJGeZXkQufiWFNOzBghGQ23eWrNv9EkiZwunDNzoTcvgaOaUZOs6Bs0RNGD
	eU0wf+X8LpOPeduH7btG85ARNGNBXio7mRGujfawcGAne1h8kWYAPfRPOoyBCATdKAjTZV2HrNX
	JZnzlB1yzrUxCiWS7+MvAhR6gKY/BXBJFAlpgErCxslHh6mirBWl+jLvT09tyUW83nvrt1pqa8y
	g2Ame/dAOy2M82zsEwI+mw/hIYtkYVORhM8SxE07eePbc6M91eeSPXCnO7yi8Yg9Qy6FF4NY5Yj
	hfEu1AbKqorHHTh5nw4JJYc86KBxytbocU7363aRlPhwAdHrrv5WcwOh3VzPAm2o4E7Vv3XJ+mm
	jJCA8=
X-Google-Smtp-Source: AGHT+IEH6YLnLzKBUaOBrPF+gt/Vwu3vr6ZVwfIBKjg5lysKKReAoUvEVvkYcdEX36hZw8BRX3tIXQ==
X-Received: by 2002:a05:6402:26d6:b0:640:a356:e78b with SMTP id 4fb4d7f45d1cf-640a356f0e2mr8579226a12.7.1762255777493;
        Tue, 04 Nov 2025 03:29:37 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e680578esm1820370a12.10.2025.11.04.03.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 03:29:37 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] drm/exynos: hdmi: replace use of system_wq with system_percpu_wq
Date: Tue,  4 Nov 2025 12:29:23 +0100
Message-ID: <20251104112923.143408-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 01813e11e6c6..8e76ac8ee4e2 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1692,7 +1692,7 @@ static irqreturn_t hdmi_irq_thread(int irq, void *arg)
 {
 	struct hdmi_context *hdata = arg;
 
-	mod_delayed_work(system_wq, &hdata->hotplug_work,
+	mod_delayed_work(system_percpu_wq, &hdata->hotplug_work,
 			msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	return IRQ_HANDLED;
-- 
2.51.1

