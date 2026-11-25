Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645441;
	b=g6JiC+yEBVPqCbV4DHyQmzc0vfH/xoLYS/AoTiTs1EMT3uiA0fAwB3r3my4PMYy+4Wuj
	 XUvCOrhq5Ws6Vw6eobMmrm9gwZkBPMPB+hhojFjSqEcVAnoXzEl9VRzV6F58kdV/EUGVe
	 O/DfPI8iSKh3Fgmm/TjG7EjoW2PuKE3C6pI1+ARTpDEXQHK3GrVRr0MtuP5A4g6RMwiOt
	 qxWII++Dgq92hQ07A3iPpyYFubym/zeHo4KIM6gezMFP69wv0u6+eJW3018LlD5NlMt97
	 oWfQdicpzvhhau9gDI+R5ZzdudMIVkoq6faypqZbpA/jfQfKJDNTuS4KNEG1ClBM3WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645441;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VgTb4TX8hzSCfpylfGvwRlsr4/jJFplNoBwpIYBpwfY=;
	b=BY/CPnd2LzIAivYGndxFKNjx475BstvVaWwKqUB4VuArCf8XLqKKegam0/kNA0AUMR4s
	 J7vpJ/O9vqrUMDdjAVVr2A1PJOX7MsgJq6mZeiWIxnKL/HscOyOSzB36kzX7LYEHA7eri
	 fJb53D/Un1ZQ31GfQNnKjjkleTn9y+VyEGf7yeSk1JIRrtrU0vAzlH6GMzSXXvVHATCrx
	 P/cv4HUwyJk1/X5QBbaopeBq/dXXtWj1oM72vo3Uyy07NV7Mw4DDxiBOqO76ITpAUKxVP
	 xWn1lri5Vwuv0qG0PoBZzMO93iGQgkA9YbebHiA587kQXzASOgAeYv5Q2XIvgbgBeKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Td8JxagP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC54E606A321;
	Wed, 25 Nov 2026 22:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Td8JxagP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3978D1F000CF;
	Wed, 25 Nov 2026 22:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645441;
	bh=VgTb4TX8hzSCfpylfGvwRlsr4/jJFplNoBwpIYBpwfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Td8JxagPa5bb2bHNmmgTkt52zw2sMAOxNh1N23fgWTCqYSD7S4iOh/Ky/iOLiFBzz
	 vENDskhM95lMdOquE8agfjRyZdn32sJa4PQVa+mR/uNp4EXLJkdDbyfHwFlzV5pIKP
	 KtYFNkVmgev+MaZ8E/wVIDsMQvzKC6BdaWj14Z2Y8iDeG6nClYAwLd3B8OnzNa8MLv
	 /hZvphcguSBXOhumrK0MtlRz8vHBE/8IafFOh8s9J20G7xExH6O21MjULLHNNwvbNi
	 jpBcTq/UpEEGqIfqBIc8XxmT/myF/EJIzFY6wRtgE+0DX4c2VMCY/qCwzCs5YEk4v0
	 W1Ab7snS2sm0g==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 22/47] clocksource/drivers/exynos_mct: Move CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:05 +0100
Message-ID: <20261125222230.22508-23-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
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
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

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
Tested-by: Michael Kelley <mhklinux@outlook.com>
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
2.56.1

