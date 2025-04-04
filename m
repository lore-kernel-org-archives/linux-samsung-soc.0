Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC84E2E62B5
	for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Apr 2025 01:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743728820; cv=none; b=WA5Bq2lns/S2vyBJvCSj359FkJJ5jonhhhqcxC43DKLYki/su2QuyEU21nF6jZC6ZOsmZ94rP4urh7VuLFYXEAJsZ8CN5VssmXOnXnOlGypGlHpJzPaN5CEHqWU7kTeVbNOeq3fq4v7XrzKL+v0DnDBCUiFJnGV9XMtI8KhTVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743728820; c=relaxed/simple;
	bh=z/l3RI4k3l0lUYAsduh+YyFy1Axb/G1eg7JrojJaD2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=BMpuQE+sK6chfDo+iOVCRepzU8Lqp75W42m/26y+MmLxSo6zxWnSwFtNTlFaUiqfH1b7ZwMl1SwVXq+6NX0ywLMh4xeiQH9/bnlQOznfzIUhdks5prHVGrZVjOzhSFkDVdM0JzCFJXYR6sW0XrXehP95U+EYtdHoD2QMpj9snVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Cr1NazQj; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Cr1NazQj"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250404010654epoutp0166f30fb194861bcf0ffe907582ec45a1~y_B5QyAH81409314093epoutp01b
	for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Apr 2025 01:06:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250404010654epoutp0166f30fb194861bcf0ffe907582ec45a1~y_B5QyAH81409314093epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743728814;
	bh=9Ktc3ifYjFK+u3qnbP5GP1jH37oHz6krwNUT1hgD8UY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Cr1NazQj41JIVC9sinG9f6TzO2zSU/Ht2yKl+63W6to+k+TLQJYxhbh4iQI8HCKZG
	 byDpNvn6D7QXM2WcsMFtn+NduTM+0QXVrrZve3C0vTZ29q5jtgmSaZyLzMjNR4zjO7
	 BBsXYABezikALgbMSIitQkQdnzJ+okI0vi8U58PA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250404010654epcas2p10a3cbfb1e6df873002c3d17f2b32a65f~y_B4ihPYg0309803098epcas2p1P;
	Fri,  4 Apr 2025 01:06:54 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZTL6P3Pyfz6B9mD; Fri,  4 Apr
	2025 01:06:53 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F3.F6.09780.DA03FE76; Fri,  4 Apr 2025 10:06:53 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250404010652epcas2p1a1c427d7e62c1872ef25b50b00f80ac8~y_B3haWLa2690026900epcas2p14;
	Fri,  4 Apr 2025 01:06:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250404010652epsmtrp20f158001027df5579775ebc9f1558dec~y_B3gY5MF1456114561epsmtrp2C;
	Fri,  4 Apr 2025 01:06:52 +0000 (GMT)
X-AuditID: b6c32a43-9b7fe70000002634-fc-67ef30ad35d7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B7.73.08766.CA03FE76; Fri,  4 Apr 2025 10:06:52 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250404010652epsmtip2b0dd3e8a4088506f071ba67fc068663f~y_B3LBCOx2446424464epsmtip2d;
	Fri,  4 Apr 2025 01:06:52 +0000 (GMT)
Date: Fri, 4 Apr 2025 10:11:08 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Saravana
	Kannan <saravanak@google.com>, Donghoon Yu <hoony.yu@samsung.com>,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, semen.protsenko@linaro.org
Subject: Re: [PATCH v2 0/7] Add module support for Arm64 Exynos MCT driver
Message-ID: <Z+8xrLbya9/oFg7y@perf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf1CTdRzH/e7Znm12q0dk9j0swZXcKTG2xdiX4leA3qj+gAOuzutcE557
	QMa29mxAP3aREDL0FA2MZscPxQyCokG4gzFgICAWdOBBEYlKKUiCjcywYzT2YOd/r8/n+3l/
	P+/P9wcP87uHB/CytUbSoFVrRPhmdnvfbkVos2SJknT8LETXq9tx1HanlY2WvjgGUFPXCAtV
	Lz+LavpHOGiweYGD7Bf90bz1Go5GR1u4yDY7wUHjHZ/jqGrUyUItVR42WnPYuajMtYqj28e9
	uVZbJYbcUwdQ8bQcNbrXADrX4+bGbVO2d7ZzlE3VTUBZazMpbY0WXDk94cCViyMjXGVr/YfK
	422NQLls25HM358TlUWqM0lDEKnN0GVma6lo0WupqgSVPEIiDZVGIoUoSKvOJaNFia8nh+7L
	1njnEwXlqTUmbypZTdOisJgog85kJIOydLQxWkTqMzV6hV5Mq3Npk5YSa0njS1KJRCb3Fr6d
	k3X6LtQ7QwvGLpgKQffOMsDnQSIcWifrWGVgM8+PsANot7gAE7gBXF44hTPB3wB+71jjPJIM
	3f9jo6oLQPewlc0ENwD85dNRbL2KTTwPXVedYJ1xIhS2D3l87E+EwDlHC3ddgBHNOCx3tvoW
	thKvQmfXD14nPJ6AeA4OFPsMCogt8PJnv7HXmU/EwhvfnvaZhcQRPvzKXr5hKREeLlnAGN4K
	7wy2cRkOgMuLXTjDNCycmcIYcTGAw5NzG4IXofXWEZ8JjMiClr5xzroJ6DXRP8Vm0k/C0r5V
	LpMWwNISP0YZDB9WtACGn4Gd577c2FEJe7r7MOZQTgE4Z6ljlYMd1sfmsT7WjWEx/KmyAmc4
	EBZ9dwazetthxHZ4wcNjcDf8piOsFuCNYBupp3MpMkOml/5/2Rm6XBvwPf09CXZwtcYjdgEW
	D7gA5GEif0F08BLlJ8hUv/seadCpDCYNSbuA3HtRJ7EAYYbO+3e0RpU0PFISHhEhVcjkEoXo
	aYHrz98pP4JSG8kcktSThkc6Fo8fUMjSjN/bYr5V37GimmxK0+wsitv+SVqK+777UFDG9FHH
	RMmSYjb/raFJfn6v/OW+lfOBefEzacnW0r1F5fynhKnFLem9xZ6xlNjSg6rw+PyGjydWemof
	/NUQ8WaDtTrv613mnP2xskt1jbIT6Wffr3fqxNesb8xHUQkL0w9SPhjUxcQYekcECcSVMDTW
	bLriunk5bvDS7cVXzD+m7Uu6Tp0VDqyaN41VVOIec6f4hWnhR8bxzgP/atrm+y010omju4IJ
	x14LtbzpTMdJRXfBP1SI8J14R1LBQQ9n4G7XE0lVIYcCUyWRKxWHE3uOCaiI9F8Bb1Z+Hpkf
	ymaoi8MVbJp1U8Sms9TSPZiBVv8HUW5ksYMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0hTYQCG+bZzzs6k1XGu/LSLuS6Ul6WY9gXdL3QIgiQyMswNPcyVm7Kp
	pVhG+aNWdrd06pIUzTlR55zzkukSU7M505Ty1sVMS1O0KIi05oj89/C+7/PrJdn8BsydlCni
	GKVCEi0knDDTU6GHr95vUuqnv7oJvdWaCGT8XIGhyYJrAOkfW1lIO7MSPWiy4uhZyRccmasE
	aEwzSKCOjjIOMnzowVFXTTaBMjrqWagsYxZDc3VmDlJbfhPo0/W/WYUhnY2m35xEqf2BSDc9
	B1BewzRn1zLaVGvCab1WD+hcQzxt0F0h6P6eOoL+arVy6Ir8FPq6UQfoGcOqw9xQp22RTLQs
	gVFu2iF2ispvFMT2eZ29XJ4FLoCfq9SAS0JqM2z5Pg7UwInkU7UAXrTZCEexAvYVdeEOdoFD
	qU24YzQEYPm1y/MjjFoLLd31wM4E5QtNLbPzLKC84WhdGcfObKqagBPTiXZ2oQ7C+scvWGpA
	kjxqDWxO9bTHfOo2gLZHS+3Mo5xha+Yw5lB9YHVlP2Gfs6nlsHCWdMQe8FJlFtvOXGonfFd+
	j3UTOGsW2JoFtua/rVlg5wJMB9yYWJVcKlf5x/ormDMilUSuildIRRExcgOYP9lroxlU6aZE
	FsAigQVAki0U8Lavn5TyeZGSxCRGGROujI9mVBawnMSErjzX0bRIPiWVxDGnGSaWUf5rWSTX
	/QIrWXZgZmXpuvvH91OzG268PHpkyvOW9NZ4tmWsweh9rkDcuoeTqxjOTN5e7Gw+tBiP0Wi8
	03ZLqtvfBxQuXSzvSLBxUibywZa9ss6t2aaqreEh/Uaf3b8H7/fmvB04N9l+Yh/5ujOn9Vte
	5K84xdjqymZ+INHZh3cli7m8H2GhzWJRj8cI9QQ+8L16LGxf8aE7suMv8vDDNhCMviX25ZeK
	Ro2nekJD3NWbW38UFzZ6Jo64LplzyflalJSergu7ZPWtGR7A3Xb2BhSdFwQK77qNpaWs3jXw
	qi3C8lFbu6Xp4fPz6hOLbmQFMWJLeElGt3ZPY1twZhTxK6LOEDRslg6lCzFVlMTfi61USf4A
	tI2BkVMDAAA=
X-CMS-MailID: 20250404010652epcas2p1a1c427d7e62c1872ef25b50b00f80ac8
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8c81f_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250402233425epcas2p479285add99d27dc18aabd2295bfcbdc8
References: <CGME20250402233425epcas2p479285add99d27dc18aabd2295bfcbdc8@epcas2p4.samsung.com>
	<20250402233407.2452429-1-willmcvicker@google.com>

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8c81f_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Wed, Apr 02, 2025 at 04:33:51PM -0700, Will McVicker wrote:
> This series adds support to build the Arm64 Exynos MCT driver as a module. This
> is only possible on Arm64 SoCs since they can use the Arm architected timer as
> the clocksource. Once the Exynos MCT module is loaded and the device probes,
> the MCT is used as the wakeup source for the arch_timer to ensure the device
> can wakeup from the "c2" idle state.
> 
> These patches are originally from the downstream Pixel 6 (gs101) kernel found
> at [1] and have been adapted for upstream. Not only has the Exynos MCT driver
> been shipping as a module in the field with Android, but I've also tested this
> seris with the upstream kernel on my Pixel 6 Pro.
> 
> Thanks,
> Will
> 
> Note1, instructions to build and flash a Pixel 6 device with the upstream kernel
> can be found at [2].
> 
> Note2, this series is based off of linux-next/master commit 405e2241def8 ("Add
> linux-next specific files for 20250331").
> 
> [1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-raviole-5.10-android12-d1
> [2] https://protect2.fireeye.com/v1/url?k=d287bb1b-b30cae21-d2863054-74fe4860008a-f0cb7ae29f3b1b85&q=1&e=4e8467a4-13da-4dd4-a8fd-4ddfc38e89b4&u=https%3A%2F%2Fgit.codelinaro.org%2Flinaro%2Fgooglelt%2Fpixelscripts%2F-%2Fblob%2Fclo%2Fmain%2FREADME.md%3Fref_type%3Dheads
> 
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Donghoon Yu <hoony.yu@samsung.com>
> Cc: Hosung Kim <hosung0.kim@samsung.com>
> Cc: kernel-team@android.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Youngmin Nam <youngmin.nam@samsung.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: André Draszik <andre.draszik@linaro.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> 
> ---
> Changes in v2:
> - Re-worked patch v1 5 based on Rob Herring's review to use the compatible data
>   for retrieving the mct_init function pointer.
> - Updated the Kconfig logic to disallow building the Exynos MCT driver as
>   a module for ARM32 configurations based on Krzysztof Kozlowski's findings.
> - Added comments and clarified commit messages in patches 1 and 2 based on
>   reviews from John Stultz and Youngmin Nam.
> - Fixed an issue found during testing that resulted in the device getting
>   stuck on boot. This is included in v2 as patch 5.
> - Collected *-by tags
> - Rebased to the latest linux-next/master.
> 
> ---
> Donghoon Yu (1):
>   clocksource/drivers/exynos_mct: Add module support
> 
> Hosung Kim (1):
>   clocksource/drivers/exynos_mct: Set local timer interrupts as percpu
> 
> Will Deacon (1):
>   arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes
> 
> Will McVicker (4):
>   of/irq: Export of_irq_count for modules
>   clocksource/drivers/exynos_mct: Don't register as a sched_clock on
>     arm64
>   clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
>   arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
> 
>  arch/arm64/Kconfig.platforms                 |  1 -
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi |  3 +
>  drivers/clocksource/Kconfig                  |  3 +-
>  drivers/clocksource/exynos_mct.c             | 73 ++++++++++++++++----
>  drivers/of/irq.c                             |  1 +
>  5 files changed, 67 insertions(+), 14 deletions(-)
> 
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 
> 

Hi Will.

I tested this series on a E850-96(Exynos3830 based) board and it's working as a moudle.

# dmesg | grep mct
[7.376224] clocksource: mct-frc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 73510017198 ns

# lsmod | grep exynos_mct
exynos_mct             12288  0

# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
arch_sys_counter
# cat /sys/devices/system/clockevents/clockevent0/current_device
arch_sys_timer

# cat /proc/interrupts 
        CPU0    CPU1    CPU2    CPU3    CPU4    CPU5    CPU6    CPU7
 12:    2566    2752    2467    4026    3372    2822    2115    3227 GIC-0  27 Level     arch_timer
...
 77:       0       0       0       0       0       0       0       0 GIC-0 235 Level     mct_comp_irq
 78:       0       0       0       0       0       0       0       0 GIC-0 239 Level     mct_tick0
 79:       0       0       0       0       0       0       0       0 GIC-0 240 Level     mct_tick1
 80:       0       0       0       0       0       0       0       0 GIC-0 241 Level     mct_tick2
 81:       0       0       0       0       0       0       0       0 GIC-0 242 Level     mct_tick3
 82:       0       0       0       0       0       0       0       0 GIC-0 243 Level     mct_tick4
 83:       0       0       0       0       0       0       0       0 GIC-0 244 Level     mct_tick5
 84:       0       0       0       0       0       0       0       0 GIC-0 245 Level     mct_tick6
 85:       0       0       0       0       0       0       0       0 GIC-0 246 Level     mct_tick7

Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>

Thanks,
Youngmin

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8c81f_
Content-Type: text/plain; charset="utf-8"


------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8c81f_--
