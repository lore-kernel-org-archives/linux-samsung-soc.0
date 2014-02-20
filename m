From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: Exynos: Add generic compatible string
Date: Thu, 20 Feb 2014 09:44:11 +0530
Message-ID: <CAK9yfHy7YHDLCfUGA-ua4iLzK2PMotVZvC=51t-bMkVZVBQFaA@mail.gmail.com>
References: <1392809645-631-1-git-send-email-sachin.kamat@linaro.org>
	<5304A779.1060702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:47738 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753516AbaBTEOM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Feb 2014 23:14:12 -0500
Received: by mail-oa0-f41.google.com with SMTP id o6so1182473oag.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2014 20:14:11 -0800 (PST)
In-Reply-To: <5304A779.1060702@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>

Hi Tomasz,

On 19 February 2014 18:15, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Sachin,
>
> [adding linux-arm-kernel ML to CC list]
>
>
> On 19.02.2014 12:34, Sachin Kamat wrote:
>>
>> To avoid modifying the kernel every time a new SoC variant
>> comes out.
<snip>
>
> Since all Exynos chips can be easily recognized using dedicated chip ID
> register, I wonder whether we really need to maintain two distinct board
> files for Exynos 4 and 5 series, especially when both of them are doing
> mostly the same set up, which can be simply generalized to cover all the
> cases.
>
> Instead of adding just another level of artificially fine grained compatible
> strings, I'd rather suggest merging both board files together and adding a
> single compatible string identifying all SoCs that can be further
> differentiated by using hardware chip ID register.
>
> What do you think?

I agree with your idea of merging both the files as there is very little that is
different for now. However I am not really sure if having a single compatible
string for all SoCs would be good. What is achieved through compatible string
can very well be done using chip ID too. But wouldn't we need to maintain some
unique identity for the SoCs in human readable form at the DT level?
In the absence
of any other opinion, can probably experiment with this and see how it
takes shape.


> P.S. Please always keep respective subsystem/arch level MLs on CC list, in
> this case linux-arm-kernel. The linux-samsung-soc ML is just a convenience
> tool to group all threads about Samsung SoCs, not a way to bypass respective
> subsystem MLs.

Nothing to disagree. A valid point at large, but for every trivial or
exynos specific
change, including top level MLs would probably amount to spamming :)

-- 
With warm regards,
Sachin
