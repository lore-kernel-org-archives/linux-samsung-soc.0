From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 2/3] pinctrl: s3c24xx: use correct header for chained_irq
 functions
Date: Tue, 18 Jun 2013 00:58:41 +0900
Message-ID: <51BF3231.1070505@samsung.com>
References: <201306140044.15568.heiko@sntech.de>	<201306140045.51206.heiko@sntech.de>	<1a1801ce6b5c$d5395270$7fabf750$%kim@samsung.com> <CACRpkdbmh5sXXycHHy0GYZY0WH5np0je1NU6jyHmb2h_VuagRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:59691 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751452Ab3FQP6q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 11:58:46 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp12so2996210pab.35
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 08:58:45 -0700 (PDT)
In-Reply-To: <CACRpkdbmh5sXXycHHy0GYZY0WH5np0je1NU6jyHmb2h_VuagRA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>

On 06/18/13 00:45, Linus Walleij wrote:
> On Mon, Jun 17, 2013 at 3:16 PM, Kukjin Kim<kgene.kim@samsung.com>  w=
rote:
>> Heiko St=FCbner wrote:
>>>
>>> chained_irq_enter and chained_irq_exit moved to a real header under
>>> linux/pinctrl instead of asm/.
>>>
>>> Update the pinctrl driver to use the correct header and fix the bui=
ld
>>> error.
>>>
>>> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> (...)
>>
>> Hmm, would be nice if I could take 1st and 2nd into samsung tree :-)
>>
>> Linus, if any problems, please let me know.
>
> No that should work fine. Nothing is touching pinctrl-s3c in my
> pinctrl tree so:
> Acked-by: Linus Walleij<linus.walleij@linaro.org>
>
Thanks, applied with Linus' ack.

- Kukjin
