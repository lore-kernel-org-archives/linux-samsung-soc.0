From: Andrey Gusakov <dron0gus@gmail.com>
Subject: Re: [oselas] Audio support on Mini6410 board
Date: Mon, 21 Jan 2013 10:32:38 +0300
Message-ID: <CAA11ShCKo0GEEBos-ZiPZ6j7jO8aKCNJZ1JGBWbUCtiUQqAXsg@mail.gmail.com>
References: <CACuz9s2w28eVG8qS9FXkUYAggXn7y2deHi2fPGizcURu_Bp4wg@mail.gmail.com>
	<50F09720.7000102@gmail.com>
	<CACuz9s2fQYw-2pbE6dyNY7MiUSQxGiWArmXARxdwn1ULuDwm_Q@mail.gmail.com>
	<201301151030.11851.jbe@pengutronix.de>
	<CACuz9s0bZa0yKKkghKqFhSQ5YDX5YdwmmpXhmb3m9yKApWqPzQ@mail.gmail.com>
	<CACuz9s0kscbt5Z87mOX6C=9vKg2wrU-T69RS6NQmeSRqP_8K4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:32895 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699Ab3AUHci (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 02:32:38 -0500
Received: by mail-pb0-f43.google.com with SMTP id jt11so1779150pbb.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Jan 2013 23:32:38 -0800 (PST)
In-Reply-To: <CACuz9s0kscbt5Z87mOX6C=9vKg2wrU-T69RS6NQmeSRqP_8K4w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Nestorov <alexandernst@gmail.com>
Cc: Juergen Beisert <jbe@pengutronix.de>, oselas@community.pengutronix.de, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi.

On Mon, Jan 21, 2013 at 12:46 AM, Alexander Nestorov
<alexandernst@gmail.com> wrote:
> Hi,
>
> I have been playing for a week with the board. Both audio and video
> work correctly, but I haven't
> been able to set the mic settings in alsamixer (so I can't test the mic).
> The touchscreen isn't working, so I'll try to make it working and send
> you some patches.
>
> Anyways, now there's another question/problem that I have. Video
> playback is really slow because
> I'm not using the device's cpu-decoder but rather doing everything in
> software mode.
>
> Is there support for hardware acceleration in the kernel for this
> device? Also, after talking with
> some people from #gstreamer they pointed me to a component[1] in
> gstreamer, but I'm not really
> sure how to I use it. Any ideas/experience with that?
Kernel that support MFC v1.0 is exist. But it is 2.6.28.
I am now experimenting with MFC on 6410, but it will take a long time
to bring to working condition.
I have just wrote code thats load MFC firmware, starts MFC and get SW version.
[1] is just plugin for Exynos version of MFC.

>
> Regards!
>
> [1] http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/tree/sys/mfc
>
> --
> alexandernst
