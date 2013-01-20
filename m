From: Alexander Nestorov <alexandernst@gmail.com>
Subject: Re: [oselas] Audio support on Mini6410 board
Date: Sun, 20 Jan 2013 21:46:18 +0100
Message-ID: <CACuz9s0kscbt5Z87mOX6C=9vKg2wrU-T69RS6NQmeSRqP_8K4w@mail.gmail.com>
References: <CACuz9s2w28eVG8qS9FXkUYAggXn7y2deHi2fPGizcURu_Bp4wg@mail.gmail.com>
 <50F09720.7000102@gmail.com> <CACuz9s2fQYw-2pbE6dyNY7MiUSQxGiWArmXARxdwn1ULuDwm_Q@mail.gmail.com>
 <201301151030.11851.jbe@pengutronix.de> <CACuz9s0bZa0yKKkghKqFhSQ5YDX5YdwmmpXhmb3m9yKApWqPzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:50141 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752474Ab3ATUrA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Jan 2013 15:47:00 -0500
Received: by mail-oa0-f50.google.com with SMTP id n16so5438708oag.37
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Jan 2013 12:46:59 -0800 (PST)
In-Reply-To: <CACuz9s0bZa0yKKkghKqFhSQ5YDX5YdwmmpXhmb3m9yKApWqPzQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Juergen Beisert <jbe@pengutronix.de>
Cc: oselas@community.pengutronix.de, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Andrey Gusakov <dron0gus@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>

Hi,

I have been playing for a week with the board. Both audio and video
work correctly, but I haven't
been able to set the mic settings in alsamixer (so I can't test the mic).
The touchscreen isn't working, so I'll try to make it working and send
you some patches.

Anyways, now there's another question/problem that I have. Video
playback is really slow because
I'm not using the device's cpu-decoder but rather doing everything in
software mode.

Is there support for hardware acceleration in the kernel for this
device? Also, after talking with
some people from #gstreamer they pointed me to a component[1] in
gstreamer, but I'm not really
sure how to I use it. Any ideas/experience with that?

Regards!

[1] http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/tree/sys/mfc

-- 
alexandernst
