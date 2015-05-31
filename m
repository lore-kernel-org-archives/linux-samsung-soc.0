From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: exynos4412: Audio dies after one day on kernel 4.0
Date: Sun, 31 May 2015 15:47:18 +0900
Message-ID: <CAJKOXPfV2HRMeVhT5uRO5An3pqALWBLBxX2wzP=WxN+eu4dr2A@mail.gmail.com>
References: <5569F435.5040708@unseen.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f53.google.com ([209.85.216.53]:46091 "EHLO
	mail-vn0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758134AbbEaGrT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 May 2015 02:47:19 -0400
In-Reply-To: <5569F435.5040708@unseen.is>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: gabriel@unseen.is
Cc: linux-samsung-soc@vger.kernel.org, sylvester.nawrocki@gmail.com, Robert Baldyga <r.baldyga@samsung.com>, dmaengine@vger.kernel.org

2015-05-31 2:32 GMT+09:00  <gabriel@unseen.is>:
>
> Hello,
>
> I've been successfully using a self compiled linux kernel until version
> 3.19 together with Debian Stretch.
>
> After upgrading the kernel to version 4.0 I see strange messages in the
> logs i.e.
>
> May 27 22:44:01 pulseaudio[1027]: [alsa-sink-3830000.i2s-HiFi HiFi-0]
> alsa-sink.c: ALSA woke us up to write new data to the device, but there
> was actually nothing to write!
> May 27 22:44:01 pulseaudio[1027]: [alsa-sink-3830000.i2s-HiFi HiFi-0]
> alsa-sink.c: Most likely this is a bug in the ALSA driver
> 'snd_soc_simple_card'. Please report this issue to the ALSA developers.
> May 27 22:44:01 pulseaudio[1027]: [alsa-sink-3830000.i2s-HiFi HiFi-0]
> alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent
> snd_pcm_avail() returned 0 or another value < min_avail.
>
>
> I can easily play sound in perfect quality for approx the first 24h.
> After that time the sound becomes distorted and is choppy/crackling.
> After rebooting then the sound is optimal again.
>
>
> I have tried to use kernel 4.0 with almost exactly the same
> configuration than for 3.19 to no avail.
>
> Then somebody on
> http://forum.odroid.com/viewtopic.php?f=82&t=13281&p=91186 gave me the
> hint that the followin patch might solve the issue:
>
> https://github.com/prahal/linux/commit/5e60cfc9fa5101a346e29ef5f944fbbad300c72d
>
>
> The patch did help something. I can now still play music after 2 days
> but what happens is that each time I turn on music I get a choppy sound
> for some time. That means the sound comes clear but every 2 seconds the
> sound pauses for a fraction of a second. Which is somewhat comparable to
> the issue earlier but without the heavy crackling - and that this goes
> away after a couple of minutes.
>
>
> But furthermore the sound has now simple cracklings. One in two second
> approx. and they do not disappear.
>
>
> Does anybody have an idea what could be the matter here?
>
> Thanks in advance.

+Cc Robert, dmaengine list.

Bisecting would be helpful. You could also try reverting following commits:
88987d2c75
aee4d1fac8

Other possible test case would be disabling runtime PM for pl330 DMA driver:

for i in /sys/bus/amba/drivers/dma-pl330/*.[amp]dma/power ; do
  echo "on" > ${i}/control
done

Best regards,
Krzysztof
