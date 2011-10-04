From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 2/2] ARM: SAMSUNG: Cleanup resources by using macro
Date: Tue, 04 Oct 2011 21:45:23 +0900
Message-ID: <019401cc8293$7c17a6f0$7446f4d0$%kim@samsung.com>
References: <005901cc817e$51a56d00$f4f04700$%kim@samsung.com>
 <CAH9JG2Wc4M2dVFOfNE5jgsygvigE8RbPH_yLcMqarr64LfbENw@mail.gmail.com>
 <4E89B505.3060501@samsung.com> <4E89C4B2.605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46316 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932079Ab1JDMpZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Oct 2011 08:45:25 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSJ00EWOKR6VLL0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Oct 2011 21:45:24 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSJ00L7PKRNPF60@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 04 Oct 2011 21:45:24 +0900 (KST)
In-reply-to: <4E89C4B2.605@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

Sylwester Nawrocki wrote:
> 
> On 10/03/2011 03:13 PM, Kukjin Kim wrote:
> > On 10/03/11 12:53, Kyungmin Park wrote:
> >> On Mon, Oct 3, 2011 at 12:41 PM, Kukjin Kim<kgene.kim@samsung.com>
> wrote:
> >>>
> >>> +#define SAMSUNG_RES_MEM(soc, ip, sz)
> DEFINE_RES_MEM(soc##_PA_##ip, sz)
> >>> +#define SAMSUNG_RES_IRQ(ip)            DEFINE_RES_IRQ(IRQ_##ip)
> >>> +
> >>> +#define SAMSUNG_RES_MEM_NAMED(soc, ip, sz, name)       \
> >>> +
> DEFINE_RES_MEM_NAMED(soc##_PA_##ip, sz, name)
> >>> +#define SAMSUNG_RES_IRQ_NAMED(ip, name)
> \
> >>> +                               DEFINE_RES_IRQ_NAMED(IRQ_##ip,
> name)
> >>> +#define SAMSUNG_RES_DMA_NAMED(ch, name)
> \
> >>> +
> DEFINE_RES_DMA_NAMED(DMACH_##ch, name)
> >>
> >> It's good for readability. but do you think that it's hard to find out
> >> defined macros are used at real place?
> >> e.g., Now I want to find out the S3C_PA_USB_HSOTG. it's difficult if
> >> you use the SAMSUNG_RES_* series macro.
> >> but if you use the DEFINED_RES_* series directly. it's easy to find
> >> out at real codes.
> >>
> > Well, I don't think so because the XXX_PA_XXX addresses are defined in
each
> > mach/map.h and they are usually used in here so it's not hard to find
it.
> 
> Some minor disadvantage is that tagging tools like e.g. gtags don't handle
> these things properly. But I don't think it's really important.
> 
> >
> > And now the 'S3C', 'S5P' and 'SAMSUNG' are used in the 'soc' part. I'm
> > preparing to consolidate the name and to remove duplicated resources.
> 
> Do you also have any specific plans for supporting single image build for
> multiple SoC's while working on this ?

Hmm, you could see through my plan :)
As you know, we need to sort out resources and platform data to support
single kernel image so I'm preparing it after this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
