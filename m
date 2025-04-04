Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5481DD9D3
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 23:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743724680; cv=none; b=Kd3msRabrbGNdHyR8vUaktrk0urRvMMPNOjc5/Wiqu41knOUFQZN679Z3HWkP478umKZvABBtxn/+0ArQB1YYvfd3+UjSrV4cB8xE+/a7FuZi+7eUaVJwg3C2MBQqHbQz+a92kPjQXU6MNZIT5HB+Qa+OxVql1V+nQbPFELSEXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743724680; c=relaxed/simple;
	bh=VAo1Q0VjwHRINwbD/L8jkkSA9OYDy+EZ6j4dxgMrPWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=KJ/PSCWB1wTfTtFLD6S0xxYYuADVyXCJ/RZanqyXoKblLqswXMOLvQZNXlo2HS7oy6lWAdlUorl/koDo9BwYwMkA1rxTPL4wgl3HHluIhnf5/w+XFAeSpYgtL/MesbxxYazXw6k4GyxB8Wqhm/8OPWl6ACD526XEeEsSGkibcm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IDip/NAv; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IDip/NAv"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250403235754epoutp0316f77829e88657ff84b2334cdd4c6d84~y9FpPuxkY1936019360epoutp03M
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 23:57:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250403235754epoutp0316f77829e88657ff84b2334cdd4c6d84~y9FpPuxkY1936019360epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743724674;
	bh=7gGMAAexLf4FhhxeDyncinVybc8k4q0bbDjQN23hj8g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IDip/NAv/kn7aYl5cgIQSYE0mgtYXspR0oT0mJMr2KX9+njFNF5LxPxpRS5qesxHS
	 pQ3gAAL99zWf1beqkCnbPpxJuTlhJ+FSgcjzmshAznPBGPnB7FcI2NPUTyIeyvE9Ld
	 MNMhsqScvu549cZy8B7YvPkh+voXC1kjpUKdwD7U=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250403235753epcas2p40e2e55932f5996808e0dafe103862034~y9FooSEpf2429624296epcas2p4e;
	Thu,  3 Apr 2025 23:57:53 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZTJZn132jz3hhTF; Thu,  3 Apr
	2025 23:57:53 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	EF.67.09871.1802FE76; Fri,  4 Apr 2025 08:57:53 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250403235752epcas2p192712bf4c5cbf0fda2c9b1dc71d3ac61~y9FnqbwGN0444504445epcas2p1b;
	Thu,  3 Apr 2025 23:57:52 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250403235752epsmtrp2db0e0a6ea15e87b7ebe110bbf9363375~y9FnpaqKb0549905499epsmtrp2W;
	Thu,  3 Apr 2025 23:57:52 +0000 (GMT)
X-AuditID: b6c32a48-b7fff7000000268f-e8-67ef2081e7e3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A7.C6.08805.0802FE76; Fri,  4 Apr 2025 08:57:52 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250403235752epsmtip1465881f309eff79f043b5d2e8e0b2852~y9FnXfgci2285222852epsmtip1D;
	Thu,  3 Apr 2025 23:57:52 +0000 (GMT)
Date: Fri, 4 Apr 2025 09:02:08 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: William McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Saravana
	Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Will Deacon
	<willdeacon@google.com>, Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 4/6] arm64: dts: exynos: gs101: Add
 'local-timer-stop' to cpuidle nodes
Message-ID: <Z+8hgK5YJ1ZhAl0C@perf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z-7V27GKU85vba0B@google.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUxTVxTn9r0+Xp0sj8rYlVWC3TCDDGihhQsKM0HnS7ZlJGQZTDN4oW8t
	o7RNX2tA3cQJAzo14uTDrsOqREwDgRXokC9dIfFjBBATTDo2ZuYIH1NmkW7igLU8XPzvd879
	/c75nXvuJTGxh4ggC3Um1qhjtFJiE+4ajFHGHYtaUMssKzj6rdFFoM65DhwtXD4BUEv/iAA1
	Lm5D54dGhKj7hzA0a/2VQM7fJ4Tobo+NQA2jAwLU3rCKo7W+7mBkca8QqMNZiyGv5xNUPqlE
	lU/nceTwrgF06bo3eHcY7ep1CemWxhZA251m2umoJujJiT6CfjQyEkx3NB2lT3U6AL3ojMwS
	fVy0S8MyKtYYxeoK9KpCnTpd+m52XmaeMlkmj5OnohRplI4pZtOle97LinunUOufShp1kNGa
	/akshuOkCRm7jHqziY3S6DlTupQ1qLSGFEM8xxRzZp06Xsea0uQyWaLST8wv0lwe/8jwzY6S
	pnPNeBl4ss0CRCSkFPD4nUncAjaRYqobwLrb9RgfeAGcH7cLAiwx5QPw6592Plf8Yh3cUPQD
	6FtaAnxwH8Bnvht4gIVTb8BKr20dE1QcdN1c9ZNIMoyKh/9WlAT4GDUrhKdcMyDA2ULlwzsD
	c8IADqFeh2dnr2I8DoW3zj1YryOiYuH9oZl1e5B6QMJ2uzuYt7QH/l37s5DHW+Dcjc6NfARc
	fNRP8JiDZVOeDXE5gLfvzWD8QRK0Tleuu8AoDey9O4wFnEK/iyEPzqdfhlWDK8F8OgRWfSXm
	lTvg8tl2wGMJ7L10ZaMiDbvWXAR/KV0CaG8bxk+DSOsL81hf6Mbjt6C910tY/S0w6jXYvEry
	MAa29STYgdABwlkDV6xmuUSD4v8FF+iLnWD9kcfS3eDbh3/Fu4GABG4ASUwaFjIjWVCLQ1RM
	6SHWqM8zmrUs5wZK/3JqsIhXCvT+X6Iz5ckVqTJFcrI8JVEpS5G+GuJ+/IdaTKkZE1vEsgbW
	+FwnIEURZYJ9vhqD7LMcT+Y+RZYlyaep2MncXH76eMKe3bT1grx0rLLnIqkSJsYcQs0OZ9tg
	ZOqbrVz3Ulrm7qDPWyckDxOmrOXVQZuL+tIMs2u12fPP4kyd8zUnfeGHo7Gq+u8cw5vPf7B6
	RrUV/Hi6rjqHnvknuitXlhZbG5oznn/RrM3cb/PsNQ4e8eaGwmvCubCMAsN1b6Pkz9z9S4bt
	OccGxhbfLrXIM4IqRO6+J/prdSeu1Fw4MtV6RpW4nD3deXU5iVq0yfq7Glrst4AkTyhaUI+B
	VAs4ePwLUZVbrvkw7Uvv+/cOY9G04OT2iPLeo6OTnyoqSg6Mfn9AYntptn7aGS7FOQ0jj8WM
	HPMfDGQsKW0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02RW0xScRzH9+dcPLDRjkj5T5EampUmpeX6t6x1mx7rIX1os5Yp5YksQYJM
	rQetLIwua5pLmWIX0yKXhoqIwgy1VUtzubDZRV21BbZM2UqXUaFr9fb5fW8vPwoT3MCDqEzl
	MVatlGVJSB5u7pKIowoXj8tXjdjC0IjBTKJmdxOOxmsvAlRv6+MggycEVXf3EcjSKkQu/TsS
	md47CTRgrSRR+XM7BzWWe3H0q8Pih3SOnyRqMpVhaHJoHyp6E4u002M4Mk7+AuhW56TfJiFj
	bjcTTL2hHjDXTTmMyXieZN44O0jmS1+fH9NUU8BcbjYCxmMSJ3H38OIy2KzM46x65cZ03qHe
	wVukaiA075zeShaC3mAd4FKQXgPf6rtwHeBRArodwObbvsNniODruwPEHAfA4aJuYi40DGDr
	S9dsCKfDoHaycpZJOgqaH3uBDlCUkJbCmbN5vjxGewjYUtyD+TIBdDp8Ufya42M+HQqvutqw
	udE2Duy/8BifM/zhk4oPs4zREfCV18XxjWJ0MKzzUj6Z+0ce7f6EXQG0/r+G/r+G/l/jOsCM
	YCGr0ijkCk20KkbJ5ko1MoUmRymXHshWmMDsFyMiLKDD+FXqABwKOACkMImQ/0k0LhfwM2T5
	J1h1dpo6J4vVOEAwhUsC+d/GLmUIaLnsGHuEZVWs+q/LobhBhZy92VfonftPHm66506oWrco
	ZFRCZm31cD3XJuLskWE9Bul2/xF7dSrhjoWrc+PW1mrFG6pr1ht+PBLFMzHbVihipkpCdfOS
	G9vzRxb0prlqH6V8kRYnFczbalM3bICtpTsuhXz2ipJGR9ecThhf6zjYWFHTVRHbEn1mIMXj
	ke+KsU5XLq9W2XgPT2lEz84tis3jz8dJt1s0mGpK2EeF+2uJZEsvf0kar2TB/curyxLtM4na
	oc6b4siLaPMdfb8FdKm/C5wN/bLCox+r0scmHNS3LTny5VtShyfsIDyzvq7xaYs8UEJM7XEK
	a4vi85Y1c1udH/EHp0t3WxuCsKUSXHNIFh2BqTWy32UE4mc0AwAA
X-CMS-MailID: 20250403235752epcas2p192712bf4c5cbf0fda2c9b1dc71d3ac61
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_8b7dd_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250331230151epcas2p486a7c6d7153737f4168cfef74249742f
References: <20250331230034.806124-1-willmcvicker@google.com>
	<CGME20250331230151epcas2p486a7c6d7153737f4168cfef74249742f@epcas2p4.samsung.com>
	<20250331230034.806124-5-willmcvicker@google.com> <Z+y4zxfifkQqLxKF@perf>
	<Z-2zQ-PcvxFTBc6M@google.com> <Z+4Hve9pQoLeh9sZ@perf>
	<Z-7V27GKU85vba0B@google.com>

------rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_8b7dd_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 03, 2025 at 11:39:23AM -0700, William McVicker wrote:
> On 04/03/2025, Youngmin Nam wrote:
> > On Wed, Apr 02, 2025 at 02:59:31PM -0700, William McVicker wrote:
> > > Hi Youngmin,
> > > 
> > > On 04/02/2025, Youngmin Nam wrote:
> > > > On Mon, Mar 31, 2025 at 04:00:26PM -0700, Will McVicker wrote:
> > > > > From: Will Deacon <willdeacon@google.com>
> > > > > 
> > > > > In preparation for switching to the architected timer as the primary
> > > > > clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> > > > > property to indicate that an alternative clockevents device must be
> > > > > used for waking up from the "c2" idle state.
> > > > > 
> > > > > Signed-off-by: Will Deacon <willdeacon@google.com>
> > > > > [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> > > > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > > > index 3de3a758f113..fd0badf24e6f 100644
> > > > > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > > > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > > > @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
> > > > >  				idle-state-name = "c2";
> > > > >  				compatible = "arm,idle-state";
> > > > >  				arm,psci-suspend-param = <0x0010000>;
> > > > > +				local-timer-stop;
> > > > >  				entry-latency-us = <70>;
> > > > >  				exit-latency-us = <160>;
> > > > >  				min-residency-us = <2000>;
> > > > > @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
> > > > >  				idle-state-name = "c2";
> > > > >  				compatible = "arm,idle-state";
> > > > >  				arm,psci-suspend-param = <0x0010000>;
> > > > > +				local-timer-stop;
> > > > >  				entry-latency-us = <150>;
> > > > >  				exit-latency-us = <190>;
> > > > >  				min-residency-us = <2500>;
> > > > > @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
> > > > >  				idle-state-name = "c2";
> > > > >  				compatible = "arm,idle-state";
> > > > >  				arm,psci-suspend-param = <0x0010000>;
> > > > > +				local-timer-stop;
> > > > >  				entry-latency-us = <235>;
> > > > >  				exit-latency-us = <220>;
> > > > >  				min-residency-us = <3500>;
> > > > > -- 
> > > > > 2.49.0.472.ge94155a9ec-goog
> > > > > 
> > > > Hi Will.
> > > > 
> > > > Are you using this property in production?
> > > > If so, have you noticed any performance improvements?
> > > 
> > > On Pixel 6, I have only recently switched to using the arch_timer as the
> > > default clocksource. I haven't noticed any major perf improvements to the main
> > > benchmarks, but also haven't seen any regressions. Based on the ChromeOS perf
> > > analysis in [1,2], there was a significant perf difference found.
> > > 
> > > [1] https://lore.kernel.org/linux-samsung-soc/CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com/
> > > [2] https://lore.kernel.org/linux-samsung-soc/CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com/
> > > 
> > > If it helps, I found that Pixel 8 and 9 devices (didn't check Pixel 7)
> > > are already using the arch_timer with this 'local-timer-stop' as the default
> > > clocksource in the production kernel.
> > > 
> > > Thanks,
> > > Will
> > > 
> > > [...]
> > > 
> > 
> > Hi Will,
> > 
> > Thanks for sharing the status of Pixel devices.
> > 
> > I agree that using the arch_timer as a clock source device brings significant benefits.
> > The links you shared are definitely related to that.
> > 
> > However, I would also like to know whether arch_timer is used as a clock event device in Pixel production.
> 
> For Pixel 8 and 9, the arch_timer is used as both the clocksource and
> clockevent device which is what my series is proposing for Pixel 6 upstream.
> The MCT device is solely being used as the alternative clockevents device for
> waking up from the "c2" state. The reason for using the arch_timer as the
> clockevents device is because we were seeing hrtimer stability issues where
> a 10ms interval timer would delay about 300ms-1s before starting the callback.
> This resulted in several media-related latency issues.
> 
> Thanks,
> Will
> 
> [...]
> 

Thank you for sharing your valuable experience. That will be helpful to us.

Thanks,
Youngmin

------rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_8b7dd_
Content-Type: text/plain; charset="utf-8"


------rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_8b7dd_--
