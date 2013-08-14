From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 0/2] Add RTC DT node to Exynos5420 SoC and Fix RTC DT
 node name for 5250 Soc
Date: Wed, 14 Aug 2013 14:27:03 +0200
Message-ID: <3941559.QnWYLUF6Gp@amdc1227>
References: <1376478181-27539-1-git-send-email-vikas.sajjan@linaro.org>
 <3054059.xbBShFpfCt@amdc1227>
 <CAD025yRSX-8Yn1OKo7mZ_qtU057GRr=FOJ7ro-Of+2ePqoAHvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24699 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932160Ab3HNM1L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 08:27:11 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRI0029UT8YYX20@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Aug 2013 13:27:08 +0100 (BST)
In-reply-to: <CAD025yRSX-8Yn1OKo7mZ_qtU057GRr=FOJ7ro-Of+2ePqoAHvA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim" <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

On Wednesday 14 of August 2013 17:37:47 Vikas Sajjan wrote:
> Hi Tomasz,
> 
> On 14 August 2013 17:00, Tomasz Figa <t.figa@samsung.com> wrote:
> > Hi Vikas,
> > 
> > On Wednesday 14 of August 2013 16:32:59 Vikas Sajjan wrote:
> >> changes since v2:
> >>       - split the 5250 related modifications into a separate patch.
> > 
> > I'm not sure whether Kukjin's comment was about this, as it introduces
> > a
> > short bisect breakage between patch 1 and patch 2 from this series.
> > 
> > IMHO it would be more sensible to make first patch simply fix name of
> > the node and then a separate patch adding the rtc node for exynos5420.
> Are you saying that
> patch 1: should contain modifications for exynos5.dtsi and
> exynos5250.dtsi   ( basically the RTC name change and status as
> "okay")
> patch 2: should contain modifications only for exynos5420.dtsi ( new
> RTC DT node )

Oh, I forgot about the status property. So ideally there should be 3 
patches:
 - patch 1 changing exynos5.dtsi and exynos5250.dtsi to fix RTC node name,
 - patch 2 adding status="okay" to exynos5250.dtsi,
 - patch 3 adding RTC node to exynos5420.dtsi.

Best regards,
Tomasz
