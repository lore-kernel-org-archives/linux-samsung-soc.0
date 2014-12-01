From: Tyler Baker <tyler.baker@linaro.org>
Subject: Re: [PATCH RFT 2/2] arm: dts: disable CCI on exynos420 based arndale-octa
Date: Mon, 1 Dec 2014 11:52:20 -0800
Message-ID: <CANMBJr60MOoHfeSYJK2dN-oyJtLaFWQ3ubjXLQYKfj1WQ8Qb2w@mail.gmail.com>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
	<1417186209-5256-2-git-send-email-a.kesavan@samsung.com>
	<7hbnnn5hmy.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:64344 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932156AbaLATwW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Dec 2014 14:52:22 -0500
Received: by mail-wi0-f181.google.com with SMTP id r20so18666234wiv.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Dec 2014 11:52:20 -0800 (PST)
In-Reply-To: <7hbnnn5hmy.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, nicolas.pitre@linaro.org, lorenzo.pieralisi@arm.com, punit.agrawal@arm.com, will.deacon@arm.com, mark.rutland@arm.com, kgene@kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dianders@chromium.org, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, javier.martinez@collabora.co.uk, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Arnd Bergmann <arnd@arndb.de>

On 1 December 2014 at 10:50, Kevin Hilman <khilman@kernel.org> wrote:
> Abhilash Kesavan <a.kesavan@samsung.com> writes:
>
>> The arndale-octa board was giving "imprecise external aborts" during
>> boot-up with MCPM enabled. CCI enablement of the boot cluster was found
>> to be the cause of these aborts (possibly because the secure f/w was not
>> allowing it). Hence, disable CCI for the arndale-octa board.
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>
> Tested-by: Kevin Hilman <khilman@linaro.org>
>
> Tested on top of next-20141128 with exynos_defconfig on my Octa board
> and I'm not seeing the imprecise aborts anymore.
>
> Thanks,
>
> Kevin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Tested-by: Tyler Baker <tyler.baker@linaro.org>

Tested on top of mainline/master with exynos_defconfig on my
arndale-octa board.
One hundred boots attempted with no imprecise aborts.

Cheers,

-- 
Tyler Baker
Tech Lead, LAVA
Linaro.org | Open source software for ARM SoCs
Follow Linaro: http://www.facebook.com/pages/Linaro
http://twitter.com/#!/linaroorg - http://www.linaro.org/linaro-blog
