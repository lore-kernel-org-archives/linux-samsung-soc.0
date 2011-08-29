From: xf liu <7inchpalace@gmail.com>
Subject: Re: kgdb on S5PV210
Date: Mon, 29 Aug 2011 15:13:16 +0800
Message-ID: <CAK6dbMSN+nCea_eY2nNgL7mPVjjprpNgDbDFBL0c6XB8V-S_jw@mail.gmail.com>
References: <CAK6dbMS6DXxez6ehAGZgi5yu9kgjg5QQr-UGYmxNR4frPGGe+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:45687 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751080Ab1H2HNQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Aug 2011 03:13:16 -0400
Received: by pzk37 with SMTP id 37so7973281pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2011 00:13:16 -0700 (PDT)
In-Reply-To: <CAK6dbMS6DXxez6ehAGZgi5yu9kgjg5QQr-UGYmxNR4frPGGe+A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

I do not subscribe the list, so pls add me in the cc list if any reply.
Thanks.

2011/8/29 xf liu <7inchpalace@gmail.com>:
> Hi list,
>
>
> I try to enable kgdb on S5PV210 using the same serial port (UART 0)
> with the console, but after adding "kgdboc=ttySAC0,115200 kgdbwait" I
> found tty_find_polling_driver returns NULL.
> The cause is that the poll_get_char and poll_put_char handlers are not
> set in static struct uart_ops s3c24xx_serial_ops.
>
> I tried google but do net found any patch for this, but maybe I lost something.
> Is there any patch I can get from anywhere or should I implement the
> functions by myself?
>
> Thanks in advance.
>
> Regards,
> Ryan
>
