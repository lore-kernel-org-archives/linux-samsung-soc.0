From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Peach Pi/Pit boot failures in linux-next  (was Re: [RFC PATCH 1/1]
 drm/exynos: Move platform drivers registration to module init)
Date: Mon, 24 Nov 2014 11:13:21 +0100
Message-ID: <1416824001.5023.7.camel@AMDC1943>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
 <7hh9xwxsev.fsf@deeprootsystems.com> <546CCAB8.9050402@collabora.co.uk>
 <CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
 <7hppchsu29.fsf@deeprootsystems.com> <546E293D.9000300@collabora.co.uk>
 <7hbno1spdt.fsf@deeprootsystems.com> <546F3837.5020706@collabora.co.uk>
 <7hzjbko6eb.fsf@deeprootsystems.com> <546FA53D.2060807@collabora.co.uk>
 <547063C4.9030607@samsung.com> <5472FC7F.6090508@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:20249 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813AbaKXKN0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 05:13:26 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFJ0069FGJ30N20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 10:16:15 +0000 (GMT)
In-reply-to: <5472FC7F.6090508@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

On pon, 2014-11-24 at 10:38 +0100, Javier Martinez Canillas wrote:
> Hell Krzysztof,
> 
> On 11/22/2014 11:21 AM, Krzysztof Kozlowski wrote:
> >>
> >> By bisecting I found that the commit introducing both regressions is:
> >>
> >> ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
> >>
> >> By reverting ae43b32, next-20141121 boots with both CONFIG_SND_SOC_SNOW=y
> >> and *without* clk_ignore_unused.
> >>
> >> Krzysztof,
> >>
> >> I see you are the author of the patch, maybe you can take a look why this
> >> is causing regressions in some Exynos boards?
> > 
> > Oh crap... I'll look at it on Monday. However I don't have Peach Pi so any 
> > information would be useful. Can you post dmesg and your config? (is it 
> > exynos_defconfig?)
> >
> 
> Yes, I'm using exynos_defconfig. I'm testing with latest linux-next, HEAD:
> 
> commit ed6778a ("Add linux-next specific files for 20141121")
> 
> The boot log of the hang in the Exynos5420 Peach Pit is sent as an
> attachment. CONFIG_SND_SOC_SNOW was enabled and without clk_ignore_unused.
> 
> > Additionally can you boot the board with DMATEST enabled (without reverting 
> > my commit so probably with clk_ignore_unsed and with SND_SNOW disabled) and 
> > run dmatest on all channels? Something like:
> >    echo 2000 > /sys/module/dmatest/parameters/timeout
> >    echo 2 > /sys/module/dmatest/parameters/iterations
> >    for i in `ls /sys/class/dma/`
> >    do
> >      echo $i > /sys/module/dmatest/parameters/channel
> >      echo 1 > /sys/module/dmatest/parameters/run
> >    done
> > 
> > ... and post these results also.
> >
> 
> I'm attaching the log of the tests as well. To run the test
> CONFIG_SND_SOC_SNOW was disabled and booted with clk_ignore_unused.
>  
> > I will test it on Arndale Octa, maybe the cause is the same. Unfortunately 
> > it seems Arndale Octa does not have any sound enabled in DTS so it may be 
> > hard to test I2S bus (which is used by audio).
> >
> 
> Ok, please let me know if you need anything else from me.

Thanks! I replied before seeing your response. Anyway the dmatests are
the same I got on Arndale Octa.

It seems that mau_epll has to be enabled... or something is wrong with
clock hierarchy.

Best regards,
Krzysztof
