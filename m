From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: DTS: Exynos: convert to generic power domain bindings
Date: Thu, 15 Jan 2015 01:11:08 +0900
Message-ID: <54B6951C.8070807@kernel.org>
References: <1420191389-1409-1-git-send-email-m.szyprowski@samsung.com> <CABxcv==zC2Sjp+ezO9HBgynbbEqDrv94VO85LPkv02Ok0LUD_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48265 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752497AbbANQLQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 11:11:16 -0500
In-Reply-To: <CABxcv==zC2Sjp+ezO9HBgynbbEqDrv94VO85LPkv02Ok0LUD_Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kevin Hilman <khilman@kernel.org>

On 01/13/15 01:50, Javier Martinez Canillas wrote:
> Hello Marek,
> 
> On Fri, Jan 2, 2015 at 10:36 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> This patch replaces all custom samsung,power-domain device tree properties
>> with generic power domain bindings and updates documentation Samsung's devices
>> refering to old binding.
>>
>> Suggested-by: Kevin Hilman <khilman@kernel.org>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> It looks to me like a very nice cleanup.
> 
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
> and on an Exynos5800 Peach Pi Chromebook:
> 
> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
Thanks your guys. Yeah, using generic something would be better and
basically I have no objection. But need to check there is no side-effect
because sometimes general cannot cover all of customs ;) Anyway I'll
look at this change about that in this weekend.

Thanks,
Kukjin
