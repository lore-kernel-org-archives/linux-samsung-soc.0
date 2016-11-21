From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: PM / devfreq: exynos-bus: need for suspend OPP?
Date: Mon, 21 Nov 2016 19:10:57 +0100
Message-ID: <3720389.YmyvQuOEbi@dell2.five-lan.de>
References: <5832F792.4010308@math.uni-bielefeld.de> <7d5d2c7c-6ebb-b4c1-5f3f-f794c249ca36@fivetechno.de> <58330FC8.5090606@math.uni-bielefeld.de>
Reply-To: m.reichl@fivetechno.de
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:36746 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752299AbcKUSLC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 13:11:02 -0500
Received: from dell2.five-lan.de (p5B22DF36.dip0.t-ipconnect.de [91.34.223.54])
        (authenticated bits=0)
        by linuxbbg.five-lan.de (8.14.9/8.14.5/SuSE Linux 0.8) with ESMTP id uALIAvlj013124
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Nov 2016 19:10:58 +0100
In-Reply-To: <58330FC8.5090606@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi Tobias,

Am Montag, 21. November 2016, 16:16:24 schrieb Tobias Jakobi:
> Hello Markus,
> 
> 
> Markus Reichl wrote:
> > Hi Tobias,
> > 
> > Am 21.11.2016 um 14:33 schrieb Tobias Jakobi:
> >> Hello everyone,
> >>
> >> I was thinking about the following. At the moment we have a suspend OPP
> >> for cpufreq-dt in place for the Exynos4412 SoC (added in
> >> 1605b60ad064c7019db8ade07f0b7bdc8c197b93). The rationale behind is that
> >> the board using the SoC might not have some PMIC reset in place. In case
> >> the board goes into reboot with a low OPP (i.e. low frequency, but also
> >> low core voltage), this results in a hang when the first-stage
> >> bootloaders sets its default core frequency.
> >>
> >> So this is properly handled in the kernel just fine, except for some
> >> corner cases like emergency reboot.
> >>
> >> But some time ago devfreq support for the various busses in the
> >> Exynos4412 was added. On the ODROID boards e.g. this adjust MIF and INT
> >> voltage.
> >>
> >> Let us take the DMC bus. Operating frequency is 100~400MHz and voltage
> >> is 900~1050mV.
> >>
> >> Now let's look at the corresponding board file
> >> (http://git.denx.de/?p=u-boot.git;a=blob;f=board/samsung/odroid/odroid.c#l234)
> >> in upstream u-boot. If I read this correctly DMC is set to 400MHz there.
> >>
> >> Here's the question. Could this, similar to the cpufreq/core frequency
> >> issue, pose a problem when the kernel goes into reboot when DMC is on
> >> the lowest OPP state?
> >>
> >> I'm not saying that it does. This just came to my mind during some
> >> recent discussion.
> > 
> > Made a test with
> > # echo performance > /sys/class/devfreq/bus_leftbus/governor 
> > # echo performance > /sys/class/devfreq/bus_dmc/governor 
> > just before reboot.
> > 
> > 20 out of 20 reboots worked.
> > 
> > With devfreq simple_ondemand governor around 50% reboots hung.
> thanks for the tests. I assume by 'reboots hung' you mean that the boot
> process doesn't even reach u-boot?

Yes, in these cases u-boot does not appear on the U3.

--
Markus
> 
> - Tobias
> 
> 
> > This could support your thoughts above.
> > 
> > Servus,
> > --
> > Markus
> >>
> >>
> >> With best wishes,
> >> Tobias
