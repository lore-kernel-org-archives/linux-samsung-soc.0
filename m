From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] mmc: s3cmci: moved mach/regs-sdi.h into s3cmci device
 driver
Date: Fri, 08 Feb 2013 14:14:08 -0800
Message-ID: <1a5001ce0649$9ede4870$dc9ad950$@samsung.com>
References: <1359765917-11219-1-git-send-email-kgene.kim@samsung.com>
 <510EB2F1.4010603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57987 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1947131Ab3BHWO0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 17:14:26 -0500
In-reply-to: 
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-mmc@vger.kernel.org, 'Chris Ball' <cjb@laptop.org>

Kukjin Kim wrote:
> 
> Sylwester Nawrocki wrote:
> >
> > Hi,
> >
> Hi,
> 
> > On 02/02/2013 01:45 AM, Kukjin Kim wrote:
> > > Since mach/regs-sdi.h is used only for s3cmci.c, so this moves the
> > > header file into the driver file, drivers/mmc/host/s3cmci.c file.
> > >
> > > Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> >
> > FIW, I have tested this patch on mini2440 board:
> >
> > Tested-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> 
> Sylwester, thanks for your test :-)
> 
> Chris, if you're ok on this, please take this in your tree. Or if you
want, let me
> pick this up in Samsung tree.
> 
Applied into Samsung tree, thanks.

- Kukjin
