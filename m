Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953A9486436
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Sep 2026 18:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273593; cv=pass; b=D/bcuf3F2KuBavM1d4MPqOzdBGDDVR+6bYOMKLz3wYIk82wEiRIy71NZ5JGXMaC6XM+A81l0+31X4EBN/9l7urQkpB/MFtmR7n5Vg4auC/8z30t6CkvrcfBZBX1sPPDTqn7iNpLc1YBkbtWj0AWGjrqWqbd294rh0QlEIfiioeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273593; c=relaxed/simple;
	bh=obM89duV/YDQdOLprqIx6ewSPHAr0cjoNZPC7dSU81A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEU4YtnVSvrLrjDcefUywZaMxaZom+A/mEKPnGOZL3LYE06EkqZrSDxM49KEVag9/UCoFeDeF/ORTKP4RZDakg+ha29x7Pige0NsAeFB+uGj4C1ky36ry/++jqgEN9fqukpJMhd2ck4g0yipAphuPMSoWZ5VITC0YSMUad+iZp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbvzXo7h; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbvzXo7h"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8d882so353196d50.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Sep 2026 11:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790273590; cv=none;
        d=google.com; s=arc-20260327;
        b=T9/4qRiuxp1UnEqn9J/XNs1OazbzMQufUkPGpG5zaTr+uo3ZJFPdT6CkKh2BReajjq
         kkA8iLMrKxEXwChUFJLMAZILzptKzjgZyNKXz5rXCyfoHu9odTSPpn8T0tpgj8CjWvFl
         DrcgqJvm2UOPGQAqUfmwCjUX27qxyi+O3zd4ISd3Mg8HXdSF7Yxr/mTmZ9o6ys7gY97H
         FkGv7v3VNbzH/n/6aVTGaTGZtzc0wR/K1vsbZ9P7c+sAaMZTyxT9vz59+dEm673FxqXK
         ETSOTMF/mALlSG8LNxlFQggv2F+zRLRZ9HCEygI0mDryX9FdOG65VRJLUGhTg3b2XySw
         p69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        fh=SlssyKPud/5uKJ2cwf/jlrC5PBE5WcyV9qzYX+CDXFM=;
        b=FvaHvml/0BmemHTihGIrjhaaJiw7H8Un8eTCCwkArrtjt0ofcsn8pirodlP4Apc2UO
         MocTBNoN1IR0d6Fu01BkrRiKNxg9tQOvu5oPwyCvuLDPzQjfiJVl4rfwny3wKrFp8WS6
         zS1T3Jn7owVfTYrDZagiJVJaBwmAsj7J02oD2Vphj4mwDFA/z2ey5BRqz1CxwCa7m/Nq
         5dtsk9iXw9o6gpiDR3NXq8YHzMnw/Q6fXK6BA/ivIPY52x9pTEaM3UcnP9v7Ok+tGUBb
         OLoT2i6imnf1UuECceDHpRS3rdOwInpiw6PPTO19lvbtAbaFfMBqTSMTD7VtQlUkfsb7
         ej6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273590; x=1790878390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=SbvzXo7hrk0G6IauEmNn8RcRTFDhXSYqND3iYB+yTSkk/RWTVAJUMeNbgREjaGaJht
         dlN1Eg/3m89JfwDHLE0FluvYhAG3q3xdg3l7jNZUUJrO+l21ou8qZFzxUfbvYJvzQXOg
         5/+ygTJVT+uaqLti+EfJmQA/N2W5pjkKps/R6ID31PGjFY4W5cJ8VvClXQeU/Ck/ZqAQ
         Y3WpYCjClKYmTsfxbbDWMvEQMJKv2FtuUgZQjWqydKctnyzYsWgzRtVwS8KSrcokkmr6
         KIqzntdUUlJs5UMpLtcBj6DmlwlgqYUD+4o6vaTavK6EWNOGL++xcPWaQBtsgV/s5fPB
         y9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273590; x=1790878390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=lE3pwXFQ3KFpAZTbVhcHY7I9KAL5WeJgzyyA45MCxy6vCdGRSlyHrEJqe/RCLnaGhu
         +aWdIsgdL/KvlT5RviKFvLaoQ6c7A6WmAJNACbjqIqOFwDs49gRNLSww9WIep3Xd/O6a
         OjbO70mrht2DtsYYi+A09FdbDelK8xy5d6patZmR7v1n+9EaZ/zjuSmv61WvkvHJhc4W
         /tywsQ5p2ano4KQaegplk52Y/UGXuo9HdGMVH3ZNnwuh0dQZk3ucoNRgY5Fhmf7mJ93w
         eH1DvpCsCFQ+GAhFZrNXYneUD7lqJYSGKvJSOyAuzZF1OdPgSRVPdo/3Fk2UFgLW4b9e
         bpBg==
X-Forwarded-Encrypted: i=1; AKwUvBzhdUK/z1xiDxLYf4JK7wgRl9NuLCdYX00jZoWkhSuCjZCcEEXMBu1UBw9MtDgNWUqbNpyVX+ZVfrf6/o04Mznkew==@vger.kernel.org
X-Gm-Message-State: AFuF++m9KmhDEveRcPHNyHw48kGykeA5prE1bomN4qYPvl3AAa0gery7
	09x2w+6+0uYF6OXSOv8k/xvvGojd5kNgpg1l1bD4CyLD08WZIVN7KxCRGTjiGfoWQ2lEK+zAyEb
	CCqSJXf4aJbeq37lAn+bMR62Oe5BXrro=
X-Gm-Gg: AYBFou3V8gFM0bScA+6mzZfcxlxsZzA409V5OqOOVfq5C0Ww4f41vVVbV9tWWqxH7sX
	yIevKoVGc/3DBDU9MHOcmZ+enreK5y3mBP4dvMESAXcPk4HzOHAV0M/XjMlsmXRaKoAtiiJxDz1
	2fmYX0n5+9QdZrwFM/JTQU7dxiBDWEc5G0Yxt8HaLPI6pxoqiRN/CHE0roHIQrl6hFB1PuVB8Lt
	tI9UmPQ+sstoYFgoX/RwCbJDc9UNys70koE20DUbHZsMWSKXBqJ9EBBTWkVm8K4LvMD5Wmct0Tj
	Rp/5gO/fWPZe8Zivjtv80oWhMXoQEiKK6WJvGtBHYdJEpJMvprdNHvjT
X-Received: by 2002:a05:690e:418b:b0:671:5ede:96e2 with SMTP id
 956f58d0204a3-672ed2603d0mr2064645d50.8.1790273590483; Thu, 24 Sep 2026
 11:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Thu, 24 Sep 2026 23:42:59 +0530
X-Gm-Features: AclHuK9xd3dlB_Cgp98d7h2ns81HK8suGpMur6yXKcYJOLZ9LOtfHEkjox28BFY
Message-ID: <CAJ9orWTDrTTRLqwnwu9YMQQKt0k2g7qZEpH6fDcMFcTbTs55KA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] PM: Use %pe to print error pointers symbolically
To: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org, 
	kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 12:42=E2=80=AFAM Sumeet Pawnikar <sumeet4linux@gmai=
l.com> wrote:
>
> This patch series is a cleanup for subsystems under power management
> (linux-pm) that converts several instances of error pointer printing
> to use the `%pe` format specifier instead of explicitly casting with
> `PTR_ERR()`.
>
> Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
> print error codes returned as pointers. By switching to `%pe` and passing
> the error pointer directly, the logging subsystem will automatically
> print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
> `CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
> numeric value otherwise.
>
> This change significantly improves the readability of kernel logs and
> dmesg traces during debugging, without introducing any functional changes
> or side effects.
>
> The cleanup has been applied across the following PM subsystems/drivers:
> * powercap (intel_rapl_msr)
> * thermal (cpufreq_cooling, devfreq_cooling, qcom)
> * cpufreq (bmips, cppc, qoriq, s3c64xx)
> * devfreq (imx-bus, imx8m-ddrc)
> * power/supply (various battery and charger drivers)
>
ping for review request on above listed changes in this v2 series.

Thanks,
Sumeet.

> ---
> changes in v2:
>  - Krzysztof kozlowski suggested to use dev_err_probe instead of dev_err
>    for *_probe() functions during review of v1 series. This will be done
>    in different patch series.
>  - Here in v2, reverted the changes for dev_err under *_probe() functions=
.
>
>  - Link to v1: https://lore.kernel.org/all/20260906061755.5103-1-sumeet4l=
inux@gmail.com/
>
> ---
>
> Sumeet Pawnikar (5):
>   power: Use %pe to print error pointers symbolically
>   devfreq: Use %pe to print error pointers symbolically
>   cpufreq: Use %pe to print error pointers symbolically
>   thermal: Use %pe to print error pointers symbolically
>   powercap: intel_rapl: Use %pe to print error pointers symbolically
>
>  drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
>  drivers/devfreq/imx-bus.c                  | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c               | 3 +--
>  drivers/power/reset/macsmc-reboot.c        | 4 ++--
>  drivers/power/supply/cpcap-charger.c       | 4 ++--
>  drivers/power/supply/intel_dc_ti_battery.c | 2 +-
>  drivers/power/supply/qcom_smbx.c           | 2 +-
>  drivers/powercap/intel_rapl_msr.c          | 4 ++--
>  drivers/thermal/cpufreq_cooling.c          | 4 ++--
>  drivers/thermal/devfreq_cooling.c          | 4 ++--
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
>  14 files changed, 25 insertions(+), 27 deletions(-)
>
> --
> 2.43.0
>
