From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] Fix compile failures by syscore_ops change on s3c2416
Date: Tue, 31 May 2011 15:41:44 +0400
Message-ID: <4DE4D3F8.1030406@ru.mvista.com>
References: <201105302234.35749.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:37462 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752350Ab1EaLmu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 May 2011 07:42:50 -0400
Received: by wya21 with SMTP id 21so3222798wya.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 May 2011 04:42:49 -0700 (PDT)
In-Reply-To: <201105302234.35749.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

Hello.

On 31-05-2011 0:34, Heiko St=FCbner wrote:

> s3c24xx_irq_syscore_ops is only defined in mach-s3c2410/irq.c which i=
s
> not used by s3c2416.
> Also s3c2410_dma_chan needs a struct prefix

    Saying "also" seems a good sign that you should do two patches inst=
ead.

WBR, Sergei
