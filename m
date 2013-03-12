From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/4] clk: samsung: always allocate the clk_table
Date: Tue, 12 Mar 2013 14:48:14 +0100
Message-ID: <513F321E.1020703@samsung.com>
References: <201303120042.09633.heiko@sntech.de>
 <201303120044.29499.heiko@sntech.de>
 <CAJuYYwT183EcZZ20P8D7AP34CwXfKYLzsmZdoJz1ny7XznzyAg@mail.gmail.com>
 <513F1037.3080107@samsung.com>
 <CAJuYYwRDv4ULqXQOXmTsGfqVopt6XPR+XXb-pPZ35+pC7kUN3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:65160 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753282Ab3CLNsR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 09:48:17 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MJJ003CDVGXOSB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Mar 2013 13:48:15 +0000 (GMT)
Received: from [106.116.147.32] by eusync2.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MJJ00A4KVOEKA20@eusync2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Mar 2013 13:48:15 +0000 (GMT)
In-reply-to: <CAJuYYwRDv4ULqXQOXmTsGfqVopt6XPR+XXb-pPZ35+pC7kUN3A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>

On 03/12/2013 12:46 PM, Thomas Abraham wrote:
> And, you mentioned Exynos4 will be dt-only from 3.10. Does that mean
> we just drop support for universal and nuri non-dt board support? Or,
> will there be a equivalent dt support added for these boards?

I think Tomasz has some initial dts files for Universal_c210 ready, and
Nuri could probably just be dropped. But we need Kyungmin's opinion on
that.

I'm not sure about other boards, they look pretty basic though.
So it shouldn't be difficult to replace them with corresponding dts
files. Currently there are:

arch/arm/mach-exynos/mach-smdk4x12.c
arch/arm/mach-exynos/mach-origen.c
arch/arm/mach-exynos/mach-nuri.c
arch/arm/mach-exynos/mach-universal_c210.c
arch/arm/mach-exynos/mach-armlex4210.c
arch/arm/mach-exynos/mach-smdkv310.c

And there are dts files for:

arch/arm/boot/dts/exynos4210-smdkv310.dts
arch/arm/boot/dts/exynos4210-origen.dts
arch/arm/boot/dts/exynos5250-smdk5250.dts
arch/arm/boot/dts/exynos5250-snow.dts
arch/arm/boot/dts/exynos4210-trats.dts
arch/arm/boot/dts/exynos5440-ssdk5440.dts
arch/arm/boot/dts/exynos4412-smdk4412.dts

So except Universal_c210 and Nuri the only ones not supporting booting
from DT are these two simple boards, which seem to be maintained by
Samsung:

arch/arm/mach-exynos/mach-smdk4x12.c
arch/arm/mach-exynos/mach-armlex4210.c

It would be nice to make Exynos DT only in this kernel release.
I guess there was enough time to get all boards converted to DT
already.

--

Regards,
Sylwester
