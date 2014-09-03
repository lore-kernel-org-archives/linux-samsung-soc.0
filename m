From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RESEND PATCH v4 2/2] ARM: EXYNOS: Refactor the pm code to use DT
 based lookup
Date: Wed, 03 Sep 2014 22:40:07 +0900
Message-ID: <02aa01cfc77c$94865f20$bd931d60$@samsung.com>
References: <1408431167-14134-1-git-send-email-vikas.sajjan@samsung.com>
 <1408431167-14134-3-git-send-email-vikas.sajjan@samsung.com>
 <CAGm_ybjx4t7kGg0mJHjrox39jP-DNgc-0rkLNn2rcOLS6JjAHQ@mail.gmail.com>
 <2186657.jhIisq7Fok@amdc1032>
 <CAGm_ybhDsGpoHg8XVBOPEv7oHc0YdSZBW_JXB0hZk-y6Bac00g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40087 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932395AbaICNkM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Sep 2014 09:40:12 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NBB008LGVAY4I30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Sep 2014 22:40:10 +0900 (KST)
In-reply-to: <CAGm_ybhDsGpoHg8XVBOPEv7oHc0YdSZBW_JXB0hZk-y6Bac00g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@samsung.com>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Doug Anderson' <dianders@chromium.org>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>

Vikas Sajjan wrote:
> 
> Hi,
> 
Hi,

Sorry for late response...

> On Tue, Aug 19, 2014 at 3:05 PM, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
> >
> > Hi,
> >
> > On Tuesday, August 19, 2014 01:26:49 PM Vikas Sajjan wrote:
> >> Hi Kukjin,
> >>
> >> On Tue, Aug 19, 2014 at 12:22 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> >> > Refactoring the pm.c to avoid using "soc_is_exynos" checks,
> >> > instead use the DT based lookup.
> >> >
> >> > While at it, consolidate the common code across SoCs
> >> > and create static helper functions.
> >> >
> >> > Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> >> > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> >>
> >> Can you pick this series...
> >
> > I think that my PM_SLEEP=n build fixes should go in before this cleanup
> > series:
> 
> Its better for Kukjin to decide which series he wants to pick first.
> 
Hmm...I need to have a look at the Bart's fix then I'll let you know. Maybe
tomorrow morning ;)

> 
> >
> >   http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg35430.html
> >

- Kukjin
