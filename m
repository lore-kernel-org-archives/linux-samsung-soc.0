From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3] gpio: samsung: use pr_* instead of printk
Date: Tue, 23 Oct 2012 00:16:20 +0200
Message-ID: <CACRpkdZCH_bxviyz5Qqx0ttFFGW-CkJT6vCT3-JcOgQ5quK0kg@mail.gmail.com>
References: <002801cdac0a$11e4f340$35aed9c0$%han@samsung.com>
	<CACRpkdYx1HLF2==6DsPp+qC6Xyb7Ag8qa1K7g2Ht-Y2T-UjzMA@mail.gmail.com>
	<00a201cdaff0$d90a11a0$8b1e34e0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00a201cdaff0$d90a11a0$8b1e34e0$%han@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Ryan Mallon <rmallon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Oct 22, 2012 at 3:02 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Friday, October 19, 2012 7:09 PM Linus Walleij wrote
>>
>> On Wed, Oct 17, 2012 at 3:52 AM, Jingoo Han <jg1.han@samsung.com> wrote:
>>
>> > This patch uses pr_* instead of printk. Also, gpio_dbg
>> > is replaced with pr_debug.
>> >
>> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
>> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org> <- NAK
>>
>> Please consult Documentation/SubmittingPatches as to the conditions that
>> apply when you add Reviewed-by tags.
>
> Um, you already gave the Reviewed-by to the same patch, a month ago.
> Anyway, I will remove Reviewed-by and send v4 patch, soon.

My bad. I confused this mail thread for something else, sorry
for this. :-(

Please keep the Reviewed-tag if you want to!

Yours,
Linus Walleij (Now less confused)
