Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A961FCF41;
	Wed,  9 Jul 2025 16:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077436; cv=none; b=ej7C8r4jD2S9MP5bLh/VSQNU+Yk0XD9my7yJdIpnAsWLyAiOo+f3vlkiiBdcCZCtbR+eVLHYahNsC28xK2peS+A+mRPm3tisIyCoYxD2+ipny/lrvzhrctcmdssrh2W9YYIjWUgqSASQLtWKpgQED4Kip9t97vwXz7qRHXD2cto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077436; c=relaxed/simple;
	bh=sdLxh5wPU4SO7jBx9mRMGoBNVWRvuavllwbkk1oFYlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbTd3kMv0r7nePjTMYgfB8kAVmvttORHyDSywp5HdZwvgjdT8dssLoE4qEkhonpowdLovySuS3ep9EYGugrjL3RouHi0ILL9Qad460XwpGFF66VvqqpAZ7VAAaO8D9EEc5R65A8ypY0hvOST21rGSNjYDqibXV6i7dO+byR4VAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBE47152B;
	Wed,  9 Jul 2025 09:10:16 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37B6C3F694;
	Wed,  9 Jul 2025 09:10:26 -0700 (PDT)
Date: Wed, 9 Jul 2025 17:10:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	William Mcvicker <willmcvicker@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v5] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Message-ID: <20250709-chocolate-flamingo-of-nirvana-5de895@sudeepholla>
References: <20250709-gs101-cpuidle-v5-1-b34d3210286d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-gs101-cpuidle-v5-1-b34d3210286d@linaro.org>

On Wed, Jul 09, 2025 at 02:26:27PM +0100, Peter Griffin wrote:
> Register cpu pm notifiers for gs101 which call the
> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> C2 hint. This hint is required to actually enter the C2 idle state.
> 
> A couple of corner cases are handled, namely when the system is rebooting
> or suspending we ignore the request. Additionally the request is ignored if
> the CPU is in CPU hot plug. Some common code is refactored so that it can
> be called from both the CPU hot plug callbacks and CPU PM notifier taking
> into account that CPU PM notifiers are called with IRQs disabled whereas
> CPU hotplug callbacks are not.
> 
> Additionally due to CPU PM notifiers using raw_spinlock the locking is
> updated to use raw_spinlock variants, this includes updating the pmu_regs
> regmap to use .use_raw_spinlock = true and additionally creating and
> registering a custom  pmu-intr-gen regmap instead of using the regmap
> provided by syscon.
> 
> Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> property to the CPU nodes. This informs the time framework to switch to a
> broadcast timer as the local timer will be shutdown. Without that DT
> property specified the system hangs in early boot with this patch applied.
> 

Assuming this is arm64 platform and using PSCI for all the power management,
can you please briefly explain why all these dance is absolutely necessary
when PSCI calls can be the clue for the EL3 firmware. I am basing my question
on this information in the file:

/*
 * CPU_INFORM register hint values which are used by
 * EL3 firmware (el3mon).
 */

This clearly sounds like workaround for the firmware limitations. That
needs to be clearly documented IMO.

-- 
Regards,
Sudeep
