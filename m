From: Alexander Nestorov <alexandernst@gmail.com>
Subject: Re: [oselas] Audio support on Mini6410 board
Date: Tue, 15 Jan 2013 19:58:20 +0100
Message-ID: <CACuz9s0bZa0yKKkghKqFhSQ5YDX5YdwmmpXhmb3m9yKApWqPzQ@mail.gmail.com>
References: <CACuz9s2w28eVG8qS9FXkUYAggXn7y2deHi2fPGizcURu_Bp4wg@mail.gmail.com>
 <50F09720.7000102@gmail.com> <CACuz9s2fQYw-2pbE6dyNY7MiUSQxGiWArmXARxdwn1ULuDwm_Q@mail.gmail.com>
 <201301151030.11851.jbe@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:38744 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757500Ab3AOS7B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 13:59:01 -0500
Received: by mail-ob0-f181.google.com with SMTP id oi10so495593obb.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jan 2013 10:59:00 -0800 (PST)
In-Reply-To: <201301151030.11851.jbe@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Juergen Beisert <jbe@pengutronix.de>
Cc: oselas@community.pengutronix.de, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Andrey Gusakov <dron0gus@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>

Hi everyone :)



Juergen Beisert <jbe@pengutronix.de>:
> I gave your patches yesterday a try on my Mini6410: when I enable the audio
> support, the system freezes forever. Don't know why yet.
> What is the base revision where I have to apply the patches to? I tried with
> 3.7.2.

I'm using Sylwester's s3c-camif branch in v4l media[1], that is 3.7.0


Sylwester Nawrocki <sylvester.nawrocki@gmail.com>:
> Great news! ;) I guess you now have all required features working with
>latest mainline kernel ? Is there anything still missing ?

I'm still playing around with the board, trying to run my project on top of it.
Till now video works great (both video output and v4l2 src).
Audio is working great (both speakers and headphones), but I haven't tested
playing audio more than 10s (other than gst-launch audiotestsrc !
autoaudiosink).
Network (via eth) is working too.

I'm not sure if mic is working ok or failing. Can't say yet as there
is some kind of
audio input but it's really week and there's too much noise. I'll keep
playing with it
for a few more days.

The only thing I haven't really tested is the touch screen.
That's what I get if I try to run 'ts_test':
/dev/input/event1: No such file or directory
Also, if I start tapping at the screen, after ~10 taps I start getting
this on the console:
s3c_adc_start: failed to find adc

Anyways, during the boot I get:

s3c-adc s3c64xx-adc: operating without regulator "vdd" .
platform s3c64xx-adc: Driver s3c-adc requests probe deferral
samsung-ts s3c64xx-ts: driver attached, registering input device
input: S3C24XX TouchScreen as /devices/virtual/input/input0

So, why is ts_test trying to use input1 instead of input0?
Also, I'm missing some code related to vdd, right? Can't say if that's
critical or not...

If there is built-in support for this in the kernel, then there must
be something wrong (but small/easy to fix)
with my code. If there isn't, then I'll try diff-ing FriendlyARM's
kernel and an untouched one
and applying to your branch.

>This patch corrects smdk6410_b_pwr_5v_consumers[] compilation warning:

Yes indeed, it worked like a charm :)


>I know I asked you previously for preparing patches so others don't
>need to waste much time to enable all required features on those s3c64xx
>reference boards. But now when there is the device tree support for
>s3c64xx SoCs on the horizon

I'm fine with whatever fits better in the kernel :)
We can wait and see if my patches are needed or I can send them to you
now (or at any moment in the future),
you just need to say.


Regards!


[1] http://git.linuxtv.org/snawrocki/media.git/shortlog/refs/heads/testing/s3c-camif
