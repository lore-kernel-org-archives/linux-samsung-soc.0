From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [GIT PULL 1/4] ARM: exynos: SoC/Mach for v4.9
Date: Mon, 05 Sep 2016 10:06:14 +0200
Message-ID: <08dfc5c7-e844-023c-b5a8-9996dfb403ff@samsung.com>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
 <1472548739-20050-5-git-send-email-k.kozlowski@samsung.com>
 <5635206.ooNAZCeQOe@wuerfel> <20160902163244.GB5534@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22737 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754322AbcIEIGX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Sep 2016 04:06:23 -0400
In-reply-to: <20160902163244.GB5534@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, sam.van.den.berge@telenet.be
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 09/02/2016 06:32 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 02, 2016 at 06:26:42PM +0200, Arnd Bergmann wrote:
>> On Tuesday, August 30, 2016 11:18:59 AM CEST Krzysztof Kozlowski wrote:
>>> Samsung mach/soc update for v4.9:
>>> 1. Fix for DMA on S3C24xx. This was probably broken for long time, nobody runs
>>>    this code... till now.
>>
>> Good to know. This reminds me that the s3c24xx DMA code is one of those
>> that need to be converted to dma_slave_map at some point. Maybe if someone
>> is now running that code, they could give that a try as well?
>>
>> It shouldn't be hard to convert, let me know if you need more information.
> 
> +Cc Sylwester,
> 
> Sylwester recently dig into this platform. I think he managed to play
> some audio.

I revived this platform for testing ASoC changes.  I should find time
to do that dma_slave_map refactoring sooner or later.

Or if you would like to do it Sam please go ahead.

-- 
Thanks,
Sylwester
