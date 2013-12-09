From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: s3c24xx: get rid of custom <mach/gpio.h>
Date: Tue, 10 Dec 2013 06:23:07 +0900
Message-ID: <52A634BB.8020909@samsung.com>
References: <1386322280-23756-1-git-send-email-linus.walleij@linaro.org> <CACRpkdZuk3zzhDnj3wJg1cmuqX0Cj-qQ--sBzEEV_XWyeDje3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:39243 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345Ab3LIVXO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 16:23:14 -0500
Received: by mail-pd0-f178.google.com with SMTP id y10so5883021pdj.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 13:23:13 -0800 (PST)
In-Reply-To: <CACRpkdZuk3zzhDnj3wJg1cmuqX0Cj-qQ--sBzEEV_XWyeDje3w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>

On 12/06/13 20:58, Linus Walleij wrote:
> On Fri, Dec 6, 2013 at 10:31 AM, Linus Walleij<linus.walleij@linaro.org>  wrote:
>
Hi Linus,

>> This isolates the custom S3C24xx GPIO definition table to
>> <linux/platform_data/gpio-samsung-s3x24xx.h>
>
> Maybe I'm too trigger happy. I'll send a combined series with
> S3C24xx, S3C64xx and maybe also S5P variants all fixed
> so you can see the overall idea here. Hold on.
>
Basically, looks good to me and let me hold on look at this patch? as 
you requested ;-)

Anyway, thanks for your care of samsung gpio stuff.

- Kukjin
