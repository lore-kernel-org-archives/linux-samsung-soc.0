From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] S3C24XX: add clockevent/clocksource support
Date: Thu, 25 Oct 2012 22:39:10 +0200
Message-ID: <6694372.nV9NvELlFJ@flatron>
References: <50885608.1030503@openwide.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:45926 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2992662Ab2JYUjE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Oct 2012 16:39:04 -0400
Received: by mail-wi0-f172.google.com with SMTP id hq12so6395158wib.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Oct 2012 13:39:02 -0700 (PDT)
In-Reply-To: <50885608.1030503@openwide.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Romain Naour <romain.naour@openwide.fr>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Hi Romain,

On Wednesday 24 of October 2012 22:56:40 Romain Naour wrote:
> Hi,
> 
> This patch converts the s3c24xx timer driver to the
> clocksource/clockevent API. I made some test on a mini2440 board and I
> had to reduce timers frequency to 1MHz in order to produce a timer's
> overflow every 64ms. Initial timer's frequency (8,45MHz) provide only
> 7ms between each overflow. It is not enough. As timers were previously
> used to produce an IRQ at 200Hz, some board (Osiris, Anubis board) use
> an external 12MHz signal to clock the timers (tclk1). So, I changed
> their configuration to select internal pclk clock instead, but I can't
> test it. Also, I created a new file (s3c24xx_time.c) to avoid impacting
> the s3c64xx. Kernel rev v3.7-rc1
> 
> Do you have any comments on this patch ?

Generally looks fine, but I have some doubts:

- Isn't 64ms still way too little for overflow period? Someone who is more 
into Linux time keeping should comment on this.

- Much of the code is duplicated from s5p-time, maybe s5p-time could be 
made a generic samsung-time instead? It could be also used for S3C64xx.

CC'ing Heiko and Sylwester, as they might find this patch interesting.

Best regards,
Tomasz Figa
