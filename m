From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: [PATCH v2 03/11] ARM: EXYNOS: add clock part for EXYNOS5250 SoC
Date: Wed, 15 Feb 2012 21:33:36 -0800
Message-ID: <CAJOA=zPujvu0WNmn8UPa4NogJ1w6UqEg-RDNEcnfBZQW3SS+eQ@mail.gmail.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
 <20120213205444.GH11077@ponder.secretlab.ca> <052801ccec5d$137aa460$3a6fed20$%kim@samsung.com>
 <201202160522.35249.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog126.obsmtp.com ([74.125.149.155]:33764 "EHLO
	na3sys009aog126.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751656Ab2BPFd5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 00:33:57 -0500
Received: by mail-iy0-f170.google.com with SMTP id k32so4665867iak.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Feb 2012 21:33:56 -0800 (PST)
In-Reply-To: <201202160522.35249.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kyungmin Park <kmpark@infradead.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, olof@lixom.net, linux-arm-kernel@lists.infradead.org, jhbird.choi@samsung.com

On Wed, Feb 15, 2012 at 9:22 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 16 February 2012, Kukjin Kim wrote:
>> Thanks for your sharing.
>>
>> OK, I and my team will follow up 'common struct clk' for exynos5250
>> and it will be done maybe next week. And since I need to
>> implement other features for exynos5250 now, firstly let me use this
>> and test this series in linux-next in a day.
>
> Ok, sounds good to me.
>
> If you like, you could also send the patches that you expect to stay
> stable for inclusion into arm-soc, or send the entire series as a
> preliminary branch that I will put into arm-soc now and then
> replace when you are done with the remaining changes.
>
> As we discussed last week at Linaro Connect, we will start taking
> both stable and unstable branches into arm-soc now, whereas we used
> to take only stable branches. Anything that is not considered stable
> yet will be marked as a staging branch, e.g. staging/samsung/soc instead
> of samsung/soc.
>
>> Ah, one more, would be better to us if arm-soc tree could provide
>> the topic branch for 'common struct clk' working as a base.
>
> Good point. Mike, can you send a pull request for whatever you have
> now as another staging branch for arm-soc?

Arnd, we discussed linux-next as the target for the common clk core
code at Linaro Connect.  Are you now asking for that code in arm-soc?
If so, I think it would be better to keep things simple only target
linux-next once V5 has hit the lists after ELC.

If you are instead referring to OMAP platform support for common clk,
that code is very infantile and not yet ready for arm-soc, especially
as it breaks OMAP2+ multi-boot.

Regards,
Mike
