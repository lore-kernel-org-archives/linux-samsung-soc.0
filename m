Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F366F06C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Feb 2024 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707491977; cv=none; b=YW+1oZaVCPDDYkWefP+SIKJWjZaVHrP/UVzTqEyKex1rRMPwMknqko5XJ2PDV4XTYwO0ZWSLT6KV/n5KpjfZHKJH7BGUlAmfobeYGR9BO3Le7WLZfSqR6DOzOypfLpeaB5b9mm4HdKx74X9EQPSPUOMRjCHCW4KiFELYOe18FnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707491977; c=relaxed/simple;
	bh=eicFE24E2v83UgvSx/21HwdVSLPvUclZ8hDg9gz+Ifg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kq5B1CUYibvtcNKlbNBztOJa2qKSqclG3KpDdrqIIxocgtPfHvu/7oyEPBHPB4EjmjOlY456fKZze9Eqj2hjkhVm5hzVoDXD6c68zCfppzDXe57dNUKA81wC5zVKGRxdlXBgCo57VmQvIafkSR4SHvTXKqtUIJMNARhYOCvCeY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4e8/vBi; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4e8/vBi"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-21920f89441so552663fac.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Feb 2024 07:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707491975; x=1708096775; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VMsj7PALpNEPLf6iF4Dtv8Du3TIV+N98OxOoenWPal4=;
        b=j4e8/vBiZgO1Y8VAoVpYaWkU42pyQZ0X1W2jk8ay5a+YQ/KcLIgGloag/APL6SedIg
         5mYvDf7n4kx+1uWDerNUhA3fE1PoI0Ibb7W5KEghoDGzw4EZ01l2h7yfK0JuiVv3Lj6q
         i/COOAd12jCcdhd1LVNun1WyvG0JyWX0g8tUAXth0zG56G6BS98ez0TS5Rg9LWO6tNIh
         DYXyE5U+QUrQOy2XOkdrqbKbjkOfNxY3wwUJO3YCWNw85W7E9meCF3XJs31UTWv1OznJ
         VNVhKAOGlxdtIzd7bZ2j+mUQ+IMSjparGc2RoklbuxArBIYcpPwvt+jFykq43rXUITld
         MVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707491975; x=1708096775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMsj7PALpNEPLf6iF4Dtv8Du3TIV+N98OxOoenWPal4=;
        b=xPOsg+GQCoVLrk1siVUjuQhzxvBpTVwdhzLvfheQyK401gmW1i3lyaNi69soTEG/Fs
         +lbKSNQXgAz9PpCKtzBohXUU28zR4ctlXrHleoKxS//Gt/PJNqIDGS+TPNk83BB4gFKL
         ll4ZaeLNMZ8DNM+Q8QFcqWcJ0Cc91hzGLrw28YGjmV3uOr8drLTN68/82BSQIdK/vODW
         KTcTIjmcMQ7CgY6SSZPWSIt4xTSyP/CEOpjPPR0WAq6+WhUwjqZK3kQkgnExbjhQGGzM
         NwMsTXp7o/ilF1vIU9xoskiV4Amq6cW3ax/BnotnM9cdbeaxhMzAbO3A9voxV6YaWKM/
         yAKg==
X-Gm-Message-State: AOJu0YzcR2qsdUQ/uXS777wtMZg3vCsSp34bsCBRXfpswcwxi/0OEAik
	Zj6UWLKvca3szioRIFvaYoeoWUfZr661i3sXyvQ6qw3rz59Lt8896/dqvid1nGm0/IlPNXTBPV0
	vg7t+P134lFoFKpP6sCubXaiQSwA7WQ2volySEQ==
X-Google-Smtp-Source: AGHT+IF0dIOHBU71xLJmPjDOFo0UjOkdUUwP49pCiNub3OkD2jd3EAMo4qvPH0D8UIF5eqpiNOnWVLUITyl5ZvYltFI=
X-Received: by 2002:a05:6870:8093:b0:219:2259:b961 with SMTP id
 q19-20020a056870809300b002192259b961mr2186589oab.46.1707491974990; Fri, 09
 Feb 2024 07:19:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208161700.268570-1-peter.griffin@linaro.org>
 <20240208161700.268570-2-peter.griffin@linaro.org> <CANgGJDpJX+ji1U3SN+2Q21FyckFQhmwb-Z2Qcx4-+GQ2ijmfCg@mail.gmail.com>
In-Reply-To: <CANgGJDpJX+ji1U3SN+2Q21FyckFQhmwb-Z2Qcx4-+GQ2ijmfCg@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 9 Feb 2024 15:19:23 +0000
Message-ID: <CADrjBPqaUQXjkXLN8JagjF=HG6moXTRMULzKU93BCGo5iAqi-A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] soc: samsung: exynos-pmu: Add regmap support for
 SoCs that protect PMU regs
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	semen.protsenko@linaro.org, kernel-team@android.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Fri, 9 Feb 2024 at 14:52, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> On Thu, 8 Feb 2024 at 16:21, Peter Griffin <peter.griffin@linaro.org> wrote:
> >
> > Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
> > security hardening reasons so that they are only write accessible in el3
> > via an SMC call.
> >
> > As most Exynos drivers that need to write PMU registers currently obtain a
> > regmap via syscon (phys, pinctrl, watchdog). Support for the above usecase
> > is implemented in this driver using a custom regmap similar to syscon to
> > handle the SMC call. Platforms that don't secure PMU registers, get a mmio
> > regmap like before. As regmaps abstract out the underlying register access
> > changes to the leaf drivers are minimal.
> >
> > A new API exynos_get_pmu_regmap_by_phandle() is provided for leaf drivers
> > that currently use syscon_regmap_lookup_by_phandle(). This also handles
> > deferred probing.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>
> Tested-by: Alexey Klimov <alexey.klimov@linaro.org>

Thanks for testing this on odroid xu3 hardware!

>
> Apparently it seems tested-by should be provided for both patches. This was
> also tested on odroid xu3 and I also have WIP code that depends on this
> SMC-based regmap. No issues are observed and behaves as expected.
>
> > ---
> > Changes since v3:
> >  - Fix PMUALIVE_MASK
> >  - Add TENSOR_ prefix
> >  - clear SET_BITS bits on each loop iteration
> >  - change set_bit to set_bits in func name
> >  - Fix some alignment
> >  - Add missing return on dev_err_probe
> >  - Reduce indentation in loop
>
> I no longer see the compilation warning related to struct device_node declared
> inside parameter list with v4, I guess one line change addition in exynos-pmu.h
> does the job.

I added a forward declaration in the header to get rid of that
compiler warning in v4, but it's not explicitly mentioned in the above
changelog.

Thanks,

Peter.


Peter
