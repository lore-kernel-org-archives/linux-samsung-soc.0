Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6581B34E744
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jun 2026 20:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161033; cv=pass; b=FpJVBZ4JhjNAHhAED8/OIs0cFLCR6iZkePds6Xp1TCxyBZI09YChwVjw2kmrHWmmK9f0vAdZzt5sNYHtJLIOCgwbdk9vp+C4/XmA1Z7HuIbHIhSCXDitpVFnR/Uk8hT/4IPooD2m+XMtNIPzKL6LnLfhW0kChntVr9/78cKcfsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161033; c=relaxed/simple;
	bh=PmY9a393FkPMi7cXE1kIXzUX+srKCbPNwHhnlFRxeaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tV0GuM+gxgyMAtCVOVe4WOD6BnqKX29t0Sa/IhuwAKuc61WXoBDZgoS7knKMaScP00ZyMkNpygdna7m9HlvkO24quTkswVj/MOqgsExC6AaPg74JhFEpjU26p13jlUlgz0yZG651+rJOSOY1A2hiJtkaEVFfV49o/8PFHoG6H1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=okXjPV0A; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="okXjPV0A"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-697763eeafcso4344160a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jun 2026 13:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782161031; cv=none;
        d=google.com; s=arc-20240605;
        b=j2OawfV32G5WP/Hu3HVVlhZiE5lFyAdqamZerAhmexSIRqBzjS9fTcc7xNxEOr3JTx
         CwGYiX5Y6TBlA4ksH1wDXQ0mwuQNWxuhWHMzZZy2YxzWoS52zOeEC5RdoQhKrriWS3e5
         Ty0+X6f1LNU6OkccGV5EHRke+WwzEpI9OfhHszGz097EmL/RWg4h3yuADRRxCCbbZwfy
         eIltq5W+26zzAIIH0cd0tjzSdi2bAlMb33xL5wBG7tk0xhw9Fm1ojcs6PHdv/lT2Aj5e
         82jRIVLzTE1GZZ4qIztUEJdhoGYzGaSmC4zrlOqixVbpKTknlvIfubGKwg+gnaLfpQGR
         cmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LK9z00ubzec0E/FSX4Kl4K5PC+aZIx5IC8zFGof99gs=;
        fh=nCn/wKT9FjkQb9Z5czMmiZLnSusssVLaR360z2ASSe8=;
        b=CbjdtpEYFsZfYPAb41MDJHMI3ux02Yme1/cg7skWMAB9nOZcnW0UXzNHJbIu9hcXsr
         FR6J6GM65Ogu6z6CHMwDZQmPCkcwxx5nZXAgI/gfFom+WB+wp3TkMMxoPLGG6wyQh0TV
         pj3UhAZSvxXc9WFX6V9kT0T4gISgOWQ5ByaI2I+6Rb5bCCPvrzYN56gvyxNR+PivGZrV
         m+/JvCxAn+bUgPNnV2HMKYlf2kD1ccIgOXVkJPAH9+nj2jQ7++uX1q41vsudgHgbX64r
         +nZ5U/uk5JwxJ3I8L/ffYkxpmoYZ+X0XDuNIUUNwHBBJiLl8IReulrfNzeOXYrXFuapj
         6qSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782161031; x=1782765831; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LK9z00ubzec0E/FSX4Kl4K5PC+aZIx5IC8zFGof99gs=;
        b=okXjPV0AOSJKvZm7tQjyO7uxpIS5W9igsAWDUnJxqXu4LGRBVY/BmykQWaUu0nL0bX
         +ph0Q9E2NzDsdY1Ec7GJ1MqWhEETd4a0PXQgeATcI/XYzznigwM04kKsH0nsAgG7wihn
         wdfplEWxQQ/M37Z7klWPJD6yHJscOskP9TF1/dKr5yYeqYoi6aQuQGux00hMEP+QDDQl
         4y7H4p5wKDE6VEIXhm6/qgOEPeJBHRN5i/WVzf/kKx1Cgp1zFqQjo+ANlqO+p01wWfAq
         Ff3a7lz4Yw6dUt3yoN4Uc4Elo43Dj1J7bL6q6dOM3LZf5GrN5B71k9Q21xZULv97DHLy
         a+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161031; x=1782765831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LK9z00ubzec0E/FSX4Kl4K5PC+aZIx5IC8zFGof99gs=;
        b=ifLpsjxGNPxkBp8P14WA/HX6Q2YGmb4ANHNUFfALlnPianwav8qGDISMijhfN3IvXu
         wQIs57BxjMoS6wEyf5Zgs3o5ztZy2g+NixFJbJ+Eg25PGD23nv23cGOD7oqpSyeiEQkU
         xmPlLJ+lNFM4VUV96aC7y4OzxXujoZYhczGLzgtp56KpXsYOofbnYIt4/7xoc/fK1fqW
         qyEUyW1zBh1uGWghjQ0LiTZZ0ul4y5Bfw1JHEjHdD8rn2ZEnn5uCb87T3NK/fypuoGcs
         A6h8JA2Gq/8Cp9NG0kUuO/9UIurP22+Us8Gg2TpsnHF8dHdd7at6cGcOYBwu6PFqRtxR
         EdJw==
X-Forwarded-Encrypted: i=1; AFNElJ9YgwT+lYlnkgDDB9A0SdRCQGmwAwhx8yozzFumNv5UBTMQZpWHdqJDid3f7kZdR73N7qiut4zN+GZ52yZS8KLu+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqiNqxJOni8gEB/OO6FBkDREkr0UZG0Vu3wlLjnLTsm7rESLGi
	JmhEY3M9x9bo53jZ2KF5ewFzxPJBax0b87Bn7DvedLi05NpyDfbzBSeyAXFByGkfvSX6wiZyVPD
	S5tpOrpMWqHhGVM3ii0z68aipNS/2lEIW7wRgKDviNQ==
X-Gm-Gg: AfdE7cn14+KY/RRTcQry1PtmOkFrUsTRvauLhLydPMEyx/fF6XyvDP/LFKkFFVs5vjI
	e4L1m8HtoSZ3htme5KPZPlggN5djpLTrrSksXZ91lFP4N6Gah9Htdna9pVjFaeXQV+i0je3UHsR
	ddszQzr+EtxtpK+i6Ch735LMghl9wsBUE9WsR6dv6O2GEqBR/NocMllUruakWo4BaWWJ+Cbrr69
	iz724pjCD8TJeqqzlX41Q0zeIAlgeFDpYXuuGWb4B7LTeXu2Lt+/c6oqYw6RNFyuV/iVB3pFlSe
	C7ETBvLKUAkRF+1q86IvXmEJR9pbiaY=
X-Received: by 2002:a05:6402:5203:b0:68d:d511:4a9f with SMTP id
 4fb4d7f45d1cf-6970f7bb394mr10422389a12.18.1782161030519; Mon, 22 Jun 2026
 13:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org>
 <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com>
 <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org> <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com>
 <DJFT3TXC0OJA.1ZK17YA2RSQXK@linaro.org>
In-Reply-To: <DJFT3TXC0OJA.1ZK17YA2RSQXK@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Jun 2026 21:43:39 +0100
X-Gm-Features: AVVi8CcSJhlsiEYo8DbJV4KtarpnAeTWxw-4zzSg6pxbzuPPjnCW8fducZqtX0Y
Message-ID: <CADrjBPovA8Kpzjqwr5w0UvqYhpdGyBwpv=xkBLcGGuwZZoocPg@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Mon, 22 Jun 2026 at 19:57, Alexey Klimov <alexey.klimov@linaro.org> wrote:
[..]
> >> >
> >> > I originally made the failure non-fatal because the system still boots
> >> > without the notifiers registered (and all other Arm64 Exynos SoCs
> >> > upstream don't register notifiers and AFAICT have broken cpu hotplug
> >> > and cpu idle).
> >> >
> >> > In hindsight, that seems like a mistake. I think your patch to fully
> >> > unwind everything in case of failure makes more sense.  See small
> >> > comment below about destroy_cpuhp_and_cpuidle()
> >>
> >> Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
> >> return any errors?
> >
> > I suggest you re-read my above comment above ^^
>
> Could you please clarify what specifically addresses my question about
> notifiers?

Sure, I was referring to this part of my previous reply:

> >> > In hindsight, that seems like a mistake. I think your patch to fully
> >> > unwind everything in case of failure makes more sense.

[..]
>
> If c2 idles are used during reboot/shutdown then they fail or what?

This followed similar logic to the Samsung downstream kernel drivers.
I have no extra information about it beyond the downstream kernel
source. It seemed reasonable though that CPU's will be hotplugged
during suspend and reboot so you may wish to ignore these.

The proper solution of course is a fully PSCI compliant firmware,
which doesn't require these side channel hints.

>
> I am not saying that patch is correct and some rework is needed but I don't
> get why we should completely ignore errors from hotplug states registration
> and should not check registration of notifiers. At least warning should be
> shown to user that pm functionality might be unreliable.

As mentioned above, and in my previous reply, I think your proposed
patch is a good idea.

regards,

Peter
