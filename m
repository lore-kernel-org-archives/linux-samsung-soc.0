From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: [PATCH v2 03/11] ARM: EXYNOS: add clock part for EXYNOS5250 SoC
Date: Thu, 16 Feb 2012 10:38:36 -0800
Message-ID: <CAJOA=zOERYdm8_kGRjHrQExaHVPE-0=iJC3e75pPWEeffAZmcQ@mail.gmail.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
 <201202160522.35249.arnd@arndb.de> <CAJOA=zPujvu0WNmn8UPa4NogJ1w6UqEg-RDNEcnfBZQW3SS+eQ@mail.gmail.com>
 <201202160550.42192.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog114.obsmtp.com ([74.125.149.211]:54662 "EHLO
	na3sys009aog114.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754322Ab2BPSi6 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 13:38:58 -0500
Received: by mail-gx0-f176.google.com with SMTP id r5so1850349ggn.35
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2012 10:38:57 -0800 (PST)
In-Reply-To: <201202160550.42192.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kyungmin Park <kmpark@infradead.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, olof@lixom.net, linux-arm-kernel@lists.infradead.org, jhbird.choi@samsung.com

On Wed, Feb 15, 2012 at 9:50 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 16 February 2012, Turquette, Mike wrote:
>> >
>> >> Ah, one more, would be better to us if arm-soc tree could provide
>> >> the topic branch for 'common struct clk' working as a base.
>> >
>> > Good point. Mike, can you send a pull request for whatever you hav=
e
>> > now as another staging branch for arm-soc?
>>
>> Arnd, we discussed linux-next as the target for the common clk core
>> code at Linaro Connect. =A0Are you now asking for that code in arm-s=
oc?
>> If so, I think it would be better to keep things simple only target
>> linux-next once V5 has hit the lists after ELC.
>
> I guess waiting for you to send out v5 is a good idea, but as Kgene
> mentioned it would be nice to have the series in arm-soc in order
> to base other branches on top of it, and we have now made it possible
> to update branches like this one by declaring them "staging".
>
> The main advantage that I see of putting your series into arm-soc
> is that I can handle the dependencies: If you want to update the
> series based to v6 after more review and send me a replacement pull
> request, I can rebase the exynos5 patches (and other conversions)
> on top of that. If you have a different tree in linux-next and plan
> to rebase it, I cannot take any other patches into arm-soc that depen=
d
> on yours.

Per our conversation at ELC, we can host in arm-soc to make it easier
for folks to port.  But the code should likely be merged through
Russell once we have the final version.

Regards,
Mike

> The alternative would be that I take the exynos5 patches in their
> current shape into arm-soc and you put your patches into linux-next
> based on the branch that I have, and with a patch to convert exynos5
> to it on top.
>
>> If you are instead referring to OMAP platform support for common clk=
,
>> that code is very infantile and not yet ready for arm-soc, especiall=
y
>> as it breaks OMAP2+ multi-boot.
>
> I did not mean the omap specific parts.
>
> =A0 =A0 =A0 =A0Arnd
