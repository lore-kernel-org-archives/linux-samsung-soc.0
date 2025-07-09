Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98EA289811
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055485; cv=none; b=JDS2ZGWMoMFR3hWdQf7Eh58AlCo+vyKOlhbRH64o16LWF42LG+1gx9nU8wa/yRUhCrPxFheayJxUuNRmWoOKpmaSs0KPG021TuVMe2JXtTjLJdZCCh0jm/jod4twJo7s/LH55v22AZeTVwj63B4e1ML7iSNmaOT+iCYJN4H7Oh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055485; c=relaxed/simple;
	bh=/8y/nNdfDj5bopu6125/NYN6hTKvH5RpqCgiIhx/xy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JIMmlW82FoOeqYjpS7akgzuFuGssYWqFHpOax6+DSpwGGGElSzbWNDEfk09r3a07HBfFHs5s+2NXMROaOZK7ASZAtuM2JkZK129atzIkTwQR0pLeYOfzDaK87C3vA/2BXhMEJu3emPHjA9Zkp9QFSMNO+IpYN3MJ/L2vqv3+ZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k0QOb/7s; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k0QOb/7s"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60402c94319so2927816eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2025 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055483; x=1752660283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+bfGFW4DtSQcr5Yecq9KqtEiX+ZRp1VJeXV6fP2IcE=;
        b=k0QOb/7styAjG16KLGACW84roeJbMF4KWZSbZlLam/t5KukaAXzLubbjTSJ66pyC/z
         lxBuFGPKsbbgdiFb9kjnUFv7nMhcwel/PwuxNanw57yiO5R2fDybQQdJYlaUkwgXn2Tw
         Qo2OXYqZH/0krP9bX07baXXeLHtJJtEhOIO4EAdKPIS2oT3XXbA3HFLAH72GQQpiOgju
         T5+WeRACKO44CEtnA0QsNlw1QK6GTInXAbLYTiTzykrw35LvxVPN5ZSIPM9WByT/UjBo
         1BC57ugXwQ5WjUEGxN9KN0tKsvem+akHQJIOE62XRS506tIpymK/DYTZpjFIe4hgpMh6
         b41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055483; x=1752660283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+bfGFW4DtSQcr5Yecq9KqtEiX+ZRp1VJeXV6fP2IcE=;
        b=AlKYrdXRrM+HYqv4xu7bkdooomtzowaMQPvg6lAReyWcWO8EKP2hsK0NfLMWzSuX3G
         PuT7PeEzuLKiptfjvs0W+diIvQsyKELuhpYYjboGduNvHya0YUrWiu3N0raQZijuxsK8
         TFgqJLbsjbMXk2Ub/AAQjE9uTPPQLKQzmwpqwLLbbo1dbjfLpRNE1bEn/mfboFD0C8hu
         JSPWNybuTnn0UHXoVpWOM2A8NKdXAnGGIHvpRPte0FfYPj/ltqccjqRamwUTBDPG94RX
         GogAiA9iYEwm/podJBKClREQPSIg/xoT8OslWLGk7HBJXzqPIR8NhfCzGxUTpYrpAhKY
         jaUw==
X-Forwarded-Encrypted: i=1; AJvYcCWnt3VF95irOuW+UZHjSdlaaxEmQWRbF1OUaM/jLbPyv7jIDgo6QdZpYjkxx1ztM6odq1Gn9SnPZ+uzWL9C/uKAGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhJmtxcoG1SQOqfQD6pkhZtg/GSJeXsjl4pxjTtBekG+VQifP4
	aAAgJ7nDCob7WTNByaoQtTXXpLkdR5QOe708/E/RAJtbCP/GMpY5hG1oTQewMsFOrtGmp16BvCh
	h5uiZdZS/rT6IKKm2NN+TWDS3eh3ix1pCB+0BqyhzAw==
X-Gm-Gg: ASbGnctsoT/UpRPMolQEOQj2hxCASgLDLaPU2nIdnseR3GXYgVyHV59IS/GGlsExgTU
	Dzn2ZRnHJLBCiaH/eesxkY8o/iaeUil2l8Vy4iSiM73fw1oe/GNdRmmnLKY16OzZyU+w12JhB67
	pRlqnvTAuTzj3tf4jhLHQ2YE7tfmzPJ+JNUoAtCsoWo6w=
X-Google-Smtp-Source: AGHT+IGY95z19tqvWhEI5fgWA6R8T6/UqcM++P6QZAW4xt2CGrUQgdZq9RwXXFtbhIUTeJDCM/NWWKWEDhJ2ZJDsq3w=
X-Received: by 2002:a05:6870:46a4:b0:2b7:f58d:6dcf with SMTP id
 586e51a60fabf-2fef870ac82mr1083901fac.18.1752055482714; Wed, 09 Jul 2025
 03:04:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org> <53a214b4039872ce7584a2ae6e688fcef0c86d7e.camel@linaro.org>
In-Reply-To: <53a214b4039872ce7584a2ae6e688fcef0c86d7e.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 9 Jul 2025 11:04:29 +0100
X-Gm-Features: Ac12FXy1nHjPc0ZtUVknu5DhgpF7CNwmS2WMX0Qx_tI6AsiwGCLjhVVgixkJAf0
Message-ID: <CADrjBPrPcYZPFuRqwm0OkFU+CQtinFUtNXHzt+MQpEy=Q-Xnww@mail.gmail.com>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review feedback!

On Thu, 3 Jul 2025 at 12:01, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> More small comments. Sorry for the drip feed, just trying to understand
> things...
>
> On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> > [...]
> >
> > +static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> > +                                     unsigned long action, void *v)
> > +{
> > +     switch (action) {
> > +     case CPU_PM_ENTER:
> > +             /*
> > +              * Ignore CPU_PM_ENTER event in reboot or
> > +              * suspend sequence.
> > +              */
> > +
> > +             if (atomic_read(&pmu_context->sys_suspended) ||
> > +                 atomic_read(&pmu_context->sys_rebooting))
> > +                     return NOTIFY_OK;
> > +
> > +             return gs101_cpu_pmu_offline();
> > +
> > +             break;
>
> break is not needed after return, and generally there should be an empty
> line before the next case statement.

Will fix
>
> > +     case CPU_PM_EXIT:
>
> Should this also handle CPU_PM_ENTER_FAILED in the same way to bring
> the CPU back up in case of failures?

I choose not to do that, mainly because the downstream production
drivers don't handle CPU_PM_ENTER_FAILED, and without access to the
firmware code it is hard to reason about.

Logically it seems like we would want to do the same code as
CPU_PM_EXIT with a CPU_PM_ENTER_FAILED, but I've never seen
CPU_PM_FAILED so far in my debugging.

>
> > +
> > +             if (atomic_read(&pmu_context->sys_rebooting))
> > +                     return NOTIFY_OK;
> > +
> > +             return gs101_cpu_pmu_online();
> > +
> > +             break;
>
> No break needed.

Will fix

Thanks.

Peter
