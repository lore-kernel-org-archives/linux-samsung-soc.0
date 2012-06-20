From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] serial: samsung: protect NULL dereference of clock name
Date: Wed, 20 Jun 2012 16:55:26 -0700
Message-ID: <20120620235526.GB31520@kroah.com>
References: <001401cd3e3e$644fd3a0$2cef7ae0$%kim@samsung.com>
 <029001cd4e9d$2f2af9b0$8d80ed10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:51642 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758619Ab2FTXza (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 19:55:30 -0400
Received: by pbbrp8 with SMTP id rp8so1270568pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jun 2012 16:55:30 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <029001cd4e9d$2f2af9b0$8d80ed10$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Kyoungil Kim' <ki0351.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 'Alan Cox' <alan@linux.intel.com>, 'KeyYoung Park' <keyyoung.park@samsung.com>, 'Huisung Kang' <hs1218.kang@samsung.com>

On Wed, Jun 20, 2012 at 01:28:47PM +0900, Kukjin Kim wrote:
> Kyoungil Kim wrote:
> > 
> > From: KeyYoung Park <keyyoung.park@samsung.com>
> > 
> > When priting the serial clock source, if clock source name is null,
> > kernel reference NULL point.
> > 
> > Signed-off-by: KeyYoung Park <keyyoung.park@samsung.com>
> > Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
> > Signed-off-by: Kyoungil Kim <ki0351.kim@samsung.com>
> 
> (Cc'ed Greg)
> 
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> Greg, could you please pick this up?

Already have, thanks.

greg k-h
