From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung devel for v3.3
Date: Sun, 8 Jan 2012 18:03:08 -0800
Message-ID: <CAOesGMj5OJUy8KUMH5vtrwjnpk4nOyqF3bq+jmS1OVyYz=kzqg@mail.gmail.com>
References: <018801ccca70$25f01260$71d03720$%kim@samsung.com>
	<CAOesGMhLE3wxM=F9OkHT-bQpsVp8Uc6eE8Uk+WN9pLuz5BRLBw@mail.gmail.com>
	<20120108204953.GA20043@sirena.org.uk>
	<CAOesGMjn5uQEWbxrJryC+jOf=3SYbAnPY4A71NUZKFBi=a0QjA@mail.gmail.com>
	<01a301ccce6f$9bb51790$d31f46b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:47939 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755251Ab2AICDJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Jan 2012 21:03:09 -0500
Received: by ggdk6 with SMTP id k6so1380338ggd.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Jan 2012 18:03:08 -0800 (PST)
In-Reply-To: <01a301ccce6f$9bb51790$d31f46b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Sun, Jan 8, 2012 at 5:40 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Olof Johansson wrote:
>>
>> On Sun, Jan 8, 2012 at 12:49 PM, Mark Brown
>> <broonie@opensource.wolfsonmicro.com> wrote:
>> > On Fri, Jan 06, 2012 at 01:58:29PM -0800, Olof Johansson wrote:
>> >
>> >> > Please pull Samsung devel for v3.3 from:
>> >> > ?git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> >> > next-samsung-devel-samsung
>> >
>> >> Thanks. I've pulled this into late/devel, based on earlier email from
>> >> Arnd we might end up sending this in towards the end of the merge
>> >> window, but there's also a chance it will wait for 3.4.
>> >
>> > That'd be extremely disappointing, especially given that there's some
>> > bug fixes in there for updates going in this merge window without which
>> > mainline is going to have problems on s3c64xx (mostly the GPIO stuff).
>>
>> Of course bug fixes should go in.
>>
>> Mark, Kukjin, can either of you split out the fixes in a separate branch?
>>
> Hi Olof,
>
> In my opinion, as you know, it would be better to us if you could send this in this merge window.
> Actually, it does not have any dependency with others, in addition, for a long time this has been included in linux-next for this
> merge window.
> If this can be missed from sending list to Linus, please kindly let me know. Let me send this to Linus at the end of this merge
> window.

We've been pretty clear on this: Everything that came in after Arnd's
email (that wasn't obvious fixes) would be queued as late/* and, if
there is time, go in towards the end of the merge window. There's
plenty of time left in the window so right now it looks likely to
happen, especially since the branch lacks dependencies and applies
relatively cleanly.


-Olof
