From: Andrey Gusakov <dron0gus@gmail.com>
Subject: Re: [oselas] Audio support on Mini6410 board
Date: Mon, 21 Jan 2013 12:01:52 +0300
Message-ID: <CAA11ShDet7jFvUtjrqG6pOCc_W0ePtfK+mvyUjP-8CKdwjrnag@mail.gmail.com>
References: <CACuz9s2w28eVG8qS9FXkUYAggXn7y2deHi2fPGizcURu_Bp4wg@mail.gmail.com>
	<50F09720.7000102@gmail.com>
	<CACuz9s2fQYw-2pbE6dyNY7MiUSQxGiWArmXARxdwn1ULuDwm_Q@mail.gmail.com>
	<201301151030.11851.jbe@pengutronix.de>
	<CACuz9s0bZa0yKKkghKqFhSQ5YDX5YdwmmpXhmb3m9yKApWqPzQ@mail.gmail.com>
	<CACuz9s0kscbt5Z87mOX6C=9vKg2wrU-T69RS6NQmeSRqP_8K4w@mail.gmail.com>
	<CAA11ShCKo0GEEBos-ZiPZ6j7jO8aKCNJZ1JGBWbUCtiUQqAXsg@mail.gmail.com>
	<CACuz9s0mUHjDiS-K_zvnn7UYC7ws6WV86=3oSYXms8gmF9y-bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f43.google.com ([209.85.210.43]:45361 "EHLO
	mail-da0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752329Ab3AUJBx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 04:01:53 -0500
Received: by mail-da0-f43.google.com with SMTP id u36so2629365dak.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jan 2013 01:01:52 -0800 (PST)
In-Reply-To: <CACuz9s0mUHjDiS-K_zvnn7UYC7ws6WV86=3oSYXms8gmF9y-bw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Nestorov <alexandernst@gmail.com>
Cc: Juergen Beisert <jbe@pengutronix.de>, oselas@community.pengutronix.de, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi.

On Mon, Jan 21, 2013 at 12:07 PM, Alexander Nestorov
<alexandernst@gmail.com> wrote:
> Hi,
>
> I see. Maybe you already saw it, but just in case, I found this[1] I
> hope it helps.
Thanks. It s looks like code from 2.6.28, I'll take a closer look.

> Do you plan sharing your code in GitHub or equivalent? I'm working on
> that board too
> and I'll probably have to make my software use hw acceleration.
Yes, I'll share it as soon as get it work or at least compile without
errors. Now it looks like mix of code from 2.6.28, s5p-mfc code and
documentation quotes.
