From: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH] of: reserved_mem: restore old behavior when no region is defined
Date: Wed, 8 Jun 2016 21:05:22 +0530
Message-ID: <CAO_48GFTbqQ0jRj93+cuax=F3Lf0DCnCnnuk8_pxkPKoXZwU4w@mail.gmail.com>
References: <20160607143425.GE1165@e106497-lin.cambridge.arm.com>
 <1465368713-17866-1-git-send-email-m.szyprowski@samsung.com> <CAL_JsqKNpx09UFkGB0n9W0GkAv8OVUdRN8cYriau83SdD6xnuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37279 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755556AbcFHPfn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 11:35:43 -0400
Received: by mail-wm0-f42.google.com with SMTP id k204so22662281wmk.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jun 2016 08:35:43 -0700 (PDT)
In-Reply-To: <CAL_JsqKNpx09UFkGB0n9W0GkAv8OVUdRN8cYriau83SdD6xnuw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Liviu Dudau <liviu.dudau@arm.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>

On 8 June 2016 at 18:35, Rob Herring <robh@kernel.org> wrote:
> On Wed, Jun 8, 2016 at 1:51 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Change return value back to -ENODEV when no region is defined for gi=
ven
>> device. This restores old behavior of this function, as some drivers=
 rely
>> on such error code.
>>
>> Reported-by: Liviu Dudau <liviu.dudau@arm.com>
>> Fixes: 59ce4039727ef40 ("of: reserved_mem: add support for using mor=
e than
>>        one region for given device")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  drivers/of/of_reserved_mem.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Looks reasonable; FWIW
Reviewed-by: Sumit Semwal <sumit.semwal@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Thanks and regards,

Sumit Semwal
Linaro Mobile Group - Kernel Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
