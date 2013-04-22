From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
Date: Mon, 22 Apr 2013 21:11:45 +0200
Message-ID: <201304222111.45653.arnd@arndb.de>
References: <51642dab.e844440a.0ad1.ffffc13f@mx.google.com> <516571BC.9030909@samsung.com> <51756E98.9040606@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:49670 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754641Ab3DVTMC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 15:12:02 -0400
In-Reply-To: <51756E98.9040606@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Olof Johansson' <olof@lixom.net>

On Monday 22 April 2013, Kukjin Kim wrote:
> On 04/10/13 23:05, Kukjin Kim wrote:
> > On 04/10/13 22:55, Arnd Bergmann wrote:
> >> On Wednesday 10 April 2013, Sylwester Nawrocki wrote:
> >>> Hmm, it turns out we are still actively using some boards based on
> >>> Exynos4210 EVT0 SoCs. And since it seems unlikely the patches from
> >>> Tomasz [1] adding basic DT support for those will get merged for
> >>> 3.10, it would be a bit inconvenient to remove the ATAGS support
> >>> now, leaving Exynos4210 Rev. 0 not supported at all.
> >>
> >> I still have hope to get those included.
> >>
> > I agree and I asked Tomasz to re-send universal dt patch.
> >
> Hi Arnd and Olof,
> 
> Is it possible to send one more pull-request for this and something like 
> dt patches for exynos?

I think it's too late for that now, let's just fix the broken pieces
now and do the minimum amount of patches on top of what we have:

* Thomas Abraham's fix for the clk code
* Tomasz Figa's patch to restore Universal C210
* Whatever is needed to get USB working again on Arndale
* Anything else that comes up that is really a bug fix.
* Getting the PWM and ADC drivers working with DT, that can
  easily be done.
* Possibly a patch to mark CONFIG_EXYNOS_ATAGS as broken,
  if you think that helps.

but not:

* The entire series to rework the PWM clock from Tomasz
* The entire series to remove ATAGS support on Exynos
* Any other non-bugfix patches

	Arnd
