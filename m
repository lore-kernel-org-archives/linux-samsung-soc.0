From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] mfd: tps65090: Stop caching registers
Date: Wed, 16 Apr 2014 11:27:25 -0700
Message-ID: <CAD=FV=WRJgWVB4TjHa04JjH6XBbPf1-SeV5Y+QXo=uGU8FYKdw@mail.gmail.com>
References: <1397592876-5741-1-git-send-email-dianders@chromium.org>
	<1397592876-5741-3-git-send-email-dianders@chromium.org>
	<20140416095922.GG4754@lee--X1>
	<20140416101323.GP12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140416101323.GP12304@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Mark,

On Wed, Apr 16, 2014 at 3:13 AM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Apr 16, 2014 at 10:59:22AM +0100, Lee Jones wrote:
>
>> > NOTE: the IRQnMASK and CG_CTRLn registers are the exception and could
>> > be cached.  If we find that we spend a lot of time reading those we
>> > can turn on cache for just those registers.
>
>> > -static bool is_volatile_reg(struct device *dev, unsigned int reg)
>> > -{
>> > -   if ((reg == TPS65090_INT_STS) || (reg == TPS65090_INT_STS2))
>> > -           return true;
>> > -   else
>> > -           return false;
>> > -}
>> > -
>
>> I don't know enough about Regmap internals to know what this actually
>> affects in real terms.
>
>> Mark,
>>   Does this change seem sane to you?
>
> It does what it says, it stops us caching stuff.  It would seem better
> to do what the changelog suggests above and keep caching the registers
> that can be cached - especially the interrupt masks, they should get
> read in the interrupt path and that tends to be a bit latency sensitive.

Done
