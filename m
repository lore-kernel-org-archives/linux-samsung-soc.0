From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RESEND][PATCH] gpio/samsung: Fix incorrect gpio pull up/down
 callback for Exynos4
Date: Mon, 10 Oct 2011 13:28:04 +0900
Message-ID: <034c01cc8705$010012b0$03003810$%kim@samsung.com>
References: <1318185325-32256-1-git-send-email-thomas.abraham@linaro.org>
 <CACxGe6v1COBz_USrg=xrXvzg=fZptYi08MsEzun2Td04BM3BJQ@mail.gmail.com>
 <CAJuYYwQGySvArSNx_RxTnTKt+dOMO-d+aQkM8mkbSRi3YeWsPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18613 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750721Ab1JJE2F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 00:28:05 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSU00LY11QDZAI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 13:28:04 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSU002N21QS8T90@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 13:28:04 +0900 (KST)
In-reply-to: <CAJuYYwQGySvArSNx_RxTnTKt+dOMO-d+aQkM8mkbSRi3YeWsPA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Grant Likely' <grant.likely@secretlab.ca>
Cc: linux-samsung-soc@vger.kernel.org

Thomas Abraham wrote:
> 
> Hi Grant,
> 
> On 10 October 2011 04:40, Grant Likely <grant.likely@secretlab.ca> wrote:
> > On Sun, Oct 9, 2011 at 12:35 PM, Thomas Abraham
> > <thomas.abraham@linaro.org> wrote:
> >> Some of the gpio chips of exynos4 are assigned a default gpio config
without
> >> the exynos4 specific pull up/down callbacks which resulted in incorrect
> >> setting of pull up/down configuration.
> >>
> >> Fix this by adding two new exynos4 specific entries in the array of
default
> >> configs with set_pull and get_pull callbacks set to exynos4 specific
callbacks
> >> The new default gpio configs can then be used for exynos4 gpio chips.
> >>
> >> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> >
> > Hi Thomas,
> >
> > Does this need to be merged as a bug fix for v3.1, or is it for v3.2?
> > Does it have any dependencies, or can it go in via the gpio/next tree?
> 
> 
> This patch is a bug fix for the new consolidated samsung gpio driver
> that will be merged in v3.2 via Kukjin's tree. The new consolidated
> samsung gpio driver is merged only in Kukjin's for-next and not
> available in gpio/next.
> 
Hi Grant and Thomas,

Yes this should be applied to my tree and I don't know why this has been
missed when I worked on gpio/samsung. Sorry for noisy on gpio/samsung :(

Anyway, I will apply this for v3.2 and as a note, this commit has been
merged into mainline so you don't need to handle in gpio/next. commit id
0bf8fa04e80a562641f687547053f98670f25cf9("gpio/exynos4: Fix incorrect
mapping of gpio pull-up macro to register setting")

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
