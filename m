From: Jungseok Lee <jays.lee@samsung.com>
Subject: Re: [PATCH v4 1/7] arm64: Use pr_* instead of printk
Date: Wed, 30 Apr 2014 11:32:32 +0900
Message-ID: <007c01cf641c$708af310$51a0d930$@samsung.com>
References: <000101cf6367$c4c219f0$4e464dd0$@samsung.com>
 <vnkwsioveuwk.fsf@mitchelh-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33873 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751474AbaD3Cce (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Apr 2014 22:32:34 -0400
In-reply-to: <vnkwsioveuwk.fsf@mitchelh-linux.qualcomm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mitchel Humpherys' <mitchelh@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, Catalin.Marinas@arm.com, 'Marc Zyngier' <Marc.Zyngier@arm.com>, 'Christoffer Dall' <christoffer.dall@linaro.org>, kgene.kim@samsung.com, steve.capper@linaro.org, 'Arnd Bergmann' <arnd@arndb.de>, linux-kernel@vger.kernel.org, ilho215.lee@samsung.com, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, sungjinn.chung@samsung.com

On Wednesday, April 30, 2014 5:35 AM, Mitchel Humpherys wrote:
> On Mon, Apr 28 2014 at 09:59:14 PM, Jungseok Lee <jays.lee@samsung.com> wrote:
> > This patch fixed the following checkpatch complaint as using pr_*
> > instead of printk.
> >
> > WARNING: printk() should include KERN_ facility level
> >
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
> > Reviewed-by: Sungjinn Chung <sungjinn.chung@samsung.com>
> > ---
> >  arch/arm64/kernel/traps.c |   14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > index 7ffaddd..0484e81 100644
> > --- a/arch/arm64/kernel/traps.c
> > +++ b/arch/arm64/kernel/traps.c
> > @@ -65,7 +65,7 @@ static void dump_mem(const char *lvl, const char *str, unsigned long bottom,
> >  	fs = get_fs();
> >  	set_fs(KERNEL_DS);
> >
> > -	printk("%s%s(0x%016lx to 0x%016lx)\n", lvl, str, bottom, top);
> > +	pr_emerg("%s%s(0x%016lx to 0x%016lx)\n", lvl, str, bottom, top);
> 
> Currently this printk is being called with lvl=KERN_EMERG or lvl="". In the case of lvl=KERN_EMERG
> leaving lvl in is redundant. In the case of lvl="" this is a behavioral change (printing to a
> different log level). Was this intended?

No intention. I will drop the change in the next version.
Thanks!!

Best Regards
Jungseok Lee
