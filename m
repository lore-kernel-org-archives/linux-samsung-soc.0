From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/3] Removal of obsolete s3c2410_* GPIO API
Date: Tue, 28 Aug 2012 16:12:45 -0700
Message-ID: <503D506D.9090201@samsung.com>
References: <1345897243-15619-1-git-send-email-sylvester.nawrocki@gmail.com> <CACRpkdaspHBDUjwf_bPtZoFeYK7q97oX4Jat=pmX810RtGJOpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41773 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751021Ab2H1XMs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 19:12:48 -0400
Received: by pbbrr13 with SMTP id rr13so49419pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 16:12:48 -0700 (PDT)
In-Reply-To: <CACRpkdaspHBDUjwf_bPtZoFeYK7q97oX4Jat=pmX810RtGJOpA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, kgene.kim@samsung.com, linus.walleij@stericsson.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 08/27/12 17:13, Linus Walleij wrote:
> On Sat, Aug 25, 2012 at 5:20 AM, Sylwester Nawrocki
> <sylvester.nawrocki@gmail.com>  wrote:
>
>> This short patch series converts remaining users of the s3c24xx SoC
>> specific gpiolib functions to the gpiolib API and finally removes
>> all s3c2410_* functions from drivers/gpio/gpio-samsung.c.
>
> I'm fine with this as long as the Samsung maintainer is, so
> Acked-by: Linus Walleij<linus.walleij@linaro.org>
>
Thanks, applied this series with your ack.

> But I suspect this will be merged through the Samsung SoC tree?
>
Yes, then will be sent to upstream via arm-soc. If any problems, please 
let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
