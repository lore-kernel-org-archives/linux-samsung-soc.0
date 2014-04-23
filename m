From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: Remove mau_pd node for Exynos5420
Date: Wed, 23 Apr 2014 19:13:32 +0900
Message-ID: <03b001cf5edc$ae42e770$0ac8b650$@samsung.com>
References: <1398145155-4615-1-git-send-email-tushar.behera@linaro.org>
 <CAGOxZ52CDOXyXDpy8h3NQ8=26Wn8jF=6_vzb+t370_GbPiHG0g@mail.gmail.com>
 <CAHbNUh2T8gOdGxDGm995vbj0oiJkyDwW9C9J7VV_o7mudfKjEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40735 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755458AbaDWKNg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 06:13:36 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4H00789B2LWF30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Apr 2014 19:13:33 +0900 (KST)
In-reply-to: <CAHbNUh2T8gOdGxDGm995vbj0oiJkyDwW9C9J7VV_o7mudfKjEw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Alim Akhtar' <alim.akhtar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, jhbird.choi@samsung.com

Tushar Behera wrote:
> 
> On 22 April 2014 13:08, Alim Akhtar <alim.akhtar@gmail.com> wrote:
> > Hi Tushar
> >
> > On Tue, Apr 22, 2014 at 11:09 AM, Tushar Behera
> > <tushar.behera@linaro.org> wrote:
> >> MAU powerdomain provides clocks for Audio sub-system block. This block
> >> comprises of the I2S audio controller, audio DMA blocks and Audio
> >> sub-system clock registers.
> >>
> >> Right now, there is no way to hook up power-domains with clock
> providers.
> >> During late boot when this power-domain gets disabled, we get following
> >> external abort.

+ Jonghwan Choi

Well, this is not a perfect solution to support MAU power domain, it's true it is a problem right now though.

In other words, this is just temporal fix for the problem.

How about accessing clock stuff for audio sub-system with handling MAU power domain via generic IO power domain?

> > ?? which abort?? Can you please mention it here?
> >>
> 
> Thanks Alim for spotting this ... I somehow missed adding this.
> 
> <<<<
> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
> >>>>
> 
> Kukjin,
> 
> Let me know if I need to resend the patch.

- Kukjin
