Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5336C3E277B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Mar 2026 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756693; cv=none; b=ZQ6ZxGOQsc7Tbtt7jhhXVcACnUghWkG8gxg/aIR7lUgP8WbFwd91Py0PFhQCQjpObtKij0PV40NOjA5KIIf1zgmaznL8IUCvQaQMYJXamgzINl4q/3RapFYArWb+fpnQQEEfCvn1fJAHAunsTUnz/CStOUCPy+umOGEJsY+pTAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756693; c=relaxed/simple;
	bh=NLJiSkzeQIFRX1mkhJW/Gt/oIZVKQKSSMHiMPxqN+3g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qQeDb2uPQzZRxSFc8HaXo0fy3SeXcPNUGm1WV1z3eTLaHVYMuIOp6BosfJXvaaLpnlZBm9H/g5UGYOwhxN34k4we0d7hUttQS9QRVQWceWZaIWYNgYJYlIDWL1WxtVVZpH3X/KUhraanEtwabnS00Dl0EYU5e5fVDtW1rJQMj5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8iqHEml; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8iqHEml"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486b9675d36so5143585e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Mar 2026 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773756690; x=1774361490; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtjYw7NIr5M9DO4GZFC2fJ8GnFCnCjLLvq9mVI1210Q=;
        b=s8iqHEmlH10OsAm6JPTeZDEsyvWyx5r+eH9ejFr4SmafxT9TTIUwC5Rqp32hcARcct
         i0Q9BtIhek6kOgfVzHWHk4IfKbx2fCa8VaizUB/N4T/jtxmoRHJPZD98SeC8gReY4Yuy
         mhzqOuehI/GnoHBBm43QJljT53yOBK3+1FcW9nyjzqthIhr35MaSZTju+C7t0bGFQRl/
         TwnGSdejBrrYlFmf4N+FoWdTwTkcAnQqdKGAK0MwWyA6RD3QtvnRKVZV0aFfzipSiKYP
         GHMbN52Zxa9EXv+NufLpqzsg79GALVxNdCByyPY/VUb2gq5bAzU72muO1f8B1f0i4wFS
         H6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756690; x=1774361490;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mtjYw7NIr5M9DO4GZFC2fJ8GnFCnCjLLvq9mVI1210Q=;
        b=mNm6b1LpaEcq/iHITU8H00kZzAWAdgOOZnEJYqEMGFq1+LQBX9f6r2W8ljl6w54Ast
         1Q8NhHntFjtCmU2XVgFqLggx6ctd/RXTET/G/ZeqNAgv/DRfd/lnkwGBADkVEG6C9lu+
         n49rCC2G7x2w+rWg+qyGt+KZH1YI4iTRjeGOeRJciwUB0GepjFS4OXUufc5ZlZ/aSVhJ
         Ip9sraakHZz8Tvg6n/2vT0mvJPllm3aK1BgI3EXGOTeC8LTPnNl4IqxidWdnVlIH/1Vq
         rhm1/6Jyg+fmlY6O6sCoizHdG96i5NSv71SUfAx4jcXEpOhGsVhnF+U5O7/g2fXOm5Om
         xDDA==
X-Forwarded-Encrypted: i=1; AJvYcCWR9t69rFKwC/OhiKhq15r8jcUy7XN4OcM5tMg+V+T7AlghJTNxrrCbb1Yv0VrrporgY2dUzl2RCqSi3KQKXSkxUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsLCHW+3pn28D/GXfWmBjrFhCjuJUAFJMOFe0YB6kvyoz50LIg
	SMgig5OHFLw693uYfInd8YftCGwONdXj+oc/bcnSRkTQgEfXYTWeZlmEqf8AjMjT6f4=
X-Gm-Gg: ATEYQzxm3coV9bdVIvh1B9iIBY9ieD+25OiSusXehHKSssQOfiLlZmW4wUOs/Lh4lXJ
	7f0tUL7Pf4KPS7w+PAV46wSGv5isK4483ix1FjuSngXk6Jzznf3HEIV4iF+bv2qfQU0Iaelx6e6
	Y0UjFXKrVH2s9OTM5WM9VSjyFFfoQLbdA26DycQ0y7lSQfTCvrzYQFRcDW6ldlD+N0GlILyFIJz
	F35tZH4X32WIhZ3BI7WCOIOm8CMAkBvoX1J3P+f75sjvEelpAumojKGVm5g8C703DluZG900g5D
	S1E7dUUfW8nsbDA9L0dGTGomt7A5qIpwoM9QprwazBMjBtAQybiqZXCkjjD9V0DbvZIDiqTPiIz
	+op//46YE0b338kwcDitC6PVpXbexFz2Gd68LhLlpjWhX5UV2AhWeHC0XaVQY9cO8KESl5V5RoP
	4eYiQyYKekVmmFjOOeeXAJKHLwi/hPKoMpmb2+YW2tv8aRlpuT7SgojOet43TjSZHklq09YfcPM
	Zlmr9yHF2egUToOrA==
X-Received: by 2002:a05:600c:4514:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-48556709e21mr271873225e9.29.1773756689493;
        Tue, 17 Mar 2026 07:11:29 -0700 (PDT)
Received: from localhost ([2a02:c7c:5e34:8000:df24:76aa:fdca:2fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485563903bbsm194524525e9.0.2026.03.17.07.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:11:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 14:11:27 +0000
Message-Id: <DH549OXPHXQA.265AMHWFSNK5C@linaro.org>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 7/8] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-7-71d7c4063382@linaro.org>
 <CADrjBPoLCDnvWocLYrg-zGRZNcBvPVYnUi4L7DA78m7QmkmQdQ@mail.gmail.com>
In-Reply-To: <CADrjBPoLCDnvWocLYrg-zGRZNcBvPVYnUi4L7DA78m7QmkmQdQ@mail.gmail.com>

Hi Peter,

On Fri Mar 6, 2026 at 2:15 PM GMT, Peter Griffin wrote:
> On Thu, 26 Feb 2026 at 15:47, Alexey Klimov <alexey.klimov@linaro.org> wr=
ote:
>>
>> Some Exynos-based SoCs require specific set of writes/updates to PMU
>> and PMU intr gen blocks in order to put a CPU or a group of CPUs into
>> a different sleep states or prepare these entities for a CPU_OFF.
>> The same is valid for a reverse procedures like wake-ups or CPU(s)
>> online. Without these writes/updates the CPU(s) wake-up or online
>> fails.
>> Add support for Exynos850-based SoCs for PMU and PMU intr gen write/upda=
te
>> sequences.
>> While at this, also add description of Exynos850 PMU registers.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  drivers/soc/samsung/exynos-pmu.c            | 86 ++++++++++++++++++++++=
+++++--
>>  include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
>>  2 files changed, 87 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyn=
os-pmu.c
>> index 0967fa56708a..7b9b8e22d91b 100644
>> --- a/drivers/soc/samsung/exynos-pmu.c
>> +++ b/drivers/soc/samsung/exynos-pmu.c
>> @@ -118,6 +118,10 @@ static const struct regmap_config regmap_pmu_intr =
=3D {
>>         .use_raw_spinlock =3D true,
>>  };
>>
>> +const struct exynos_pmu_data exynos850_pmu_data =3D {
>> +       .pmu_cpuhp =3D true,
>> +};
>> +
>
> You may want to consider having an e850-pmu.c file to contain the e850
> specific data and hooks.
>
> Andre recently moved some of the gs101-specific parts into gs101-pmu.c
> (although not the actual gs101 online/offline hooks). Now that more
> SoCs are being added it could be a good time for exynos-pmu to contain
> only the generic code and the <soc>-pmu.c file having the
> peculiarities/hooks for the specific SoC.

Thanks. Yeah. That's why it was sent as an RFC to get pointers where
to place things properly. I'll update it.

[..]

>> -       pmu_context->cpu_pmu_online =3D __gs101_cpu_pmu_online;
>> -       pmu_context->cpu_pmu_offline =3D __gs101_cpu_pmu_offline;
>> +       if (of_machine_is_compatible("google,gs101")) {
>> +               pmu_context->cpu_pmu_online =3D __gs101_cpu_pmu_online;
>> +               pmu_context->cpu_pmu_offline =3D __gs101_cpu_pmu_offline=
;
>> +       }
>> +
>> +       if (of_machine_is_compatible("samsung,exynos850")) {
>> +               pmu_context->cpu_pmu_online =3D __exynos850_cpu_pmu_onli=
ne;
>> +               pmu_context->cpu_pmu_offline =3D __exynos850_cpu_pmu_off=
line;
>>
>
> There should be no compatibles inside probe (that rule applies to all
> drivers & subsystems). Instead use the driver match data
> (exynos_pmu_data).

Thanks. Yep, I'll update it.

BR,
Alexey
