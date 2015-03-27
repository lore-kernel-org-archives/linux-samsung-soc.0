From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] Revert "ARM: dts: add display power domain for exynos5250"
Date: Fri, 27 Mar 2015 15:34:27 +0100
Message-ID: <55156A73.7060802@collabora.co.uk>
References: <1427107800-21668-1-git-send-email-javier.martinez@collabora.co.uk> <CAJKOXPewO77pRwh151MFLX+W6WQYPZS759uqjvyZ_TkRf9vmdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPewO77pRwh151MFLX+W6WQYPZS759uqjvyZ_TkRf9vmdA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 03/27/2015 03:29 PM, Krzysztof Kozlowski wrote:
> 2015-03-23 11:49 GMT+01:00 Javier Martinez Canillas
> 
> I looked at the DP and FIMD drivers and with great help of Andrzej
> Hajda found the issue: the FIMD driver does not enable DP clock
> (DP_MIE_CLKCON register). The process looks like:
> 1. Bootloader sets the DP_MIE_CLKCON to proper value.
> 2. FIMD is probed, DP power domain is on.
> 3. FIMD is deffered, DP power domain is turned off.
> 4. The FIMD registers are reset so DP clock is turned off.
> 5. DP driver is probed, DP power domain is turned on but clock is not enabled.
>

Great! I knew it was some setup missing that was made by the boot-loader.

> I'll do some more testing and sent a patch for it till end of Monday
> so I think we should not revert this commit.
>

Agree, I of course preferred to fix the actual cause instead of relying
on the boot-loader to do the initialization but I wasn't able to figure
it out so I posted this patch to revert the commit in the meantime.

> Best regards,
> Krzysztof
> 

Best regards,
Javier
