From: Panchaxari Prasannamurthy Tumkur
	<panchaxari.prasannamurthy@linaro.org>
Subject: Re: [PATCH CFT] ARM:S5P64X0: Enable ARM_PATCH_PHYS_VIRT and
 AUTO_ZRELADDR by default
Date: Thu, 12 Dec 2013 16:33:46 +0530
Message-ID: <CAAunhULO5n3rf5_Q+HwExd=kadsPC_rTz9oP8kXKM7krBetbdQ@mail.gmail.com>
References: <1386825152-398-1-git-send-email-panchaxari.prasannamurthy@linaro.org>
	<26167386.hX5eWUjT6T@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <26167386.hX5eWUjT6T@flatron>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kgene Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz

> Could you explain the purpose of this change on S5P64x0?
>
> This is actually quite a poor platform choice. As of today, the kernel
> is stuck with supporting just SMDK6440/6450 boards, which are proprietary
> development boards and it doesn't look like any further boards will show
> up in future. Kukjin has actually proposed removing support for this
> platform at all and I consider this reasonable.
>
> Kukjin, should we proceed with removal?

The purpose of this patch is with the greater intent of consolidating
ARM-32 kernel. Which means a generic kernel for ARM-32 processors.

Hence these platform supported configs are introduced as default for
that particular platform.

I hope i answered your question. Else please mail me with further queries.

thanks
Panchaxari
