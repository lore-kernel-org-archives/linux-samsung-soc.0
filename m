Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCF3325726
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351951; cv=pass; b=qsfo9RHxguSO59qFppf9EpQMtwVOeckqp7Y7eVUniW319M5U2GtdIS8E4C8HPVGM9G2NdGiY/rx/oxXaUKMadTWbogjWpe5cNyS3TC/AM8SLUhEsWz8R7KWeYtHWJh44TMGyEwnbVRev4OEF8Iqm7HAfaUrECjWpVhXySW4jSco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351951; c=relaxed/simple;
	bh=/xfuVj+8C9HSpfq1RyMslkzeYrWVJnmNTKz5dovIclE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A39RTNZQ+0Ssw9bY6UhOVZ3TDw5wl5AhlP+Ec/1PGlZZjtkWyoNwThlLP+3aaeele6Y9Ck7Atv7bp+DF5rucJjlEWA0NNCfKMmQITOReXsHZUOgjNQOWNgkg5qhFJ5R4prBScnjntp2A2TcqxW3JzCQvIm7Za03KL+06fJFrnkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f+1xpUA3; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f+1xpUA3"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so396945a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 01:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779351948; cv=none;
        d=google.com; s=arc-20240605;
        b=V9VBYzxeIuemHO/+6niEeda9CXafnaO0cc9nhbnUeXKB4bzESMxzYQc98+VugwQsWm
         cUv0YQLEBIkrYpTH6dqh0J3cXOvIvHU6OpMKtLheWCwyA3nhZ8e0awnQmDB/ZBxDJ26Q
         fMEFomOAii+19SAU5PqRmH4j9LCiWv7h+gc3MIYEW9JGGnKfjWatnChMBBpcHFUqIZnh
         7Zyj1+W/xTOaUUc0HzpXYKFhpyn6igfLjAWnivvgWd6a7t3qUfxJVt989LqVgUuj9qMw
         3hnFWG9jnMNYxXh233WdP+6HLKFdMQo7FtuCLxuuUDHjaDvI+KCgAzcFk20Zmn/JIkgH
         iWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HftGKTFDQHz46tZbCrQonIA0wDZTxmOItHnP/B1pm30=;
        fh=Ej76F9dTE24XcuMmve6ZsvgC5MsKgbZwILvxFjHvlW8=;
        b=iTLsc3LomMGLlrb8jx8bZ/dVCNFtq3KhDJkTAibN+j2y6rJW8OwA+m8rwy3y+DGrfJ
         7f/qsHaSxURBTchQWx1TheRgknYhJm5KibJLxy9V6i2I6Or2QKV7IiukN2d8mIkrJyWe
         PrTSPx6KMkFQ5mYR4dDBwjB7GFQjQOPFjEuEMYdYw4x8l7nzJ4XY35JGSXyiwuq7bqph
         6YziP5SnWMg0J9dtWn3NbXQQGeusUHAiIL0YRAFuC2/rWqc+6LOSMXu0Sg2hSc3KVgG1
         iAcJ7o3FZo8Rs90KjaH0O3MRKvOCIHrlTeHwsMmPczw/rpdX41ByJr/V0FhHllRX6GiA
         AZaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779351948; x=1779956748; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HftGKTFDQHz46tZbCrQonIA0wDZTxmOItHnP/B1pm30=;
        b=f+1xpUA3gG3wFCqSAVsmh1j3eGnVXPydgxmUfJltKFSfDuIw1XjLwDPICCn8dS/wyA
         l/gvgznACC4POx/+Mdp5RrMuqBvGowa/GXOsE+Wmy85KQoH/vuuuAFaZ1/vzWky1SoxL
         SLk0SrGRIoOB80ZF323CCzXsTymULFUVWSzFmwzLDddeuaczb2hZxpin9K1NDtKLPxgM
         CR022P//YvgxGNkxPwi/atHOXayzKAdbQSrwGEAPmD6IIu544lQ4hgHVobDHrSmawgeZ
         Zt1bf0UrcI0m2myUcoL7Naap06CmGLMMBdtq9i0JLT1tPhIMgIsKBXZwKs02qwLDkj/K
         bAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351948; x=1779956748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HftGKTFDQHz46tZbCrQonIA0wDZTxmOItHnP/B1pm30=;
        b=lAc8kF/TaGgqbms50nmV0XPVE1/grVxjDWgZ4rdGiVsatlygW2qVbSQoTiQTGTQykS
         Y+FrqVc9N70ug8Kn7tY+LlFmdo7vd/WFjGyj+pBdM1mLCsmHvV+EtpkvfNMHaMuE3fd8
         tq1AMktCfXXkL3IFUnfZRS+kWgcfOElq9DkAbAz6obWlSjEKU4flSSM+VNJeLkosbIoW
         JHyZOA2ydqFoenQP7mJOVHMhdpPxbgKl5/M6Ty2fFoRI0iOdIjAFxN3MrCeF3mUvdj5t
         qNX0/vGjRO/BnXz0WPf06nNYORQS33vEK+f7mJtkHfFGAqA7I9wvRulOnV1jlwTpgtzr
         cyeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MZxXhd1mmMW821v1t8bOnjDBIWP8wwao961CA+vkdwCwZRTFrYbhvxI2LHMSxuNGOA6Q0qczYoiU7bggZVKausg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyzFDY9//twiAg+vjljv5Nx1E4NFwi4Yqwz7FTT8fgoYxwTLzp
	NX7k+0O/ZpXAjSsjZRxiFw8Z7nz+fEAABBkaIbhpWttA+W49w3F/hOGi36dMF6H5S8bEzSqmFOR
	S7+tX+0Q4ID25X37wNvr+B9iqkBSQsDb8xZRbWUPBlw==
X-Gm-Gg: Acq92OEvLvVui2sPpp/PumZ3BbunH/cXYB1ws/F2ruzNcDVUB7Us4n4/UT167JUtrNH
	gyg1S7thoBYfiJKvoiKgAILU97Bh3o6RROSJXFa4JL1k4Gv7sG62UpS4yoyz9KulEzegzpWJX+a
	9g+11HBni6V43qYqWM/AE1IJjaedc9E3gljAzptAcPRnuO5QxfyBsnMowebHDztRBna5COg2vz8
	1Z0yONJxrEzi/l9t54XMeiBzX9kc34tpY4OpTQ4Ccluo236DJb9g86A3YSR4+4dHZFBKP2IQ9w5
	pbGNItLM4tGM1CkhI1jZyYLtL9T2uQ+qOuZHznLqyirDd4rUUVU9
X-Received: by 2002:a05:6402:5306:b0:672:8f26:8a9a with SMTP id
 4fb4d7f45d1cf-68835bf6a4amr868802a12.8.1779351947791; Thu, 21 May 2026
 01:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org> <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org> <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org> <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org> <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
In-Reply-To: <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 21 May 2026 09:25:34 +0100
X-Gm-Features: AVHnY4JhWIGAx26PwOK0C45852TVZfJmuG1qn6e3lCf-fVcwgDGuhhZK4l_Sw9Y
Message-ID: <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Wed, 20 May 2026 at 22:01, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Hi Tudor,
>
> On Tue May 19, 2026 at 4:46 PM BST, Tudor Ambarus wrote:
> > Hi, Alexey,
> >
> > On 5/18/26 2:24 PM, Alexey Klimov wrote:
> >> Thinking further about this I'd humbly suggest that even
> >>
> >>      if (fw_err >= 0)
> >>              return 0;
> >>
> >>      pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
> >>      or pr_debug(...);
> >>
> >>      if (fw_err == -1)
> >>              return -EACCES;
> >>
> >> some debug message would do.
> >> Perhaps we need some convertation, for instance as it is done in scmi
> >> code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have any
> >> data for mapping acpm errors to some human meanings.
> >
> > I did that for the pmic helpers. I don't need any debug prints for
> > gs101 TMU as I have clear instructions from firmware: 0 for success,
> > -1 for error.
>
> This doesn't look like a right approach for upstreaming a ACPM TMU
> framework.
>
> You are trying to submit a gs101-specific implementation masquerading
> it as a generic ACPM TMU framework, while explicitly pushing the
> refactoring work onto the next developer to add support for other
> SoCs in this generic ACPM code.
>
> The ACPM TMU protocol implementation on Exynos850 is different: it uses
> different error codes, and half of the calls in this 'generic' driver
> are not even implemented in the Exynos850 firmware. Relying on a
> hardcoded if (fw_err == -1) in a driver named generic ACPM is broken
> by design and may silently swallow critical firmware errors on other
> SoCs.
>
> What about such options below?
> - rename the driver to reflect reality: rename this specifically to
> gs101-acpm-tmu-something to reflect that it is tailored for gs101-s;
>
> or
> - abstract the firmware error handling paths through driver_data or
> a dedicated ops structure now, so that other SoCs can cleanly hook into
> it without having to rewrite the logic later.

AFAIK it's pretty normal not to add new hooks before they are
required. I think the approach taken in this series makes sense, as
it's the developer adding support for SoC #2 who best knows what the
differences are on their platform versus what exists upstream.
Similarly, the developer adding support for SoC #3 may have different
requirements to e850 and gs101 and that developer is best placed to
refactor and add hooks or quirks that are required for that platform.

Let's not try to boil the ocean with this series, it's targeting GS101
support. We can evolve it for future SoCs as those requirements and
differences become clear.

Peter


Peter
