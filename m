Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F9A1E04B0;
	Thu, 17 Oct 2024 16:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183861; cv=none; b=Z0ysGKsApGXpOBXfbGQJEjihlIr9WN8iV+qVUeVXWPnFMBACmtU6iFjy+K9hiKE4NHd0KH+fnxK+E24IZLqvTnm5a3qS4/JJtaixapoDyqUBlFpd+3k9gyvIWB3bD6FUFaGBbZyJ2v/OEYkHuJ0TEYd1E4CXlqJU0OimGlPLeKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183861; c=relaxed/simple;
	bh=SMDyXbB2S/Xna6nklNIq1bBj07R+0sg6UmAJM+SQqgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lrg+Tw/0QKhdPASZFdzFzJzQ9wLUE4/1lYrg+zkrYJRH4ZscOkS7iIPjpHgCcG60l9XiBdwSKsZGFiQ141sXCvRC/LDC9QnmZ1gtS1DtCuh4Ssa80/SOf5vRn5ME3nlEbngg2I60lNhctdzQCIkhasgHe4ip2cnEmeeqCvb/Y/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQJMtAwm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQJMtAwm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127E9C4CECE;
	Thu, 17 Oct 2024 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729183861;
	bh=SMDyXbB2S/Xna6nklNIq1bBj07R+0sg6UmAJM+SQqgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQJMtAwmSg5pAPwoiUin+EfrcQ7i+f7AhT7GUVcIWyAJPHfZNpsZ7G89+ihAgqnPm
	 Xh9KK69pNKuybifDjJYPnZu+hLH6l0C1iWWpOdFz9+b4KjoGpBV75fuDukL+PjhcEl
	 3vehkk6QPwrkkFG4MvGNW77ycEgOt74ZYlta+f7YPa3y7jeDdQg6StgV3Q5VkHTaem
	 SLPV4YE7vansfEhkcpzpALGakE6PAo9MGdPQpTB10RLh7w9XcgCrE5ajhXjjkiDwPE
	 rQ3hHWO0NDEI/+7UCBdIGzjmAviJCTX7becTTrR3HnzeQ5XtU7MPlu6hDEfs83Dh6W
	 J0RuBY+staWzA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 07/10] drivers/clocksource/exynos_mct: Remove clockevents shutdown call on offlining
Date: Thu, 17 Oct 2024 18:50:38 +0200
Message-ID: <20241017165041.6954-8-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241017165041.6954-1-frederic@kernel.org>
References: <20241017165041.6954-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clockevents core already detached and unregistered it at this stage.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/clocksource/exynos_mct.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index ef8cb1b71be4..e6a02e351d77 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -496,7 +496,6 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 		per_cpu_ptr(&percpu_mct_tick, cpu);
 	struct clock_event_device *evt = &mevt->evt;
 
-	evt->set_state_shutdown(evt);
 	if (mct_int_type == MCT_INT_SPI) {
 		if (evt->irq != -1)
 			disable_irq_nosync(evt->irq);
-- 
2.46.0

