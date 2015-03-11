From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [v3] libdrm: improvements to userspace exynos component
Date: Wed, 11 Mar 2015 18:56:46 +0000
Message-ID: <CACvgo50iT=fUbyt_ZtRDppudgcfNERrNLwvKvPhhGoHuaOqwWw@mail.gmail.com>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<550043C2.1050601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f45.google.com ([209.85.213.45]:39205 "EHLO
	mail-yh0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbbCKS4r convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 14:56:47 -0400
Received: by yhai57 with SMTP id i57so5534415yha.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Mar 2015 11:56:46 -0700 (PDT)
In-Reply-To: <550043C2.1050601@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>, jy0922.shim@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, Rob Clark <robclark@freedesktop.org>

On 11 March 2015 at 13:31, Inki Dae <inki.dae@samsung.com> wrote:
> Hi,
>
> On 2015=EB=85=84 02=EC=9B=94 24=EC=9D=BC 23:20, Tobias Jakobi wrote:
>> Hello,
>>
>> here are some miscellaneous improvements (small features, bugfixes, =
spelling fixes, etc.) for the exynos component of libdrm. The general i=
dea is to let userspace use the G2D engine functionality more
>> efficiently.
>>
>> If someone is interested in an application that actually makes use o=
f this, the RetroArch frontend has a custom video backend:
>> https://github.com/libretro/RetroArch/blob/master/gfx/drivers/exynos=
_gfx.c
>>
>>
>> Please review and let me know what I can improve.
>>
>> v2:
>> - Mention value of G2D scaling normalization factor (02/15).
>> - Moved patch (04/15) description from commit message to source itse=
lf, like suggested by Joonyoung Shim.
>>
>> v3:
>> I integrated the suggestions by Emil Velikov and added two additiona=
l patches to the series. One doing the header cleanup that Emil point o=
ut, another one just a trivial whitespace thing. I'm resending
>> the whole series, since number of patches and order changed.
>
Wohoo Inki's back !

> Looks good to me except for 14/17 patch. For the patch, I commented
> already, which may be very trivial but should be fixed correctly. I
> think Emil could fix it before merging it.
>
> To Emil,
> Could you please fix the patch 14/17 like below?,
>
> before
> -       /* Global Alpha : Set by ALPHA_REG(0x618) */
> +       /* Global Color : Set by ALPHA_REG(0x618) */
>
> after
> -       /* Global Alpha : Set by ALPHA_REG(0x618) */
> +       /* Global Color and Alpha: Set by ALPHA_REG(0x618) */
>
>
If you don't mind I'll leave this to Tobias as a follow up patch, as
the one you've looked at is already in master.

> for all patches - 1 though 17, Signed-off-by : Inki Dae
> <inki.dae@samsung.com>
>
I believe you mean Reviewed-by, isn't that right ?

Tobias,
Can you please re-spin the remaining patches on top of master, and
address Inki's comment.
Also please add Inki's and Joonyoung Shim's tags.

Thanks
Emil
