From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] pinctrl: samsung: Calculate GPIO base for
 pinctrl_add_gpio_range
Date: Tue, 21 Mar 2017 09:32:20 +0000
Message-ID: <20170321093220.GV6986@localhost.localdomain>
References: <20170228090143.GG2742@localhost.localdomain>
 <1488301475-10804-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <CA+Ln22HUK2NBV7=NCeJ3r1J2E5-C_5qc+i9Co5js9VamAXF04g@mail.gmail.com>
 <20170306164909.GA6986@localhost.localdomain>
 <20170320183915.r4bfl466yyph74i4@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170320183915.r4bfl466yyph74i4@kozik-lap>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Mar 20, 2017 at 08:39:15PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Mar 06, 2017 at 04:49:09PM +0000, Charles Keepax wrote:
> > On Sat, Mar 04, 2017 at 08:20:11PM +0900, Tomasz Figa wrote:
> > > Hi Charles,
> > > 
> > > 2017-03-01 2:04 GMT+09:00 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>:
> > > > As the pinctrl is now added before the GPIOs are registered we need to
> > > > manually calculate what the GPIO base will be, otherwise the base for
> > > > each gpio_range will be set to zero. Fortunately the driver
> > > > already assigns a GPIO base, in samsung_gpiolib_register, and uses the
> > > > same calculation it does for the pin_base. Meaning the two will always
> > > > be the same and allowing us to reuse the pinbase and avoid the issue.
> > > 
> > > Sorry, I didn't notice before and I don't see the offending patch in ,
> > > but you should add
> > > 
> > > Fixes: XXXXXXXXXXXX ("pinctrl: Patch subject")
> > > 
> > > if you intend to submit this patch separately. Otherwise, maybe this
> > > can be just squashed?
> > > 
> > 
> > Yeah apologies for that as the original patch hasn't showed up in
> > the tree yet I couldn't pull a commit ID to add the fixes tag.
> > Squashing it in is probably the best way to go.
> 
> Hi Charles,
> 
> Thanks for the work.
> 
> This is a follow up of:
> https://patchwork.kernel.org/patch/9577147/
> Right?
> 
> None of these two were applied so can you squash them, rebase, retest
> and send again?
> 

Yeah no problem should be able to resend later today hopefully.

Thanks,
Charles
