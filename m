From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 6/8] drivers: soc: add support for exynos SROM driver
Date: Tue, 20 Oct 2015 15:48:25 +0900
Message-ID: <5625E3B9.8040707@samsung.com>
References: <1445255206-11148-1-git-send-email-pankaj.dubey@samsung.com>
 <1445255206-11148-7-git-send-email-pankaj.dubey@samsung.com>
 <56258683.7070204@samsung.com> <5625B92C.10505@samsung.com>
 <5625C07D.4030706@samsung.com> <014301d10b01$488873f0$d9995bd0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29981 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751781AbbJTGsa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 02:48:30 -0400
In-reply-to: <014301d10b01$488873f0$d9995bd0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com

On 20.10.2015 15:33, Pavel Fedin wrote:
>  Hello!
> 
>> AFAIR Fedin was talking about missing functionality, not about adding
>> the contribution by himself. So he might add it or he might not. I did
>> not receive any commitments from him.
> 
>  I am waiting for the driver to be integrated, because i see it's constantly redesigned. Then i'll post my patches.

That means you will extend the driver? Great! So from my point of view
it is fine.

Dear Pankaj,

With the fix of unneeded NULL assignments:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


> By the way, they
> will be useful only if pin controller driver for 5410 is accepted upstream, several authors have done it but i still didn't see it
> in upstream.
>  Pin controller is needed in order to configure multi-functional pins correctly.

Are there any obstacles for upstreaming it?

Best regards,
Krzysztof
