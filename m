From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 10/14] exynos/fimg2d: remove default case from g2d_get_blend_op()
Date: Mon, 31 Aug 2015 19:53:05 +0100
Message-ID: <CACvgo52p=ymGzgjA5YHBmQbYEJ_Xowj40=a=2EindKnyoYPk2A@mail.gmail.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1440425649-9768-11-git-send-email-tjakobi@math.uni-bielefeld.de>
	<55E455D7.8060101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:33657 "EHLO
	mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752176AbbHaSxH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 14:53:07 -0400
Received: by iods203 with SMTP id s203so169091826iod.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Aug 2015 11:53:05 -0700 (PDT)
In-Reply-To: <55E455D7.8060101@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk

On 31 August 2015 at 14:25, Inki Dae <inki.dae@samsung.com> wrote:
> On 2015=EB=85=84 08=EC=9B=94 24=EC=9D=BC 23:14, Tobias Jakobi wrote:
>> We now validate the blending mode via g2d_validate_mode()
>> prior to feeding it to g2d_get_blend_op().
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  exynos/exynos_fimg2d.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
>> index 4274a94..d708e91 100644
>> --- a/exynos/exynos_fimg2d.c
>> +++ b/exynos/exynos_fimg2d.c
>> @@ -91,11 +91,6 @@ static unsigned int g2d_get_blend_op(enum e_g2d_o=
p op)
>>               SET_BF(val, G2D_COEFF_MODE_SRC_ALPHA, 0, 0, 0,
>>                               G2D_COEFF_MODE_SRC_ALPHA, 1, 0, 0);
>>               break;
>> -     default:
>> -             fprintf(stderr, "Not support operation(%d).\n", op);
>> -             SET_BF(val, G2D_COEFF_MODE_ONE, 0, 0, 0, G2D_COEFF_MOD=
E_ZERO,
>> -                             0, 0, 0);
>> -             break;
>
> With this, how about changing above switch and case statement to if
> statement?
>
Out of curiosity: why is if/else statement preferred - won't it make
things longer/harder to read (there are 11 cases here) ?

Cheers,
Emil
