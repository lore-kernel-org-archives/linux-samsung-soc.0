From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 1/3] ARM: dts: exynos: Secound round of DTS for v4.7
Date: Fri, 29 Apr 2016 14:01:05 +0200
Message-ID: <57234D01.90105@samsung.com>
References: <1461748256-4394-1-git-send-email-k.kozlowski@samsung.com>
 <1956683.Gv388axJqA@wuerfel> <20160428190428.GA10520@kozik-lap>
 <3806573.U95ZyAj1xD@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31846 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752892AbcD2MBK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Apr 2016 08:01:10 -0400
In-reply-to: <3806573.U95ZyAj1xD@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 04/28/2016 10:37 PM, Arnd Bergmann wrote:
> On Thursday 28 April 2016 21:04:28 Krzysztof Kozlowski wrote:
>> On Thu, Apr 28, 2016 at 04:06:54PM +0200, Arnd Bergmann wrote:
>>> On Wednesday 27 April 2016 11:10:54 Krzysztof Kozlowski wrote:
>>>>   kernel.org:/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.7-2
>>>>
>>>
>>> Pulled into next/dt after I figured out that the URL was wrong.
>>>
>>> Please check your git configuration to make sure you send an address
>>> I can pull from.
>>
>> Ah, indeed, sorry for that. I still did not automate entirely this process
>> so apparently I am doing simple mistakes. I'll be more carefull next
>> time.
> 
> Ok. The trick is to have a separate 'url' and 'pushurl' entry in your
> git config, like
> 
> [remote "origin"]
>         url = git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git
>         pushurl = git+ssh://gitolite@ra.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git
> 
> That way, 'git request-pull' will pick the first one, but 'git push' will
> use the second.

I was using two remotes but your config is easier.

Thanks for hint,
Krzysztof
