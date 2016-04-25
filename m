From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 2/5] ARM: dts: exynos: DT for v4.7
Date: Mon, 25 Apr 2016 11:02:15 +0200
Message-ID: <571DDD17.9090402@samsung.com>
References: <1460541682-32417-1-git-send-email-k.kozlowski@samsung.com>
 <1460541682-32417-3-git-send-email-k.kozlowski@samsung.com>
 <5773702.Vl2lnk0PfR@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:19754 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753483AbcDYJCU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 05:02:20 -0400
In-reply-to: <5773702.Vl2lnk0PfR@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/24/2016 11:18 PM, Arnd Bergmann wrote:
> On Wednesday 13 April 2016 12:01:19 Krzysztof Kozlowski wrote:
>> Samsung Device Tree updates and improvements for v4.7:
>> 1. Enable accelerated AES (Security SubSystem) on Exynos4412-based boards.
>> 2. Enable HDMI CEC on Exynos4412-based Odroid.
>> 3. Add regulator supplies for eMMC/SD on Odroid XU3/XU4.
>> 4. Fix DTC unit name warnings.
>> 5. Merge topic branch of new Artik5 board.
>>
> 
> Pulled into next/dt. Thanks for splitting this into a separate branch
> aside from the Artik5 stuff, that makes sense. Two minor things you
> could have done even better:
> 
> - split out the DTC unit name warning fixes into yet another branch,
>   as there are lots of them and they are unrelated to the rest
> 
> - not merge the Artik5 changes into this, but let us deal with
>   any conflicts ourselves.

Thanks for both hints. Noted.

Best regards,
Krzysztof
