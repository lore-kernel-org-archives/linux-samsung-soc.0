From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH 3/4] drm/exynos: use generic code for managing zpos plane property
Date: Wed, 11 May 2016 14:09:43 +0200
Message-ID: <CA+M3ks7JptQqptmZNn7Xd74_=Rt2wUVauewkpez71tBFnKSEWQ@mail.gmail.com>
References: <1462962308-13410-1-git-send-email-benjamin.gaignard@linaro.org>
	<1462962308-13410-3-git-send-email-benjamin.gaignard@linaro.org>
	<57331D7F.5080000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36576 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751790AbcEKMJp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 08:09:45 -0400
Received: by mail-lf0-f47.google.com with SMTP id u64so47168388lff.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 May 2016 05:09:45 -0700 (PDT)
In-Reply-To: <57331D7F.5080000@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I haven't double check but I had to do changes into the original patch
so I guess that "from" field comes the new commit.

I will manually edit the commit for v2,

thanks

2016-05-11 13:54 GMT+02:00 Krzysztof Kozlowski <k.kozlowski@samsung.com=
>:
> On 05/11/2016 12:25 PM, Benjamin Gaignard wrote:
>> This patch replaces zpos property handling custom code in Exynos DRM
>> driver with calls to generic DRM code.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Ekhm? From=3DBenjamin, SoB=3DMarek... why did you change the author?
>
> Best regards,
> Krzysztof



--=20
Benjamin Gaignard

Graphic Working Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

=46ollow Linaro: Facebook | Twitter | Blog
