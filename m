From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 1/9] exynos: fimg2d: fix return codes
Date: Fri, 12 Jun 2015 18:21:13 +0200
Message-ID: <557B06F9.9060400@math.uni-bielefeld.de>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>	<1433943748-15849-2-git-send-email-tjakobi@math.uni-bielefeld.de> <CACvgo50-A71yG1vtyyow_tEcAe4cUnpNfsbh8hAPYskju5AdxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50725 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752713AbbFLQVV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 12:21:21 -0400
In-Reply-To: <CACvgo50-A71yG1vtyyow_tEcAe4cUnpNfsbh8hAPYskju5AdxQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk, Inki Dae <inki.dae@samsung.com>

Hello Emil,


Emil Velikov wrote:
> On 10 June 2015 at 14:42, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
>> Even if flushing the command buffer doesn't succeed, the
>> G2D calls would still return zero. Fix this by just passing
>> the flush return code.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  exynos/exynos_fimg2d.c | 20 +++++---------------
>>  1 file changed, 5 insertions(+), 15 deletions(-)
>>
>> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
>> index 86ae898..5ea42e6 100644
>> --- a/exynos/exynos_fimg2d.c
>> +++ b/exynos/exynos_fimg2d.c
>> @@ -330,9 +330,7 @@ g2d_solid_fill(struct g2d_context *ctx, struct g2d_image *img,
>>         bitblt.data.fast_solid_color_fill_en = 1;
>>         g2d_add_cmd(ctx, BITBLT_COMMAND_REG, bitblt.val);
>>
>> -       g2d_flush(ctx);
>> -
>> -       return 0;
>> +       return g2d_flush(ctx);
>>  }
>>
>>  /**
>> @@ -415,9 +413,7 @@ g2d_copy(struct g2d_context *ctx, struct g2d_image *src,
>>         rop4.data.unmasked_rop3 = G2D_ROP3_SRC;
>>         g2d_add_cmd(ctx, ROP4_REG, rop4.val);
>>
>> -       g2d_flush(ctx);
>> -
>> -       return 0;
>> +       return g2d_flush(ctx);
>>  }
>>
>>  /**
>> @@ -527,9 +523,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
>>         pt.data.y = dst_y + dst_h;
>>         g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
>>
>> -       g2d_flush(ctx);
>> -
>> -       return 0;
>> +       return g2d_flush(ctx);
>>  }
>>
>>  /**
>> @@ -636,9 +630,7 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
>>         pt.data.y = dst_y + h;
>>         g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
>>
>> -       g2d_flush(ctx);
>> -
>> -       return 0;
>> +       return g2d_flush(ctx);
>>  }
>>
>>  /**
>> @@ -766,7 +758,5 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
>>         pt.data.y = dst_y + dst_h;
>>         g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
>>
> Strictly speaking g2d_add_cmd() can fail, and all the functions that
> build upon it. In the latter case most ignore the return value which
> is a bit bad. That plus the fact that these are part of the public API
> makes things easier to misuse.
I'm totally aware of that. In fact I've already rewritten the error
checking logic. But that would be for a later series.

I prefer to do this in small steps, in particular because I see the
tendency that nobody from Samsung reviews the larger patches anyway. Or
any patches at all. And yes, I'm voicing my frustration here...



> One way to avoid all this is to implement an internal function that
> does the size checks ahead of time, and drop them from g2d_add_cmd(),
> apart from this patch.
I'm doing something different, which however results in more or less the
same thing.


> 
> The nouveau mesa drivers do a similar thing - see PUSH_SPACE().
> 
> -Emil
> 


With best wishes,
Tobias
