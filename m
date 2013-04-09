From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/6] pinctrl: samsung: Include pinctrl-exynos driver data conditionally
Date: Tue, 9 Apr 2013 09:40:15 +0200
Message-ID: <CACRpkdb63vNQ_63NLPrK0mx=W4ecBeksY=GNMpJRLsAyzfb65A@mail.gmail.com>
References: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
	<1363642315-10331-3-git-send-email-tomasz.figa@gmail.com>
	<1733680.zsxXgkCci5@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:61939 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936585Ab3DIHkQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 03:40:16 -0400
Received: by mail-ie0-f175.google.com with SMTP id c12so7964676ieb.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 00:40:16 -0700 (PDT)
In-Reply-To: <1733680.zsxXgkCci5@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Mon, Mar 18, 2013 at 10:38 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Monday 18 of March 2013 22:31:51 Tomasz Figa wrote:
>> Since pinctrl-samsung is a common part of the pin control support for
>> several Samsung SoCs, it can be compiled without Exynos support enabled.
>>
>> This patch surrounds Exynos-specific driver data with ifdefs to include
>> them only when support for Exynos is enabled.
>>
>> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
>> ---
>>  drivers/pinctrl/pinctrl-samsung.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinctrl-samsung.c
>> b/drivers/pinctrl/pinctrl-samsung.c index b1d4ac8..f1fb562 100644
>> --- a/drivers/pinctrl/pinctrl-samsung.c
>> +++ b/drivers/pinctrl/pinctrl-samsung.c
>> @@ -968,10 +968,12 @@ static int samsung_pinctrl_probe(struct
>> platform_device *pdev) }
>>
>>  static const struct of_device_id samsung_pinctrl_dt_match[] = {
>> +#ifdef CONFIG_PINCTRL_EXYNOS4
>
> Oops... This should be CONFIG_PINCTRL_EXYNOS. It used to be EXYNOS4 in
> Kgene's tree (on which I usually base my patches) for some time, but it no
> longer is, but I forgot to change this during rebae.
>
> Linus, if remaining patches turned out to be OK, would you fix this when
> applying?

Fixed and applied.

Thanks!
Linus Walleij
