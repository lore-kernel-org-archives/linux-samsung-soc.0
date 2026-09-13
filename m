Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A2B22D785
	for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 01:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789263300; cv=none; b=kSRdxARTWHTqJ4YV63cpx2oFX4RlDLT6CVC4AdWxStQY8zG7tGmpRY9xg6tce9zI1GIM3mF8oDAdloRP4D3BpJ9fCeqkduzWEhdQ/x6W+WiVYaYG6gTkFfrYX+yquip6GfBVoFyTycS7+XkVQPaCxb74iLo1wBw0mLxNowq14Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789263300; c=relaxed/simple;
	bh=CtfAQLPmc/aaMApEpdADxsh5TlenudW5VoarEPfh7ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E+F1C098P0nqMSVsJBnla+sqFri6mRP2ZBD1wEJb4r5RTP4V0nj6amlS+VUNdjR+gCajWhQw0xWnFuyI7X3IeiEEIN3s0509zygPQm3rQWFe7Ttl7UrHi32Kl6vq4NOGe3btRu2gCEGs71QaiYf9zb5gp61sEL+BO/SY6ojAJIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtWKKhZI; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtWKKhZI"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so13909436d6.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 18:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789263298; x=1789868098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=olNBNDsUgs4Oen6UYhKmbkEp8czeJg52l/oC6o3L080=;
        b=BtWKKhZIfCYjYoSEQVQNX1/aiLr1QQauE6TREGOw0o+8G8wE5KBrAZ+4ZwP6gx1e+L
         ANOPOHoSlqeYUprgZ/mbjKf8KOyCJSr+CQW4OcSFx5++dpxS7SpoyS+/FMdF/K3S/GKB
         F/D1fDjmKRiwYrdZYhJVwd5ZhTlm5HxPULA9GcyvMKeBR1vzYYnAjzuadYU+SU2BmBHc
         a8T8rGTCHYk4IkJfPV5IsGeyzdfsjjPT02DZK4Q6pwNtL43Xvwu+vcYvfir9ryQJ76Ru
         wC4IqgZcVEEcGFlTh93Qs7DbaDkBm1q0Vzn1WclNN8jbWrl3xnBqE7NJmr0WsttG1WYt
         J80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789263298; x=1789868098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olNBNDsUgs4Oen6UYhKmbkEp8czeJg52l/oC6o3L080=;
        b=NJLUH95EENz1bxP+4PM4SwU0uKHgNWRE7FTW5E183jU/yCo7URALG/OZz5qjnhWgwK
         XjZ0bL4C99vDx+At8kr2a8osepAr3n/WNDqMBFhbpqrTC9/v6IpqTGQJpd/2pjTyNRJs
         AwIne44qZXaLoqYOfz7UVsEwICiO3qiqq8p2jwIFS0qpTmwoM1vXgezo0UbK5BjokRSa
         t3rrTew7Vv9roQB3JZTX7G4WBL0NN2yJ7H7njhfaSNbrAIeK+zdfNh8PeZUmoxP6GGEG
         rchhq6r/xg4EG5nFGtYIrsp9oFT2uSOq/PMd+c6r/Mh0OMZUImW1KLX/eQUq5C1t5Bn4
         pOoQ==
X-Forwarded-Encrypted: i=1; AKwUvByurWBgVGt/98ksLeIJP1UfVKgoaZq1qUfqNTcSGtUBptop5Fzn1PxYU0nB51R/5csrUWxjZc9OMnRUPAKsoShrsg==@vger.kernel.org
X-Gm-Message-State: AFuF++mKaDpXCeq2MyUDFahWrY6Nok2ScYP+ZAt7W50w8OFo/rQiydDo
	XAIg+jBTRmkqfJR/7lrtLJedpr9pY6Zy9YEErrBGdURYe0yfBko/R0A=
X-Gm-Gg: AYBFou3dHab+c2I5yjuttMOlDMfqKrltZK+anNCGWUYNxB1PZUtsXVcocR76YCLQg24
	H6DvU2x0ZIi28XhwO52zwloxLgLUrZr8EBjdHsUW/FCiPY9FdIzVrwfOchgkyUmIyCsXzbsY9pO
	9P/ERGINx2GiF+5TXrYT5PoPaYD0XgGWOEgh7IwcC2dPzKE+in0zp/UynJAqcziu++Aoy8pRAbt
	M4lHHGt8OvTfwX6awfj8BcsJC2l1SEX5ckcBMHUhlWw9ka8gr8Z66vDTufFwS6L+j14pmRljecx
	y4qI6/4ai62p02sV+9gKG96MmWhqUpr+TAmSxlefmx+/KAxrpML7FPjRtqmHZSuNkAjoGUbWx2X
	1EfkqbiiQZ/+Fc9h34BQzRElTDHRM6S+jp3hNcdV+jILRS0QcT0cAc9giyvPqvM8lwQ8f5g+bzE
	KsDgZes0jeO1QuE6BVQevirsfrE3MnUjdy8jLQPl19Bpwl9gtzRb/Gx0lrpbHS+fBt7WPMMXRYh
	8PiT4tYCSSp09rYJNUF8BUrcTrzyaTFhs1CZp1DPs2OC+4BnRGXMoxZriC/kb1ZQXyEKgsi/JKH
	jiO1ky9dzkBvbr27jW2OgQyt23Oclzxx2g==
X-Received: by 2002:a05:6214:1315:b0:90e:9a7c:e5a0 with SMTP id 6a1803df08f44-912120f0444mr161688246d6.17.1789263297899;
        Sat, 12 Sep 2026 18:34:57 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4920c5sm58866936d6.32.2026.09.12.18.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 18:34:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/exynos: fimc: disable LCLK during cleanup
Date: Sat, 12 Sep 2026 21:34:50 -0400
Message-ID: <20260913013450.20786-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fimc_setup_clocks() prepares and enables FIMC_CLK_LCLK after acquiring
the clocks.  The later component_add() failure path and normal remove path
only put the clock references, leaving LCLK prepared and enabled.

The runtime PM callbacks manage only FIMC_CLK_GATE, and component bind and
unbind do not change LCLK ownership.  Disable LCLK at the cleanup sites
that are reached only after fimc_setup_clocks() succeeds.  Keep the setup
failure path unchanged because it can put the clocks before LCLK has been
enabled.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: e5f8683923af ("drm/exynos: rework fimc clocks handling")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 09e33a26c..58214abb5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1362,6 +1362,7 @@ static int fimc_probe(struct platform_device *pdev)
 err_pm_dis:
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
+	clk_disable_unprepare(ctx->clocks[FIMC_CLK_LCLK]);
 	fimc_put_clocks(ctx);
 
 	return ret;
@@ -1376,6 +1377,7 @@ static void fimc_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
+	clk_disable_unprepare(ctx->clocks[FIMC_CLK_LCLK]);
 	fimc_put_clocks(ctx);
 }
 
-- 
2.47.1

