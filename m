From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm: Exynos: Respect framebuffer pitch for FIMD/Mixer
Date: Sat, 28 Mar 2015 01:28:33 +0900
Message-ID: <CAAQKjZN9fCmtqw-q39sdKdvhBY-yxm5jNL9rj3sgDz6jernK1A@mail.gmail.com>
References: <1426598698-31095-1-git-send-email-daniels@collabora.com>
	<CABxcv==Z0ccmR-3Hasnkmg14m3hBJEwha=6c6288jQPUhyQt-g@mail.gmail.com>
	<5514187E.60405@samsung.com>
	<5514A118.2000609@gmx.net>
	<5514B6CB.7060301@samsung.com>
	<CABxcv=nZoXGRyRbOAtFApNVb3CG42-1DVzsNRqpRCNQ+qW80VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:35063 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753285AbbC0Q2f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Mar 2015 12:28:35 -0400
Received: by lbdc10 with SMTP id c10so13340683lbd.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2015 09:28:33 -0700 (PDT)
In-Reply-To: <CABxcv=nZoXGRyRbOAtFApNVb3CG42-1DVzsNRqpRCNQ+qW80VQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Tobias Jakobi <liquid.acid@gmx.net>, Daniel Stone <daniels@collabora.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello Javier,

2015-03-27 20:08 GMT+09:00 Javier Martinez Canillas <javier@dowhile0.org>:
> Hello Inki,
>
> On Fri, Mar 27, 2015 at 2:47 AM, Inki Dae <inki.dae@samsung.com> wrote:
>>
>> Right, this is not documented but if you have ever checked exynos drm
>> driver tree, then I think you could know how we use the prefix. Of
>> course, I don't like to force the use of this prefix but if you and
>> other people use prefix in the manner of them, exynos drm tree would be
>> a little bit messy. i.e., DRM: EXYNOS, drm: exynos, drm: Exynos,
>> drm/exynos, drm/exynos: fimd, drm: exynos: fimd, DRM: EXYNOS: FIMD, ...
>>  so many cases....  Do you really want this?
>>
>> So I will always say "please, use right prefix" Otherwise, I will change
>> it while merging as is.
>> And I see that other drm drivers have their own way which is not
>> documented but just implicitly.
>>
>
> I agree with you that people should follow the convention for subject
> lines used in a subsystem and that it is tedious to tell them to fix
> the subject and resend but I do agree with Tobias that you should
> rethink your mail filters.
>
> For example I've a filter for all the emails that are directly
> addressed to me or that I'm cc'ed to. It's true that you may get some
> emails that are not interesting to you just because people cc'ed you
> in random patches but I think is better to have false positives than
> to have false negatives. Specially since you are a kernel maintainer
> and people expect your feedback / ack for patches to get merged.
>

Added a new filter, which will pick up all emails of CCing me. :)

Thanks,
Inki Dae

>> Thanks,
>> Inki Dae
>>
>
> Best regards,
> Javier
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
