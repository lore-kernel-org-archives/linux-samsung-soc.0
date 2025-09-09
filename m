Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF1332253D;
	Tue,  9 Sep 2025 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426392; cv=none; b=e9NIrMEKPjMcamwLYPdSg6VheE/80PdlLJ/QdL4SMItmJe1gfoSPQs7C2SEp7y3/j6tKVX8mHTcFkHMWe9voZ7EC+hXe81HIvVEQTDpdwL40gUIyIHpqSuyYaRwsLYrRGhx6+Pi+kbjk2GOsW8bUtEVdKCasnBVKxYCrSU9ecYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426392; c=relaxed/simple;
	bh=zccPcrAxl+3uLnZ3nZHwdrV86xu6wlzs/i+B3xa0BkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dLO/zZZ0NVk5/RXOiBL+O70GRBpbzaVxWrVw9bCCFXilhLZ4LBXDCfS7vJ9dXJe3MwOqyC78pIPZnJZhTVMVUZYh+afhcBI25V5hq8mOHLaFuJ7w0Pl4KQizRTgeenZO4WN3ZVgOK5bgVMU0iyBZRrgX5DHNxOkDUBTS/1VcsmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DADNZxuy; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DADNZxuy"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so8430627a12.0;
        Tue, 09 Sep 2025 06:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757426389; x=1758031189; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vl21Ac/hRl5KaWEXAXbzKsLXJ9UhwUEd+pnm8CY14SY=;
        b=DADNZxuyNbQDB4UOClkpGGtoJi0kGYvgQszmAhWJJAqUY2IKTVK0vuEomEYS/D3pnW
         2Z8Riu6XDsr8264/hUUBBuCp6HNcRVqWihTYKK5wxInXnjFgQMizkoYt+UtvwxUaUZz9
         MOtanxhhU89dj9fI8XIGVWDUhQR/0OQOx3uQo7xCq5Jj0oIcUAHAoowAU+9WrATD5pbo
         0Z8O6d0tCmsTZsks8wbZSKwdR0BlwfU466bYjwvEmTN0EWDtZSDoSjV51AIEAqjQZyem
         v6MAXuA1qWuBuvUhLmHNV+fDVEvgduxL72lIoPzcUEHdzwOGqQjMj6kFf4yQIp6GxfK6
         0ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426389; x=1758031189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vl21Ac/hRl5KaWEXAXbzKsLXJ9UhwUEd+pnm8CY14SY=;
        b=O0G1Nzka8QGnvX+paxNuYDUzpXkMUi8BRRG2Lfs8U9c3Pt/9jRmxuPZbTK+NcuWdll
         9iqJAXy5TkifAC1oFW13OQO2ws2cecvMR5KIm/CAZ5FfnDMZ97PwDJ32VQQXhwvI3iEA
         6ndcb3MWq/lxJHmkRb5wG2SJ3koRedi9HaZpNglf6u4rlOhGLNb+Bzzuuq8DdbmCfplQ
         wqsGilYWew5j7b+/3eczJkGCSQIHida1qdeCA3NV+X8CTrTvmgz+tyxYpZ8OoPwyOX2a
         iPcyJPX4fMzRXxeXFiKqIDvFGTGsUHfXeJ4Q8x75fU88Y1S6hwxz95Ev32Ka7FBkgrg/
         e6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvNzQK59wyuatEy/8Ga8CuBkORrr1VTX3Y6HlHTrnc222vfESZ3ioQYhryykUNzWch5XIehSDPD9TP@vger.kernel.org, AJvYcCWlg6rNYZFzjchiI/ihzDxCK/oBRIErFFz321oSLcPqjieOtYfjWf6yZafWqL3dSJ9mALIpN4bXrA5Mbbkr@vger.kernel.org, AJvYcCXZ8TCMy/M1nR45m0h2nNtcek9zJJgQr++e4tw2/ocE4aAxjJu+ScEsT8ZgbPoHt/775UPnfVJqUZwKBLNNBXoMe/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxROIbvY50IkMnssHPt3IQ8/C++xF1GJsZlvPOl5D1iye5IyjbD
	U5O9ZCIZUKfN9yaRQ4vdYgQWdvem+ROReTECPlJ/CyjXaqvc6fl55IefwYY0e2F4/q1+/3IJJh7
	oXxxnwb0Es0uK+w0wDp8NKIASwQSyLoD2IGma
X-Gm-Gg: ASbGncusppNz0QkeiuOJ0tioMo2R/ZdNKDjKQ4QckVsgjNywcWkThonGw5ioHwe0UYo
	kWT26H+C+S7hm3mcBp/YMMownfOu8rPJw9nYLJnFa3sdh9sn9JNvqp+5obucIRnWJ/Wo/q1wBNa
	xqjpJAzBRplG+/3HGIHZdcFo9OlFFKiJkyGauw4d+0BS3uTKxgKjVXGtv+sywCiQPaVP8uw/5+y
	EziDx9rAvDhsgdy
X-Google-Smtp-Source: AGHT+IHdzYdKi432+CbqXD4bpTGkg+RAdUX/BeDAoijH6nRbojp/RI1EEY0yOSR4vLDMODWDNeuQsigNZI6gn2G14Hw=
X-Received: by 2002:a05:6402:42cc:b0:61c:d457:e542 with SMTP id
 4fb4d7f45d1cf-623775e56cemr11270735a12.17.1757426388676; Tue, 09 Sep 2025
 06:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730091322.5741-1-linux.amoon@gmail.com> <CGME20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659@eucas1p1.samsung.com>
 <20240730091322.5741-2-linux.amoon@gmail.com> <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
 <CANAwSgT_TOFwP80+H8-CdXDLLu+u2XZMr2dnxcsSDe8S5yeYCw@mail.gmail.com>
 <a41a6143-ef2e-4d86-b102-eaf442985173@kernel.org> <CANAwSgSbSgXwOQLrVrHD7jpDe0=Bq7r2K8p0JjvZJMPpVNq4XQ@mail.gmail.com>
 <d72d7927-079a-4a82-a298-db9ed70a816f@kernel.org> <CANAwSgSgK5hmcLg7sChAs7QL0x7wufHpWDZJFyw6tMiiOuDZeg@mail.gmail.com>
In-Reply-To: <CANAwSgSgK5hmcLg7sChAs7QL0x7wufHpWDZJFyw6tMiiOuDZeg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 9 Sep 2025 19:29:31 +0530
X-Gm-Features: Ac12FXy25GJOdSBU_JfQSnoFhbd7dDaA744zBKRa5JcRhilE7Rzjj8NE0zapeR0
Message-ID: <CANAwSgRTM4OSnXKZWWzxi2cW8QwWLKJz2xmUThyLkdkq71rH1g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof, Marek,

On Tue, 30 Jul 2024 at 20:32, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Krzysztof,
>
> On Tue, 30 Jul 2024 at 18:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 30/07/2024 15:20, Anand Moon wrote:
> > > Hi Krzysztof,
> > >
> > > On Tue, 30 Jul 2024 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>
> > >> On 30/07/2024 14:06, Anand Moon wrote:
> > >>> Hi Marek,
> > >>>
> > >>> On Tue, 30 Jul 2024 at 17:14, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >>>>
> > >>>>
> > >>>> On 30.07.2024 11:13, Anand Moon wrote:
> > >>>>> As per the Exynos 5422 user manual add missing cache information to
> > >>>>> the Exynos542x SoC.
> > >>>>>
> > >>>>> - Each Cortex-A7 core has 32 KB of instruction cache and
> > >>>>>       32 KB of L1 data cache available.
> > >>>>> - Each Cortex-A15 core has 32 KB of L1 instruction cache and
> > >>>>>       32 KB of L1 data cache available.
> > >>>>> - The little (A7) cluster has 512 KB of unified L2 cache available.
> > >>>>> - The big (A15) cluster has 2 MB of unified L2 cache available.
> > >>>>>
> > >>>>> Features:
> > >>>>> - Exynos 5422 support cache coherency interconnect (CCI) bus with
> > >>>>>    L2 cache snooping capability. This hardware automatic L2 cache
> > >>>>>    snooping removes the efforts of synchronizing the contents of the
> > >>>>>    two L2 caches in core switching event.
> > >>>>>
> > >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > >>>>
> > >>>>
> > >>>> The provided values are not correct. Please refer to commit 5f41f9198f29
> > >>>> ("ARM: 8864/1: Add workaround for I-Cache line size mismatch between CPU
> > >>>> cores"), which adds workaround for different l1 icache line size between
> > >>>> big and little CPUs. This workaround gets enabled on all Exynos542x/5800
> > >>>> boards.
> > >>>>
> > >>> Ok, I have just referred to the Exynos 5422 user manual for this patch,
> > >>> This patch is just updating the cache size for CPU for big.litle architecture..
> > >>>
> > >>
> > >> Let me get it right. Marek's comment was that you used wrong values.
> > >> Marek also provided rationale for this. Now your reply is that you
> > >> update cache size? Sorry, I fail how you address Marek's comment.
> > >>
> > >> Do not repeat what the patch is doing. We all can see it. Instead
> > >> respond to the comment with some sort of arguments.
> > >>
> > >
> > > Ok, If I am not wrong  icache_size is hard-coded in the above commit.
> > >
> > > +#ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
> > > +.globl icache_size
> > > +       .data
> > > +       .align  2
> > > +icache_size:
> > > +       .long   64
> > > +       .text
> > > +#endif
> > >
> > > In the check_cpu_icache_size function, we read the control reg
> > > and recalculate the icache_size.
> > > if there mismatch we re-apply the Icache_size,
> > >
> > > So dts passed values do not apply over here,
> >
> > So you provide incorrect values in terms of them being ignored? Then do
> > not provide at all.
> >
> I will drop the icache and dcache values and just pass the L2_a7 and
> L2_a15, value
> Is this ok for you?
>
> Earlier, I have tried to verify this information in /sys and /proc
> to verify the changes as ARM does not populate this information.
>
Here's an article that provides detailed insights into the cache feature.
[0] http://jake.dothome.co.kr/cache4/

The values associated with L1 and L2 caches indicate their respective sizes,
as specified in the ARM Technical Reference Manual (TRM) below.

Cortex-A15 L2 cache controller
[0] https://developer.arm.com/documentation/ddi0503/i/programmers-model/programmable-peripherals-and-interfaces/cortex-a15-l2-cache-controller

Cortex-A7 L2 cache controller
[1] https://developer.arm.com/documentation/ddi0503/i/programmers-model/programmable-peripherals-and-interfaces/cortex-a7-l2-cache-controller

These changes help define a fixed cache size, ensuring that active pages
are mapped correctly within the expected cache boundaries.

Here is the small test case using perf
Before

$ sudo perf stat -e L1-dcache-loads,L1-dcache-load-misses ./fact

Simulated Cache Miss Time (avg): 4766632 ns
Factorial(10) = 3628800

 Performance counter stats for './fact':

            926328      armv7_cortex_a15/L1-dcache-loads/
     <not counted>      armv7_cortex_a7/L1-dcache-loads/
                         (0.00%)
             16510      armv7_cortex_a15/L1-dcache-load-misses/ #
1.78% of all L1-dcache accesses
     <not counted>      armv7_cortex_a7/L1-dcache-load-misses/
                               (0.00%)

       0.008970031 seconds time elapsed

       0.000000000 seconds user
       0.009673000 seconds sys

After
$ sudo perf stat -e L1-dcache-loads,L1-dcache-load-misses ./fact
Simulated Cache Miss Time (avg): 4623272 ns
Factorial(10) = 3628800

 Performance counter stats for './fact':

            930570      armv7_cortex_a15/L1-dcache-loads/
     <not counted>      armv7_cortex_a7/L1-dcache-loads/
                         (0.00%)
              4755      armv7_cortex_a15/L1-dcache-load-misses/ #
0.51% of all L1-dcache accesses
     <not counted>      armv7_cortex_a7/L1-dcache-load-misses/
                               (0.00%)

       0.011068250 seconds time elapsed

       0.000000000 seconds user
       0.010793000 seconds sys

Thanks
-Anand
