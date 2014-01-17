From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] tty: Fallback to use dynamic major number
Date: Fri, 17 Jan 2014 14:54:45 +0530
Message-ID: <CAHbNUh0dV_MWCUh=6yYQ3FzV69O3=j4QpMFsnjxTqJphSyHzXA@mail.gmail.com>
References: <1389848602-30985-1-git-send-email-tushar.behera@linaro.org>
	<20140116161841.GA7476@kroah.com>
	<20140116170814.GI17314@sirena.org.uk>
	<20140116172240.GB9587@kroah.com>
	<20140116181520.GL17314@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140116181520.GL17314@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, lkml <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, jslaby <jslaby@suse.cz>
List-Id: linux-samsung-soc@vger.kernel.org

On 16 January 2014 23:45, Mark Brown <broonie@kernel.org> wrote:
> On Thu, Jan 16, 2014 at 09:22:40AM -0800, Greg KH wrote:
>> On Thu, Jan 16, 2014 at 05:08:14PM +0000, Mark Brown wrote:
>
>> > No, the issue is happening because the drivers are registering things
>> > at module load time and not at device instantiation time.
>
>> That's a driver bug that could easily be fixed, instead of hacking up
>> the tty core :)
>
> Looking at the code it really, really looked intentional - in any case
> that seems worthwhile, Tushar this looks like a way forwards?
>

Ok. I will prepare a patch with this approach for amba-pl011 and
samsung-uart drivers. If that works well, I will extend that to other
serial drivers.

Thanks to both of you for your time.
-- 
Tushar Behera
