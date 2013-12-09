From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: pmu: Constify data tables
Date: Mon, 09 Dec 2013 17:15:22 +0100
Message-ID: <30145891.cE1204QWiC@amdc1227>
References: <1384971686-7208-1-git-send-email-djkurtz@chromium.org>
 <1922780.plAOmhqzpW@amdc1227>
 <CAGS+omDq95paoHsf5-i2gbRoSGvqn36zNO93KHGi2FGhfGMsrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29125 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932897Ab3LIQPf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 11:15:35 -0500
In-reply-to: <CAGS+omDq95paoHsf5-i2gbRoSGvqn36zNO93KHGi2FGhfGMsrw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: kgene.kim@samsung.com, Heiko Stuebner <heiko@sntech.de>, Amit Daniel Kachhap <amit.daniel@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Doug Andersen <dianders@chromium.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org

On Tuesday 10 of December 2013 00:11:40 Daniel Kurtz wrote:
> Hi Tomasz,
> 
> Thank you for the reviews.
> 
> On Dec 9, 2013 5:15 AM, "Tomasz Figa" <t.figa@samsung.com> wrote:
> >
> > Hi Daniel,
> >
> > On Thursday 21 of November 2013 02:21:24 Daniel Kurtz wrote:
> > > These tables are all immutable, make them const to save 4416 bytes of RAM.
> > >
> > > size arch/arm/mach-exynos/pmu.o
> > >    text          data     bss
> > >     848          4420       4         // before
> > >    5264             4       4         // after
> >
> > I'm not sure where the mentioned saving of RAM is. Moving data between
> > sections is not supposed to make it use less memory, I believe.
> 
> You are correct.  This was my misunderstanding from doing too much
> work with microcontrollers, where .text sections are accessed in place
> from FLASH for code and const data, but .data memory is copied from a
> FLASH section to a second RAM section at init for access at runtime.
> Most modern Linux systems copy/decompress their code and data sections
> from external storage to RAM anyway, so there is no actual memory
> savings (except potentially the compiler may be able to optimize a bit
> more with the const hint).
> 
> >
> > Anyway, it's a good practice to mark constant data as const, to disallow
> > changing them at runtime by mistake, so the patch is fine. Except some
> > issues I commented on inline.
> 
> Were there supposed to be inline comments?  I don't see any.

Oops, sorry for this, forgot to remove the last sentence. I initially had
one question about the constant pointers below, but I read through the
full code again and answered it myself.

The patch is fine.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
