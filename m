Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFE32E9EBA;
	Fri, 11 Jul 2025 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752245604; cv=none; b=MVrpbt/5/9TMcLwpgsy2P0ShGk4n6zUuy/h9JHJC1I76eW/QDtMMr+3k+MTxTich8YOGNjYIKs8njBlszhbYbRn6g7W11OLSleIjeOEk6gLPyBBQl5Ry+XYzoCDWg7npHNJ04vPXvIvZ2vXC4CwlbCgwxzgv4C0xMgpwkvNucS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752245604; c=relaxed/simple;
	bh=wUFvH2YkRyqv63gc1UZfUHWKeTwZZ04MT5dJ1hKkueE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRihhGeht+NY5szrePBVOzPvv0rhEs9zTba44OYGZRVlos3Aw74qWGpU5vP5vBAiWHdTGfecuP+0wl9NodPXBrbzt1/TvZeKIBSMXffcRsIM/xOt2Lhj7+8jzXSH0mgJYzW+BEQt2fLMX0L+/jJZgLcJazhB6khKoBqXzq7vUHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59C8D2247;
	Fri, 11 Jul 2025 07:53:11 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC8AF3F6A8;
	Fri, 11 Jul 2025 07:53:19 -0700 (PDT)
Date: Fri, 11 Jul 2025 15:53:17 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	William Mcvicker <willmcvicker@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v6] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Message-ID: <aHElXbj4-T--QqKk@bogus>
References: <20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org>

On Fri, Jul 11, 2025 at 02:50:26PM +0100, Peter Griffin wrote:
> Register cpu pm notifiers for gs101 which call the
> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> C2 hint. This hint is required to actually enter the C2 idle state in
> addition to the PSCI calls due to limitations in the firmare.
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
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Hi folks,
> 
> This patch adds support for CPU Idle on gs101. In particular it achieves
> this by registerring a cpu pm notifier and programming a ACPM hint. This is
> required in addition to the PSCI calls to enter the c2 idle state due to
> limitations in the el3mon/ACPM firmware.
> 

I would rather keep the above note as part of the commit message or the
code comment as this will get lost when the patch is applied which is not
something we want. I clearly want to loudly shout or shame the broken
firmware for not getting this right.

-- 
Regards,
Sudeep
