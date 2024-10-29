Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8A62071FB;
	Tue, 29 Oct 2024 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206511; cv=none; b=Gs2bSdGsyajVfhEsKYsH8PM9M/k+p/vDF6a0Z4BDlv654R7Lhacy8xDDMhH99rLpKoFG/HQj41G0xYL1kncsHodjfCBt0bUxIyZNlqHjIGk9BVJXqjK8OqVy5mSd2XdNweCCJlsYNdgry3SatYjmQ3IN7elSA12a8QaqacmMwLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206511; c=relaxed/simple;
	bh=SMDyXbB2S/Xna6nklNIq1bBj07R+0sg6UmAJM+SQqgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOUwIQf5ITslhC0L6pRx0T84GjcCI1upznt2e/JMFZ7S1zjHv04ocR98Nh+bZ5cTM7qqDXiOE+Gd4flohJDjYR5M51oALDuTSOXYv3Ro39+lg2OZpbvUrSGTkEi3fdNihDCV2kzkjbCvnpzUSNoRRk8R7wsNwWhrqMa2guYOEes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJGiwWQz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJGiwWQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F200C4CEE3;
	Tue, 29 Oct 2024 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206511;
	bh=SMDyXbB2S/Xna6nklNIq1bBj07R+0sg6UmAJM+SQqgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GJGiwWQziuAXIPGEsbIeJ67Cd8ikiouNRZJSB4eheC82PZohay8AluOa2Ue3HyJtE
	 pvZpAEvcev+b6Ypw1kLSzCZXx+oCXKts5Hbwf/AMw624tkpy7Pbfuk2n92KojPJ0dX
	 lPWwUiAPwMaQdBK4DroBjRkVqwGg2t3UUinbtC2zdeARkSRyRCAyvhldUlwc0wRhbN
	 51zxRjzqAGWxCJQhIm91Qal6QN6EPuE2zefKyf1sS0QMvXhuU4XPAhCOOChUxY6/2U
	 lPYo/+VFVOwrsbcNQBU6X43BjdcMg5tgg3l3is10WSoKOyl79a+ffyILQB89rGYWIY
	 k9tAmBr4myx8A==
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
Subject: [PATCH 07/10] clocksource/drivers/exynos_mct: Remove clockevents shutdown call on offlining
Date: Tue, 29 Oct 2024 13:54:48 +0100
Message-ID: <20241029125451.54574-8-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029125451.54574-1-frederic@kernel.org>
References: <20241029125451.54574-1-frederic@kernel.org>
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

