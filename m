From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] ARM: S3C24XX: Correct NR_IRQS definition for s3c2440
Date: Sun, 07 Apr 2013 23:42:58 +0200
Message-ID: <5161E862.9060905@gmail.com>
References: <1365366170-9682-1-git-send-email-s.nawrocki@samsung.com> <201304072235.02218.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f177.google.com ([209.85.215.177]:57277 "EHLO
	mail-ea0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762304Ab3DGVnE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Apr 2013 17:43:04 -0400
Received: by mail-ea0-f177.google.com with SMTP id q14so1963435eaj.36
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Apr 2013 14:43:02 -0700 (PDT)
In-Reply-To: <201304072235.02218.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

On 04/07/2013 10:35 PM, Heiko St=C3=BCbner wrote:
> Am Sonntag, 7. April 2013, 22:22:50 schrieb Sylwester Nawrocki:
[...]
> Thanks for testing the irq changes on another subarchitecture and fix=
ing the
> glitch.

And thanks for your effort in adding DT support for s3c24xx!

I'm still debugging one more issue, which prevents the ethernet control=
ler
from working properly. I.e. currently booting stops on starting network=
=20
interfaces.
There is some problem with the external interrupts handling on s3c2440.=
=20
In my
case EINT7 does not trigger any interrupts, even though gpcon_reg and=20
extint_reg
seem to be configured properly.


Regards,
Sylwester
