From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix compilation error in mach-goni.c
Date: Mon, 04 Mar 2013 22:11:02 +0900
Message-ID: <008101ce18d9$b879e850$296db8f0$%kim@samsung.com>
References: <1361779938-30023-1-git-send-email-sachin.kamat@linaro.org>
 <512B3723.8070801@samsung.com>
 <CAK9yfHwNnadfVEco5ORn4fCK=myazmVnUCMec_xJa2_tzLzvbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17136 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757129Ab3CDNLZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Mar 2013 08:11:25 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ500BRH0MC9JO0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 22:11:02 +0900 (KST)
In-reply-to: <CAK9yfHwNnadfVEco5ORn4fCK=myazmVnUCMec_xJa2_tzLzvbQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

Sachin Kamat wrote:
> 
> Hi Sylwester,
> 
> On 25 February 2013 15:34, Sylwester Nawrocki <s.nawrocki@samsung.com>
> wrote:
> > Hi Sachin,
> >
> > On 02/25/2013 09:12 AM, Sachin Kamat wrote:
> >> Commit 56bc91 ("[media] s5p-fimc: Redefine platform data structure for
> fimc-is")
> >> split bus_type into fimc_bus_type and sensor_bus_type and converted all
> >> instances of it. This file however escaped the change.
> >>
> >> Without this patch we get the following build error:
> >> arch/arm/mach-s5pv210/mach-goni.c:848:3: error:
> >> unknown field 'bus_type' specified in initializer
> >>
> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> >
> > Thanks for the patch. My apologies for this omission, there is already
> > similar patch from Arnd [1], [2].
> 
> Yes, they fix the same issue. I had not noticed them earlier.
> 
So, when can be fixed?

arch/arm/mach-s5pv210/mach-goni.c:848:3: error: unknown field 'bus_type'
specified in initializer
  CC      arch/arm/mm/idmap.o
make[2]: *** [arch/arm/mach-s5pv210/mach-goni.o] Error 1
make[2]: *** Waiting for unfinished jobs....

- Kukjin
