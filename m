From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V3] gpio: samsung: use pr_* instead of printk
Date: Mon, 22 Oct 2012 10:02:03 +0900
Message-ID: <00a201cdaff0$d90a11a0$8b1e34e0$%han@samsung.com>
References: <002801cdac0a$11e4f340$35aed9c0$%han@samsung.com>
 <CACRpkdYx1HLF2==6DsPp+qC6Xyb7Ag8qa1K7g2Ht-Y2T-UjzMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CACRpkdYx1HLF2==6DsPp+qC6Xyb7Ag8qa1K7g2Ht-Y2T-UjzMA@mail.gmail.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Ryan Mallon' <rmallon@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Friday, October 19, 2012 7:09 PM Linus Walleij wrote
> 
> On Wed, Oct 17, 2012 at 3:52 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> 
> > This patch uses pr_* instead of printk. Also, gpio_dbg
> > is replaced with pr_debug.
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org> <- NAK
> 
> Please consult Documentation/SubmittingPatches as to the conditions that
> apply when you add Reviewed-by tags.

Um, you already gave the Reviewed-by to the same patch, a month ago.
Anyway, I will remove Reviewed-by and send v4 patch, soon.

> 
> Hint: it doesn't mean "I know Linus looked at this patch".
> 
> Yours,
> Linus Walleij
