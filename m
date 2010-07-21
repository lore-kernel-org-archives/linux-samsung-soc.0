From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] serial: samsung.c: Add FRACVAL support for newer UART
Date: Wed, 21 Jul 2010 18:20:47 +0900
Message-ID: <008b01cb28b6$049fc6d0$0ddf5470$%kim@samsung.com>
References: <1277474119-6897-1-git-send-email-kgene.kim@samsung.com>
 <4C46B9D8.7020504@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40090 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751755Ab0GUJUt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 05:20:49 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5W00DQGHYIMYD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Jul 2010 18:20:42 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5W000Z2HYIW2@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Jul 2010 18:20:42 +0900 (KST)
In-reply-to: <4C46B9D8.7020504@ru.mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Changhwan Youn' <chaos.youn@samsung.com>, ben-linux@fluff.org

Sergei Shtylyov wrote:
> 
> Hello.
> 
Hi ;-)

> Kukjin Kim wrote:
> 
> > From: Changhwan Youn <chaos.youn@samsung.com>
> 
> > FRACVAL register provides the same function as UDIVSLOT register which
is
> > the 1/16ths adjustment to the baud rate but the implementaiton is
easier.
> > To support UDIVSLOT register, UDIVSLOT table search is necessary though
> > supporting FRACVAL only needs the index value of UDIVSLOT table.
> 
> > This patch implements the FRACVAL supports for the newer Samsung SoC
> UARTs.
> 
> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> [...]
> > diff --git a/drivers/serial/samsung.c b/drivers/serial/samsung.c
> > index a9d6c56..09805c7 100644
> > --- a/drivers/serial/samsung.c
> > +++ b/drivers/serial/samsung.c
> > @@ -530,7 +530,7 @@ static int s3c24xx_serial_calcbaud(struct baud_calc
*calc,
> >
> >  	calc->clksrc = clksrc;
> >
> > -	if (ourport->info->has_divslot) {
> > +	if ((ourport->info->has_divslot) || (ourport->info->has_fracval)) {
> 
>     Parens around variables are not needed.
> 
Yeah.

> 
> > @@ -755,7 +758,7 @@ static void s3c24xx_serial_set_termios(struct
uart_port
> *port,
> >  	wr_regl(port, S3C2410_UBRDIV, quot);
> >  	wr_regl(port, S3C2410_UMCON, umcon);
> >
> > -	if (ourport->info->has_divslot)
> > +	if ((ourport->info->has_divslot) || (ourport->info->has_fracval))
> 
>     Here as well...
> 
Yeah.

You're right.
But already re-submitted updated.

Please kindly find following URL.
http://lists.infradead.org/pipermail/linux-arm-kernel/2010-July/020713.html

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
