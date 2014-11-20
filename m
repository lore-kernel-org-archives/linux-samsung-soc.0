From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration to
 module init
Date: Fri, 21 Nov 2014 02:01:10 +0900
Message-ID: <CAAQKjZOGn5+tvLWmBi2QU47+h3-AYCpk8XRQWrJeQL=5Oga2aQ@mail.gmail.com>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
	<546DF598.6030701@samsung.com>
	<546DFA97.1030006@collabora.co.uk>
	<546E0364.9000009@samsung.com>
	<546E0836.8000604@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:52745 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754559AbaKTRBM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 12:01:12 -0500
Received: by mail-la0-f48.google.com with SMTP id s18so2821164lam.35
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2014 09:01:10 -0800 (PST)
In-Reply-To: <546E0836.8000604@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kevin Hilman <khilman@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

2014-11-21 0:26 GMT+09:00 Javier Martinez Canillas
<javier.martinez@collabora.co.uk>:
> Hello Inki,
>
> On 11/20/2014 04:06 PM, Inki Dae wrote:
>>> BTW, it would be great if exynos-drm-next is pulled in linux-next. That is
>>> what most people use to test integration issues so you can catch earlier any
>>> regression that may arise.
>>>
>>> You have to email Stephen Rothwell <sfr@canb.auug.org.au> and point to your
>>> tree and branch and he will be able to add it to linux-next.
>>
>> Thanks for information. Actually, I received a similar email privately
>> before. However, exynos-drm-next should go to drm-next first and than to
>> mainline by Dave who is DRM subsystem maintainer. I think all vendor
>> specific drm drivers would need to be checked by drm subsystem
>> maintainer because these changes might be affect drm subsystem or other
>> vendor specific drm drivers before go to mainline.
>>
>
> This is orthogonal to the normal upstreaming path. linux-next is an integration
> tree that is created daily. So all the remote branches are merged and a git tag
> published. The branch does not get rebased and history is not preserved between
> two published linux-next tags.
>
> This is just to test the integration of different subsystems to be sure that a
> commit in one tree does not cause a regression in another one so issues can be
> spot earlier. For example in the case of $subject, a change in the OF caused a
> regression in the Exynos DRM driver.
>
>> If needed, I will make a new branch, which is based on top of linux-next
>> so other people can check their systems.
>>
>
> You don't really need another branch, git will take care of merge everything
> in linux-next :)

Ah, sorry. There was my misunderstanding. drm-next already is merged
to linux-next so I think we can do the integration test if
exynos-drm-next is merged to drm-next earlier. Anyway, I will try to
consider your opinion.

Thanks,
Inki Dae

>
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
