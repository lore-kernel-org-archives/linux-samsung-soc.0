Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6803112AB;
	Wed, 10 Sep 2025 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757495671; cv=none; b=tis7IycnNNSfGDjlxCyS2I6m2AZIMuV3Zqsp8IQdxZziKalJd5VSL6er8Wga3Q6jxaMfUEglAihj5l2CGENJUFq70HpxcISsP24gaxOBAXK4MK5tJZI0lczPy8/G95UabbsP4Q1CYwzD9aAr1XXcyV/efrUiK0N5Jj80R4O4t8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757495671; c=relaxed/simple;
	bh=dOBnSJdY1HBDGZIbzVURAx2W0jjaL81SOqrrsNYd8Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+NCZN74HIfJvsYmbtc+M3cEGbOcpa0aTNdfbrkbFF3pzc/3NGJ/FxX6lC0/FpA+DB2NjoG4eYKAfCtlODWoWokIM0wlJO3m2fD8AV4/3nygcykEK+FTIMjAWmCdH6jExZFOr687dAfCc5LEOGF17/8Qe3eceG5eIWJGUELiU1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOXGn2t/; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOXGn2t/"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62bec18abe6so3528417a12.3;
        Wed, 10 Sep 2025 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757495668; x=1758100468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tohhmJpLnU2OZqryKv4/8WdFOQ07N2VycEhxl34l3PI=;
        b=eOXGn2t/Oo5J5DcxrPiFx9FDVhvvnmQ5lvktrGOL7gEOvwtPVyY9m8XDFu1VjDTCrn
         O5FqZZuUzH8N+NQsq9Pg4xnYGn56Ivh+Z4LheR3qnSNI8sxf1xd7MvQESGqo5DQjsKJf
         jgH8801bQumU1Fu0Qcc1YFEk2M1I+6yCGZav6zmli6JpnAAmgGzbxubogBVFP91wbrTd
         2Tw5F7VbC8t5Qc6r9QjBU96RcQNU1YM/NmCaKfcHqp4t8D+7/gkx68XcQor2R4lJcnbx
         RNSY+y7AjOe/pesxe7CAOUpfenFTTOATzdyLJK/To+j0kUN/3bbN4Z/Kh2y5/AdYVch9
         udKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757495668; x=1758100468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tohhmJpLnU2OZqryKv4/8WdFOQ07N2VycEhxl34l3PI=;
        b=tuU32n8swyifse5tDeE2yIgQlifhLQYmdIYXkzSyUyujh95AsUKtKynBYjB+NzEcup
         dufnBRu3DYolTsGilSFU5EcTkcYqb5U5wUH4zd8FpjbD4EdVKCZG84DM+Bu1j82tGqdL
         KLheAgBd0fT9wTDyJcU6I1cy00K2uDHupY4UNrLNS2agrxLe4OQ8iHdK7Xvt4twqS2kQ
         tkSrDd4RkIfgLcU9oSNbF6dqLlntNtu5Lae1X48RDxgdAQB6iK1FZ6nrqHfVh4qZlu6/
         oz2opWopLUivBbOthYJ4NEhgKOtIa8MVLiKucU0yLGlMzEjOOnwL6gocROU/htskuKE9
         ASow==
X-Forwarded-Encrypted: i=1; AJvYcCV3gwBbFTkPEFOnx3LOCxWDvN4H8RxOKroJxpgDWG6QutCpL4GaJYYY37xWHjEtwRay+SvDqG80hPvt@vger.kernel.org, AJvYcCVbh2nJLDLZJpsf9GTJxAu0i50quQUnWP11xdX8PSvDxp62zEVKl5tFEJnt/qz5WoK4G8IJ0ZHQ2G5S0kMX6TMXFLc=@vger.kernel.org, AJvYcCWLeuAHgJfCimko2ICoWlYB2EPtIIVIsS79zDQoCPdPpU5gdIb+f6HufcuGzs2LWtkPKNvXc29c+9TSUFZT@vger.kernel.org
X-Gm-Message-State: AOJu0YyKEquCDb+0WYXb4iYcMhFU+x0wd0gbqj8HOjgCggESBc1x+l/3
	LoHorXAAmOe4/ptjTeJcaK939htHs1PSc9eh0ALHo7jA855RyhhjzIr1bhwnwPQ5QhC0BEqJjgv
	fq7ZDYPb3aABhQKuvEwGvId9V4LKiUd8=
X-Gm-Gg: ASbGncuzS8oD72U5oYlbLVLKKPVgpFOlXk+UwU3gosesqpL96kCUyEfzEIY2RTd98wp
	NZh+YRnXGDBp/T6rGYOwxLfH4NZlKqsI7vgO7r5i07SWI2x5pHrdl7/Witvlbn8i6lljLa5qDbP
	LW1KrTuRr3P7zQEiejHtscx8tmPRHUXTiD5sE+pTcnHZDiJXRgXnguRKdw+rx+2++rLyldvR3bT
	MccAw==
X-Google-Smtp-Source: AGHT+IHt5OMfq3RnvcklD+ff+bOSHuLwNzni+Ry6n9qQYdWO5mBITPRPkPB5JSUgezT5cNBUF8jT6J1EG+4oUU+F/IM=
X-Received: by 2002:a05:6402:280d:b0:618:20c1:7e61 with SMTP id
 4fb4d7f45d1cf-62378833026mr13983611a12.27.1757495667975; Wed, 10 Sep 2025
 02:14:27 -0700 (PDT)
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
 <CANAwSgRTM4OSnXKZWWzxi2cW8QwWLKJz2xmUThyLkdkq71rH1g@mail.gmail.com> <4453695a-9f31-455b-b118-4084f0367cb3@kernel.org>
In-Reply-To: <4453695a-9f31-455b-b118-4084f0367cb3@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 10 Sep 2025 14:44:10 +0530
X-Gm-Features: AS18NWBdjpBUe9RFBFcPJVLD2d1QZEmgBiuDkbK1apG0d-9f9dyb4w2ne2YPcFc
Message-ID: <CANAwSgQZSGnoT9kyjVtZ=chgb_L+k4S+ynZoFjS3QPQsazJJdg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, 10 Sept 2025 at 12:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 09/09/2025 15:59, Anand Moon wrote:
> > Hi Krzysztof, Marek,
> >
> > On Tue, 30 Jul 2024 at 20:32, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi Krzysztof,
> >>
> >> On Tue, 30 Jul 2024 at 18:53, Krzysztof Kozlowski <krzk@kernel.org> wr=
ote:
> >>>
> >>> On 30/07/2024 15:20, Anand Moon wrote:
> >>>> Hi Krzysztof,
> >>>>
> >>>> On Tue, 30 Jul 2024 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> =
wrote:
> >>>>>
> >>>>> On 30/07/2024 14:06, Anand Moon wrote:
> >>>>>> Hi Marek,
> >>>>>>
> >>>>>> On Tue, 30 Jul 2024 at 17:14, Marek Szyprowski <m.szyprowski@samsu=
ng.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 30.07.2024 11:13, Anand Moon wrote:
> >>>>>>>> As per the Exynos 5422 user manual add missing cache information=
 to
> >>>>>>>> the Exynos542x SoC.
> >>>>>>>>
> >>>>>>>> - Each Cortex-A7 core has 32 KB of instruction cache and
> >>>>>>>>       32 KB of L1 data cache available.
> >>>>>>>> - Each Cortex-A15 core has 32 KB of L1 instruction cache and
> >>>>>>>>       32 KB of L1 data cache available.
> >>>>>>>> - The little (A7) cluster has 512 KB of unified L2 cache availab=
le.
> >>>>>>>> - The big (A15) cluster has 2 MB of unified L2 cache available.
> >>>>>>>>
> >>>>>>>> Features:
> >>>>>>>> - Exynos 5422 support cache coherency interconnect (CCI) bus wit=
h
> >>>>>>>>    L2 cache snooping capability. This hardware automatic L2 cach=
e
> >>>>>>>>    snooping removes the efforts of synchronizing the contents of=
 the
> >>>>>>>>    two L2 caches in core switching event.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>>>>>
> >>>>>>>
> >>>>>>> The provided values are not correct. Please refer to commit 5f41f=
9198f29
> >>>>>>> ("ARM: 8864/1: Add workaround for I-Cache line size mismatch betw=
een CPU
> >>>>>>> cores"), which adds workaround for different l1 icache line size =
between
> >>>>>>> big and little CPUs. This workaround gets enabled on all Exynos54=
2x/5800
> >>>>>>> boards.
> >>>>>>>
> >>>>>> Ok, I have just referred to the Exynos 5422 user manual for this p=
atch,
> >>>>>> This patch is just updating the cache size for CPU for big.litle a=
rchitecture..
> >>>>>>
> >>>>>
> >>>>> Let me get it right. Marek's comment was that you used wrong values=
.
> >>>>> Marek also provided rationale for this. Now your reply is that you
> >>>>> update cache size? Sorry, I fail how you address Marek's comment.
> >>>>>
> >>>>> Do not repeat what the patch is doing. We all can see it. Instead
> >>>>> respond to the comment with some sort of arguments.
> >>>>>
> >>>>
> >>>> Ok, If I am not wrong  icache_size is hard-coded in the above commit=
.
> >>>>
> >>>> +#ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
> >>>> +.globl icache_size
> >>>> +       .data
> >>>> +       .align  2
> >>>> +icache_size:
> >>>> +       .long   64
> >>>> +       .text
> >>>> +#endif
> >>>>
> >>>> In the check_cpu_icache_size function, we read the control reg
> >>>> and recalculate the icache_size.
> >>>> if there mismatch we re-apply the Icache_size,
> >>>>
> >>>> So dts passed values do not apply over here,
> >>>
> >>> So you provide incorrect values in terms of them being ignored? Then =
do
> >>> not provide at all.
> >>>
> >> I will drop the icache and dcache values and just pass the L2_a7 and
> >> L2_a15, value
> >> Is this ok for you?
> >>
> >> Earlier, I have tried to verify this information in /sys and /proc
> >> to verify the changes as ARM does not populate this information.
> >>
> > Here's an article that provides detailed insights into the cache featur=
e.
> > [0] http://jake.dothome.co.kr/cache4/
>
> Here is Korean Wikipedia article about Sugar glider:
> https://ko.wikipedia.org/wiki/%EC%9C%A0%EB%8C%80%ED%95%98%EB%8A%98%EB%8B%=
A4%EB%9E%8C%EC%A5%90
>
> I guess we are putting now random references in Korean to our emails.
>
That wasn=E2=80=99t my intention=E2=80=94I was simply trying to elaborate o=
n my thought process.
If the reference came across as random or unclear,
I=E2=80=99ll make sure to be more precise going forward. Thanks for pointin=
g it out.
>
> >
> > The values associated with L1 and L2 caches indicate their respective s=
izes,
> > as specified in the ARM Technical Reference Manual (TRM) below.
> >
> > Cortex-A15 L2 cache controller
> > [0] https://developer.arm.com/documentation/ddi0503/i/programmers-model=
/programmable-peripherals-and-interfaces/cortex-a15-l2-cache-controller
> >
> > Cortex-A7 L2 cache controller
> > [1] https://developer.arm.com/documentation/ddi0503/i/programmers-model=
/programmable-peripherals-and-interfaces/cortex-a7-l2-cache-controller
> >
> > These changes help define a fixed cache size, ensuring that active page=
s
> > are mapped correctly within the expected cache boundaries.
>
>
> As with many previous attempts, you do not understand comments and
> questions and you do not reply to them. This makes conversation pointless=
.
>
> To prove it:
>
> 1. No one asks for performance numbers.
> 2. You give performance numbers.
>
I realize my explanation might have been confusing.
What I meant is that my changes take a different approach,
but they=E2=80=99re safe and don=E2=80=99t break the current codebase.

Specifically, they do not break or interfere with the behavior
introduced in commit
5f41f9198f29 ("ARM: 8864/1: Add workaround for I-Cache line size
mismatch between CPU cores").
> I am dropping this patch because you did not address actual comments. I
> also do not plan to give thorough review to other of your patches,
> because you wasted a lot of my time in the past and this example here
> proves you keep wasting.
Thanks for the feedback. I understand your frustration,
and I regret that my response didn=E2=80=99t adequately address your commen=
ts.
I intended to clarify my understanding and contribute constructively,
not to waste anyone=E2=80=99s time.

I=E2=80=99ll take this as a cue to improve how I respond to reviews going f=
orward.
Appreciate the time you=E2=80=99ve spent engaging with my patches.
>
> Best regards,
> Krzysztof
Thanks
-Anand
