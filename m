Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CD63537E8;
	Thu, 21 May 2026 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366719; cv=none; b=th4HyI66ZQOvlWbcwEjeMy2/ETZGV49xIy4dfsSVIibNEc9a3qcS200DcHSfVrBOJI0EVCVciyVoedjuGkqgyv6s1TPpE3bV+Zf1m77HO1s2jesMpqz6t7XzI4CiCkLl/9vPcV+VTIDnURjSfZkU4jlMmJvh9dZ1GqstMaU0khs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366719; c=relaxed/simple;
	bh=2ONFY1dkf6uXrgmJy/g9IpX903O/9noihZCif0aPlSI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uMGco3nvw9LZEc4xEdBN7/GLhkb7FUiJkhHUftpWcE8wY9/BfjbFcwOmoDdwi9VRovlPqZMe911/009OD5z5eVEL3J66brKTf2aFhZu15Bk7OpS8OCeBvNSAUueB2eB3APq2BffTKJyqemOcn00XKc52cj2r8/UQuUTYruSkG4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUoxOvs0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUoxOvs0"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E75041F000E9;
	Thu, 21 May 2026 12:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779366717;
	bh=wqCkFknN+N3li35+HvdUGnhYWftGulMOgKVsuhyPHwA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=eUoxOvs0JYkXNTlx9svl9KZE1lEq/WML4RGD2qzPLI55urA8oxqlh1yrDfHUX+M/9
	 1DzAZ0/Lg3KXIZi4nqcczqJT7tSiyO6fCmA/GUDWynw1R3UEFoiiynIsF3fsogSAlP
	 2paYLDriI6tlqMA76IVTJ8Wg2LfkU7xHhaZ8iha9ky5Acbl8d5oh1oPoS8z4UUIUfF
	 6uMiQnOxrdNKBxK9i08OqGW56EUEbqlaS9m461X8zXrUg90OmJOf6+rUK7krhgPqn5
	 KIi9H1mC6V3N9r3x7PzeusHSpB5FX3Ch+i2wSIbr69rL11JzqgO1YzigLx6cSKhrTs
	 ngwkUlZI0A3+Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
	Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] irqchip/exynos-combiner: switch to raw_spinlock
In-Reply-To: <97f33a9d-5fdd-4766-aaff-d10d5f5fdf28@samsung.com>
References: <CGME20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109@eucas1p1.samsung.com>
 <20260520220422.3522908-1-m.szyprowski@samsung.com> <87ecj5w2qf.ffs@tglx>
 <97f33a9d-5fdd-4766-aaff-d10d5f5fdf28@samsung.com>
Date: Thu, 21 May 2026 14:31:54 +0200
Message-ID: <87zf1tueo5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 21 2026 at 13:26, Marek Szyprowski wrote:
> On 21.05.2026 11:06, Thomas Gleixner wrote:
>> What is this lock actually protecting?
>>
>> Each combiner has it's own @base address, so there is no concurrency
>> problem between two cascade interrupts being handled at the same time.
>>
>> That means the only possible problem would be that the same cascade
>> interrupt is handled on two CPUs concurrently. Is that even possible?
> Frankly speaking I did this conversion mechanically, late in the evening =
to fix
> the bug warning I've spotted. Indeed this spinlock looks like a copy&past=
e or
> development leftover. The only side-effect of it I see is a=C2=A0memory b=
arrier,
> which might affect how the register access happens, but this should not a=
ffect
> cascade operation imho. Do You want me to send a patch removing it comple=
tely?

I've applied the fixup for now. But, yes please send a removal against

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent

Thanks,

        tglx

