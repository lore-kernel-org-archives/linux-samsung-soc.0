Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B129E37DE9D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jul 2026 21:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151355; cv=none; b=uq6GXEVc+r6q64QkMS6TmFK+qAzxDQOpJctP0jcaETT4nKZlj/mnhOtdjbGntHgDdXX7QOm9oPb8Gi20xblPrF2+nfoAukteYeQ07MORiw5G6YHEnSKTmDm51G/2c/bltV2banju7Mv4bHgLvou/LETOh2qshKzgFJsPdcHHzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151355; c=relaxed/simple;
	bh=zDmviBF6d0z8y3iKUGEq0/19Yd0dsXtSGmGOvA4pLkA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BGrpb2nYKIJ4MO5MTuYwkQwAjnlUqkNDgjeN2jKLHVxavFmwg+SnB6h3B+JZkZC6kMwjdCO2wFdy5yRKg532PpUlQ7Nc+9yZ+Z85hRpK0za+3aTLAfia6z3q9ysm3TPX1rAvdYBCPo5XjBVvBNt2A+IzSos2NNMP1CJaxp+Otzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PQPTPLdC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PQPTPLdC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c733f15aso52970395e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jul 2026 14:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784151352; x=1784756152; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a0R9o4ZK0HkvMsFwVmeumC4FpdS0toOa+WJD+XwvNz8=;
        b=PQPTPLdCkeljOZCINYQ+FY+ftYomQEVIQmbGECnCvnmLnSCTpoimZtJG349XUFWz/9
         +AAZp4Lzn9MTGN1DLjDGdr8/U0anOYqUvYdHEJTbcayY7x+6AMhyo4mVSgA07h2tEmKr
         fRlGIpC1fPgZX2M1uCbVOTDtyd0D6X+aYK8/PPF0xhIE5qPNg11WRdfncBQTiPWxDGlN
         KM5TOJnfZrHQ9V0jNaJ3+bAJQTVMXbKVJKW4Uv1ovy5WByo8oxeqHsBbfiq8cV0rokOX
         6jzQfhLNaqZY8rhrxwKZanQ+cWtePLnI+1+ceFFdcChxC4tX0zcy2cTzwduYMc2cCW77
         ZEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151352; x=1784756152;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0R9o4ZK0HkvMsFwVmeumC4FpdS0toOa+WJD+XwvNz8=;
        b=RSgbrOaJlgVH1OQU+L+YuZHNwiRvF2uq6afVKHQWTC8dXExE24SDioYPt6GrcWHxIt
         6p1hjNOvXAhNT5DztvpQZ5jfX0PC28HLu8m2IrvrY5tootx26OCNWyIskrpqV3UbhHMQ
         GjTm2feQreSkcvLBDcxwcfSYIxRmsRvenxZZHo+uVMyukGbwYqH6aUoMGNJa+/wRpYjt
         E4ijZtu2zWX17dlMhBonxBrWQwWX9HlqQp2oEvKx+D+DWfJTJbgDiKG21TN9eZH4vPyP
         lyPTG4c7yY0Chl8GmtFITXgSlSr4/N3QSUguI6KPn3DOxl6MaZ6n/smgWCn/n8iSGhC6
         AOXw==
X-Forwarded-Encrypted: i=1; AHgh+RrZ3VopjgR9td41JB/llOrAs8+FyRJcgOu7yVPGk0gL2IMfACoLglyvN8sQYCtg0//zlesqfrQzMT6JYxgLPP0Qug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ivMunZFVFo7bm3pPmhEBgGhTjLoMJGrDVVNBP/oSQJoYW1iE
	Lu5vSpEXPJ61U9dqNWJHHL3r3qQwNbGg2escRYan/OBPIgVlmWnrQBH83GdmVcBI4ac=
X-Gm-Gg: AfdE7cmipbMA73jKEiKy9mi0m16WllFDWroGle3QpCJjUURTN5+PPLqpimzBecBin99
	mEDZNV6XnQkDeX0K71RKfxpIwLenG2VOBDH3+7UvyFeRjmxAwisuynJNdLGoJq9e5ZacHnhbLne
	p8D/a1PdES578+fSn5sfeEm9uVNd3zZCG7OXdecw5otvEyUGkm8eRRoYTuO62QWCB/j6E6ZBoUg
	O1Mo/Nyuw0CbZYg47MxQ0hfHhDqTUGiIds5uuBmVlkR8a+xLIRt45KxozYKL3M/qKK1QgMkAabQ
	7cMQPVZdenMtu6fBYNEZ10ysshgwSVjLUJHH4WSW45eCYf20TA7PsxSbprckT5ExFz8daB1KKy0
	5DnTSKv2auqGCnTxsaz/vH/HeBC8REfShO9zxldEzn5yH5AHJ3yimX8KGzGuJQZyY/QAGlzTrIb
	h0S79B1hQS9TA3Ip1GCGU8GMEUappn+RRx1ACUj6TmkjWkjBM97MMQSxTPzHrUloI=
X-Received: by 2002:a05:600c:8a0d:10b0:495:3b8a:5e17 with SMTP id 5b1f17b1804b1-4953b8a5e5amr42488305e9.16.1784151351734;
        Wed, 15 Jul 2026 14:35:51 -0700 (PDT)
Received: from localhost ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e53680sm9560845e9.0.2026.07.15.14.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 14:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 22:35:50 +0100
Message-Id: <DJZGVB7DOX4L.318L4AZWEFQBE@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in
 hotplug callbacks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org> <20260605-exynos-pmu-cpuhp-idle-fixes-v1-1-0cd05c81a82d@linaro.org> <CADrjBPoDC68jyEY2HZtoh1SLfVwFPpzKea7T6QLyfY99MsNVcQ@mail.gmail.com>
In-Reply-To: <CADrjBPoDC68jyEY2HZtoh1SLfVwFPpzKea7T6QLyfY99MsNVcQ@mail.gmail.com>

On Wed Jun 10, 2026 at 10:55 AM BST, Peter Griffin wrote:
> Hi Alexey,
>
> Thanks for your patch.
>
> On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wro=
te:
>>
>> The CPU hotplug state callbacks __gs101_cpu_pmu_online() and
>> __gs101_cpu_pmu_offline() currently partially use smp_processor_id() to
>> determine the target register offset for the CPU inform hints. This may
>> be fine for cpuidle flow but broken for cpu hotplug where the target
>> cpu is passed as an argument and could be different from cpu where
>> that is executing (e.g. CPU 0 offlining CPU 1), meaning that
>> smp_processor_id() returns the id of local CPU but hotplug flow
>> deals with another CPU core undergoing the transition.
>
> This was intentional. The powermode hint is always programmed based on
> the currently executing CPU core in the gs101 downstream code (for
> both CPU Idle and CPU hotplug paths). See
> https://android.googlesource.com/kernel/google-modules/raviole-device/+/r=
efs/heads/android-gs-raviole-mainline/drivers/soc/google/cal-if/pmucal_powe=
rmode.c#15
> and the pmu_intr_gen is done based on the actual CPU being
> enabled/disabled.

Beware of the Downstream bearing gifts.
Dowstream may or may not contain mistakes or maybe they have something
that workarounds potential problems. I agree that it is a good source
of reference but I doubt that we must use it as an ultimate GOAT reference
source.

Even Qualcomm downstream things have mistakes sometimes.

> It's possible Exynos850 requires something different. I suggest
> checking the equivalent function in the e850 downstream kernel.
>
>>
>> This causes the pmu driver to write power down and power on configuratio=
n
>> hints to the wrong hardware registers, messing up the power state of act=
ive
>> cores and failing to configure the target core. Fix this by removing the
>> cpuhint variable entirely and utilizing the target 'cpu' argument passed
>> to the callbacks by the hotplug core infrastructure.
>
> Unfortunately I think you're introducing the bug you describe with this p=
atch.

I wouldn't be so quick judging this like this. I think this patch actually
does fixes a problem. IIRC I also tested this and there were no issues.

Considering that neither your team nor me have access to the implementation
details it would be easier to just drop it instead of endlessly debating
over this if there is no interest narrowing it down.
FWIW this was reported by Sashiko in the first place so I couldn't say what
justification can be provided.
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65=
362@linaro.org?part=3D3

Let's go over details. Idle callbacks are executed on target CPUs so
target CPU is the same as local CPU.
The hotplug callbacks are slightly different. Offline CPU callback executes
on target CPU so again the local CPU is equal to target CPU (CPU offlines
itself). The online hotplug callback stands out. It is executed on
some CPU and deal with target CPU, that some CPU is not the same as target =
CPU
as system assumes that CPU undergoing online transition is not ready yet.

All these callbacks write to CPUx_INFORM register (where x -- is CPU id).
The number of these regs are equal to the number of CPUs. I think these
are per-CPU registers.

Idle callbacks and hotplug offline callback write cpu power state hint
to the local CPU's cpu_inform register. On online callback, the random
CPUx_INFORM register is chosen and its state is cleared (because online
callback can be executed on random available CPU). Does it make any sense
to you? Why among 4 callbacks one of them updates random CPUx_INFORM
register?

I think these callbacks should deal with target CPU undergoing transition
and not with random CPU id.

If I consumed enough coffee and can still trust my eyes, I tested two
configurations:
-- this commit (and similar change for e850);
-- change where CPU_INFORM_CLEAR write is removed from online callback.

On e850 (with consecutive series) and gs101. All were fine.

My understanding from experiments is that:
-- clears of CPUx_INFORM are less important and maybe not needed at all;
-- important thing is the value in correct CPUx_INFORM when CPU goes
into a power state, upon executing psci call.

The potential race doesn't reproduce presumably because hotplug ops
are fully serialized.

The downstream probably uses smp_processor_id() for cluster power
down and up states. Perhaps, cluster offline callbacks don't have CPU id
for transition into CPD state and they are executed on the last CPU from
cluster undergoing power state transition.

Anyhow, I think it will less compilcated to remove this change rather
than speculate without a way to confirm the behaviour.

BR,
Alexey.

>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-=
0-54fec5f65362@linaro.org?part=3D3
>> Fixes: 598995027b91 ("soc: samsung: exynos-pmu: enable CPU hotplug suppo=
rt for gs101")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  drivers/soc/samsung/exynos-pmu.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyn=
os-pmu.c
>> index d58376c38179..6e635872247a 100644
>> --- a/drivers/soc/samsung/exynos-pmu.c
>> +++ b/drivers/soc/samsung/exynos-pmu.c
>> @@ -235,11 +235,10 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle=
);
>>  static int __gs101_cpu_pmu_online(unsigned int cpu)
>>         __must_hold(&pmu_context->cpupm_lock)
>>  {
>> -       unsigned int cpuhint =3D smp_processor_id();
>>         u32 reg, mask;
>>
>>         /* clear cpu inform hint */
>> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
>> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
>>                      CPU_INFORM_CLEAR);
>>
>>         mask =3D BIT(cpu);
>> @@ -296,12 +295,10 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu=
)
>>  static int __gs101_cpu_pmu_offline(unsigned int cpu)
>>         __must_hold(&pmu_context->cpupm_lock)
>>  {
>> -       unsigned int cpuhint =3D smp_processor_id();
>>         u32 reg, mask;
>>
>>         /* set cpu inform hint */
>> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
>> -                    CPU_INFORM_C2);
>> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INF=
ORM_C2);
>>
>>         mask =3D BIT(cpu);
>>         regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_=
ENABLE,
>>
>> --
>> 2.51.0
>>

