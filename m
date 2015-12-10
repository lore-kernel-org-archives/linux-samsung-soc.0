From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v2 14/22] drm/exynos: fimd: fix dma burst size setting for
 small plane size
Date: Thu, 10 Dec 2015 15:36:47 +0000
Message-ID: <CAPj87rP-34txHEE0mxZrc4j3q0Ubgk3z0dYdPo8vNViSq8uksQ@mail.gmail.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
	<1448891617-18830-15-git-send-email-m.szyprowski@samsung.com>
	<5669639C.9080701@samsung.com>
	<56697720.8000901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:33894 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005AbbLJPgs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Dec 2015 10:36:48 -0500
Received: by mail-wm0-f46.google.com with SMTP id v187so39063353wmv.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Dec 2015 07:36:48 -0800 (PST)
In-Reply-To: <56697720.8000901@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Hi Inki,

On 10 December 2015 at 12:59, Marek Szyprowski <m.szyprowski@samsung.co=
m> wrote:
> On 2015-12-10 12:35, Inki Dae wrote:
>> 2015=EB=85=84 11=EC=9B=94 30=EC=9D=BC 22:53=EC=97=90 Marek Szyprowsk=
i =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> This patch fixes trashed display of buffers cropped to very small w=
idth.
>>> Even if DMA is unstable and causes tearing when changing the burst =
size,
>>> it is still better than displaying a garbage.
>>
>> It seems that this patch is different from above description. I thin=
k
>> below patch is just cleanup,
>> which passes each member necessary instead of passing a drm_framebuf=
fer
>> object.
>
>
> Please note the last chunk of this patch. After applying it width is
> taken from state->src.w instead of fb->width. If you want, I can spli=
t
> this patch into 2 parts - one cleanup without functional change, and
> second, replacement of fb->width with state->src.w.

As Marek says:
http://lists.freedesktop.org/archives/dri-devel/2015-November/094321.ht=
ml

It fixes the case where state->src.w (what we're actually scanning
out) < MIN_FB_WIDTH_FOR_16WORD_BURST < fb->width (total size of
allocated buffer). Quite subtle, but also correct.

Cheers,
Daniel
