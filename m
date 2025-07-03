Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A8242D80;
	Thu,  3 Jul 2025 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537998; cv=none; b=ozqKlYNyKKofYF9pJxTTCiXtcFGI6bWFlKINK8E/qNjNNOx8cN5NWDTBk06rrRsJQceie/jCUqZgNDwpZ7BpCucYLrf29PRwUsP6XiGKhr+7JYx9qR7cng9YWSVNTVe6OjB5TKfFk1nIIxk1FCK5GAYYvAXW302cePjsDYF+cJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537998; c=relaxed/simple;
	bh=2oRl7X8cE7xzvtFjjMrKVe0cbR2T7lD4kiFZPoL+Z1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hGbjY+uX+tH9S4dOaKl4iRM6ku5dLD4+g2/6klwjvmEnZg31BKZmUe4y5k04PSCuiCTbnhkYFe3pUXIdgFVSreq3/SRq5Npct3nkV+xmNzIKc2jSiKQ3roHtf+F7dJJ6qI1P1tc6x1P18wHzzocydLim3s3XMVyGwrQUJko3vr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzKI0AQs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzKI0AQs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA714C4CEE3;
	Thu,  3 Jul 2025 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751537998;
	bh=2oRl7X8cE7xzvtFjjMrKVe0cbR2T7lD4kiFZPoL+Z1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FzKI0AQsV9y04k7M6FH1poIsF8od3bbnoogf9sONsVQhN0MfGgNmLlRmgDYcIvi/y
	 F+4NW2dRM7kNSt4rsoNaYeNBRjckMWsOuGf6Y1NaBg9DrSAoMoJ5Qxv/yKAblWImkz
	 IfBfpnp5KltFsHxza4HiAalX9x0XJc05oK+6L2WaG0mzNq9nmUnvACmyraT+zaD50k
	 +6JnAHu7sVE4shR74iCpl7dLgBmSoJLx9y+MDnN23MCDS4Ru4WWqcEpigOuVGlJmy6
	 WJvmY0/f8ypzDU5oTMBy3RCfBM0mU+LGiA/p5503f7wJzkYxaJgHfwkzXH9blRXvIO
	 ErsWnRSEYalqQ==
Message-ID: <232267bf-d226-43df-bd4f-5977706176a2@kernel.org>
Date: Thu, 3 Jul 2025 12:19:53 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: William Mcvicker <willmcvicker@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
 <91a9d4dbe5504c493856ef81b30d98e7da925ac0.camel@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <91a9d4dbe5504c493856ef81b30d98e7da925ac0.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 12:12, André Draszik wrote:
> Thanks Pete for your patch!
> 
> On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
>> Register cpu pm notifiers for gs101 which call the
>> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
>> hint. This is required to actually enter the C2 idle state.
>>
>> A couple of corner cases are handled, namely when the system is rebooting
>> or suspending we ignore the request. Additionally the request is ignored if
>> the CPU is in CPU hot plug. Some common code is refactored so that it can
>> be called from both the CPU hot plug callback and CPU PM notifier taking
>> into account that CPU PM notifiers are called with IRQs disabled whereas
>> CPU hotplug callbacks aren't.
>>
>> Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
>> property to the CPU nodes. This informs the time framework to switch to a
>> broadcast timer as the local timer will be shutdown. Without that DT
>> property specified the system hangs in early boot with this patch applied.
>>
>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> 
> With this applied, I see the following during boot:
> 
> [    1.841304][    T0] =============================
> [    1.841422][    T0] [ BUG: Invalid wait context ]
> [    1.841550][    T0] 6.16.0-rc4-next-20250702+ #54 Tainted: G     U          T  
> [    1.841727][    T0] -----------------------------
> [    1.841844][    T0] swapper/0/0 is trying to lock:
> [    1.841965][    T0] ffff000800ee84b8 (&pmu_context->cpupm_lock){....}-{3:3}
> [    1.842001][    T0] , at: gs101_cpu_pm_notify_callback+0x48/0x100
> [    1.842309][    T0] other info that might help us debug this:
> [    1.842613][    T0] context-{5:5}
> [    1.842987][    T0] 1 lock held by swapper/0/0:
> [    1.843442][    T0]  #0: 
> [    1.843859][    T0] ffffafe9d8f1f100
> [    1.844282][    T0]  (
> [    1.844618][    T0] cpu_pm_notifier.lock
> [    1.844980][    T0] ){....}-{2:2}, at: cpu_pm_enter+0x30/0x88
> [    1.845340][    T0] stack backtrace:
> [    1.845855][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G     U          T   6.16.0-rc4-next-20250702+ #54 PREEMPT 
> [    1.845878][    T0] Tainted: [U]=USER, [T]=RANDSTRUCT
> [    1.845884][    T0] Hardware name: Oriole (DT)
> [    1.845897][    T0] Call trace:
> [    1.845909][    T0]  show_stack+0x24/0x38 (C)
> [    1.845934][    T0]  dump_stack_lvl+0x40/0xc0
> [    1.845949][    T0]  dump_stack+0x18/0x24
> [    1.845956][    T0]  __lock_acquire+0xc68/0xd90
> [    1.845976][    T0]  lock_acquire+0x14c/0x2b8
> [    1.845985][    T0]  _raw_spin_lock+0x54/0x78
> [    1.846011][    T0]  gs101_cpu_pm_notify_callback+0x48/0x100
> [    1.846021][    T0]  notifier_call_chain+0xb0/0x198
> [    1.846046][    T0]  raw_notifier_call_chain_robust+0x50/0xb0
> [    1.846053][    T0]  cpu_pm_enter+0x4c/0x88
> [    1.846063][    T0]  psci_enter_idle_state+0x2c/0x70
> [    1.846078][    T0]  cpuidle_enter_state+0x14c/0x4c0
> [    1.846097][    T0]  cpuidle_enter+0x44/0x68
> [    1.846121][    T0]  do_idle+0x1f0/0x2a8
> [    1.846142][    T0]  cpu_startup_entry+0x40/0x50
> [    1.846152][    T0]  rest_init+0x1c4/0x1d0
> [    1.846161][    T0]  start_kernel+0x358/0x438
> [    1.846181][    T0]  __primary_switched+0x88/0x98

Thanks for the report. Probably such code should be always tested with
lock debugging options enabled, e.g.:
https://github.com/krzk/tools/blob/master/linux/build.sh#L845

Best regards,
Krzysztof
