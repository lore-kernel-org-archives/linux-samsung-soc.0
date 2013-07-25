From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/3] ARM: exynos5420: dt: add clock entries to watchdog
 node
Date: Thu, 25 Jul 2013 11:18:51 -0700
Message-ID: <51F16C0B.7070107@wwwdotorg.org>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com> <1374683930.AViQJCJKdW@amdc1227> <CAK9yfHz9-2WeDU8fnsOoQk7FCXoUvM6MnpWNXEd_GXvv=Fd4Cw@mail.gmail.com> <5919446.9SmJVKqkD3@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:57588 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756758Ab3GYSSz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 14:18:55 -0400
In-Reply-To: <5919446.9SmJVKqkD3@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com, grant.likely@secretlab.ca, arnd@arndb.de, olof@lixom.net, s.nawrocki@samsung.com

On 07/24/2013 07:14 AM, Tomasz Figa wrote:
> On Wednesday 24 of July 2013 16:51:06 Sachin Kamat wrote:
...
>> This is contrary to the fact that we disable everything by default in
>> the top level dt files and only enable them as required in the board
>> dts files.
> 
> No, we don't disable everything. We disable things that require board 
> specific setup or can't work without other support from board side. If there 
> is some hardware disabled in SoC level dtsi that can work without any 
> support from board side, then it is a BUG() and must be fixed.
> 
>>> To illustrate the problem please consider that in the end, a dtb file
>>> will be fused into board ROM (or at most flash memory) and passed to
>>> the kernel by the bootloader. If you disable some hardware on DT level
>>> even if it can be physically used on the board, there will be no way
>>> to reenable it, if some user wanted to use it, because that would
>>> require editing the fused dtb.
>>
>> I believe some h/w will be disabled in dt only if it should not be
>> used for whatever reason. If there is no reason then ofcourse they
>> would be enabled IMHO.
> 
> Yes. This is what I meant. However the reason must be valid - e.g. 
> "hardware does not allow such configuration", not like "some very important 
> manager decided that this board should not use this".
> 
>> Whatever be the case the choice of enabling or
>> disabling should be done at the leaf node (at board level). No?
> 
> It depends. For components that don't require any support from board side 
> it can be globally enabled on SoC level. If a SoC component requires 
> support from board side (like regulators, GPIOs, etc.) then it should be 
> disabled on SoC level and enabled on board level only if all the 
> dependencies are provided.

I tend to agree with Tomasz.

One note though: This is talking about the *.dts files, which may be
different from the DTB that gets passed to the kernel.

In other words, I don't think that the SoC or board .dtsi file (at least
public versions that are hosted outside company-internal/downstream
branches) have any business disabling HW based on policy or use-cases,
rather than actual HW issues such as requiring other HW to support it
that isn't present or doesn't work.

However, I don't think anyone can influence what e.g.a bootloader does
to the DTB before passing it to the kernel; it could add
status="disabled" to some nodes based on policy, and nobody in the Linux
kernel has any absolute right to influence it, although there's sure a
right to complain about it and point out why it's a bad idea.

Equally, if somebody is creating a "BSP" (ick!) for a specific product's
production flash image, rather than contributing to upstream SW support
for that HW board, we probably don't have too much say in what they do.
