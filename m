Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7517221D87
	for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Jul 2025 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751989919; cv=none; b=HjKegF+0PplzMtQ74x9pxL+SwjRAZ68OtsIv9TcFjIGVH6yzECZYwG2b/OEmxzCf6zLGNsCxPK+3yiwvpyzCAb0W+/dRAue0Q/2ULSGufjEAWnB46hSdLqycBUocwC+sbc2Ke6yScXFZJiAnYU7xRJNrKoYjv7ckzql1aGqAoKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751989919; c=relaxed/simple;
	bh=voeyQ0MDCj/Z+MBpJSQMfnqdjg3SDuJuOUlR1jBdKNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxlWtpQBN5LrZdEfo9sBLWKcYIeeLIEZ6B6RvlKsC6i8JOs6yUEEWzkkhsb9dTqKkpOl/6m90mmjB/Ou//u7xyrnGZ7ZczBLWgYHA64EoQ5vIzDOUYO67xlXQRiFOzoD9ChiVckGnq7mSdTUO6F01N5jFMFy0L4mtAdo1FecgWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLxp1LHt; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLxp1LHt"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ea58f008e9so4375826fac.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Jul 2025 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751989917; x=1752594717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRbXwJ4vnB/zDj0rM1xWnMPZ+mVdznTRW5M3IQISchU=;
        b=sLxp1LHtVCsC8ByL3XGe6TwJXddHBTTSCk7qJ1rA4sReZqHCXz0VEX1zTcmMHh2TY6
         qFMjZcd5sZMgY3oapnw4wlj4/PbwEcvdQVLBpv7Ds60s/TGPGEugY2UZR6u3IHIWjDjT
         8SBNRZ1FNHZIdda1cHrmVKmG8anpQVSJD+7vgwMxEhWlS5EtqUe2Q6TLlRJCQKWN3PZE
         j1P15EKKeXD33EniCzufaGDcfY/HEBCu3wTiSC4aQ9/1g6VbVSgNY7KVhpWOvGS5eanp
         obpJIUuy9FbYbzIrNZrIB+ivCH/GJsUrcV8keB4g0LmBe9ZiY0dUkC0DE4p0Tf2F8Smz
         o7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751989917; x=1752594717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRbXwJ4vnB/zDj0rM1xWnMPZ+mVdznTRW5M3IQISchU=;
        b=PGZ/FpH5q2bq7fWgbXDAq8n+b/7hwaboHrW1bd6tGrtVfx3uqMuAZ76GCanue9i0jl
         Q6RXC/XqbU1aMQaGyzOhyXWwGyGKqoqUsl03XvrddcETnsmljVTy83KOdWcpD9XUdwh4
         6gX4338auvKLRk880GdClWcXbv8cGwFuv4i3gjTzpJH0qQ7Tu76iGyiFWmkLFoshaghP
         bPGGMn/1OgrqewcKJ+7HXroPUad11G2NxZ/6WGfTighRMYrmI7FC9MiKu1wz99uS7sYM
         Y4sDrUOU3SfznFdPN2zTJWrcwkXrRkZEDSekrnTHWY0ciMy0iRU6c+1hpXBGy4Msy0WM
         6sVw==
X-Forwarded-Encrypted: i=1; AJvYcCW4rI0m2b8c5cyIQxBNA5WKNWSvVUGJtxWshoNId3Mhy44Iuv7dfVxAExvo4fKSLKoV8YEw3FWp2sAB9C5mXk12Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVhDF5JirDngj7DBsRWdVpIFdAWwIMLTF/nhi4fSMfVwXZdgL7
	VDJUTcuyTsQjuOZZJKPW/k6wq5miw5+SIjkWHI5RF6tamg8FhfdD51psf4KyoorMenAQgdYEO0n
	Cz3OFRGUGrTUo/COnyjNODNlH3et7iE1dczC2ZOp/hA==
X-Gm-Gg: ASbGnctN3TsvufPODGtEyj1sZ3ZKuo5XbkF0shy20biNoqC3nLHW4yl9gF/Awr9m31g
	YNUlWOu9ju4wHtqwWUK+KMfin76bkiyGkfELYvvc+G3ro15PADoFeQBKqQtlso5SZyV7/LO7ndu
	An8+pCxSWxPkax4uL3u9i3MGXtDrKRgUEOe2GOzNikO7PD
X-Google-Smtp-Source: AGHT+IGayKsL09US/aG4BWXfDqvwdj7IbiR5yylTrdq3b4SPkY53vMlQ75BaToWu3g2R7Y7GTXTocA55aVVbeeWQnIw=
X-Received: by 2002:a05:6870:85cd:b0:2ea:7101:7dc1 with SMTP id
 586e51a60fabf-2f796d387ddmr13310705fac.33.1751989916214; Tue, 08 Jul 2025
 08:51:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
 <91a9d4dbe5504c493856ef81b30d98e7da925ac0.camel@linaro.org> <232267bf-d226-43df-bd4f-5977706176a2@kernel.org>
In-Reply-To: <232267bf-d226-43df-bd4f-5977706176a2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 8 Jul 2025 16:51:43 +0100
X-Gm-Features: Ac12FXyQtnEeVlAK_PBT_PKHrE4fR7brNoVWCLA4QssHna082hO6RsgDRrOaQo8
Message-ID: <CADrjBPp5ndaEs=s-bZOyYnH21r=b2BoROC7+zV=dH_O2Pwxvmw@mail.gmail.com>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, 3 Jul 2025 at 11:19, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 03/07/2025 12:12, Andr=C3=A9 Draszik wrote:
> > Thanks Pete for your patch!
> >
> > On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> >> Register cpu pm notifiers for gs101 which call the
> >> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> >> hint. This is required to actually enter the C2 idle state.
> >>
> >> A couple of corner cases are handled, namely when the system is reboot=
ing
> >> or suspending we ignore the request. Additionally the request is ignor=
ed if
> >> the CPU is in CPU hot plug. Some common code is refactored so that it =
can
> >> be called from both the CPU hot plug callback and CPU PM notifier taki=
ng
> >> into account that CPU PM notifiers are called with IRQs disabled where=
as
> >> CPU hotplug callbacks aren't.
> >>
> >> Note: this patch has a runtime dependency on adding 'local-timer-stop'=
 dt
> >> property to the CPU nodes. This informs the time framework to switch t=
o a
> >> broadcast timer as the local timer will be shutdown. Without that DT
> >> property specified the system hangs in early boot with this patch appl=
ied.
> >>
> >> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >
> > With this applied, I see the following during boot:
> >
> > [    1.841304][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    1.841422][    T0] [ BUG: Invalid wait context ]
> > [    1.841550][    T0] 6.16.0-rc4-next-20250702+ #54 Tainted: G     U  =
        T
> > [    1.841727][    T0] -----------------------------
> > [    1.841844][    T0] swapper/0/0 is trying to lock:
> > [    1.841965][    T0] ffff000800ee84b8 (&pmu_context->cpupm_lock){....=
}-{3:3}
> > [    1.842001][    T0] , at: gs101_cpu_pm_notify_callback+0x48/0x100
> > [    1.842309][    T0] other info that might help us debug this:
> > [    1.842613][    T0] context-{5:5}
> > [    1.842987][    T0] 1 lock held by swapper/0/0:
> > [    1.843442][    T0]  #0:
> > [    1.843859][    T0] ffffafe9d8f1f100
> > [    1.844282][    T0]  (
> > [    1.844618][    T0] cpu_pm_notifier.lock
> > [    1.844980][    T0] ){....}-{2:2}, at: cpu_pm_enter+0x30/0x88
> > [    1.845340][    T0] stack backtrace:
> > [    1.845855][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G =
    U          T   6.16.0-rc4-next-20250702+ #54 PREEMPT
> > [    1.845878][    T0] Tainted: [U]=3DUSER, [T]=3DRANDSTRUCT
> > [    1.845884][    T0] Hardware name: Oriole (DT)
> > [    1.845897][    T0] Call trace:
> > [    1.845909][    T0]  show_stack+0x24/0x38 (C)
> > [    1.845934][    T0]  dump_stack_lvl+0x40/0xc0
> > [    1.845949][    T0]  dump_stack+0x18/0x24
> > [    1.845956][    T0]  __lock_acquire+0xc68/0xd90
> > [    1.845976][    T0]  lock_acquire+0x14c/0x2b8
> > [    1.845985][    T0]  _raw_spin_lock+0x54/0x78
> > [    1.846011][    T0]  gs101_cpu_pm_notify_callback+0x48/0x100
> > [    1.846021][    T0]  notifier_call_chain+0xb0/0x198
> > [    1.846046][    T0]  raw_notifier_call_chain_robust+0x50/0xb0
> > [    1.846053][    T0]  cpu_pm_enter+0x4c/0x88
> > [    1.846063][    T0]  psci_enter_idle_state+0x2c/0x70
> > [    1.846078][    T0]  cpuidle_enter_state+0x14c/0x4c0
> > [    1.846097][    T0]  cpuidle_enter+0x44/0x68
> > [    1.846121][    T0]  do_idle+0x1f0/0x2a8
> > [    1.846142][    T0]  cpu_startup_entry+0x40/0x50
> > [    1.846152][    T0]  rest_init+0x1c4/0x1d0
> > [    1.846161][    T0]  start_kernel+0x358/0x438
> > [    1.846181][    T0]  __primary_switched+0x88/0x98
>
> Thanks for the report. Probably such code should be always tested with
> lock debugging options enabled, e.g.:
> https://github.com/krzk/tools/blob/master/linux/build.sh#L845

Thanks for the tip, I will do it for future versions.

Peter
