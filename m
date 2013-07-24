From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH V2 2/2] ARM: EXYNOS: cpuidle: Allow C1 state only in
 supported SOC's.
Date: Wed, 24 Jul 2013 16:36:29 +0900
Message-ID: <0e7d01ce8840$82f79070$88e6b150$@org>
References: <1371036526-16589-1-git-send-email-amit.daniel@samsung.com>
 <1371036526-16589-3-git-send-email-amit.daniel@samsung.com>
 <0e2301ce882c$d39021a0$7ab064e0$@org>
 <CADGdYn5uY7A9OB=xGi_oKS3DX6+wRhbKBnTfxjkFY5OtUX3hXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14299 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751828Ab3GXHgb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 03:36:31 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF00DMYJSUWB20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 16:36:30 +0900 (KST)
In-reply-to: <CADGdYn5uY7A9OB=xGi_oKS3DX6+wRhbKBnTfxjkFY5OtUX3hXg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'amit daniel kachhap' <amit.daniel@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Abhilash Kesavan' <a.kesavan@samsung.com>

amit daniel kachhap wrote:

[...]

> >>               /* Support IDLE only */
> >> -             if (cpu_id != 0)
> >> +             if (!(soc_is_exynos4210() || soc_is_exynos4212() ||
> >> +                     soc_is_exynos4412() || soc_is_exynos5250()) ||
> >> +                     cpu_id != 0)
> >
> > How about exynos5420?
> >
> > So...
> >
> > +               if (soc_is_exynos5440() || cpu_id !=0) ?
> This is fine.
> 
So, you will re-send?

- Kukjin
