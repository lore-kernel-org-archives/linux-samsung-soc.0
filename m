From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 4/4] PM / Domains: Let the ->attach_dev() callback return an error code
Date: Wed, 29 Oct 2014 14:10:17 -0700
Message-ID: <7h1tpq7fba.fsf@deeprootsystems.com>
References: <1414507090-516-1-git-send-email-ulf.hansson@linaro.org>
	<1414507090-516-5-git-send-email-ulf.hansson@linaro.org>
	<CAMuHMdVn2mfk5v8MQshU0gko+dL9xtCT_zBuqyntHHrmxjwfSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVn2mfk5v8MQshU0gko+dL9xtCT_zBuqyntHHrmxjwfSA@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 28 Oct 2014 21:31:35 +0100")
Sender: linux-pm-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Linux PM list <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <tomasz.figa@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Philipp Zabel <philipp.zabel@gmail.com>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Russell King <linux@arm.linux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jack Dai <jack.dai@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Ulf, Rafael,
>
> On Tue, Oct 28, 2014 at 3:38 PM, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>> Typically an ->attach_dev() callback would fetch some PM resourses.
>>
>> Those operations, like for example clk_get() may fail with different
>> errors, including -EPROBE_DEFER. Instead of ignoring these errors and
>> potentially only print an error message, let's propagate them to give
>> callers the option to handle them.
>>
>> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Given that several patch series using ->attach_dev() are already floating
> around and will be in -next soon, what is the plan of getting this in?

Shall we take this as a Reviewed-by or Acked-by for the series?  :)

> Doing it ASAP (in v3.18-rc3)?

IMO, this isn't at all appropriate for -rc since it's not fixing a
regression. Also, this series includes other cleanups that are not
really fixes either.  At this point of the -rc cycle, we need to focus
only on regression fixes.

> Delaying this to v3.19-rc2, which will require an atomic fixing of its users?
> Any other option?

I don't see any users of this in -next yet, so I think doing a simple
patch to the prototype and fixing up any users before they hit -next is
the right approach.  Errors will be ignored, but that's not change from
today. :)

Then the rest of this cleanup and behavior change stuff can continue to
be reviewed and get broader testing before merge.

Kevin
