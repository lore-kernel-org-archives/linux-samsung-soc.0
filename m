From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH 06/11] USB: s3c-hsotg: Only load packet per fifo write
Date: Fri, 09 Jul 2010 14:48:15 +0400
Message-ID: <4C36FE6F.6050606@ru.mvista.com>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org> <1278460943-16224-7-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:39870 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754912Ab0GIKt0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jul 2010 06:49:26 -0400
In-Reply-To: <1278460943-16224-7-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hello.

Ben Dooks wrote:

> Limit the IN FIFO write to a single packet per attempt at writing,
> as per the specifications and ensure that we don't return fifo-full
> so that we can continue writing packets if we have the space.

> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
[...]
> diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
> index 4196e37..df6a39d 100644
> --- a/drivers/usb/gadget/s3c-hsotg.c
> +++ b/drivers/usb/gadget/s3c-hsotg.c
> @@ -538,6 +538,17 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
>  	if (can_write > 512)
>  		can_write = 512;
>  
> +	/* limit the write to one max-packet size worth of data, but allow
> +	 * the transfer to return that it did not run out of fifo space
> +	 * doing it. */

   According to CodingStyle, the preferred style for the multi-line commnets 
is this:

/*
  * bla
  * bla
  */

WBR, Sergei
