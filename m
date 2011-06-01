From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] Fix compile failures by syscore_ops change on s3c2416
Date: Wed, 1 Jun 2011 13:54:03 +0200
Message-ID: <201106011354.06804.heiko@sntech.de>
References: <201105302234.35749.heiko@sntech.de> <4DE4D3F8.1030406@ru.mvista.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:54962 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758827Ab1FALyU convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jun 2011 07:54:20 -0400
In-Reply-To: <4DE4D3F8.1030406@ru.mvista.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

Am Dienstag 31 Mai 2011 schrieb Sergei Shtylyov:
> On 31-05-2011 0:34, Heiko St=FCbner wrote:
> > s3c24xx_irq_syscore_ops is only defined in mach-s3c2410/irq.c which=
 is
> > not used by s3c2416.
> > Also s3c2410_dma_chan needs a struct prefix
>=20
>     Saying "also" seems a good sign that you should do two patches in=
stead.

you are right of course :-) ... I have redone them now

Heiko
