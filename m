From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 2/3] ARM: Exynos4: Add ioremap interceptor for statically
 remapped regions
Date: Thu, 13 Oct 2011 14:52:03 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1110131448130.17040@xanadu.home>
References: <1318234289-22041-1-git-send-email-thomas.abraham@linaro.org> <1318234289-22041-3-git-send-email-thomas.abraham@linaro.org> <4E95BC8E.8010105@gmail.com> <CAJuYYwSQgiZMEuzyqFvijy+sTLWqi=TqvM8cGe=W3bPOSBe0Hg@mail.gmail.com>
 <CAJuYYwTpUX+zdRr5PO9SW+nUFW-BwsSwWkWXNRjw_TKy+vdEgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1368983491-1318531926=:17040"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:63909 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751703Ab1JMSwK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Oct 2011 14:52:10 -0400
Received: by vcbgb30 with SMTP id gb30so353428vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Oct 2011 11:52:08 -0700 (PDT)
In-Reply-To: <CAJuYYwTpUX+zdRr5PO9SW+nUFW-BwsSwWkWXNRjw_TKy+vdEgw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Rob Herring <robherring2@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1368983491-1318531926=:17040
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

On Thu, 13 Oct 2011, Thomas Abraham wrote:

> On 12 October 2011 22:00, Thomas Abraham <thomas.abraham@linaro.org> wrote:
> > On 12 October 2011 21:43, Rob Herring <robherring2@gmail.com> wrote:
> >> On 10/10/2011 03:11 AM, Thomas Abraham wrote:
> >>> ioremap() request for statically remapped regions are intercepted and the
> >>> statically assigned virtual address is returned. For requests for which
> >>> there are no statically remapped regions, the requests are let through.
> >>>
> >>> Cc: Kukjin Kim <kgene.kim@samsung.com>
> >>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> >>> ---
> >>>  arch/arm/mach-exynos4/cpu.c             |   16 ++++++++++++++++
> >>>  arch/arm/mach-exynos4/include/mach/io.h |    4 ++++
> >>>  2 files changed, 20 insertions(+), 0 deletions(-)
> >>>
> >>
> >> You won't need this with Nico's vmalloc.h clean-up series. It does
> >> exactly this but generically for all platforms.
> >
> > Ok. Thanks for your suggestion. I will move to using Nico's patches.
> 
> From Nico's reply to his pull request of vmalloc cleanup series, it
> looks like that pull request has been withdrawn (hope I am not missing
> anything here).

I'm just postponing it because this depends on a large cleanup in the 
OMAP code which is being pushed to mainline for the next merge window.

> Without Nico's series, and gic dt support for exynos4 support 
> requiring this patch, all other workarounds to replace this patch does 
> not seem be correct.
> 
> So is it acceptable to retain this patch and later rework/drop the
> exynos4 specific ioremap along with Nico's vmalloc patch series when
> it is merged.

I would guess so.  But please CC me on those patches so I know what to 
look for when rebasing my series.


Nicolas
--8323328-1368983491-1318531926=:17040--
