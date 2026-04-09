Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1939183D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Apr 2026 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775736481; cv=none; b=Onfpa2bVlRdmNYG5FjHU+siyzrDaxc401OI3EnQXW+S8bVRJe1SPxFZV6dXxCwlZAWgeH5Q/CU7/co075C72V33RekgwLbvivs/bk9BKdzCHEhRvNh6zaR8cbz13Uud/pY9uRMqKmaz674nN7oENvIkpXvxTmi3j0/kR7cRnlag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775736481; c=relaxed/simple;
	bh=ir1VdmviffzXBZPmE93/M0r5Z01m2FdEOc1nRHQQYMM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=K+IZ4/rhAcWOd+S0H4VbngPmrl6OnyrU8mgpbUan8zgO9HhzUlnIM/+Na0o9wvg8JZwyJndgXVamb1QeXaOBF0776dLy2TGcyVPHJj7PHLHhmOp3LOvBTUNYJKlLPQuLwSAkxiBvm2EYeOWdudAA+6aUV+DhlOxH+O+3ZqeURaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzfztKj7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzfztKj7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfbd17589so572707f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Apr 2026 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775736477; x=1776341277; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C159+BoCf0JeccgPtowgYy9MrOmnFdOSeFm140he7+U=;
        b=LzfztKj7xiXIaFfy+V5Zg064uDxB8CrD+BmlL+NOkrDbp8qXNkWgRpaplSCw5aYrPE
         8O9AKOv7WqxuCrUUdS88N0SSIuJTi6B0wLswV3BYOed6BMdJU16nXjHzlOIQxAoMCpuu
         Lild9e0VgwP508J9OZROOhmfh1Uo3DupTUH36G/VVWX7cW5+DAZ0e8gIUAfpd4aBItJq
         5pT3/ObsrmMd/JslfdF+PaBsf3Ou3rtcps5ZCpCpZBbXdPfPH71bAdCK27GvKe9/zr92
         Ng6orys/52s8biAMRZuk5ZuHbYUbwlz5ecObGXSyNHrASHo8+4XM/mjZCcKjrDYNcRKw
         N9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775736477; x=1776341277;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C159+BoCf0JeccgPtowgYy9MrOmnFdOSeFm140he7+U=;
        b=CwWox9ErUQgUY1hKb+eEFp+/jwtXv4myJGCp2Dgd37JpuxVmndNa8fj4hHvdc72sRy
         rmH8ABtT71IESxEXJKT4rdN98wKyXWozOUoegpiQQeHwXJ/uqD+7T9hRN1HZR6Myoz6g
         ZJ7b1Elov0YwbYZ+ViSSBYW2Lawq0lG1Wnyi6fHaiTu3bELQcNM+tepjX9qiDc36ox2Q
         uWY6tqcIv/dO7flw3ERn9xW4LVetH5ZREx0gT35kTQkkdJBof4igdAJf8j1JlFSXwD8Y
         KRX7MhtVoaBeT7Uc53LyOalD/EGPoSIAdVjJz6TuUnkVH6E8rWmTzzvESp+Tr/fmmP4D
         GknA==
X-Forwarded-Encrypted: i=1; AJvYcCUCXsQllqsODU/mO0s7QtSSEUAMxl6xzmhl3ffUa5wfx7gIByy/v+3myhXZS7dc5CLmyHjS3KQHmRGH/cEFvyJVpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5+UiF9nnOLENpRnFCwIeIQOVdw/jYNdBjZmOPMspsnAkTZRyI
	fyla1lLFu5O7bL/233e5h2GgR3MJazzh9cZ3nhQTtGhu26SEgxNsCbuLemnUJ/GTLd4wPvG1s9u
	EJn8V
X-Gm-Gg: AeBDietnuJzQX2ex/ioqKt/VEPIto5hSe0tZ7xuFof7p5SVmIccRbbCHjJZ7MBfnZo/
	r3irq6Vw5ocz4LX2Yj47ZqrKV4KFBgA71LvR4OVkgFeygtFRtOlrQnVplbCDseBZ0Fn2slwv4uM
	FqfHnlLJiElSYu4nhmnCGjxEfMGrhaRKpCYe13Y7cjuibURtb5jEhrs/cj+WlX5GvFh4GY3Qg6k
	PnLsUrk4cjcTiC9Mb4uiE8YlnOhk5AORHH5pTobcrh8KQwxt+lhhvPe5bnS1kl9rfMBGAlA5kRk
	5+1aHNQU5rgOaoKHmXyBeAJaMWPffU2fvJUjeAHL6lkX1n8PPXgEIRVpMcDJemlYt7oaBwcdDq0
	MYZTjrkaNIsFL6WydjGBpaNlxQmUABnee7yEeBKKpOjcYnZwX6tDt1j8Tn6ksfjHsNjR4n3mtTf
	9YL73VZHzmCbjBJ8Rg8EcEMPTXc+sasSTeELGN0s3u1hu1tPIi9FAgIFI1u7oGg3ipFTuA9H0rg
	UOZKar8cEpIZE9jEMREaQ+Ugzqq
X-Received: by 2002:a05:6000:2086:b0:43d:309b:f2db with SMTP id ffacd0b85a97d-43d5a126f8dmr4358618f8f.7.1775736476554;
        Thu, 09 Apr 2026 05:07:56 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:e6b4:ab32:911e:de1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2971sm66154263f8f.22.2026.04.09.05.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 13:07:54 +0100
Message-Id: <DHOM1MT2MQON.3F5MF0V2RYSFJ@linaro.org>
Subject: Re: [PATCH v2 5/7] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Henrik Grimler" <henrik@grimler.se>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-5-c5a760a3e259@linaro.org>
 <20260409115630.GA15706@localhost>
In-Reply-To: <20260409115630.GA15706@localhost>

Hi Henrik,

On Thu Apr 9, 2026 at 12:57 PM BST, Henrik Grimler wrote:
> Hi Alexey,
>
> This patch breaks compilation for arm(32) exynos devices. Compiling
> with exynos_defconfig I get:
>
> [ ... ]
>   CC      drivers/soc/samsung/exynos850-pmu.o
>   CC [M]  fs/squashfs/page_actor.o
> ../drivers/soc/samsung/exynos850-pmu.c:17:21: error: call to undeclared f=
unction 'MPIDR_AFFINITY_LEVEL'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
>    17 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                            ^
> ../drivers/soc/samsung/exynos850-pmu.c:17:42: error: call to undeclared f=
unction 'read_cpuid_mpidr'; ISO C99 and later do not support implicit funct=
ion declarations [-Wimplicit-function-declaration]
>    17 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                                                 ^
> ../drivers/soc/samsung/exynos850-pmu.c:48:21: error: call to undeclared f=
unction 'MPIDR_AFFINITY_LEVEL'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
>    48 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                            ^
> ../drivers/soc/samsung/exynos850-pmu.c:48:42: error: call to undeclared f=
unction 'read_cpuid_mpidr'; ISO C99 and later do not support implicit funct=
ion declarations [-Wimplicit-function-declaration]
>    48 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                                                 ^
> 4 errors generated.
> make[6]: *** [../scripts/Makefile.build:289: drivers/soc/samsung/exynos85=
0-pmu.o] Error 1
> make[5]: *** [../scripts/Makefile.build:548: drivers/soc/samsung] Error 2
> make[4]: *** [../scripts/Makefile.build:548: drivers/soc] Error 2
> make[3]: *** [../scripts/Makefile.build:548: drivers] Error 2
> make[3]: *** Waiting for unfinished jobs....
> [ ... ]

Thank you! My bad.
I will check for the next series what I missed.

Thanks,
Alexey

