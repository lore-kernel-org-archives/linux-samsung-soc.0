From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: Enable multi-platform build support
Date: Wed, 21 May 2014 16:02:26 +0200
Message-ID: <2191387.Fu2TRadtVb@amdc1032>
References: <1400655169-21683-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHxj-z1bWQqiaWVwvL2yRotqZn86ecjKcoHcyMQHZCrVcA@mail.gmail.com>
 <036c01cf74fa$2da9c320$88fd4960$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30573 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751878AbaEUOCv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 10:02:51 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5X00DBZGCP45C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 May 2014 23:02:49 +0900 (KST)
In-reply-to: <036c01cf74fa$2da9c320$88fd4960$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Arnd Bergmann' <arnd@arndb.de>


Hi,

On Wednesday, May 21, 2014 10:40:07 PM Kukjin Kim wrote:
> Sachin Kamat wrote:
> > 
> > Hi Bartlomiej,
> > 
> > On 21 May 2014 16:06, Bartlomiej Zolnierkiewicz
> > <b.zolnierkie@samsung.com> wrote:
> > >
> > > Hi,
> > >
> > > On Wednesday, May 21, 2014 12:22:48 PM Sachin Kamat wrote:
> > >> From: Arnd Bergmann <arnd@arndb.de>
> > >>
> > >> This makes it possible to enable the exynos platform as part of a
> > >> multiplatform kernel, in addition to keeping the single-platform
> > >> Exynos support.
> > >
> > > The patch description is wrong.  After this patch single-platform Exynos
> > > support is no longer available
> > 
> > Forgot to update the message while rebasing. Thanks for noticing.
> > 
> > > and it adds at least one serious regression
> > 
> > I have mentioned about this in the cover letter.
> > 
> > > (cpufreq) which should be fixed before merging this patch.  Moreover it
> > > seems that this patch (#2) should be merged with patch #3 to preserve
> > > bisectability.
> > 
> > At this point exynos_defconfig works.
> > 
> > >Please also note that exynos_defconfig is no longer useful
> > > after these changes and can be be removed.
> > 
> > Yes.
> > 
> Well, I think keeping the exynos_defconfig would be nice like other platform in multiplatforms...and I'm going to enable possible configs in exynos_defconfig for exynso SoCs then it can cover more for exynos...

I know that many other platforms still have their own configs [*] but
I would strongly prefer to have a single config supporting Exynos SoCs
(that would be a multiplatform one) to simplify testing and prevent
situations when something works with one config but not the other.

[*] I also hope that they get removed in the longer-term.. 

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
