From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: How to get High resolution time in s3c6410
Date: Fri, 9 Dec 2011 03:56:00 +0000
Message-ID: <20111209035600.GB25601@sirena.org.uk>
References: <CANJvwR_NCHs0KfmhRrV6pfo_PW3kFJmEHqhdi1QEUi8xhRHiNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:38796 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836Ab1LID4B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Dec 2011 22:56:01 -0500
Content-Disposition: inline
In-Reply-To: <CANJvwR_NCHs0KfmhRrV6pfo_PW3kFJmEHqhdi1QEUi8xhRHiNg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sathishkumar Duraisamy <bewithsathish@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>

On Wed, Dec 07, 2011 at 05:51:05PM +0530, Sathishkumar Duraisamy wrote:

> Here I have to measure time elapsed between two events in
> microseconds. Currently in my working kernel 2.6.36.2, there is no
> support for high resolution timer and resolution of time is 10ms
> (jiffies) . Can you please help me to get high resolution timer? Or Do
> I have to use timer hardware ?

There''s an out of tree patch in the spica tree which adds a hrtimer
using the PWM hardware - see git://github.com/tom3q/spica-3.0
