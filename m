Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C34A92E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 21:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752097033; cv=none; b=JnBJBds0NqPkpGDIAKJaCm/G+KOZgZ9Bd2mNugWr9yy9Vfe8Y4Ddna/aTN5U/qfkoqqB+3mKXvJ0Va6MqWgDF67obDQC6p9udun34fG19iAM04piBCNQXhMw7zjVa1qIte0OncvF00xeVd58bKXYiQ196ZgmQkX/GnLBkMrzU5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752097033; c=relaxed/simple;
	bh=+ClvygQ2RMEEPybf+Dhrb6/A2svFsACwgt2ByyISdvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nP2b1hrb/RfF4IMFtbxfRfxzwuFW8nzExszX7fuRXdXWcIY8Pl9ojRgVmzPuPkxGNJRpnHiG+EXBO8IYFemB8GiW8/MPK/lJz+cHkjcLNtKamIb0zh8Ogjjn39kfTYzOqHxcYCquwrQwn7KBl4L1lrIWTTGUqLcZJ7RN8KSwfF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xL4zJN4b; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xL4zJN4b"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2eb5cbe41e1so230013fac.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2025 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752097031; x=1752701831; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ej56GZoDfiEB41ozBqeCG5Oh6gi5hM+KQ3liG4bvyEs=;
        b=xL4zJN4b2P7p2blNBJz/pzTto63zeoi5g4aBFEsJwHKlLnjvcrbeRTyTRo3G02neRT
         1hN66cxM3OBPC79oKueWWYPx1jNgU9XnmUb6zNvUOfH/pr9KuJhDa8fIreaUWm97yTTA
         QEyocJUra8XbVSh+r5WX2EZDvRRaRp8yo21PLIY5ehEynNbDp9Q7SkaUemr4DSUUYo/a
         BgI9evRSB+2+HcekUYtFxDJZwX3raYQLV+6b/Mz1cPHBdFqG98+F5RNNN5V63rI6Zhqm
         LRtJug3uKNTFNgH5Q/IAPMnDCri+5DtBNN2wEwudi6R3vbh4J5I/eQaB4/ts5w8VkLBb
         eYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752097031; x=1752701831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ej56GZoDfiEB41ozBqeCG5Oh6gi5hM+KQ3liG4bvyEs=;
        b=W+WjcojFuecr7zzaF+dMV6FCOgTVS+WV0QtuvuxZg2r8VexqoxWyddCvKwYjUVaq3r
         0n9C/lMWSlNaUIecSagzyq0VmkkzQ97SA65Kl+hovE72C45rWixAdIH+psFYWx/uHfX0
         bzifWy460YfuUHS51zHhpl+i/jpAbj1YgAXB0EXl64cb5b1E4pNVTpYxTHBGxTvyXQex
         HmI5FddpImlP3Fp7pB9r8IaHmQnZ8q0VNqxM+QkLKfmTfh6F6LglPrjLWfgLT5exNDV/
         2Y//BrIFBHt3TCvbKR1UurotXJZfTpAuPO/xM5IjMgV+OQCq0D2F70aD0yyZJwAneKPk
         uiKA==
X-Forwarded-Encrypted: i=1; AJvYcCWlHR4GaXoHn7Ql0HGA+6u/5wUQogsLW9CKfQJDZw12vt8C52Yt10xJRWWd7bH7jDjlGb+HBW/UKutExDmlvqbuig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY2QnSOWEso9TdOGKjWTLnjYV9ea7Wr49D2wmeDXQmUkKar2G4
	vWDqMkQyojV7mDAxzw2XL0VtZA5udeAjnpSY4/z8pGwp1Jg+5+uf3GKz6yFp/ciVYGpbdmDK+Zy
	5vjf/ViHLelAirCvX79rTCzPFWrQrxfBkSs+K9nisTg==
X-Gm-Gg: ASbGnctWm479P6i8DJce5sG5SFNZsuwh/S+9Nqb067BGBjUwNyEMRgbB0Jp9wRNewkD
	/oZin/EEXkj4G6oFv9IVscQ+FqoU1Gq399pCyJ+S39PaR82wJ98YnHnStxGcKwL5EeBzRCMU7uB
	U7iAFHMCwRF9obcLGJBOiFul7z2yFUGZOZ+uKR0SgN2ns=
X-Google-Smtp-Source: AGHT+IFkQC/A6ox6MY05MYUw+CxjeUHI6gwfGQcb8/ByhkzLHUkzh1cpvqJdYCStR9o2v2KnGFlHUHdMYMFFGD7SDdg=
X-Received: by 2002:a05:6871:293:b0:2ea:841f:773c with SMTP id
 586e51a60fabf-2fef87e6153mr3338509fac.35.1752097030840; Wed, 09 Jul 2025
 14:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-gs101-cpuidle-v5-1-b34d3210286d@linaro.org> <20250709-chocolate-flamingo-of-nirvana-5de895@sudeepholla>
In-Reply-To: <20250709-chocolate-flamingo-of-nirvana-5de895@sudeepholla>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 9 Jul 2025 22:36:59 +0100
X-Gm-Features: Ac12FXwllShNhqvUQknysIBtFTk51NgLeP-HjV13-opUWbLkoeErzAnBiZILB3U
Message-ID: <CADrjBPqYSVO20a0ox9un0fq7dBss9sMGK1Q3ivCjCGaFyqhZFA@mail.gmail.com>
Subject: Re: [PATCH v5] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

Thanks for your review feedback!

On Wed, 9 Jul 2025 at 17:10, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Jul 09, 2025 at 02:26:27PM +0100, Peter Griffin wrote:
> > Register cpu pm notifiers for gs101 which call the
> > gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> > C2 hint. This hint is required to actually enter the C2 idle state.
> >
> > A couple of corner cases are handled, namely when the system is rebooting
> > or suspending we ignore the request. Additionally the request is ignored if
> > the CPU is in CPU hot plug. Some common code is refactored so that it can
> > be called from both the CPU hot plug callbacks and CPU PM notifier taking
> > into account that CPU PM notifiers are called with IRQs disabled whereas
> > CPU hotplug callbacks are not.
> >
> > Additionally due to CPU PM notifiers using raw_spinlock the locking is
> > updated to use raw_spinlock variants, this includes updating the pmu_regs
> > regmap to use .use_raw_spinlock = true and additionally creating and
> > registering a custom  pmu-intr-gen regmap instead of using the regmap
> > provided by syscon.
> >
> > Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> > property to the CPU nodes. This informs the time framework to switch to a
> > broadcast timer as the local timer will be shutdown. Without that DT
> > property specified the system hangs in early boot with this patch applied.
> >
>
> Assuming this is arm64 platform and using PSCI for all the power management,
> can you please briefly explain why all these dance is absolutely necessary
> when PSCI calls can be the clue for the EL3 firmware. I am basing my question
> on this information in the file:

Yes, you're correct it is an arm64 platform using PSCI. Unfortunately
I don't have access to the el3mon firmware code to speak super
authoritatively about it, but you're correct that it is essentially
working around a firmware limitation.

What I initially observed whilst working on suspend to RAM, when
hotplugging CPU's with just the PSCI calls the system hangs. Debugging
this and tracing versus the downstream production drivers the missing
piece was programming the "ACPM hint" to the CPU_INFORM registers.
Further debugging and power measurements also showed that the ACPM
hint is also required in addition to PSCI calls for the cpuidle states
to function correctly.

> /*
>  * CPU_INFORM register hint values which are used by
>  * EL3 firmware (el3mon).
>  */
>
> This clearly sounds like workaround for the firmware limitations. That
> needs to be clearly documented IMO.

Sure I can add a more verbose comment, that this is required to work
around firmware limitations in the PSCI implementation.

Thanks,

Peter
