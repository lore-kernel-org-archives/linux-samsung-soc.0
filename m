Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E8B2586C8;
	Thu, 10 Jul 2025 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163338; cv=none; b=P+AcePEf6uy4zOdQaEkTkoH6nvqH5XMCwYxV95ieya8lcd5zRPn643AUS4t+N5Mq4NXvIo7r1i4J4whXf5zDS9evQ3odf/TaZ1wS4aWvJrT+JI3QDvpqcSXYgiDKr9BajxSJZMclUn4qVey8ySR+wT4qGZOG2E6CNZHudHrGTts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163338; c=relaxed/simple;
	bh=lN750KO/pPWnzCXFx4f46ZxdEyd/vB6O8CNNoB35e0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+slkH/UnUQwzu4PfrgQmyu2hA5zmv0+Cp++OZ2EHpIc3rW4n/PH5Z+5X5qxWcqHsRN6xcbmIB7RsIW0JAredtT8MsNe1AP/OlaAJzEapVqrpTUxmbB+xxmCCecuuRAg69bnos7PqxzDQjys9brbVFo2oWs+NFUBH9xMLOmW9vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62A281EA6;
	Thu, 10 Jul 2025 09:02:04 -0700 (PDT)
Received: from bogus (unknown [10.57.50.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF7503F738;
	Thu, 10 Jul 2025 09:02:12 -0700 (PDT)
Date: Thu, 10 Jul 2025 17:02:03 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
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
Message-ID: <20250710-translucent-mastiff-of-performance-b5f1ba@sudeepholla>
References: <20250709-gs101-cpuidle-v5-1-b34d3210286d@linaro.org>
 <20250709-chocolate-flamingo-of-nirvana-5de895@sudeepholla>
 <CADrjBPqYSVO20a0ox9un0fq7dBss9sMGK1Q3ivCjCGaFyqhZFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqYSVO20a0ox9un0fq7dBss9sMGK1Q3ivCjCGaFyqhZFA@mail.gmail.com>

On Wed, Jul 09, 2025 at 10:36:59PM +0100, Peter Griffin wrote:
> Hi Sudeep,
> 
> Thanks for your review feedback!
> 
> On Wed, 9 Jul 2025 at 17:10, Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Wed, Jul 09, 2025 at 02:26:27PM +0100, Peter Griffin wrote:
> > > Register cpu pm notifiers for gs101 which call the
> > > gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> > > C2 hint. This hint is required to actually enter the C2 idle state.
> > >
> > > A couple of corner cases are handled, namely when the system is rebooting
> > > or suspending we ignore the request. Additionally the request is ignored if
> > > the CPU is in CPU hot plug. Some common code is refactored so that it can
> > > be called from both the CPU hot plug callbacks and CPU PM notifier taking
> > > into account that CPU PM notifiers are called with IRQs disabled whereas
> > > CPU hotplug callbacks are not.
> > >
> > > Additionally due to CPU PM notifiers using raw_spinlock the locking is
> > > updated to use raw_spinlock variants, this includes updating the pmu_regs
> > > regmap to use .use_raw_spinlock = true and additionally creating and
> > > registering a custom  pmu-intr-gen regmap instead of using the regmap
> > > provided by syscon.
> > >
> > > Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> > > property to the CPU nodes. This informs the time framework to switch to a
> > > broadcast timer as the local timer will be shutdown. Without that DT
> > > property specified the system hangs in early boot with this patch applied.
> > >
> >
> > Assuming this is arm64 platform and using PSCI for all the power management,
> > can you please briefly explain why all these dance is absolutely necessary
> > when PSCI calls can be the clue for the EL3 firmware. I am basing my question
> > on this information in the file:
> 
> Yes, you're correct it is an arm64 platform using PSCI. Unfortunately
> I don't have access to the el3mon firmware code to speak super
> authoritatively about it, but you're correct that it is essentially
> working around a firmware limitation.
> 
> What I initially observed whilst working on suspend to RAM, when
> hotplugging CPU's with just the PSCI calls the system hangs. Debugging
> this and tracing versus the downstream production drivers the missing
> piece was programming the "ACPM hint" to the CPU_INFORM registers.
> Further debugging and power measurements also showed that the ACPM
> hint is also required in addition to PSCI calls for the cpuidle states
> to function correctly.
> 

It is definitely worth adding all the above info and shaming the firmware
for not taking care of this. I still don't like this as PSCI is there
for nearly a decade now and still we see such limitations that needs to
be fixed in the firmware and now workaround in the kernel.

> > /*
> >  * CPU_INFORM register hint values which are used by
> >  * EL3 firmware (el3mon).
> >  */
> >
> > This clearly sounds like workaround for the firmware limitations. That
> > needs to be clearly documented IMO.
> 
> Sure I can add a more verbose comment, that this is required to work
> around firmware limitations in the PSCI implementation.
> 

Thanks that's what we need to fully understand the need of otherwise
useless dance around hotplug and idle state machinery in the kernel.

-- 
Regards,
Sudeep
