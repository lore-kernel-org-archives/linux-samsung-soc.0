From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v7 0/2] Adds PMU and S2R support for exynos5420
Date: Tue, 30 Sep 2014 09:38:45 +0530
Message-ID: <000e01cfdc64$4181a710$c484f530$@samsung.com>
References: <1408625982-3267-1-git-send-email-vikas.sajjan@samsung.com>
 <CAGm_ybh-R1GsHF-BRhRYQKkCpQFQSE6Mem=A3kz=H3Bemor9xA@mail.gmail.com>
 <CABxcv=kHwCCYhit20qO1q=Nn3KVj8U=8cpCu=DQRuy+R86N0kQ@mail.gmail.com>
 <CAGm_ybgFfnS=bhz2yWUt_b_95Wg=eDNxadzfy7WF+VNFx+pO6Q@mail.gmail.com>
 <CABxcv==E9h_V8_YmcvuxRORg7tbnc9uDT-rwqKJeXb_bNr0xXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47642 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750760AbaI3EJZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 00:09:25 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCP00LHN4VNPNA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 30 Sep 2014 13:09:23 +0900 (KST)
In-reply-to: <CABxcv==E9h_V8_YmcvuxRORg7tbnc9uDT-rwqKJeXb_bNr0xXw@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier@dowhile0.org>, 'Vikas Sajjan' <vikas.sajjan@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Doug Anderson' <dianders@chromium.org>, 'Olof Johansson' <olof@lixom.net>

Hi Javier and Vikas,

> Hello Vikas,
> 
> On Mon, Sep 29, 2014 at 2:59 PM, Vikas Sajjan <vikas.sajjan@samsung.com>
> wrote:
> > Hi Javier,
> >
> >
> > On Thu, Sep 25, 2014 at 10:45 PM, Javier Martinez Canillas
> >>
> >> The mentioned patches from the PMU series depend on the patch to
> >> decouple the syscon interface from syscon drivers. The latest version
> >> of that patch is Pankaj's "[PATCH v5] mfd: syscon: Decouple syscon
> >> interface from platform devices" [0].
> >>
> >
> >  Since Arnd has given "Reviewed-by" to Pankaj's MFD syscon patch now,
> > Pankaj can rebase his PMU patchset [1],  so that I can re-spin my 5420
> > S2R patchset on top his PMU patchset.
> >
> 
> Indeed, that would be great. Thanks a lot!
> 

I was waiting for syscon patch to be finalized, now I will rebase my the PMU
patches as almost all issues of syscon has been addressed, and I hope it's now ready
to be taken in.

Thanks,
Pankaj Dubey
> >
> > Regards
> > Vikas Sajjan
> 
> Best regards,
> Javier
