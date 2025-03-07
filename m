Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3014418DF65
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2025 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741357764; cv=none; b=ZdZ2prWrr6nEQZd1zwdHClEuKrdm5mLBcz3axHM9HGu3wKhfQHIhcodXOM0uDOZv61qkD2VZpkZFSvwMZfFbG1+1nwU2ceRe0G+Er4dDzpckLt4Y+jGlueNZ7o9ujbK0aPV7LaphZCzjVzm2y5zOr/SlcB/oLQe2lwt0HG+Lzpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741357764; c=relaxed/simple;
	bh=rp0f42glUxHYB7cLrjBPwzCOiRnlxUZyzryaA9MuJbo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iGKJudxq2Lu+dZT2xFNG7BW8CdxVhstNrmqXYlIMFuF0ihQZRtIR0XXmA3DNJqJkiq6LY5d6GhIMQRIj/piCkKCOGs8evecv1PlxNLTS85ueqM6adiiMAQn9p5YnpohNlpZEdgMqHrhKaigwR0g7X0YduIc26r5VuKhvy554y5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yDpysmLM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDpysmLM"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abf57138cfaso361410566b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Mar 2025 06:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741357760; x=1741962560; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rZXFa7Uj+1Gvv26a7pIq8NFyLVUfkGuLwgcw0ui9q90=;
        b=yDpysmLM7yFtMWYIpeYqTdE/UwlR2OXkgIJM4wz+ZJc5OWSBoWeecpieoZDXfX7e/m
         UdoE76WSFiSEGg2Jk1Ukce1pFWYN3eaQjGZOpLBWa4R1lEsLteQEZ7VqnkqonoHcQAEX
         k4bleMnJ7fcCkHuOU3rmKXnk3Tc2HQblgGMFhPby7B7Vv//FaH89o7h9Y1SQd2Ojunoe
         Q7jRr0jGw6wb5eZ5WHn4yKYKeX3p/J2mec0anptFw612J594ObEumTQdSBerWZOMuOEC
         p/6SDXpP0dBAu33I9KedRKt7wop2nSx0VUIXV2wuKcjN3NqlLCIcRLTwuoeijQoxNt+L
         /Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741357760; x=1741962560;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZXFa7Uj+1Gvv26a7pIq8NFyLVUfkGuLwgcw0ui9q90=;
        b=c24P1W1Co9uy9bNyvkBN0RYDnx1Q0kEiXLmgHvCeKAcr5HpgvqYWzwEKPAH3YxqbSb
         nwRzJdrAlJRokSmc9zVf9nJ60QELRTEwXJFn3pB8kU8SD6y4u7LcWQ9sd27inWbw5L+R
         tA3X8hXsii9xx4P40SSTkbsdFaizfFeqGge0UasNcKzIzngqMOvCvueD3Gryvs//4wI8
         l9vgtxeZ2/IP6fZle/6NNdeRqUnYo9CCxPSMbxIbhRENKay9JalcpKQYx5Nbpq34woUa
         0PfBpyGiBjOQBe0BfLGvBHRyUj+lVFX8IeMWx+rzyYJvvL+i8b4PRrxdLS28+0ULykMp
         4qQw==
X-Gm-Message-State: AOJu0YyNxOWn0SavQ+gZlKlLi5VJwH+JnO1pL771Ue1wb89igNWOUviv
	fzrUZOlEpijdQE6PWoBGbzjQgUqmkSpbmufaaTp2UP2UWOXpCPF8RPtp+onZO1o=
X-Gm-Gg: ASbGnct4k0e1r1Qvk0MOZiiZkILMsITZ5FVowjDK+k+8Y6iq8b4LyMPKJxmQHlvuVyN
	DbeOqbhemvZiecFM+PKHH6O/YzQfsfhSw4EBEWwzRojbfZMOfOb0iNXRwEHWGCPDscacqWYH61c
	bNWgXxjwkvqEIbr+m1Chfe04YoYTJ7+Ptm8O5pLBRnAffoIujeihw7JqXbAw07XcxAQ0vAirQ06
	bvO/YS+dogOYKqugLIzZ5IT7KFda2+Ln3ovVS/HQ8/UpF473d0lm67/JG/B7SgJMJtvSfic8shA
	z0WcgbESP618HKvrF1QaxesoglkjNkEMJ66ZVarwYb+FzQ9R
X-Google-Smtp-Source: AGHT+IF49kYpg5RPGwJy8i9yjwRINb0kt0IyAlxaMk/9eqprhpCXQ6RH2p+TtJmUmzITNA8l5Eqp+g==
X-Received: by 2002:a17:907:1581:b0:ac1:e14a:19d6 with SMTP id a640c23a62f3a-ac252111787mr295629366b.0.1741357760246;
        Fri, 07 Mar 2025 06:29:20 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394fd5e6sm280834666b.80.2025.03.07.06.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 06:29:19 -0800 (PST)
Message-ID: <01cdf3a68e120d30bdcf4fc225bb236dba47fdff.camel@linaro.org>
Subject: Re: [PATCH RFC/RFT 00/12] clk: samsung: Use platform_driver_probe()
 to avoid __refdata
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 07 Mar 2025 14:29:18 +0000
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
References: 
	<20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

Nice idea!

On Wed, 2025-03-05 at 22:43 +0100, Krzysztof Kozlowski wrote:
> RFT/RFC because testing needed. I tried to do the same on exynos5-subcmu
> and it caused weird oopses which even KASAN did not narrow. Probably
> because of multiple exynos5-subcmu devices?

I've tried this on top of next-20250225, and it doesn't work on gs101
either and OOPSes several times during boot in different places, but
I can not dig deeper right now.

[   11.502919][   T58] Unable to handle kernel paging request at virtual ad=
dress ffffbfe2ab25cc30
[   11.503128][   T58] Mem abort info:
[   11.503202][   T58]   ESR =3D 0x0000000096000007
[   11.503295][   T58]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   11.503419][   T58]   SET =3D 0, FnV =3D 0
[   11.503498][   T58]   EA =3D 0, S1PTW =3D 0
[   11.503579][   T58]   FSC =3D 0x07: level 3 translation fault
[   11.503695][   T58] Data abort info:
[   11.503769][   T58]   ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x00000000
[   11.503896][   T58]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[   11.504058][   T58]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[   11.504288][   T58] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D000000=
008208c000
[   11.504570][   T58] [ffffbfe2ab25cc30] pgd=3D0000000000000000, p4d=3D100=
0000082a58003, pud=3D1000000082a59003, pmd=3D1000000082a5d003,
pte=3D0000000000000000
[   11.505079][   T58] Internal error: Oops: 0000000096000007 [#1] PREEMPT =
SMP
[   11.505346][   T58] Modules linked in:
[   11.505495][   T58] CPU: 6 UID: 0 PID: 58 Comm: kworker/u32:1 Tainted: G=
                T  6.14.0-rc4-next-20250225+ #12
[   11.505902][   T58] Tainted: [T]=3DRANDSTRUCT
[   11.506061][   T58] Hardware name: Raven (DT)
[   11.506230][   T58] Workqueue: events_unbound deferred_probe_work_func
[   11.506477][   T58] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
[   11.506768][   T58] pc : __device_attach_driver+0x18/0x254
[   11.506978][   T58] lr : bus_for_each_drv+0xfc/0x154
[   11.507168][   T58] sp : ffff8000803abc00
[   11.507321][   T58] x29: ffff8000803abc10 x28: ffff00ed403363d0 x27: fff=
f00ed40336400
[   11.507620][   T58] x26: 0000000000000000 x25: ffff00ed4002380d x24: fff=
f00ed40028000
[   11.507919][   T58] x23: ffffbfe2aba26000 x22: 0000000000000000 x21: fff=
f00ed409f8400
[   11.508219][   T58] x20: ffff8000803abca8 x19: ffffbfe2a9a4cf4c x18: 000=
0000000000040
[   11.508518][   T58] x17: 0000000000000001 x16: 0000000000000001 x15: 000=
0000000000010
[   11.508817][   T58] x14: 0000000000000010 x13: 0000000000000093 x12: 000=
0000000000002
[   11.509117][   T58] x11: ffffffffff6070d2 x10: 0000bef56a420260 x9 : 000=
0000100000000
[   11.509416][   T58] x8 : 0000000100000000 x7 : ff7f7f7f7f7f7f7f x6 : 455=
242436f53531d
[   11.509715][   T58] x5 : 1d53536f43425245 x4 : 0000000000000000 x3 : e8c=
6e6e4bec6c65a
[   11.510015][   T58] x2 : 0000000000000062 x1 : ffff8000803abca8 x0 : fff=
fbfe2ab25cc28
[   11.510315][   T58] Call trace:
[   11.510436][   T58]  __device_attach_driver+0x18/0x254 (P)
[   11.510644][   T58]  bus_for_each_drv+0xfc/0x154
[   11.510819][   T58]  __device_attach+0x100/0x1cc
[   11.510996][   T58]  device_initial_probe+0x14/0x20
[   11.511182][   T58]  bus_probe_device+0x94/0x100
[   11.511359][   T58]  deferred_probe_work_func+0xa0/0xfc
[   11.511558][   T58]  process_scheduled_works+0x194/0x2c4
[   11.511761][   T58]  worker_thread+0x28c/0x394
[   11.511930][   T58]  kthread+0x1c0/0x204
[   11.512081][   T58]  ret_from_fork+0x10/0x20
[   11.512248][   T58] Code: a9017bfd f90013f5 a9034ff4 910043fd (f9400408)=
=20
[   11.512506][   T58] ---[ end trace 0000000000000000 ]---

and

+ udevadm trigger '--action=3Dadd'
[  390.387986][  T394] Unable to handle kernel paging request at virtual ad=
dress ffffbfe2ab25cc28
[  390.388207][  T394] Mem abort info:
[  390.388282][  T394]   ESR =3D 0x0000000096000007
[  390.388378][  T394]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[  390.388506][  T394]   SET =3D 0, FnV =3D 0
[  390.388586][  T394]   EA =3D 0, S1PTW =3D 0
[  390.388669][  T394]   FSC =3D 0x07: level 3 translation fault
[  390.388787][  T394] Data abort info:
[  390.388862][  T394]   ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x00000000
[  390.388990][  T394]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[  390.389137][  T394]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[  390.389367][  T394] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D000000=
008208c000
[  390.389650][  T394] [ffffbfe2ab25cc28] pgd=3D0000000000000000, p4d=3D100=
0000082a58003, pud=3D1000000082a59003, pmd=3D1000000082a5d003,
pte=3D0000000000000000
[  390.390173][  T394] Internal error: Oops: 0000000096000007 [#2] PREEMPT =
SMP
[  390.390426][  T394] Modules linked in:
[  390.390580][  T394] CPU: 7 UID: 0 PID: 394 Comm: udevadm Tainted: G     =
 D         T  6.14.0-rc4-next-20250225+ #12
[  390.390969][  T394] Tainted: [D]=3DDIE, [T]=3DRANDSTRUCT
[  390.391153][  T394] Hardware name: Raven (DT)
[  390.391322][  T394] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
[  390.391612][  T394] pc : dev_uevent+0x144/0x2d8
[  390.391785][  T394] lr : kobject_uevent_env+0x1e0/0x3a8
[  390.391985][  T394] sp : ffff8000810fbb40
[  390.392137][  T394] x29: ffff8000810fbb60 x28: 0000000000000002 x27: fff=
fbfe2aa859240
[  390.392437][  T394] x26: ffffbfe2aae1ca12 x25: 0000000000000000 x24: fff=
f00ed41167540
[  390.392736][  T394] x23: ffff00ed41070000 x22: ffff8000810fbbf8 x21: 000=
0000000000000
[  390.393035][  T394] x20: ffff00ed41070000 x19: ffff00ed41083010 x18: 000=
0000000000000
[  390.393335][  T394] x17: 0000000000000000 x16: 0000000000000000 x15: 000=
0ffffc7e40360
[  390.393634][  T394] x14: 00000000ffffffd0 x13: aaaaaaaaaaaaaaaa x12: aaa=
aaaaaaaaa0000
[  390.393933][  T394] x11: 0000000000000000 x10: 0000000000000004 x9 : 3bc=
04d1231e6a100
[  390.394233][  T394] x8 : ffffbfe2ab25cc28 x7 : 3d4d455453595342 x6 : 455=
4535953425553
[  390.394532][  T394] x5 : ffff00ed4107026b x4 : ffffbfe2aae64508 x3 : fff=
fffffffff0a00
[  390.394831][  T394] x2 : 0000000000000000 x1 : ffff00ed41070000 x0 : fff=
f00ed41083010
[  390.395132][  T394] Call trace:
[  390.395252][  T394]  dev_uevent+0x144/0x2d8 (P)
[  390.395425][  T394]  kobject_uevent_env+0x1e0/0x3a8
[  390.395610][  T394]  kobject_synth_uevent+0x3ec/0x440
[  390.395802][  T394]  uevent_store+0x28/0x64
[  390.395962][  T394]  dev_attr_store+0x18/0x2c
[  390.396128][  T394]  sysfs_kf_write+0x80/0xa0
[  390.396295][  T394]  kernfs_fop_write_iter+0xdc/0x178
[  390.396488][  T394]  vfs_write+0x344/0x3a0
[  390.396644][  T394]  ksys_write+0x7c/0xe8
[  390.396797][  T394]  __arm64_sys_write+0x1c/0x28
[  390.396973][  T394]  invoke_syscall+0x40/0xf8
[  390.397139][  T394]  el0_svc_common+0xac/0xdc
[  390.397306][  T394]  do_el0_svc+0x1c/0x28
[  390.397459][  T394]  el0_svc+0x34/0x9c
[  390.397602][  T394]  el0t_64_sync_handler+0x84/0x108
[  390.397791][  T394]  el0t_64_sync+0x1a4/0x1a8
[  390.397963][  T394] Code: aa1403e0 94232d4d f9403668 b40000c8 (f9400102)=
=20
[  390.398221][  T394] ---[ end trace 0000000000000000 ]---


Cheers,
Andre'

