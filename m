Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AEB2D7809
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Jul 2025 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537562; cv=none; b=ORipqkRVqIOfRfGOB3qpOGHpc1EMZEkG8wzA4G2+MIdlZOYbX15UTZj7p6HdIxszhn7Gy43hRZPGOBgTW2mcZ4Jp7qKf8syzh+18xqwpfPNQcroALqyCroiogWSJToOACZll/mMQhvdyteW7U0qhHwmpZnHsCcojKV3scLSttF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537562; c=relaxed/simple;
	bh=qYy7HJ+rnW5C2fOTnpYlbi1OPTddvrialPACcgAVxjk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GlC85dBE8ampdyqhrpset1vpu09s7JrF0XQRhYVQq6vWhbJ2ibUlNFr3iDM2CxJw/U1pTb/2DQzvYs0uWKWGa3ib6jlZO3kuu5DWVqTmcUpxLfx5V5l3446VpphfR8GmLLjr2w/7UqBU3IPhrt/hWzMuoAK5DjhlDevhoxh5o8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8iZeQQD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8iZeQQD"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so65880155e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Jul 2025 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751537556; x=1752142356; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zsy3o+a5LwN2jUmSXKdFxPZ/Sf0ebBo2DlMLfM6qA2Y=;
        b=g8iZeQQDpNIv80JKOYLmC+xcjzPDPVwR39EboEmeoLqW85zjPJ8RYJ2WqV7dyKJQBw
         YuYVQO+3cghOYPx36QC0Pj6Nl5PjZOwhU6ATssd7x8qTDVR469brD0d6yURR7hUGXaC7
         5o7emONuIiiMbjL/v7IUUFiFoLquB94/evi5fVmYVb+1SpxzerAtC+ZcQlOKr04pxfv9
         gYfm2e0xwaYHZTjTBSFPtdMXXqrOGfjL/jl0IvlIyq/sMGL39NfqJAmQO/rNtNnj/fyv
         dU1/BqANFQOFUohve7YtSmbs2pvXKuB1iWU0myPs/gY46hiT1lmGi4KfH+4B01CoqD6I
         FKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537556; x=1752142356;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsy3o+a5LwN2jUmSXKdFxPZ/Sf0ebBo2DlMLfM6qA2Y=;
        b=WtOAN0ob3CSkKoVWLbrsNglRRPy5sVD7mduVORDHCzvR/ozY1EWz1ViEJbUF4Og+fz
         0UKnsyVWBz3Jkh31YODZ/bn/pwfFkNRUy6aFEU8bNQ669nouZ66dA6ZKPU8yNPwRgIEn
         VCSpJMT1wClIYSbsC7pgcWbG3t0hAMX1jwXKOVFb6sKhhFgJGvwVowt5xalaGRZo+a4u
         IRodZp3vThrfXEC4AzswdTzeFvNHbV48jcjahIKaVQwVqMj1n+5EusTfw8t9Y1dPVEA6
         yv7ovpnAzCPHO5U+eQ7fkU+IRjyZFe2SYqnsnLbqHrZdyb86x5u4Hj9A3nQ5cF+aJTRG
         CN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHgIbhiiJdCURdIc3afPdQXkMaBPJGOo8LC4RUt7lY/OeJWhpb1+e5jJzzl1la+KzGZL0SUUHFcDVjfTIZ5HDx9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8oUCw6MeJ0HFSTIS6RUgxp07vasN24/RkU4ws6vJ/Xfd/cYau
	L3Gqz+KXnoLaV7waAAqwDabL1z+9/9uybHhuMhxmjHiOuCBbSjS5KweYPZ9bbxNO0Pg=
X-Gm-Gg: ASbGncvy4qMZDqHlRHI4mOa35r7UopxSSQli9km5xv6+VFnKSYsOOqS5VHRhkusmcns
	oa0PMJWVWGKiV6wTCwVwB4qpUdDsUecczzkXsRhlAuGsJUj6jZleJFzqineMtV488oTcbprhvHC
	fRRvgEqahfj8xXFcGHTT5Jby4jjunNHvRguRfvdFZczlrG0SXrzQ2FMfYdiOQ9BJhvx0v2RKngd
	PMfaeap+ctekLRgCZvkJ+xja4JlJN/tFBRwaJimlCq+CKxW5yn2i0smKup/ziKpCPk/w4v06HCp
	COmpx9vywu1AiSl2MgMUln7JDgFiN6VrNdZZTGoXd/5NvTvq6RHubM7FwXEeXy4Ggw==
X-Google-Smtp-Source: AGHT+IGppM52segUxgIPv47hrycPAIwz2l2DAMekCZpVZr+AEqBxKXhYAJco74IOHWkjBbVxw0/FcQ==
X-Received: by 2002:a05:600c:3b01:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-454a3732ff3mr81884355e9.30.1751537556220;
        Thu, 03 Jul 2025 03:12:36 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e591d7sm18532443f8f.67.2025.07.03.03.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:12:35 -0700 (PDT)
Message-ID: <91a9d4dbe5504c493856ef81b30d98e7da925ac0.camel@linaro.org>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Date: Thu, 03 Jul 2025 11:12:34 +0100
In-Reply-To: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks Pete for your patch!

On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> Register cpu pm notifiers for gs101 which call the
> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> hint. This is required to actually enter the C2 idle state.
>=20
> A couple of corner cases are handled, namely when the system is rebooting
> or suspending we ignore the request. Additionally the request is ignored =
if
> the CPU is in CPU hot plug. Some common code is refactored so that it can
> be called from both the CPU hot plug callback and CPU PM notifier taking
> into account that CPU PM notifiers are called with IRQs disabled whereas
> CPU hotplug callbacks aren't.
>=20
> Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> property to the CPU nodes. This informs the time framework to switch to a
> broadcast timer as the local timer will be shutdown. Without that DT
> property specified the system hangs in early boot with this patch applied=
.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

With this applied, I see the following during boot:

[    1.841304][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    1.841422][    T0] [ BUG: Invalid wait context ]
[    1.841550][    T0] 6.16.0-rc4-next-20250702+ #54 Tainted: G     U      =
    T =20
[    1.841727][    T0] -----------------------------
[    1.841844][    T0] swapper/0/0 is trying to lock:
[    1.841965][    T0] ffff000800ee84b8 (&pmu_context->cpupm_lock){....}-{3=
:3}
[    1.842001][    T0] , at: gs101_cpu_pm_notify_callback+0x48/0x100
[    1.842309][    T0] other info that might help us debug this:
[    1.842613][    T0] context-{5:5}
[    1.842987][    T0] 1 lock held by swapper/0/0:
[    1.843442][    T0]  #0:=20
[    1.843859][    T0] ffffafe9d8f1f100
[    1.844282][    T0]  (
[    1.844618][    T0] cpu_pm_notifier.lock
[    1.844980][    T0] ){....}-{2:2}, at: cpu_pm_enter+0x30/0x88
[    1.845340][    T0] stack backtrace:
[    1.845855][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G     =
U          T   6.16.0-rc4-next-20250702+ #54 PREEMPT=20
[    1.845878][    T0] Tainted: [U]=3DUSER, [T]=3DRANDSTRUCT
[    1.845884][    T0] Hardware name: Oriole (DT)
[    1.845897][    T0] Call trace:
[    1.845909][    T0]  show_stack+0x24/0x38 (C)
[    1.845934][    T0]  dump_stack_lvl+0x40/0xc0
[    1.845949][    T0]  dump_stack+0x18/0x24
[    1.845956][    T0]  __lock_acquire+0xc68/0xd90
[    1.845976][    T0]  lock_acquire+0x14c/0x2b8
[    1.845985][    T0]  _raw_spin_lock+0x54/0x78
[    1.846011][    T0]  gs101_cpu_pm_notify_callback+0x48/0x100
[    1.846021][    T0]  notifier_call_chain+0xb0/0x198
[    1.846046][    T0]  raw_notifier_call_chain_robust+0x50/0xb0
[    1.846053][    T0]  cpu_pm_enter+0x4c/0x88
[    1.846063][    T0]  psci_enter_idle_state+0x2c/0x70
[    1.846078][    T0]  cpuidle_enter_state+0x14c/0x4c0
[    1.846097][    T0]  cpuidle_enter+0x44/0x68
[    1.846121][    T0]  do_idle+0x1f0/0x2a8
[    1.846142][    T0]  cpu_startup_entry+0x40/0x50
[    1.846152][    T0]  rest_init+0x1c4/0x1d0
[    1.846161][    T0]  start_kernel+0x358/0x438
[    1.846181][    T0]  __primary_switched+0x88/0x98

>=20
> [...]
>=20
> @@ -444,6 +586,18 @@ static int exynos_pmu_probe(struct platform_device *=
pdev)
> =C2=A0			 */
> =C2=A0			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
> =C2=A0		} else {
> +			pmu_context->hotplug_ing =3D
> +				devm_kmalloc_array(dev, num_possible_cpus(),
> +						=C2=A0=C2=A0 sizeof(bool), GFP_KERNEL);

I haven't done a full review, but sizeof(bool) should be rewritten as
sizeof(*pmu_context->hotplug_ing)

> [...]
> =C2=A0
> @@ -471,10 +628,32 @@ static int exynos_pmu_probe(struct platform_device =
*pdev)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +#ifdef CONFIG_PM_SLEEP
> +static int exynos_cpupm_suspend_noirq(struct device *dev)
> +{
> +	atomic_set(&pmu_context->sys_suspended, 1);
> +	return 0;
> +}
> +
> +static int exynos_cpupm_resume_noirq(struct device *dev)
> +{
> +	atomic_set(&pmu_context->sys_suspended, 0);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops cpupm_pm_ops =3D {
> +	.suspend_noirq =3D exynos_cpupm_suspend_noirq,
> +	.resume_noirq =3D exynos_cpupm_resume_noirq,
> +};
> +#endif
> +
> =C2=A0static struct platform_driver exynos_pmu_driver =3D {
> =C2=A0	.driver=C2=A0 =3D {
> =C2=A0		.name=C2=A0=C2=A0 =3D "exynos-pmu",
> =C2=A0		.of_match_table =3D exynos_pmu_of_device_ids,
> +#ifdef CONFIG_PM_SLEEP
> +		.pm =3D &cpupm_pm_ops,
> +#endif

This can use pm_sleep_ptr() instead to avoid the ifdef.

Cheers,
Andre'
