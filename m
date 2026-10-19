Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F454FD29F;
	Mon, 19 Oct 2026 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415412; cv=none; b=p+NDu7tpTJcA/ic4hRT+AeW6+PEQziMlwabwaM/3Or73+9SQFxiPhOzpxqsI0EUjmYkmM98ymqLxU0MUNgk8wrU0aMF5GZI89K1d3nLqvQ6ar0rGmFCHSJF5unqCkxnAlCZavfDhKXfY6gohCJOQ9CbpJhGcP27VBEYLKdhyOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415412; c=relaxed/simple;
	bh=gOc2iflYEYLam0Q6VPVzut2riggPOtkaY7ftQIo1ArI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ba+LMYlVDKmY9fzSO3TazhSMaiBlfUgzAxLaS8t3AlbnptSCs3/MZEuJr6kIQuSusq6ihWheYTkOddHDaYiMx3wPJIpKxIOx28A/lBHYGIIO/QD93w+Nbcd9zCfbkHVJa8B3dRiMv2OSC1HKoGimtPV4vJAHA3Zo+lpRY4n3O9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQfP/Wu/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQfP/Wu/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E211F000C6;
	Mon, 19 Oct 2026 13:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415410;
	bh=r6PkF4bnp6I0pVDOC8OuHY00fV+VdeZIgzJShsLaxsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RQfP/Wu/5UbTHx27ISIBvQBqbCm+3a/H+6MqmbDpIiq140xxhhCuWJGpTASB78+4w
	 kwNn9qtpFHJDEYXI1WuuznYeWHwi6qUJDuK+xuyjLiqf/T6AIkMP3bB7o+MRSm1+wK
	 zswGvgjCtBlSLOaXL18WF3VB7zyutByrJF8bwxccXrT+hAE5/eJScRWeqH2V1nxScQ
	 WDbpEd086FTp+MTPhRKSz/lFlanDpF+JrGn34z2W8CJY+2zc/ObfZ8Zu7kC5Aczm0k
	 ei+/ENwXcP432E6HX02g2Vs5kOdTKyv225a5aFx/ffU5sWskf7qfJDROnF3wWnMsJ2
	 t4wr/36dYgeFA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH 22/49] clocksource/drivers/exynos_mct: Move CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:29 +0200
Message-ID: <20261019130856.49711-23-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply disables the IRQ and clears/ack the
interrupt bit on the local device. All these operations can run
concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c08ef67e3499..27e6542fb6c4 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_L2X0_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_L2X0_STARTING);
+	WARN_ON(st->state != CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

