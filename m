From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/2] ARM: exynos: Enable TMU support in exynos platforms
Date: Tue, 24 Jul 2012 12:03:18 -0700
Message-ID: <20120724190318.GA10922@roeck-us.net>
References: <1342084543-8302-1-git-send-email-amit.daniel@samsung.com>
 <117e01cd60ea$99f24e60$cdd6eb20$%kim@samsung.com>
 <20120713144138.GB25264@roeck-us.net>
 <CADGdYn5mrHVBEhYF-Zv1UJK1YtVNk=kBA98xOdWevRU+_tu6cg@mail.gmail.com>
 <CAK9yfHwGU8EWsXoY9_gDn5=zyJhqtaZbKXzwyGais8u0iaL8xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:65326 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754238Ab2GXTDC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jul 2012 15:03:02 -0400
Content-Disposition: inline
In-Reply-To: <CAK9yfHwGU8EWsXoY9_gDn5=zyJhqtaZbKXzwyGais8u0iaL8xA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: amit kachhap <amit.kachhap@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lenb@kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

On Tue, Jul 24, 2012 at 12:20:33PM +0530, Sachin Kamat wrote:
> Hi Amit,
> 
> On 14 July 2012 12:55, amit kachhap <amit.kachhap@gmail.com> wrote:
> > On Fri, Jul 13, 2012 at 8:11 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> >> On Fri, Jul 13, 2012 at 08:28:18PM +0900, Kukjin Kim wrote:
> >>> Amit Daniel Kachhap wrote:
> >>> >
> >>> > These TMU enablement patches are needed for exynos4 and exynos5 TMU
> >>> > driver patches sent earlier. The link for those are
> >>> > http://www.spinics.net/lists/lm-sensors/msg35858.html.
> >>> >
> >>> How was going on above patches? I can't see them you said in linux-next now,
> >>> it means if I apply this series in my tree, problem will be happened :(
> >>>
> >>> Note1: I've seen Rafael's updating exynos4_tmu patch which is using struct
> >>> dev_pm_ops for pm and applied by Guenter.
> >>>
> >> If that is in the way, I can drop it, to be applied after the move. Let me know.
> >> There is now another patch pending, to convert the driver to use devm_ functions.
> >> Please let me know what you want me to do with it.
> >>
> > Hi Guenter,
> >
> > I rebased my V5 patch series with  hwmon-next branch so Rafael's pm
> > changes are already included. Regarding the devm_ patch by sachin
> > please hold it.
> 
> Guenter has already sent the pull request to Linus for v3.6 [1].
> That does not include your patches. I do not understand why you want
> to hold back my patch when you can rebase your series on top of it.
> 
> [1] https://lkml.org/lkml/2012/7/23/414
> 
Linus doesn't like rebases, especially not from one tree to another.
As it is, it may even be that he rejects my pull request because I rebased
to 3.5 before sending the pull request to him (I'll definitely not do that
again).

In addition, it may well be that some of your changes no longer apply
after the driver moved to its new location. So it is overall safer to move
the driver first, and convert it to devm_ functions afterwards.

If anything, I should not have applied Rafael's patch to the driver either.

Guenter
