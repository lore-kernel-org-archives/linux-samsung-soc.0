From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 1/3] pinctrl: samsung: clean up modular vs. non-modular
 distinctions
Date: Tue, 23 May 2017 11:54:44 -0400
Message-ID: <20170523155444.GE11504@windriver.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com>
 <20170522205648.23545-2-paul.gortmaker@windriver.com>
 <CAJKOXPcJDFw2-EW+dGvL1AtVwXWkxAQ6cnF0o6GGgaaxeqBqug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPcJDFw2-EW+dGvL1AtVwXWkxAQ6cnF0o6GGgaaxeqBqug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

[Re: [PATCH 1/3] pinctrl: samsung: clean up modular vs. non-modular distinctions] On 23/05/2017 (Tue 16:51) Krzysztof Kozlowski wrote:

> On Mon, May 22, 2017 at 10:56 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
> > Fixups here tend to be more all over the map vs. some of the other
> > repeated/systematic ones we've seen elsewhere.
> >
> > We remove module.h from code that isn't doing anything modular at
> > all;  if they have __init sections, then replace it with init.h
> >
> > A couple drivers have module_exit() code that is essentially orphaned,
> > and so we remove that.
> >
> > There are no module_init replacements, so we have no concerns wrt.
> > initcall ordering changes as per some of the other cleanups.
> >
> > Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> >
> > We also delete the MODULE_LICENSE tag etc. since all that information
> > was (or is now) contained at the top of the file in the comments.
> >
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Thomas Abraham <thomas.ab@samsung.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> > Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> These are quite old entries of maintainers. I guess you add Cc-entries
> once per git commit but no problem - I have it from the lists.

Actually what happend is it got sent quite some time ago, but Linus
didn't merge it because he wanted some Acks[1] and a resend.  Shortly
after Sylwester provided an ack.

So with that in mind, I decided to restart with the most simple pinctrl
patches 1st, and hence it took a while to finally get back to this one
in the final series.  But I didn't want to change an ack'd patch.

Not that it matters, but just in case you were curious.

Thanks,
Paul.

[1] https://marc.info/?l=linux-kernel&m=145803185919692&w=2

> 
> Thanks, applied.
> 
> Best regards, Krzysztof
