Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07EB1957FC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 May 2025 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704683; cv=none; b=lKEfr1Ob4PgQV6FCp4ekJJWgeAKNcYKawMoW0rD21xPM7Ln3dZ7Knz+TmAmQSvWob6oOaNWxyTZQUNLJNz2JBiMzx4ZQ6AvV20MXpI6F30oTIqmuAYUKS8ysR2CTqTp/3D7/iHR2aAIAoJZC4iA5ae3oxHdOUGrSZCQs8UeA/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704683; c=relaxed/simple;
	bh=mJFhbTThhLFHyqN/MbOoAtaZMkMAPKeRwEdqOwaJZ+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrbyuHWKhT4o6nmNGMRQuTHx4tA42RCKcfG8wNmrPTkXvUStZpkrxHTE7p+GbxCvmtoPCETbsuxCMu0FYJNw6achsvk9Cg0eHhJRGN0ZCvnpY9LkUqwn6NXNrapPjRzpEaxKPO7nKUJS8aLsGKt7oUuBWPPr5gURFnbnTLl9s48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kBtrIoLL; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kBtrIoLL"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72ec926e828so249825a34.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 May 2025 04:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746704681; x=1747309481; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Hp/Zx088l7ufNM7/gEglcaYvteforqJCTr5utu/Y/M=;
        b=kBtrIoLLAZO0lTnGfdXfrfkZT++uTq0sm5gKTFoX1tb9H6B4PYg5Gkj13McOvdqDRo
         l+BJOQVPIrf3o+KTCbqMEpYMNyBdf8+vTep94k1y6iIchOllfvF/K0QvidGj8OOWGjVo
         xHvew46nG0JzRgWbFzgE9wtVBF6My2vA5UhUHVPujEXLlLBmyoKaHFNzEvK26A3/aB1V
         MziMzkAv56x4J+LnZNX7ECFhW6i+f4eKo7U3lJXF29y22XBJn4ostuB8PkY7mM3G6njS
         c0fNqHwCHi8t41Sb/cB828k+mSSET7cmbOwdA+gFSm+X05sG3gulyL8VP8wY2v8ue609
         nYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704681; x=1747309481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Hp/Zx088l7ufNM7/gEglcaYvteforqJCTr5utu/Y/M=;
        b=vdWzfxH/5U7EaDO9tOxZ/7524ST9LfUIOnsYspjDgJH0EFyJ19I+x2VMsXhBJv3Aut
         9xvWUqWxKIB3/sEsexLcl79Dc2RdV7mRm2p2/EnvSw8WiPKVjF40wUOOu8z5Tqbm2g9a
         n8RTV9IBfnT7fQQBuq8At0A7OSTcQq55Z4CXacgNElVng/9+GmRK48BrVHNsB/Vqxo5S
         E3JbORy8grifsdIWEk+e9NlD3debEmorIzXLx6uS4eVqHsJooixsfUj9nNWHOpfpSMeo
         2NQKcUNTMWaP0exDGufB/ByH6NW7PgFj9BVgZFqGrg5Qbvz+fzAipNAvzwydDK+N35gU
         Y0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXE4gTo/S1bA6H4R98or9x1ZdimAK3fdmU3CMCkCwockTs9mGy5XsrCp5KXv0WizKCkifafo0iATUHu0xtmzpqB/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCeY48faiEDgoTKjg3gNNROo0Vv2dSfwW4RFnzefYFsy5wKALQ
	85I4X9GLNhUXD2SwIbdWIR/vZXAtF8NP24d70K61jAYd9ITx2BPPk1XEezg7y+mBbW2hK3fzxX4
	8AYH1bTe1GuRBrNzC4C8FZPZrVl8CMYyr6lwtkg==
X-Gm-Gg: ASbGnct6uns9QDb23RHg4P5az7dbQJNBouGA8ELeTOrm5jV4kOUehz6bhWzYAy7z7hQ
	edQKbmuk1nnXFYZGLcCYJ1RgfXAZLhxJLyyAlXYLtj7RMuo6E0x3r3wFBwPCvHkrrhpW9LXfJ4X
	QPW7i6m2juMu90/D/CIv+rCMo=
X-Google-Smtp-Source: AGHT+IHR8KYLZfRaxr/JXt1MbDStXnfYLmh12kfUK55ebtZ9Q6Un3DnFf5DzZhGiLaPUsqdPll0N8Q4dykGFdmsvGsI=
X-Received: by 2002:a05:6870:891b:b0:29e:69d9:8834 with SMTP id
 586e51a60fabf-2db5b915d6cmr3889315fac.0.1746704680699; Thu, 08 May 2025
 04:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com> <Z_6OZHYfC0bC5289@mai.linaro.org>
 <Z_7O1xi2-ZGhJ1r_@google.com> <Z_-RaYcXHR9--zXA@mai.linaro.org>
In-Reply-To: <Z_-RaYcXHR9--zXA@mai.linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 May 2025 12:44:29 +0100
X-Gm-Features: ATxdqUEvbDcAFOTGHzLMBK8svR6T90akaQxSMqcut79zelUxyv-arjNE7fwYfi0
Message-ID: <CADrjBPoePtodu-yYaFBcOMmvv0r2x+gCAdVnZypJ=G_BN4Sn-w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: William McVicker <willmcvicker@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

[..]

> > > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > >
> > > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > > source for the arch_timer.
> > >
> > > From a previous thread where there is no answer:

Aside from the timer modularization part here which is proving a bit
contentious are
you OK with queueing the other parts of this MCT series?

As I need some of the MCT driver changes to enable CPUIdle on Pixel 6 upstream.
Exiting from c2 idle state is broken for gs101 without some of these
MCT changes.

[..]

> > >
> > > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> > >
> > > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > > a module for the reasons explained in the aforementionned thread.
> > >
> > > Before this could be accepted, I really need a strong acked-by from Thomas
> >
> > Thanks for the response! I'll copy-and-paste your replies from that previous
> > thread and try to address your concerns.
> >
> > >   * the GKI approach is to have an update for the 'mainline' kernel and
> > > let the different SoC vendors deal with their drivers. I'm afraid this
> > > will prevent driver fixes to be carry on upstream because they will stay
> > > in the OoT kernels
> >
> > I can't speak for that specific thread or their intent, but I can speak to this
> > thread and our intent.
> >
> > This whole patch series is about upstreaming the downstream changes. So saying
> > this will prevent others from upstreaming changes is punishing the folks who
> > are actually trying to upstream changes. I don't think that's a fair way to
> > handle this.
> >
> > Also, rejecting this series will not prevent people from upstreaming their
> > changes, it'll just make it more unlikely because they now have to deal with
> > upstreaming more changes that were rejected in the past. That's daunting for
> > someone who doesn't do upstreaming often. I'm telling this from experience
> > dealing with SoC vendors and asking them to upstream stuff.
> >
> > With that said, let me try to address some of your technical concerns.
>
> I won't reject the series based on my opinion. Answering the technical concerns
> will prevail.
>
> Why is it needed to convert the timer into a module ?

MCT is hardware very specific to Exynos based SoCs. Forcing this
built-in is just
bloat for many other systems that will never use it.

The aim of this series is to upstream the downstream OOT code with the goal of
then switching over to the upstream version of the driver.

I agree with your points though that we should be sure the timer framework can
handle this, and we aren't introducing subtle bugs.

>
> > > * the core code may not be prepared for that, so loading / unloading
> > > the modules with active timers may result into some issues
> >
> > We had the same concern for irqchip drivers. We can easily disable unloading
> > for these clocksource modules just like we did for irqchip by making them
> > permanent modules.
>
> In the clockevent / clocksource initialization process, depending on the
> platform, some are needed very early and other can be loaded later.
>
> For example, the usual configuration is the architected timers are initialized
> very early, then the external timer is loaded a bit later. And when this one is
> loaded it does not take over the architected timers. It acts as a "broadcast"
> timer to program the next timer event when the current CPU is going to an idle
> state where the local timer is stopped.
>
> Other cases are the architected timers are not desired and the 'external' timer
> is used in place when it is loaded with a higher rating. Some configuration can
> mimic local timers by settting a per CPU timer.
>
> Some platforms could be without the architected timers, so the 'external' timer
> is used.
>
> Let's imagine the system started, the timers are running and then we load a
> module with a timer replacing the current ones. Does it work well ?
>
> Are we sure, the timer modularization is compatible with all the timer use cases ?

It's a good question. We can say it's been used as a module on
multiple generations
of Pixel devices in production without issues. Whether that covers all
timer use cases
I can't say.

>
> > > * it may end up with some interactions with cpuidle at boot time and
> > > the broadcast timer
> >
> > If I'm understanding this correctly, no driver is guaranteed to probe at
> > initialization time regardless of whether it is built-in or a module. Taking
> > a look at the other clocksource drivers, I found that the following drivers are
> > all calling `clocksource_register_hz()` and `clockevents_config_and_register()`
> > at probe time.
> >
> >   timer-sun5i.c
> >   sh_tmu.c
> >   sh_cmt.c
> >   timer-tegra186.c
> >   timer-stm32-lp.c (only calls clockevents_config_and_register())
> >
> > So this concern is unrelated to building these drivers are modules. Please let
> > me know if I'm missing something here.
>
> We would have to check each platform individually to answer this question.
>
> The interaction between cpuidle and the timer module is about not having a
> broadcast timer when cpuidle initializes and then having it later when the
> module is loaded. Did you check the deep idle states are used after loading the
> module ?

For gs101 / Oriole deep idle states are used after loading the module as if the
MCT timer *isn't* used then the CPU can't wake up from c2 and eventually there
are no CPUs left leading to a hang.

>
> The discussion is not about only the Exynos MCT but as you are not the first
> one asking to convert the timer driver to a module, we should check what could
> be the impact on the time framework and the system in general.
>
> Others proposed to convert to module and I asked to investigate the impact.
> Nobody came back with a clear answer and there is no feedback from Thomas.

Hopefully the above answers go a little bit towards giving a degree of
confidence
that this is a safe change :)

regards,

Peter.
