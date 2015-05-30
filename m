From: gabriel@unseen.is
Subject: exynos4412: Audio dies after one day on kernel 4.0
Date: Sat, 30 May 2015 19:32:37 +0200
Message-ID: <5569F435.5040708@unseen.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from outmail02.unseen.is ([82.221.107.197]:42178 "EHLO
	outmail02.unseen.is" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755677AbbE3RxK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 May 2015 13:53:10 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sylvester.nawrocki@gmail.com


Hello,

I've been successfully using a self compiled linux kernel until version
3.19 together with Debian Stretch.

After upgrading the kernel to version 4.0 I see strange messages in the
logs i.e.

May 27 22:44:01 pulseaudio[1027]: [alsa-sink-3830000.i2s-HiFi HiFi-0]
alsa-sink.c: ALSA woke us up to write new data to the device, but there
was actually nothing to write!
May 27 22:44:01 pulseaudio[1027]: [alsa-sink-3830000.i2s-HiFi HiFi-0]
alsa-sink.c: Most likely this is a bug in the ALSA driver
'snd_soc_simple_card'. Please report this issue to the ALSA developers.
May 27 22:44:01 pulseaudio[1027]: [alsa-sink-3830000.i2s-HiFi HiFi-0]
alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent
snd_pcm_avail() returned 0 or another value < min_avail.


I can easily play sound in perfect quality for approx the first 24h.
After that time the sound becomes distorted and is choppy/crackling.
After rebooting then the sound is optimal again.


I have tried to use kernel 4.0 with almost exactly the same
configuration than for 3.19 to no avail.

Then somebody on
http://forum.odroid.com/viewtopic.php?f=82&t=13281&p=91186 gave me the
hint that the followin patch might solve the issue:

https://github.com/prahal/linux/commit/5e60cfc9fa5101a346e29ef5f944fbbad300c72d


The patch did help something. I can now still play music after 2 days
but what happens is that each time I turn on music I get a choppy sound
for some time. That means the sound comes clear but every 2 seconds the
sound pauses for a fraction of a second. Which is somewhat comparable to
the issue earlier but without the heavy crackling - and that this goes
away after a couple of minutes.


But furthermore the sound has now simple cracklings. One in two second
approx. and they do not disappear.


Does anybody have an idea what could be the matter here?

Thanks in advance.

Gabriel
