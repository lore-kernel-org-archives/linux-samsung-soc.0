Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918292581
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 03:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743652554; cv=none; b=Ju1UyF4VHAzsKApvsSJY4H9udGIBmc9YTBVo5GXd2TSVo6RulQ2gHTjrISxcCPpPAT8SJdU3ABW8N02g356e8BYgsSc/uXq7M+9yFFK/f4ck3HwytUFdSpg28ldOs1aUPVaIgmS8UdChm4RqivHstQVNSvR4CR9d/Q5zRiqruVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743652554; c=relaxed/simple;
	bh=nqVB5uOqiFKCdpWccwDNjTPjd4j3yLd4tllbjZgjjLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=LTMslrsKgi1/CLtHW6qrPz996MOQ0RruftCgT+S2VRq5y65vmbZgBhUjf5mTNRv5JcpNWeBXI/pJAU/+Ex5yjBpM8i0mnq2ftOm3TXnakH9JushueXI684ZxxzE+f4byjtZwGURrzBdt0fqZAXl6Htk37xDGNmwiwYSq9c8PMz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rTSlV94Q; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rTSlV94Q"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250403035544epoutp03adce819b16ed2ec6f0ef5700bb37ab70~yssBbkDs10069400694epoutp03d
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 03:55:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250403035544epoutp03adce819b16ed2ec6f0ef5700bb37ab70~yssBbkDs10069400694epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743652545;
	bh=Ej6k3ZLWQF+05g7feuaoptHbKWegrmPgWjF8rs/7NXY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rTSlV94QRiaBjdMyRMI6WMQNRVVqeSCgMnBhmnBKB5ZENFjdIngWy9b98jCYPn6fh
	 A4uZUjHHheJ8WzwPFlhlscNxGVzYH43TUj5FB+feDHNLLxsmVq1wul4FCHm01bcDKx
	 Kdrdy2Av+9paiVxwqCfzc+iIfl3oqDOtkr7tAiPA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250403035544epcas2p3c55ebdc995a32e86804f8b0b2caaf468~yssA2RRGP2105821058epcas2p3P;
	Thu,  3 Apr 2025 03:55:44 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZSnvg4Yzkz3hhT8; Thu,  3 Apr
	2025 03:55:43 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	8E.F1.09780.FB60EE76; Thu,  3 Apr 2025 12:55:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250403035542epcas2p2da512aa29b7d9c68ad698399264e0d05~ysr-MEXyv2358523585epcas2p2o;
	Thu,  3 Apr 2025 03:55:42 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250403035542epsmtrp11d576aabebb09abda82ace4d6ca4cbaf~ysr-KwEhN2942429424epsmtrp1t;
	Thu,  3 Apr 2025 03:55:42 +0000 (GMT)
X-AuditID: b6c32a43-9b7fe70000002634-99-67ee06bf3b1c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	78.8C.08766.EB60EE76; Thu,  3 Apr 2025 12:55:42 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250403035542epsmtip1b91f8b8759e4cc8898b6b6c78a09a97e~ysr_6KM960228602286epsmtip1g;
	Thu,  3 Apr 2025 03:55:42 +0000 (GMT)
Date: Thu, 3 Apr 2025 12:59:57 +0900
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
Message-ID: <Z+4Hve9pQoLeh9sZ@perf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z-2zQ-PcvxFTBc6M@google.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHd/teX1/R6hsyvWGDsMfCBhmlRaAXoUQjP+rmHyRblm0o0LVv
	LWlpS18LssTJJhOpG8IU0YYUHDAdMnEFShXBpZDA3KgjW2Ajjun8EagburIZRAtrebr43+ec
	+/3ec88995JY+C9EJFlisDBmg1JPE2G4azgeJV4i5jWS824aXXO4CNTr68HR3S8/Bahr0MtD
	joUo1DLi5SN3fwSas88QyHljko9+utBMoONXhnjo3PFlHK1cdAuQzRMgUI+zEUP+6UJUfTUV
	1Ty4g6NO/wpAbd/6BVsjFK4BF1/R5egCilanVeHsrCUUVycvEop5r1eg6Gnfp6jr7QSKBWd0
	vvBdXaaWUaoZcwxjUBnVJQaNnH79jaLtRalpEmmiNB3J6BiDspSR09k78xNzS/TBruiYcqXe
	GkzlK1mWTsrKNButFiZGa2QtcpoxqfUmmUnMKktZq0EjNjCWLVKJJDk1KCzWaTv8Dbjp16g9
	Cw92V4H7m2yAJCGVAq+4C2wgjAyn3AAunFjkc4EfQN/ElMAGhMHgPoCOWvMTQ1NAw2kGAfx4
	aJDHBdcBPP+PAwsZcOolaHPdIUJMUInQNbYMQuYISgwffbInpMeoOT6sc82CkGYDVQwnhnz8
	EIuoWNj8hZ/g+Fn43YmbeIiFVAL87VETCJkhNUtCn61n1QCpbHh4fITH8QboG+0VcBwJ5w4f
	eMwsrPp9GuPM1QBenprFuIXN0H67ZvUUGKWFrmsTGNdmLByZxrn0OnhwOCDg0iJ48EA454yD
	S0fPAY5fgANtpx/vqIB9Ky6Cu5QAgN9/8xCrB9H2p/qxP1WN41dh64CfsAdLYNTz8NQyyWE8
	7L6Q1Ar4nWAjY2JLNYwq2ST9f7wqY6kTrD7xhO1u8HPLstgDeCTwAEhidISoLOEvTbhIraz8
	gDEbi8xWPcN6QGpwOA1Y5HMqY/CPGCxF0pR0SUpamlSWnCqR0ZtEnr9vacIpjdLC6BjGxJif
	+HikMLKKl5FmF93LKz+082561o8Sf/ylk+m5vMWKwEq1bFBEyq2LyYP98/va6u/pZIXOJDtR
	836Bs6/2lSN5Hc3r+zdP3soOHMstbP8o8NnwM853dhQf2zKrut43HCj7M/brioeVom2qxu5F
	+RE8J2djx9tzayQnp9ZWlGTERXkv94mLDuF5r/0QtvZme1ymsCFrvLpgfq9OUyleChuLq3Ps
	cAhbG2+fbmz50JdztgCs7Goor19TfjZrf9TM1ow/0Hqc9+KbdflTZ6rYM1FhevM69UKTN/ut
	vdHjL9e3qkfz/zWdQkdndnWTnqVAuXXs8/2ewq9wcWGatWwRvndjW/WEWNA8Cty7aZzVKqUJ
	mJlV/gddt0+8awQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsWy7bCSnO4+tnfpBi/eSVk8mLeNzWLLq80s
	Fu+X9TBarNl7jsli3mdZi/lHzrFa7NguYvFy1j02i02Pr7FaXN41h81ixvl9TBYbZvxjsfi/
	Zwe7Rdehv2wWmzdNZbb4dCvOouWOqUX7z9csFqs+/We0WHzgE7uDiMe23dtYPdbMW8PosWBT
	qcemVZ1sHneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4kF8AZxWWTkpqTWZZapG+XwJWx/OZStoKZ
	0hXdf46wNTCeF+1i5OCQEDCRmP43vYuRi0NIYDejxMy9J9m6GDmB4jISt1deZoWwhSXutxxh
	hSi6zyjxbOp9FpAEi4CKRNe212ANbAK6EttO/GMEGSoioCfxp7UCpJ5Z4DOrxNaOo8wgNcIC
	CRKXOm4zgdi8AsoScxZ9YoMY+p9R4uXdPVAJQYmTM5+ALWAW0JK48e8lE8hQZgFpieX/OEDC
	nEDhu3+mM05gFJiFpGMWko5ZCB0LGJlXMUqmFhTnpucWGxYY5qWW6xUn5haX5qXrJefnbmIE
	R6KW5g7G7as+6B1iZOJgPMQowcGsJMJbqPU2XYg3JbGyKrUoP76oNCe1+BCjNAeLkjiv+Ive
	FCGB9MSS1OzU1ILUIpgsEwenVAMTa0723LM2WRcbVtzZz71RTCcrROzgC2azaxddOV6kvg+e
	2ROhdfP0fXtZn7JLP/ucrjccf5PxbUb8pc/nqp1eLzc++lZq1kbbWabS7dsFlBgUkyUvb4k6
	cLqENytlRcgpTzNVtodz39rt0G9qVJlb82Lu1LsMN3svpq7e/CfvQsuE1fdNHn+7fy2r7ki3
	c6Wrxjf1r7O4qw1u/39fmrCpb0LnW+4pyzLrPnRMr1/WdeXttPl9xRUvqlLa2UT4+7cUT74g
	ETWjr/pImUcXe2DL0llTc4QjPukfPRjrP9WZgT0s2bShV/bK9T2cf1JezPKrtLLQsLNKimE3
	np3QlHD1/Ez32d8mcGZPcjrwtnmjEktxRqKhFnNRcSIAx5ywPTMDAAA=
X-CMS-MailID: 20250403035542epcas2p2da512aa29b7d9c68ad698399264e0d05
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----JAxyHCgdtJ96A8.Ok.gYWmZQmsTOHaTnMoXq.aDuWNAvXzgf=_81f4a_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250331230151epcas2p486a7c6d7153737f4168cfef74249742f
References: <20250331230034.806124-1-willmcvicker@google.com>
	<CGME20250331230151epcas2p486a7c6d7153737f4168cfef74249742f@epcas2p4.samsung.com>
	<20250331230034.806124-5-willmcvicker@google.com> <Z+y4zxfifkQqLxKF@perf>
	<Z-2zQ-PcvxFTBc6M@google.com>

------JAxyHCgdtJ96A8.Ok.gYWmZQmsTOHaTnMoXq.aDuWNAvXzgf=_81f4a_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 02, 2025 at 02:59:31PM -0700, William McVicker wrote:
> Hi Youngmin,
> 
> On 04/02/2025, Youngmin Nam wrote:
> > On Mon, Mar 31, 2025 at 04:00:26PM -0700, Will McVicker wrote:
> > > From: Will Deacon <willdeacon@google.com>
> > > 
> > > In preparation for switching to the architected timer as the primary
> > > clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> > > property to indicate that an alternative clockevents device must be
> > > used for waking up from the "c2" idle state.
> > > 
> > > Signed-off-by: Will Deacon <willdeacon@google.com>
> > > [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > ---
> > >  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > index 3de3a758f113..fd0badf24e6f 100644
> > > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
> > >  				idle-state-name = "c2";
> > >  				compatible = "arm,idle-state";
> > >  				arm,psci-suspend-param = <0x0010000>;
> > > +				local-timer-stop;
> > >  				entry-latency-us = <70>;
> > >  				exit-latency-us = <160>;
> > >  				min-residency-us = <2000>;
> > > @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
> > >  				idle-state-name = "c2";
> > >  				compatible = "arm,idle-state";
> > >  				arm,psci-suspend-param = <0x0010000>;
> > > +				local-timer-stop;
> > >  				entry-latency-us = <150>;
> > >  				exit-latency-us = <190>;
> > >  				min-residency-us = <2500>;
> > > @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
> > >  				idle-state-name = "c2";
> > >  				compatible = "arm,idle-state";
> > >  				arm,psci-suspend-param = <0x0010000>;
> > > +				local-timer-stop;
> > >  				entry-latency-us = <235>;
> > >  				exit-latency-us = <220>;
> > >  				min-residency-us = <3500>;
> > > -- 
> > > 2.49.0.472.ge94155a9ec-goog
> > > 
> > Hi Will.
> > 
> > Are you using this property in production?
> > If so, have you noticed any performance improvements?
> 
> On Pixel 6, I have only recently switched to using the arch_timer as the
> default clocksource. I haven't noticed any major perf improvements to the main
> benchmarks, but also haven't seen any regressions. Based on the ChromeOS perf
> analysis in [1,2], there was a significant perf difference found.
> 
> [1] https://lore.kernel.org/linux-samsung-soc/CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com/
> [2] https://lore.kernel.org/linux-samsung-soc/CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com/
> 
> If it helps, I found that Pixel 8 and 9 devices (didn't check Pixel 7)
> are already using the arch_timer with this 'local-timer-stop' as the default
> clocksource in the production kernel.
> 
> Thanks,
> Will
> 
> [...]
> 

Hi Will,

Thanks for sharing the status of Pixel devices.

I agree that using the arch_timer as a clock source device brings significant benefits.
The links you shared are definitely related to that.

However, I would also like to know whether arch_timer is used as a clock event device in Pixel production.

Thanks,
Youngmin

------JAxyHCgdtJ96A8.Ok.gYWmZQmsTOHaTnMoXq.aDuWNAvXzgf=_81f4a_
Content-Type: text/plain; charset="utf-8"


------JAxyHCgdtJ96A8.Ok.gYWmZQmsTOHaTnMoXq.aDuWNAvXzgf=_81f4a_--
