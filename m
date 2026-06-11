Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BF931E845
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2026 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161642; cv=pass; b=IyUMd+5r/QPSj6/gyNRk6K9qe0TjQx/rKumtPKbOWyyOoP08BO5r4MMlJn0y48OmH1+erEknnq3urD1bw9P7QYn6sG7EXyGbeIcEZIZ3Vn3idlbJZ4cCJauXoBfbXmfoSTX3ZtFH0l3X2ZBdji+YthPZotGLAc+Kc0soKeks47c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161642; c=relaxed/simple;
	bh=xN2LpMjZu5K7DVB0JhBTnaF6qsi0f6S98BwkA4HP9IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xa3wHaY7g1lkDL+CRHsh6fvRrx95wVkZl2tQRZMHcFrpVZA1wW/rY7mX8VPWBH3LrBNzBw/krinJHmqPcDNbdHrZXz6r4RjuKCFvniumHaThXrYEkwp+ww4KUwv9vll4MmkbVNF0XygPi9/O2CjbwHIogAv+WFj6BegtofPjEFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uad1jsjg; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uad1jsjg"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so6190500a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2026 00:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781161639; cv=none;
        d=google.com; s=arc-20240605;
        b=kYFjatgrB/F+viY1reEB/+Q+3XTK6uRFnc7f+vb7HmB22mWZOrw4XeY0sggS9LSMzC
         65hNRN02GQ3+oeoYtH6+LphQ5LnRXLcbKCjw7/ny2V+YWhdreywFc9skbYg9AkrVS08+
         X8azf767kQ2NVozqBkdZCrBVluXaAlxNbozt1dXmVAmenTFp2vM3OtVvdjANqO25JcSP
         ILoUB7X/rTM7gvsCKFgT1jpQ2scEA/ia3acPOyCsqr5AnPo9dpmrx+Jn2N90F7jmIKMb
         cBPrKSjhxqi8FAea90RPtxmaKFrh6zRopDyRFt3oBWMKXGwjoGj9lvuuoseDBkWZruVM
         08qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AEpk5nvUQrP2hOPNfotCvTIhHCWOPoRQlVlTaAX6Z7w=;
        fh=ywKNola9YlMQzHhuLVImhQQ9pW/t0GqTpKM5vevJz/g=;
        b=DJcqQMjwjlbNt+j9qPYPd5xFWSv2sWYhTWGvQeBjSKX+X2QLADA1oQtti0mzSOlN1F
         QwS25JxqmhBtul+8B1CQAwbrbjBvL7HaNqFq6KcfSsWPnwjRnUdVnrD2A8laCUdb6bVZ
         ICBUYv4GpFxis4Cjh2VCuM7nC1wuCe9kuHS8s+a4+Jwn40WDrvHY9Kg+2Y/fVNt5P4K8
         miezfa1sKDOwW26YNOrS0IPM3qvAVxuZq01kQSP9HssNGnjOQ/vY5pi3yf6UmK6742xl
         RCy1feK4pf+4/cdmZrRGNZ0a1mtl1r2JJB+9LhF6Bm5lI0NgEPJTdg+6RW+PbRGqwxso
         bALA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781161639; x=1781766439; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AEpk5nvUQrP2hOPNfotCvTIhHCWOPoRQlVlTaAX6Z7w=;
        b=Uad1jsjgMMxeVF+rFkzhlnKhcxuqXiVxg6zHIdCYr1XJ5ZoyLoYzBoLyv6arGMfaqW
         AvpxpKVHWAhv5av/0ni6x7yhxPyrlm2gbZqJMLxcjtA9icDrqw9gry8Xxymr1zsaZRcB
         wrSthcZuHwjZlzq8X/XdGTX29WF7p/wrti9wwBFEk749XmRESjo+DqkhsunbqnfWQ0RX
         FrtBxVHtZse4ZN2UCsMvgf0faqIve8Jc2o5EEpnxzwlCaDz5F9SSKd/QDaBpRYrpDPte
         Hk+rKOb8dYlzHs4slCOnqi5iPA4SHyOXvP+xd2qRJsBJwwHn5JqlGoHmOta5dHmtoBAD
         ZHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781161639; x=1781766439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEpk5nvUQrP2hOPNfotCvTIhHCWOPoRQlVlTaAX6Z7w=;
        b=fN8+CGcNRy0rjFWrvcCY9vGXPKSzI5RsdXz11SSPW44urOKXeqHhPd9S/6xrnyqehr
         hTRRVcprd2FnqH0pId0e4QpJJvMvfaXSGbcrOUwssax14O/uAiazC0LYlgu2hJ+RN7wm
         J30VkedkDGVYmdyhS+0MA6VL0lUhtDqpEPCLdbgX4V6EyQaMBYpfMx4nHfVVHiC2mLYP
         yy89lOI8jbiWR2t5NYgxvA+6959qwT0ZqUM2ucDfK8Fu9RBVEnV0UEcYVvpdsHtMi6u9
         XrXtNXCsHr0gZlokLkP2d832DO4YR+/WQkVF/gZ89/Yuo6aOuV+OsqYN+oDYWk89+lQ3
         xhKg==
X-Forwarded-Encrypted: i=1; AFNElJ94k8zHEqrqUZi5YzcJI2Z39X9Bkf8cYDOBH25H7KKZXZO/KnMh9amhyfwYA0QvI2kJ7oqx+hd0bHLEy01SpcpQ9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNVMBQkAvysHR0kOPE/VSFq+wcHwANwCWtrs6/ySWvQOZ3/2QG
	i1c4iHDWYXALXGz4BxhVYARw1pID2PklQPwE0qbfib4oGvYBoTNq1W6xEY7vGrJK2vV0jckdd6z
	GQKIwYt734PS5XBx0tQAqjG9vloxQ7vPxM6n2htzWfw==
X-Gm-Gg: Acq92OEc5ch14k+Qy/YgocTjZsGG6yl6xp+2l0D9QGLZl4PGN3PYblGtf+HznnOeabq
	Hup8DHJK0G/YtwePrcFAbmCKTvwmZktXNRj8TfVafAU6Cp5ew8qH2VwTJRfd0FUB1SofhFmdS55
	TuZ2aCjwvST5hUZSaNGkzx8PsufeEy9/H2ibJs7XLsqaM5zO5ru7B1PThnfOzdzcwj0tC3GE54N
	w0Jl/1VKN/o1kuoFF/QHqjH5QabLTW/XiAXWNWsiQ8YF+FKBDJwlCBAgcFX/jTaAwq+t+MALN5h
	0WhOEj702G1aUqLah8efSzebKd0fUfoTStkoHuCgXNSCrsLp6xoz
X-Received: by 2002:a05:6402:440a:b0:68d:623a:bc77 with SMTP id
 4fb4d7f45d1cf-6930e282296mr669421a12.8.1781161639285; Thu, 11 Jun 2026
 00:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org>
 <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com> <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org>
In-Reply-To: <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 11 Jun 2026 08:07:07 +0100
X-Gm-Features: AVVi8Ce9AFTdn5GgI4FGeBsq66vruRZqhouaV1W8cJvhIjXpfYGWOCqf13Hq8Oo
Message-ID: <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Wed, 10 Jun 2026 at 16:07, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> On Wed Jun 10, 2026 at 2:34 PM BST, Peter Griffin wrote:
> > Hi Alexey,
>
> Hi Peter,
>
> > Thanks for your patch!
> >
> > On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wrote:
> >>
> >> The setup_cpuhp_and_cpuidle() initialisation sequence currently ignores
> >> the return values of cpuhp_setup_state(), cpu_pm_register_notifier(), and
> >> register_reboot_notifier(). If any of these registrations fail during
> >> probe() routine, the driver returns 0, leaving the driver partially
> >> configured.
> >
> > I originally made the failure non-fatal because the system still boots
> > without the notifiers registered (and all other Arm64 Exynos SoCs
> > upstream don't register notifiers and AFAICT have broken cpu hotplug
> > and cpu idle).
> >
> > In hindsight, that seems like a mistake. I think your patch to fully
> > unwind everything in case of failure makes more sense.  See small
> > comment below about destroy_cpuhp_and_cpuidle()
>
> Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
> return any errors?

I suggest you re-read my above comment above ^^

Peter.
