From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/exynos: dp: remove suspend/resume functions
Date: Wed, 30 Sep 2015 15:36:57 +0100
Message-ID: <CACvgo527KL-Ub68XHMynVbQ-SL=HxGfeMdooqcg_rHNaXT2JFg@mail.gmail.com>
References: <1443612079-28094-1-git-send-email-inki.dae@samsung.com>
	<CACvgo52GwALBN1Tw_WXntbC6+QJRDrjM7EAFbYtC+VG5OZm9yA@mail.gmail.com>
	<560BE79C.6040903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:35702 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752179AbbI3Og5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 10:36:57 -0400
Received: by igbkq10 with SMTP id kq10so102972147igb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2015 07:36:57 -0700 (PDT)
In-Reply-To: <560BE79C.6040903@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, jg1.han@samsung.com, ML dri-devel <dri-devel@lists.freedesktop.org>

On 30 September 2015 at 14:46, Inki Dae <inki.dae@samsung.com> wrote:
> Hi Emil,
>
> On 2015=EB=85=84 09=EC=9B=94 30=EC=9D=BC 21:19, Emil Velikov wrote:
>> Hi Inki,
>>
>> On 30 September 2015 at 12:21, Inki Dae <inki.dae@samsung.com> wrote=
:
>>> This patch removes unnecessary pm suspend/resume functions.
>>>
>>> All kms sub drivers will be controlled by top of Exynos drm driver
>>> and connector dpms so these sub drivers shouldn't have their own
>>> pm interfaces.
>>>
>> Not sure if you've noticed but this patch seems to do the opposite o=
f
>> what Gustavo was aiming with an earlier series [1].
>
> I removed just the interfaces related to sleep pm not runtime pm. Fro=
m
> long ago, Linux DRM drivers - especially ARM DRM drivers - have been
> stepping forward to a integrated DRM driver so it'd be reasonable for
> sleep pm operations of all KMS drivers are controlled by top of DRM
> driver. It means that Exynos drm driver has already sleep pm interfac=
es.
>
> However, I think a power domain of each kms device couldn't be
> controlled by the top in case of ARM SoC because kms devices can use =
a
> different power domain each other according to Vendor SoC so runtime =
pm
> should be controlled by each kms driver, which will be triggered by D=
RM top.
>
> And Gustavo's patch set you mentioned - now being reviewed - will add
> only runtime pm interfaces to each kms driver.
>
Ack. Seems like I misread your patch. Thank you for the comprehensive
answer and apologies for the noise.

Thanks
Emil
