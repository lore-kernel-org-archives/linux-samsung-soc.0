Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896326;
	b=ape/RuPJpFMZCw+f3E5YDFU0Cz+ueNoOM5f6hC2en7ElkE1+OTuZc3Yc+9+Li/3EsHPH
	 Nb2N4SWncm/Fkgn5a0vAn7nThywZMhnDrGYwfkpFUjl6UNTNc9X8o7+Nsm2ujfCO+vuux
	 VY3bp24uUHrTjzOCegDpNYgqIxofNwxK8ndGfujvkltvmYAZnJ68F51W7XJg/f2+ITXma
	 yQlYSUq2LSWMnj35Ih+dYZHkEP6tgF/MsoOGMV/zb4vrUQTIpRJpNUakDhwkqTecNkkdz
	 8zCQnMTshMF67XjlePmhJqRCNom7yhDZroZZ1AItGlPBplKDmuCht4HtKM0td7QTQ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896326;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=fKOdFqxPTEKzvgxzKitvANO1INfI8oK4AY55TJ9Pkw8=;
	b=4Y7hToEMe/SeGjqbVJmsFnluyLHTXZdj6VikHB8j6z8xxtzCNpsbKfjOS7/gbeGcUGmp
	 +4Tp143rvnobfADISv7RyP8QppgE2MIGy8HZUTja4mJgiXaTfTq0Jl03bvlDH1y8cfwMu
	 cWbJrQMWiIwKM8D+VKE4LYJqe6lcVEZ1MVaING2UdnKpfvfWbrX3p4MtykMEDIMVWq+Fj
	 DmZWvIvOodxqG6HQS/48vGpEQnj8ztff0cGBGYin3g/4I7lIvgyQezpxwwwq03vWcWxrt
	 9X9GIMUDnQ7unKVLw0v1yqGfqQrWNjBXqmcNU8ab9dpqr1J4gLtDAFZaPRoYDtxdBIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCvFhuqX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175D860726D6;
	Thu,  5 Nov 2026 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCvFhuqX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45811F0093A;
	Thu,  5 Nov 2026 16:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896325;
	bh=fKOdFqxPTEKzvgxzKitvANO1INfI8oK4AY55TJ9Pkw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YCvFhuqXIU4FSPcHWmQ2RVMW44tUODyYuQxuOf4P/aBjYjZ6i3knsvX5ty4OAbgIH
	 s/G30TS2Xfptpjc3HgDdJgxE/WiJRV3EFAEU6YjUTULojVDdDVjTtkYcvMOXZv2V7V
	 YmfZaPWm7ZfgNFteAd30ZsXRFl0zV5ILlzIo5F7VwFeA/lTz3+pUnWuokYzFuPfnhT
	 RzsfmsHLCnkwJBzAiaaYMMWQkEWNGS5b7aFMiCiLEWs7lVDU8A5PWP3MOAtZCdgkix
	 Z2tXznBmxhLg0KeztVSgFjF6/YTRyLiazVpXBb2h1aehcEsH/nVmCF5mX5OHWbolRC
	 V2sJA6082qDlQ==
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
	linux-samsung-soc@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 22/47] clocksource/drivers/exynos_mct: Move CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:20 +0100
Message-ID: <20261105163045.38862-23-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
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
index 498ff31b24cf..a4db04807aa7 100644
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

