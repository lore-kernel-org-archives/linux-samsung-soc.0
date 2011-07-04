From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/7] ARM: EXYNOS4: Support early wakeup while entering
	sleep mode
Date: Mon, 4 Jul 2011 10:52:14 +0100
Message-ID: <20110704095214.GA8286@n2100.arm.linux.org.uk>
References: <1308732405-16664-1-git-send-email-kgene.kim@samsung.com> <1308732405-16664-5-git-send-email-kgene.kim@samsung.com> <20110622145715.GS23234@n2100.arm.linux.org.uk> <007401cc3242$48947160$d9bd5420$%kim@samsung.com> <20110624093750.GD23234@n2100.arm.linux.org.uk> <20110624102246.GF23234@n2100.arm.linux.org.uk> <017d01cc378a$c017edf0$4047c9d0$%kim@samsung.com> <20110701074414.GD21898@n2100.arm.linux.org.uk> <005001cc3a2e$a6689480$f339bd80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:55711 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754151Ab1GDJw1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 05:52:27 -0400
Content-Disposition: inline
In-Reply-To: <005001cc3a2e$a6689480$f339bd80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Jaecheol Lee' <jc.lee@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Mon, Jul 04, 2011 at 06:42:08PM +0900, Kukjin Kim wrote:
> Russell King - ARM Linux wrote:
> > 
> > On Fri, Jul 01, 2011 at 10:03:48AM +0900, Kukjin Kim wrote:
> > > Russell thanks.
> > >
> > > How do you think to add following for handling failure of cpu_suspend?
> > >
> > > +	mov	r0, #-1
> > 
> > No.  -1 is not an error code, and I refuse to create functions which
> > use an explicit -1 as a return code to indicate failure.
> > 
> I used wrong words, 'handling failure' :(
> 
> Actually, it means handling other case, like early wakeup but we will
> address comments from you :)

Bear in mind that others may wish to return negative errno codes
through this, so if you want to indicate 'no need to resume and
restore state' then I guess using a small positive number would be
acceptable to distinguish it from a real error.
