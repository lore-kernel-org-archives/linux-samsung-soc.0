From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] arm: mct: Don't reset the counter during boot and resume
Date: Wed, 04 Jun 2014 10:47:22 +0900
Message-ID: <026701cf7f96$ed616a00$c8243e00$@samsung.com>
References: <1401821299-24431-1-git-send-email-chirantan@chromium.org>
 <CAD=FV=VfK6DoK53ZBzouoUz-j8COUDUkifEenggC0kkLrJnVcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34570 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752036AbaFDBrZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 21:47:25 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6M00CSIFMY1ZA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Jun 2014 10:47:22 +0900 (KST)
In-reply-to: <CAD=FV=VfK6DoK53ZBzouoUz-j8COUDUkifEenggC0kkLrJnVcA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>, 'Chirantan Ekbote' <chirantan@chromium.org>
Cc: 'Russell King' <linux@arm.linux.org.uk>, 'Olof Johansson' <olof@lixom.net>, 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Doug Anderson wrote:
> 
> Chirantan,
> 
> On Tue, Jun 3, 2014 at 11:48 AM, Chirantan Ekbote
> <chirantan@chromium.org> wrote:
> > Unfortunately on some exynos systems, resetting the mct counter also
> > resets the architected timer counter.  This can cause problems if the
> > architected timer driver has already been initialized because the kernel
> > will think that the counter has wrapped around, causing a big jump in
> > printk timestamps and delaying any scheduled clock events until the
> > counter reaches the value it had before it was reset.
> >
> > The kernel code makes no assumptions about the initial value of the mct
> > counter so there is no reason from a software perspective to clear the
> > counter before starting it.  This also fixes the problems described in
> > the previous paragraph.
> >
> > Cc: Olof Johansson <olof@lixom.net>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Chirantan Ekbote <chirantan@chromium.org>
> > ---
> >  drivers/clocksource/exynos_mct.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> I can confirm that this fixes problems I described in
> <http://www.spinics.net/lists/linux-samsung-soc/msg29085.html>.  Now
> when I boot there's no mysterious delay and there's no big jump in
> time.
> 
> I'd love to see this in 3.16 so we can get rid of this annoying delay.
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Tested-by: Doug Anderson <dianders@chromium.org>

OK, I will queue this patch into fixes for 3.16.

Thanks,
Kukjin
