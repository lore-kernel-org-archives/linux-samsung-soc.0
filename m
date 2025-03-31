Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B1121ABDC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 23:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743464469; cv=none; b=LXQjvJzdwzcKmzoaPqJF7YOuFRQdTf6K9cOhcPKBW4rb920nRR9zLFQiVKSZNwymOn8MxHRe2o/2/njAHMF7UJMvRDLIvgYOYDt580eft2Dhb8kKZJzp4ZKGgxSmQJNE1lG3J6RjNIkoL+N6VXvkb8VVHV/4wtz8ctFd30NtaX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743464469; c=relaxed/simple;
	bh=QHI4pERMKgnRMGVEKQXdrIlIz7Y7pXvElA6HvyzE4FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKJJAzUYTAoszZZfidPzm9vSb7SeBqOy6MknaITe7Lt2iKA391cq+PXeRxyy2zGrY2h9MpwXdfvJUXmWv59eYEckW3olgIceOHm7x/uu2Phvxne04z5y0EpuS9q6qYDUKHAZTqTpB7KyxPevPmUkoBqB7A94Y89dR2RY3HK/78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sIyHw6+N; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sIyHw6+N"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30db1bc464dso44467861fa.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743464462; x=1744069262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NihBRY3Qx+zlswEGaDL64cOxdG56gPbPLooVIn/eW4c=;
        b=sIyHw6+NzSnTAhkrHRImCWjxOKHlMdIHnOGgHDxVcIj4BSk4Sl/IiZUkeFZhSaGUoM
         oni3nhxS5xPIAYwc36X45LHyGl7eyZ4wGxH8aZ/U2tyaKVo5sYsrAOO7vdxFl5jaLjUj
         Q5/seRFylwoDLN65naw17Xb5g+RMBPTuNBPVYYNXyebqW7LIkGBJtdm3ovfTcdGkAGRr
         lfVOnLgWMtZiW1gyHsGQxurOmEU+3t0louqoSD/64ZC1CUMxsiRYfRvtIkMRs5W8QRH8
         1P45ECOI4LWdukixRKeIPNHfcPb+F2bmO7Otfxk/ioQXmUmbz4MEMBLoK4guZYMyHw8O
         C+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743464462; x=1744069262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NihBRY3Qx+zlswEGaDL64cOxdG56gPbPLooVIn/eW4c=;
        b=uD+XMosMMnesugjHOTqx4CaymcpaGbuxtJuEg+VA1Lx0B/WSF9t4HMOHN/occCfOVC
         13DPQBaHHW90TJLnK5ZPLOFS7TPzehYGn0Pr88Y7KMgkq41KPOpNheqEMn48eTMLXHNO
         SwW0N8qU0Zi8/57sCNRBeekmDii0bjL7s2Xbqdgi6Hi0BL8UAsGmS1mvpMokBRSoeMSA
         ej/yDvs16UZr65+z1sqVJyCvm54ZT9yL29w7+hDAjvgUwqzqn79BzgGbLTTg/qUcHwoB
         2+HyuKqcCtIgzkCVgAjw5Vk6J+10abOoiKXuOZx/LQuPzacZEw1JoW1g/BDPlC6Bv4NS
         nQCg==
X-Forwarded-Encrypted: i=1; AJvYcCVpVghE01u3cIWA5Sx6iTwRIDVhnzqO8apWzLJBZramp5nB3mOayPezOuwZmFKxdfxW580u3eysaS5Xow1NxU37tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRte5BC+WgKPoDL6grO4InhaRxMrXmmheZPAPgBw/sij76YDq9
	9rRQ5P9HD2WvkxwsIDD8QDlHPuVY+WQf6Rfp20M0yos3gw61GiBfNgWDFCCuISKTb38npeAS8i7
	njYR2Z7rqz80Y6z8kgK661fpZSCkAX9/IJ3I=
X-Gm-Gg: ASbGncu2obYyZpm/JdFV51hS+2dqRVIrOdJyTtvuwlxy9TUeAVtNjlX0FhcppguGRwf
	J9mqELv9deccvVZI7cBXEe0J7l0ko6pnSdrGk/IqN17yI4U9tkKc6N+aT0X64E+v4MP/UfQqrP7
	jaVHPLNd5VPgoHIlsXPOFA/rzTr8zNPDvU41+3n1XQ6uxAw4q90kOSvLY=
X-Google-Smtp-Source: AGHT+IF3h32uucL3xY40HmWzn3evA+K+jabkhnqDz5vygl4XMcKOz4J5P2nUFJqU9c4v2ED1QiiikYOA6qjqGVaMVCo=
X-Received: by 2002:a05:651c:199e:b0:309:1e89:8518 with SMTP id
 38308e7fff4ca-30de02ce300mr34282961fa.27.1743464461848; Mon, 31 Mar 2025
 16:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com> <20250331230034.806124-3-willmcvicker@google.com>
In-Reply-To: <20250331230034.806124-3-willmcvicker@google.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 31 Mar 2025 16:40:50 -0700
X-Gm-Features: AQ5f1JpN1uPBwlW10PDmdE0JIkoJNtbjg8pC6IakGecLKV2zkoUWAmiRsCtx93c
Message-ID: <CANDhNCrxTTkeq3ewos=07jD67s3t6rXOv=u=_qV6d+JEVoXeUA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] clocksource/drivers/exynos_mct: Don't register as
 a sched_clock on arm64
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Donghoon Yu <hoony.yu@samsung.com>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 4:00=E2=80=AFPM 'Will McVicker' via kernel-team
<kernel-team@android.com> wrote:
>
> When using the Exynos MCT as a sched_clock, accessing the timer value
> via the MCT register is extremely slow. To improve performance on Arm64
> SoCs, use the Arm architected timer instead for timekeeping.

This probably needs some further expansion to explain why we don't
want to use it for sched_clock but continue to register the MCT as a
clocksource (ie: why not disable MCT entirely?).

> Note, ARM32 SoCs don't have an architectured timer and therefore
> will continue to use the MCT timer. Detailed discussion on this topic
> can be found at [1].
>
> [1] https://lore.kernel.org/all/1400188079-21832-1-git-send-email-chirant=
an@chromium.org/

That's a pretty deep thread (more so with the duplicate messages, as
you used the "all" instead of a specific list). It might be good to
have a bit more of a summary here in the commit message, so folks
don't have to dig too deeply themselves.

> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/630817=
f7080e92c5e0216095ff52f6eb8dd00727
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clocksource/exynos_mct.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exyno=
s_mct.c
> index da09f467a6bb..05c50f2f7a7e 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -219,12 +219,12 @@ static struct clocksource mct_frc =3D {
>         .resume         =3D exynos4_frc_resume,
>  };
>
> +#if defined(CONFIG_ARM)

I'd probably suggest adding a comment here explaining why this is kept
on ARM and not on AARCH64 as well.

>  static u64 notrace exynos4_read_sched_clock(void)
>  {
>         return exynos4_read_count_32();
>  }
>
> -#if defined(CONFIG_ARM)
>  static struct delay_timer exynos4_delay_timer;
>
>  static cycles_t exynos4_read_current_timer(void)
> @@ -250,12 +250,13 @@ static int __init exynos4_clocksource_init(bool frc=
_shared)
>         exynos4_delay_timer.read_current_timer =3D &exynos4_read_current_=
timer;
>         exynos4_delay_timer.freq =3D clk_rate;
>         register_current_timer_delay(&exynos4_delay_timer);
> +
> +       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
>  #endif
>
>         if (clocksource_register_hz(&mct_frc, clk_rate))
>                 panic("%s: can't register clocksource\n", mct_frc.name);
>
> -       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
>
>         return 0;

Otherwise, this looks ok to me.

thanks
-john
