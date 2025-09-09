Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4AB322DBA
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Sep 2025 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757416505; cv=none; b=oTTwBnFhaeCqNY+LpzAM1uOKeKT3/1xXCGiehGIIxo4xqgZWXu02eN9bS77P77IwqDjtO0an66LY9Gjxe3PNn3uUQYAAfbNzZbkythRvzilT6o/Ke7ffJ7FH/Cn9SW+niDdr1WjKfSBe3c4XEbxJSBZ46Xd0Pkw9M0JcecAxIRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757416505; c=relaxed/simple;
	bh=g3ZI8YN/95LI9br+AKCOMOcs4Ot9AmRP9xRKTSgX7YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKolYG9bxQIh6WHtwk1IF3slBj/PAQZRXkkEFHCG4k3cVid3IXxrCQXbux5FqcZg1MOdgYIBCzGetP1XLF7UC0D1zgKGJ6IegsZkIJkxbe84NSXkRCYg85Sbx/pXZ5e94FhHeQa4bRg+AWcfMFbuxjDHwmTejNCMcxQW5LHLh/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pkJkZakD; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pkJkZakD"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-62177413b39so1685489eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Sep 2025 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757416503; x=1758021303; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H3J9huOApoi8Y6hebVd9AzV0hA0WzoEyWAy0m3sVnzY=;
        b=pkJkZakDQmm0ibgP1jQYl/4uzpvdF6Br0ZxxjBOM+iG9aDMIKMy589BAZpdMm0ra5U
         XzpQsS5PnKy1q1Xv0OvO6q1yr1UC2aDTMJpFXEwCUXIhn7Q4HE35ZKTbvhTWA0y7p4tI
         iC468iW45DnOPnPFzq4aOocMVS4oWPRPNN5HraJU4hBfR1xKZhKEiKh7BhtwTUgGJk+0
         /h7L0gFp4kX1kgKEf+qZmOQGJkAtd9kEQCFlgop4hNfK+vkQ78kkLsT08C7G8eQuiI07
         OSG1nygBez2FfYgvNmkw3iXFtOVLDAmqVWlEOsRWEfULN+4Iu2KK+2DaHwI3ARe18JVq
         wBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416503; x=1758021303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3J9huOApoi8Y6hebVd9AzV0hA0WzoEyWAy0m3sVnzY=;
        b=BMVfzVZ7R+yVR1z6EPNfqqER6860nToRXb4LXSAvLOCFOmBuh1jBJjQJDDh3Fhzuu9
         eM5ufTbMF4nPNP4BJpdeodvRmrJA1sA0krLktKU21e99Kn+WosnMU+o8cSh/ky2cecS0
         WBHdOJJ0cyPXktKakzeA5l6Ki+x2zBiPdpwMRSEoNstAAAkXr0pjsRJwxnBvQcabEi3C
         VLr/b+5H88OUgxRarXoTJ6dnPdDz1owi3IUVC24vigYE1qUJ98SCgpNuePraODwpkngj
         zshzqbXRP8x2wSFGm/psTFca1ysKdZ/KwRq87BW0L2dHlmlJ2iEdFwudd6jEGFKb1+4X
         qvUA==
X-Forwarded-Encrypted: i=1; AJvYcCU5A8LXwYnLb/3qTwdNR7xTflLTe1xcsAOQQ5YkVi4soVJXPr0qhyV+sAaab/1Us/7R+jQlxZPpftceOISv5m6SwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/fIqE0Eo1Tqxd+noA75jnFWMnxvmtfilE2IVwLnuCN7BQiEaD
	sgBYJ1Cj/N5XDNygKEgDeuvne/5EVaz4D4G4jF5OTIfbpDV0Vav6JqDmPn6WBNIBm4MkVeAniKk
	slLCXaC42H/DJd00HmLRP33yUFyUWV4j8zWDlyJsIaA==
X-Gm-Gg: ASbGncusYLLeh6qlarPGL++M5KO2sVMSHQgTVjK/Vp7+uPLYRff2ouxdwy2uuAeNK/V
	2MBmC3T3inCLjRX0jVPwEa3almeYTmwbuVAIn0hQGLvfHIyVx5av2Ov+KUsV5rVjpWnKzKwUAf2
	WBXSWhbK8eYrSRNduykXkKY544g62qhPPDJe3w+w8yLfsEtrWIg4+AHckVojnEi+IOd9l6gYuPY
	dlbCpZLBZTViqIg
X-Google-Smtp-Source: AGHT+IF3haCb/E1FzNUTbha289kFS363Kg33HMc7PBhqqE87V+/FyqUeuaGr+6CiNvSrkmkJwrmOIOH6XS4or1+1aBE=
X-Received: by 2002:a05:6808:13c6:b0:43a:d659:7822 with SMTP id
 5614622812f47-43b29ae7843mr4779835b6e.34.1757416502750; Tue, 09 Sep 2025
 04:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905162446.88987-1-smostafa@google.com>
In-Reply-To: <20250905162446.88987-1-smostafa@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 9 Sep 2025 12:14:51 +0100
X-Gm-Features: Ac12FXx64qJXe2GQUzO8JtALwGYnJphXENgbpS-QSSifTl3glwftoVzGYAhwfsA
Message-ID: <CADrjBPqH==y5KaN6oBnGJ8407gx31sGVEFqqNdz8NG_vPuNPYw@mail.gmail.com>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzk@kernel.org, alim.akhtar@samsung.com, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mostafa,

Thanks for your patch and bug report, it's great to see more folks
running upstream Pixel 6 :)

On Fri, 5 Sept 2025 at 17:25, Mostafa Saleh <smostafa@google.com> wrote:
>
> Booting the kernel on Pixel-6 with `CONFIG_DEBUG_PREEMPT` prints the
> following WARN:
>
> [    0.784187][    T1] BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> [    0.784328][    T1] caller is debug_smp_processor_id+0x20/0x30
> [    0.784433][    T1] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc4-gd69eb204c255 #1 PREEMPT
> [    0.784439][    T1] Hardware name: Oriole (DT)
> [    0.784441][    T1] Call trace:
> [    0.784443][    T1]  show_stack+0x34/0xa0 (C)
> [    0.784453][    T1]  dump_stack_lvl+0x7c/0xb0
> [    0.784460][    T1]  dump_stack+0x18/0x24
> [    0.784464][    T1]  check_preemption_disabled+0xf8/0x100
> [    0.784470][    T1]  debug_smp_processor_id+0x20/0x30
> [    0.784476][    T1]  gs101_cpuhp_pmu_online+0x40/0x108
> [    0.784483][    T1]  cpuhp_invoke_callback+0x188/0x2d8
> [    0.784490][    T1]  cpuhp_issue_call+0xec/0x240
> [    0.784494][    T1]  __cpuhp_setup_state_cpuslocked+0x140/0x2c0
> [    0.784499][    T1]  __cpuhp_setup_state+0x58/0x88
> [    0.784504][    T1]  exynos_pmu_probe+0x2a4/0x380
> [    0.784508][    T1]  platform_probe+0x64/0xd0
> [    0.784516][    T1]  really_probe+0xd0/0x3b0
> [    0.784520][    T1]  __driver_probe_device+0x8c/0x170
> [    0.784524][    T1]  driver_probe_device+0x44/0x140
> [    0.784528][    T1]  __device_attach_driver+0xd8/0x180
> [    0.784532][    T1]  bus_for_each_drv+0x90/0xf8
> [    0.784536][    T1]  __device_attach+0xa8/0x1d0
> [    0.784540][    T1]  device_initial_probe+0x1c/0x30
> [    0.784544][    T1]  bus_probe_device+0xb4/0xc0
> [    0.784547][    T1]  device_add+0x4d0/0x700
> [    0.784550][    T1]  of_device_add+0x4c/0x78
> [    0.784556][    T1]  of_platform_device_create_pdata+0x9c/0x148
> [    0.784560][    T1]  of_platform_bus_create+0x1d0/0x370
> [    0.784563][    T1]  of_platform_bus_create+0x234/0x370
> [    0.784567][    T1]  of_platform_populate+0x84/0x178
> [    0.784571][    T1]  of_platform_default_populate_init+0xf0/0x120
> [    0.784579][    T1]  do_one_initcall+0x68/0x2d0
> [    0.784585][    T1]  kernel_init_freeable+0x2d8/0x358
> [    0.784589][    T1]  kernel_init+0x28/0x168
> [    0.784595][    T1]  ret_from_fork+0x10/0x20
>
> As this value is only read once, it doesn't require to be stable, so
> just use "raw_smp_processor_id" instead.

Can I ask what baseline you are running when you see this warning?

As this code got refactored recently in commit 78b72897a5c8 ("soc:
samsung: exynos-pmu: Enable CPU Idle for gs101") which is present in
linux-next but hasn't made its way to a proper release yet. After this
patch smp_processor_id() is always called with a raw_spin_lock() held
(so this warning shouldn't fire).

I just built next-20250909 locally to confirm, and with the above
patch reverted I see the warning you mention. So in summary I think
the issue has already been fixed by the above commit.

Thanks,

Peter
