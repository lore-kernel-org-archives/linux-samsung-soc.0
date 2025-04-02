Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1EDFC0A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 01:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743557977; cv=none; b=swvc0TRxOcn2n1bPGkxo8OEKF2XNkWDIUqlc/yP/EVig5UJgkHd08Wj8o6f5+qnknPCNVPDQVYDJJNYc6U53bHnvDRZ6N4h1ze7tml7C3t/WLrAgMMp2rnPp92mDjiYTmNfGS1AMjMT4DXv4uWCcKNq8Cdk5fo4/1sOjaTsd0fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743557977; c=relaxed/simple;
	bh=4jOlb4ACh1sxX01IRIAhnIypJo4e6WZooU1luTyg1wk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=Shlc0C6M9ebEUPK+A/Z0uasEjhIJNpjNcHaTEGOXNV9zFAYdMXFhLqS7eRbyiuHiTNy2DbZLXf2+PBwob+0QpnWG4Gp9GcVsYj8y8/jDmIjNUz9HrWrk8UZtWyl+n+9Ul0jVC/AtXpcxM0U+DQLLWKIyCCtGncLse9bmjOE1i7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lUSdWcAj; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lUSdWcAj"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250402013933epoutp025032f8c085159ccc3b71fa829c1f3754~yXL0okMRN0597005970epoutp02S
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 01:39:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250402013933epoutp025032f8c085159ccc3b71fa829c1f3754~yXL0okMRN0597005970epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743557973;
	bh=eVjNkH/V/fv1Y45uPpNZVysJT11oKFePxebtI4FVQb4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lUSdWcAjH6lkI9zgwx0zmjLt2pwDM5AQDK2n3KOnfDQ1tk+0WnkWb3Bzz3BZlWH2h
	 kBkMz4jL8b/SSZzHukoyOgYwR+JA85yLfNwlxwGA8CDcGamqeyL9tNt3SJR69hsLiN
	 /5CXZoxqreq19qxALmHmNkPgfZD41cGJApBi9rcg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250402013932epcas2p232ccdd795d488406778169393bc21e9c~yXLz87yQg2124221242epcas2p2m;
	Wed,  2 Apr 2025 01:39:32 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZS6wz6bdrz6B9mJ; Wed,  2 Apr
	2025 01:39:31 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	BC.94.10159.3559CE76; Wed,  2 Apr 2025 10:39:31 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250402013931epcas2p31d16291742c84025c363b3783b8ac18e~yXLy7VQ151103811038epcas2p3Z;
	Wed,  2 Apr 2025 01:39:31 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250402013931epsmtrp2131d2f748c2191a3ab6278be721eba4b~yXLy6GJXg3008130081epsmtrp2Q;
	Wed,  2 Apr 2025 01:39:31 +0000 (GMT)
X-AuditID: b6c32a46-9fefd700000027af-e9-67ec9553e5d8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	82.A7.08766.3559CE76; Wed,  2 Apr 2025 10:39:31 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250402013931epsmtip2f0edf5faf9a071f540f43c5c9feea055~yXLypyyek1331713317epsmtip2B;
	Wed,  2 Apr 2025 01:39:30 +0000 (GMT)
Date: Wed, 2 Apr 2025 10:43:46 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: William McVicker <willmcvicker@google.com>
Cc: John Stultz <jstultz@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, =?iso-8859-1?Q?Andr=E9?= Draszik
	<andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Daniel
	Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Donghoon Yu
	<hoony.yu@samsung.com>, Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 2/6] clocksource/drivers/exynos_mct: Don't register
 as a sched_clock on arm64
Message-ID: <Z+yWUj5ZLftPrbht@perf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z-wZV3RCXKPzpZGl@google.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUxTVxT39rWvLVvN43N3iNDVDcOnLVJ6WcSBMNK4ZWGTRLNlwgt9tIzS
	Nv1YmJuIyiiCIZBJJoUBA+ekAe0KAuPLURDZspQBhmmnKENQkMEoYJYpsNaHC//9zu+c37m/
	c8+9HMxrEffnZKn0lFZFKgW4B7OtPyQm4lDFvFx4xb4X3a9pw1HrXAsTLV48C1BTj52BapZ3
	otoBOwvdaH7MQs+GfsBRR7sPmjVN4Gh42MJG1qlxFhrrrMbR+eFeBrKcX2eije4ONiq2reGo
	xVqBIafjKCq4I0Zm5wZADT852fF+0rauNpa0qaYJSOusBqnVfAaX3hnvxqULdjtb2nLhhLS0
	1Qyky9bAFO6H2fsUFCmjtHxKlaGWZankcYJ3DqUlpoljhKIIUSySCPgqMoeKEyS9mxKRnKV0
	zSfgf0oqDS4qhdTpBHv279OqDXqKr1Dr9HECSiNTaiSaSB2ZozOo5JEqSv+mSCiMErsK07MV
	1/pm2Zra3bld9iFGPhgIKgZcDiSi4b2xa3gx8OB4ER0A1p+sZtGBE0D7yAaDDp4A2Gw7zX4h
	aV+9zqYTPQDeGi4BdDAJoOO7MlczDodJvA6rl4RuAU5EwLahdeCmfYhI+OzLXHc5RrTgcHBy
	nuHmvYlMODEa6C7nEbvg+KKZRWNP+HPlA6Ybc4lQWFjS+NwqJIxcWGTuZNGGkuCpi2c3zXnD
	uRutm9gfLi/04DTWwfx7DowWFwD4y++PMDqxF5pmjMCNMUIB+8/0st2GoMvFgINJ09thUf/a
	Js2DRYVetDIY/nvOAmgcALsaLm12lMKZh0ubF9fEgCOOaWYZCDRtmce05TSTqy1GhMArnXto
	OgievlqF0fQO+P06Z0tFHcDNwI/S6HLklC5KE/X/rjPUOVbw/OWHJneAc3/9HWkDDA6wAcjB
	BD68I6uzci+ejPzsGKVVp2kNSkpnA2LXlsoxf98MtevrqPRpouhYYXRMjEgSJRZKBK/wbEvT
	ci9CTuqpbIrSUNoXOgaH65/POG5zpMbxybWZhPG+qQ9mSm6PrH9TnljdfDA2yCPn8mu5VaO7
	3veDX2xPndaITE9lPYMGf42z7uSP9ZfIE2thxrybJbvj8yqPPWRI+AFvKxIza5s/KRpZlfW/
	NF/mW+Bd3uBZIbxuGby5GqwokV8d725tP5De3nv3cJ9PzcFXM0uVTwZi3qifDA8/PHY0/StJ
	ob4Vdh7Z9l7D7ctvHY/fYOdBy8qAfM7XKh695dH4sSTsW+yR56k15dSK7WVjZS3P+NFcQtVO
	clBv4j4dXKlPTYLBv31NfV46UtX4IF9VsA3yYpN/9cD/YO1Iflwb3vNP+wS0XPjz7kJA6f6m
	hJCwdCP3voCpU5CiUEyrI/8DjLkHzYIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsWy7bCSvG7w1DfpBi//Clo8mLeNzWLLq80s
	Fu+X9TBarNl7jsli3mdZi/lHzrFaHF/7mtXiz4mNbBY7totYvJx1j83i/PkN7BabHl9jtbi8
	aw6bxYzz+5gsNsz4x2Lxf88OdouuQ3/ZLDZvmsps8elWnEXLHVOLVZ/+M1osPvCJ3UHMY9vu
	bawea+atYfRYsKnUY9OqTjaPO9f2sHm8O3eO3WPzknqPvi2rGD0+b5IL4IzisklJzcksSy3S
	t0vgyngw4xpjwUGViiUz/jM2MDbJdjFyckgImEhs/3qUvYuRi0NIYDejxJdF7awQCRmJ2ysv
	Q9nCEvdbjrBCFN1nlDh84zRbFyMHB4uAisScjwYgNWwCuhLbTvxjBAmLCOhJ/GmtAClnFtjP
	JtHV18MEUiMskCYxcdoZRhCbV0BZ4tr7VVAz1zBJPF/4lQkiIShxcuYTFhCbWUBd4s+8S8wg
	Q5kFpCWW/+OACMtLNG+dzQxicwpoSbR1r2SbwCg4C0n3LCTdsxC6ZyHpXsDIsopRMrWgODc9
	t9iwwDAvtVyvODG3uDQvXS85P3cTIziatTR3MG5f9UHvECMTB+MhRgkOZiUR3oivL9OFeFMS
	K6tSi/Lji0pzUosPMUpzsCiJ84q/6E0REkhPLEnNTk0tSC2CyTJxcEo1MO2fLckYmt4kzbZR
	/NN/zwWpAaoMzjHHfutk/T+2zS1pw/env0sfR9t9X27XvfvHjgut/U3FW0Qjwxx71iueLVcJ
	1WaYKL094MbHo/NzHL7f1Xh3qM+063YBM6PTrJnVcyLuOyzdvUNFqMEp5MEE+9keW1f2dfQ9
	/fP94Au+yin1omZSlo1JC/dbBq6WvCqyMWYhoxlLqOqBCc/M4mbudNdZn8126vn/8LjHKf8/
	GKZcZ9UQOKS5vWvvpLmNjfosfBm1zZkuC1qZz91f3blaf4a9YIxnXBXLwQk95b5Niq5TjzRs
	iF/mM1muUHFBwe26CZPXXTBiVnyRxjP5HFOAwvfiS9x8LP7H/WqVeptTlFiKMxINtZiLihMB
	zitcEVUDAAA=
X-CMS-MailID: 20250402013931epcas2p31d16291742c84025c363b3783b8ac18e
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_73402_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250401165039epcas2p16b954647b0c1c79e48450ad91d19f525
References: <20250331230034.806124-1-willmcvicker@google.com>
	<20250331230034.806124-3-willmcvicker@google.com>
	<CANDhNCrxTTkeq3ewos=07jD67s3t6rXOv=u=_qV6d+JEVoXeUA@mail.gmail.com>
	<CGME20250401165039epcas2p16b954647b0c1c79e48450ad91d19f525@epcas2p1.samsung.com>
	<Z-wZV3RCXKPzpZGl@google.com>

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_73402_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

Hi Will.

I'm really glad to see our work on Pixel being upstreamed.

On Tue, Apr 01, 2025 at 09:50:31AM -0700, William McVicker wrote:
> On 03/31/2025, John Stultz wrote:
> > On Mon, Mar 31, 2025 at 4:00 PM 'Will McVicker' via kernel-team
> > <kernel-team@android.com> wrote:
> > >
> > > When using the Exynos MCT as a sched_clock, accessing the timer value
> > > via the MCT register is extremely slow. To improve performance on Arm64
> > > SoCs, use the Arm architected timer instead for timekeeping.
> > 
> > This probably needs some further expansion to explain why we don't
> > want to use it for sched_clock but continue to register the MCT as a
> > clocksource (ie: why not disable MCT entirely?).
> 
> Using the MCT as a sched_clock was originally added for Exynos4 SoCs to improve
> the gettimeofday() syscalls on ChromeOS. For ARM32 this is the best they can do
> without the Arm architected timer. ChromeOS perf data can be found in [1,2]
> 
> [1] https://lore.kernel.org/linux-samsung-soc/CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com/
> [2] https://lore.kernel.org/linux-samsung-soc/CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com/
> 
> I think it's valid to still register the MCT as a clocksource to make it
> available in case someone decides they want to use it, but by default it
> doesn't make sense to use it as the default clocksource on Exynos-based ARM64
> systems with arch_timer support. However, we can't disable the Exynos MCT
> entirely on ARM64 because we need it as the wakeup source for the arch_timer to
> support waking up from the "c2" idle state, which is discussed in [3].
> 
> [3] https://lore.kernel.org/linux-arm-kernel/20210608154341.10794-1-will@kernel.org/
> 

Exactly right.

> > 
> > > Note, ARM32 SoCs don't have an architectured timer and therefore
> > > will continue to use the MCT timer. Detailed discussion on this topic
> > > can be found at [1].
> > >
> > > [1] https://lore.kernel.org/all/1400188079-21832-1-git-send-email-chirantan@chromium.org/
> > 
> > That's a pretty deep thread (more so with the duplicate messages, as
> > you used the "all" instead of a specific list). It might be good to
> > have a bit more of a summary here in the commit message, so folks
> > don't have to dig too deeply themselves.
> 
> Ah, sorry about the bad link. The above points should be a good summary of that
> conversation with regards to this patch.
> 
> > 
> > > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > > [Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727
> > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > ---
> > >  drivers/clocksource/exynos_mct.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> > > index da09f467a6bb..05c50f2f7a7e 100644
> > > --- a/drivers/clocksource/exynos_mct.c
> > > +++ b/drivers/clocksource/exynos_mct.c
> > > @@ -219,12 +219,12 @@ static struct clocksource mct_frc = {
> > >         .resume         = exynos4_frc_resume,
> > >  };
> > >
> > > +#if defined(CONFIG_ARM)
> > 
> > I'd probably suggest adding a comment here explaining why this is kept
> > on ARM and not on AARCH64 as well.
> 
> Sure, I can add my comments above here in v2.
> 
> > 
> > >  static u64 notrace exynos4_read_sched_clock(void)
> > >  {
> > >         return exynos4_read_count_32();
> > >  }
> > >
> > > -#if defined(CONFIG_ARM)
> > >  static struct delay_timer exynos4_delay_timer;
> > >
> > >  static cycles_t exynos4_read_current_timer(void)
> > > @@ -250,12 +250,13 @@ static int __init exynos4_clocksource_init(bool frc_shared)
> > >         exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
> > >         exynos4_delay_timer.freq = clk_rate;
> > >         register_current_timer_delay(&exynos4_delay_timer);
> > > +
> > > +       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
> > >  #endif
> > >
> > >         if (clocksource_register_hz(&mct_frc, clk_rate))
> > >                 panic("%s: can't register clocksource\n", mct_frc.name);
> > >
> > > -       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
> > >
> > >         return 0;
> > 
> > Otherwise, this looks ok to me.
> > 
> > thanks
> > -john
> 
> Thanks for taking the time to review!
> 
> Regards,
> Will
> 

Along with John's comment,
Reviewed-by:: Youngmin Nam <youngmin.nam@samsung.com>

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_73402_
Content-Type: text/plain; charset="utf-8"


------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_73402_--
