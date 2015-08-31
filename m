From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 07/14] exynos/fimg2d: add g2d_validate_xyz() functions
Date: Mon, 31 Aug 2015 19:45:12 +0100
Message-ID: <CACvgo53kHvk6RjXVBkDtAJ8CD36fQh0+iayLXgy9n9Dd-YTX1Q@mail.gmail.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1440425649-9768-8-git-send-email-tjakobi@math.uni-bielefeld.de>
	<55E45429.3070500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:35823 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754142AbbHaSpN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 14:45:13 -0400
Received: by igbut12 with SMTP id ut12so29707980igb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Aug 2015 11:45:12 -0700 (PDT)
In-Reply-To: <55E45429.3070500@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk

On 31 August 2015 at 14:18, Inki Dae <inki.dae@samsung.com> wrote:
> On 2015=EB=85=84 08=EC=9B=94 24=EC=9D=BC 23:14, Tobias Jakobi wrote:
>> The G2D headers define a number of modes through enums
>> (like e.g. color, select, repeat, etc.).
>>
>> This introduces g2d_validate_select_mode() and
>> g2d_validate_blending_op() which validate a
>> select mode or blending operation respectively.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  exynos/exynos_fimg2d.c | 44 +++++++++++++++++++++++++++++++++++++++=
+++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
>> index 2e04f4a..781aff5 100644
>> --- a/exynos/exynos_fimg2d.c
>> +++ b/exynos/exynos_fimg2d.c
>> @@ -119,6 +119,50 @@ static unsigned int g2d_check_space(const struc=
t g2d_context *ctx,
>>  }
>>
>>  /*
>> + * g2d_validate_select_mode - validate select mode.
>> + *
>> + * @mode: the mode to validate
>> + */
>> +static unsigned int g2d_validate_select_mode(
>> +     enum e_g2d_select_mode mode)
>> +{
>> +     switch (mode) {
>> +     case G2D_SELECT_MODE_NORMAL:
>> +     case G2D_SELECT_MODE_FGCOLOR:
>> +     case G2D_SELECT_MODE_BGCOLOR:
>> +             return 0;
>> +     }
>
> It's strange use a bit. Just check the range like below,
>
> First, please add G2D_SELECT_MODE_MAX which has 3 << 0, and
>
> if (G2D_SELECT_MODE_MAX < mode) {
>         fprintf(strerr, "invalid command(0x%x)\n", mode);
>         return -EINVAL;
> }
>
Listing every value might seem like an overkill, indeed. Yet I think
it's the more robust approach.

By adding _MAX to the API we effectively lock it down. That can be
avoided, plus the compiler will warn us when new values are added to
the enum. If someone starts getting smart (due to the _MAX) and adds
G2D_SELECT_MODE_FOO =3D -1, the above check will fail :(

> And I think it'd be better to change return type of this function to =
int,
>
Good idea.

Cheers,
Emil
