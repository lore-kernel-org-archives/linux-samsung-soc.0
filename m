From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: DTS: Exynos: convert to generic power domain bindings
Date: Tue, 20 Jan 2015 12:47:27 +0100
Message-ID: <54BE404F.5030302@samsung.com>
References: <1420191389-1409-1-git-send-email-m.szyprowski@samsung.com>
 <CABxcv==zC2Sjp+ezO9HBgynbbEqDrv94VO85LPkv02Ok0LUD_Q@mail.gmail.com>
 <54B6951C.8070807@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39907 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751767AbbATLrb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 06:47:31 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIH009E84Y0LK60@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Jan 2015 11:51:36 +0000 (GMT)
In-reply-to: <54B6951C.8070807@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kevin Hilman <khilman@kernel.org>

Hello,

On 2015-01-14 17:11, Kukjin Kim wrote:
> On 01/13/15 01:50, Javier Martinez Canillas wrote:
>> On Fri, Jan 2, 2015 at 10:36 AM, Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> This patch replaces all custom samsung,power-domain device tree properties
>>> with generic power domain bindings and updates documentation Samsung's devices
>>> refering to old binding.
>>>
>>> Suggested-by: Kevin Hilman <khilman@kernel.org>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> It looks to me like a very nice cleanup.
>>
>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>
>> and on an Exynos5800 Peach Pi Chromebook:
>>
>> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>
> Thanks your guys. Yeah, using generic something would be better and
> basically I have no objection. But need to check there is no side-effect
> because sometimes general cannot cover all of customs ;) Anyway I'll
> look at this change about that in this weekend.

Kukjin: any new thoughts? I didn't notice this patch in your dt-samsung 
branch
update...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
