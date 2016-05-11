From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 3/4] drm/exynos: use generic code for managing zpos plane property
Date: Wed, 11 May 2016 08:26:41 -0400
Message-ID: <CABxcv==2Dv3XrNPQ3rgNvWzjM-X66+7YzT2aW6pK5Hd8trtcxA@mail.gmail.com>
References: <1462962308-13410-1-git-send-email-benjamin.gaignard@linaro.org>
	<1462962308-13410-3-git-send-email-benjamin.gaignard@linaro.org>
	<57331D7F.5080000@samsung.com>
	<CA+M3ks7JptQqptmZNn7Xd74_=Rt2wUVauewkpez71tBFnKSEWQ@mail.gmail.com>
	<573322A2.5050603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f193.google.com ([209.85.213.193]:33742 "EHLO
	mail-ig0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751552AbcEKM0n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 08:26:43 -0400
Received: by mail-ig0-f193.google.com with SMTP id rc4so4008272igc.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 May 2016 05:26:42 -0700 (PDT)
In-Reply-To: <573322A2.5050603@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Wed, May 11, 2016 at 8:16 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 05/11/2016 02:09 PM, Benjamin Gaignard wrote:
>> I haven't double check but I had to do changes into the original patch
>> so I guess that "from" field comes the new commit.
>>
>> I will manually edit the commit for v2,
>
> Git keeps original author untouched. You have to manually change the
> author to remove the original one (or use non-standard way of applying
> patches). If you use Git, just stick to typical workflow - git am, git
> commit --amend --signoff, git format-patch, etc.
>

and if the patch doesn't apply cleanly anymore and need to manually
re-do it, git allows to change the author when doing a commit with:

$ git commit --author='Marek Szyprowski <m.szyprowski@samsung.com>'

> Best regards,
> Krzysztof
> --

Best regards,
Javier
