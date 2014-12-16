From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH/RFC 00/14] ASoC: samsung: Add clk provider
 for I2S internal clocks
Date: Tue, 16 Dec 2014 08:46:32 +0530
Message-ID: <CAAgF-BfY_28PpgChfB-7vEF5z9ETmXJUKGuBYhmAC-CxbFedqA@mail.gmail.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f178.google.com ([209.85.160.178]:46500 "EHLO
	mail-yk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722AbaLPDQd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Dec 2014 22:16:33 -0500
Received: by mail-yk0-f178.google.com with SMTP id 20so5533182yks.37
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Dec 2014 19:16:32 -0800 (PST)
In-Reply-To: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, broonie@kernel.org, drake@endlessm.com, padma.v@samsung.com

Hi Sylwester,

> I need some more thought about interaction between the clk API calls on the
> clocks being exposed and the ASoC calls into sound/soc/samsung/i2s.c.
> I'm sending teh patches for review though to avoid any waste of time should
> it turn out the direction taken is wrong.
>
> This whole series definitely needs more testing, so far I only tested it
> on Odroid X2, with the I2S working in slave mode.

your patches looks good to me. I did basic playback and capture test
of your patches with i2s in master mode on exynos7.  I also added
secondary dai for testing and verified playback. But I think some more
testing required to check the serialization of registers. Tried aplay
with front dai in background and with secondary dai in the foreground.
But due to one issue on my system backend playback not working.

Thanks
Padma

>
> [1]
> http://mailman.alsa-project.org/pipermail/alsa-devel/2014-September/081753.html
