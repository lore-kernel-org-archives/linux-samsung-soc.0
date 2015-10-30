From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 08/13] exynos: fimg2d: add g2d_set_direction
Date: Fri, 30 Oct 2015 18:14:23 +0100
Message-ID: <5633A56F.2070302@math.uni-bielefeld.de>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442937302-8211-9-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20151030161401.3e2d327c@hwh-ubuntu> <563351E0.3050108@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:58491 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750835AbbJ3ROZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 13:14:25 -0400
In-Reply-To: <563351E0.3050108@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Hyungwon Hwang <human.hwang@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Tobias Jakobi wrote:
> Hello Hyungwon,
> 
> 
> Hyungwon Hwang wrote:
>> On Tue, 22 Sep 2015 17:54:57 +0200
>> Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
>>
>>> This allows setting the two direction registers, which specify how
>>> the engine blits pixels. This can be used for overlapping blits,
>>> which happen e.g. when 'moving' a rectangular region inside a
>>> fixed buffer.
>>
>> Code itself looks good. But as I know, direction registers are related
>> with flip, not moving. Isn't it? I am not that much familiar with G2D.
>> Please let me know if I am wrong.
> that's correct, you can use the direction registers to implement
> flipping operations.
> 
> However what they really do is to change the operation direction of the
> G2D engine. So you can manage how the engine traverses through pixel
> rows and column (either in forward or in backward direction).
> 
> Normally this doesn't matter, like it doesn't matter if you memcpy()
> from one buffer to another when there is no intersection of the buffers.
> However if the two buffers overlap then you have to be careful with the
> direction in which you traverse the buffer.
> 
> Now if you set the x-direction of the source G2D image to forward, but
> the x-direction of the destination to backward, you get your mentioned
> x-flipping.
> 
> The main purpose for g2d_move() is to be used e.g. in acceleration code
> for the armsoc Xorg DDX. A common operation there is not move pixel
> regions around in the same buffer.
Sorry, this should read "...there is to move pixel regions...".


- Tobias

> 
> 
> With best wishes,
> Tobias
> 
> 
> P.S.: I think the Exynos user manual mentions flipping as one example on
> how to use these registers. But like I said above, it's just one way to
> use it.
> 
> 
> 
> 
>>
>> Best regards,
>> Hyungwon Hwang
>>
>>>
>>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>> ---
>>>  exynos/exynos_fimg2d.c | 13 +++++++++++++
>>>  exynos/exynos_fimg2d.h | 38 ++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 51 insertions(+)
>>>
>>> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
>>> index e997d4b..4d5419c 100644
>>> --- a/exynos/exynos_fimg2d.c
>>> +++ b/exynos/exynos_fimg2d.c
>>> @@ -242,6 +242,19 @@ static void g2d_add_base_addr(struct g2d_context
>>> *ctx, struct g2d_image *img, }
>>>  
>>>  /*
>>> + * g2d_set_direction - setup direction register (useful for
>>> overlapping blits).
>>> + *
>>> + * @ctx: a pointer to g2d_context structure.
>>> + * @dir: a pointer to the g2d_direction_val structure.
>>> + */
>>> +static void g2d_set_direction(struct g2d_context *ctx,
>>> +			const union g2d_direction_val *dir)
>>> +{
>>> +	g2d_add_cmd(ctx, SRC_MASK_DIRECT_REG, dir->val[0]);
>>> +	g2d_add_cmd(ctx, DST_PAT_DIRECT_REG, dir->val[1]);
>>> +}
>>> +
>>> +/*
>>>   * g2d_reset - reset fimg2d hardware.
>>>   *
>>>   * @ctx: a pointer to g2d_context structure.
>>> diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
>>> index c6b58ac..9eee7c0 100644
>>> --- a/exynos/exynos_fimg2d.h
>>> +++ b/exynos/exynos_fimg2d.h
>>> @@ -189,6 +189,11 @@ enum e_g2d_exec_flag {
>>>  	G2D_EXEC_FLAG_ASYNC = (1 << 0)
>>>  };
>>>  
>>> +enum e_g2d_dir_mode {
>>> +	G2D_DIR_MODE_POSITIVE = 0,
>>> +	G2D_DIR_MODE_NEGATIVE = 1
>>> +};
>>> +
>>>  union g2d_point_val {
>>>  	unsigned int val;
>>>  	struct {
>>> @@ -269,6 +274,39 @@ union g2d_blend_func_val {
>>>  	} data;
>>>  };
>>>  
>>> +union g2d_direction_val {
>>> +	unsigned int val[2];
>>> +	struct {
>>> +		/* SRC_MSK_DIRECT_REG [0:1] (source) */
>>> +		enum e_g2d_dir_mode		src_x_direction:1;
>>> +		enum e_g2d_dir_mode		src_y_direction:1;
>>> +
>>> +		/* SRC_MSK_DIRECT_REG [2:3] */
>>> +		unsigned int			reversed1:2;
>>> +
>>> +		/* SRC_MSK_DIRECT_REG [4:5] (mask) */
>>> +		enum e_g2d_dir_mode
>>> mask_x_direction:1;
>>> +		enum e_g2d_dir_mode
>>> mask_y_direction:1; +
>>> +		/* SRC_MSK_DIRECT_REG [6:31] */
>>> +		unsigned int			padding1:26;
>>> +
>>> +		/* DST_PAT_DIRECT_REG [0:1] (destination) */
>>> +		enum e_g2d_dir_mode		dst_x_direction:1;
>>> +		enum e_g2d_dir_mode		dst_y_direction:1;
>>> +
>>> +		/* DST_PAT_DIRECT_REG [2:3] */
>>> +		unsigned int			reversed2:2;
>>> +
>>> +		/* DST_PAT_DIRECT_REG [4:5] (pattern) */
>>> +		enum e_g2d_dir_mode		pat_x_direction:1;
>>> +		enum e_g2d_dir_mode		pat_y_direction:1;
>>> +
>>> +		/* DST_PAT_DIRECT_REG [6:31] */
>>> +		unsigned int			padding2:26;
>>> +	} data;
>>> +};
>>> +
>>>  struct g2d_image {
>>>  	enum e_g2d_select_mode		select_mode;
>>>  	enum e_g2d_color_mode		color_mode;
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
