From: Sathishkumar Duraisamy <bewithsathish@gmail.com>
Subject: Re: How to get High resolution time in s3c6410
Date: Fri, 9 Dec 2011 10:59:52 +0530
Message-ID: <CANJvwR_0LKEJAFkfwjsgeQKq9sars3f+1L58L9FyNuo+R9cgVA@mail.gmail.com>
References: <CANJvwR_NCHs0KfmhRrV6pfo_PW3kFJmEHqhdi1QEUi8xhRHiNg@mail.gmail.com>
	<20111209035600.GB25601@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:50109 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750792Ab1LIF3x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Dec 2011 00:29:53 -0500
Received: by dadw7 with SMTP id w7so133707dad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Dec 2011 21:29:52 -0800 (PST)
In-Reply-To: <20111209035600.GB25601@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>

On Fri, Dec 9, 2011 at 9:26 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Dec 07, 2011 at 05:51:05PM +0530, Sathishkumar Duraisamy wrote:
>
>> Here I have to measure time elapsed between two events in
>> microseconds. Currently in my working kernel 2.6.36.2, there is no
>> support for high resolution timer and resolution of time is 10ms
>> (jiffies) . Can you please help me to get high resolution timer? Or Do
>> I have to use timer hardware ?
>
> There''s an out of tree patch in the spica tree which adds a hrtimer
> using the PWM hardware - see git://github.com/tom3q/spica-3.0

Thanks Mark Brown for timely help. I have been looking in this branch.

-- 
Regards,
Sathishkumar D
http://flowersopenlab.weebly.com/
