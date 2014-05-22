From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH] drm/exynos: use 4WORD dma burst length for small fbs
Date: Thu, 22 May 2014 10:06:29 +0530
Message-ID: <CAPdUM4NyCHsA8gBZrcDw1+1LqUbE9LquWA=H4NsjHEXb8Xp1dg@mail.gmail.com>
References: <1399461922-27131-1-git-send-email-rahul.sharma@samsung.com>
	<537C8A45.6040407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:56110 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750897AbaEVEgb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 00:36:31 -0400
Received: by mail-we0-f177.google.com with SMTP id x48so2802323wes.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 21:36:30 -0700 (PDT)
In-Reply-To: <537C8A45.6040407@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, Prathyush K <prathyush.k@samsung.com>, sreekumar.c@samsung.com

Hi Inki,

On 21 May 2014 16:43, Inki Dae <inki.dae@samsung.com> wrote:
>
> Hi Rahul,
>
> On 2014=EB=85=84 05=EC=9B=94 07=EC=9D=BC 20:25, Rahul Sharma wrote:
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> In case of exynos, setting dma-burst to 16Word causes permanent
>> tearing for very small buffers, e.g. cursor buffer. Burst Mode
>> switching, which is based on overlay size is not recommended as
>> overlay size varies a lot towards the end of the screen. This
>> causes unstable DMA which results into tearing again.
[snip]
>> +     /*
>> +      * In case of exynos, setting dma-burst to 16Word causes perma=
nent
>> +      * tearing for very small buffers, e.g. cursor buffer. Burst M=
ode
>> +      * switching which is based on overlay size is not recommended=
 as
>> +      * overlay size varies alot towards the end of the screen and =
rapid
>> +      * movement causes unstable DMA which results into iommu crash=
/tear.
>
> FIMD has width limitation so width of hardware overlay may need to be
> aligned to 16 pixels.
> We had faced with similar issue and the issue had been resolved by
> aligning it to 16 pixels.
>
> So can you try to align it instead of changing burst len size?
>

This problem is only with the very small FBs which are
rendered towards corners. For large FBs like 1366x768,
we dont see this issue though 1366 is not 16 pixel
aligned.

But I still carried out following experiments just to
verify the fimd behaviour for small overlay.

1) Round DOWN:
+  overlay->crtc_width =3D ((overlay->crtc_width)/16)*16;

Cursor corruption from A to B
A: [  308.530000] start addr =3D 0x20408000, end addr =3D 0x2040e000, s=
ize =3D 0x6000
[  308.530000] ovl_width =3D 64, ovl_height =3D 64
[  308.540000] offset_x =3D 1302, offset_y =3D 335
[  308.540000] fb_width =3D 96, fb_height =3D 64

B: [  341.890000] start addr =3D 0x20408000, end addr =3D 0x2040e000, s=
ize =3D 0x6000
[  341.890000] ovl_width =3D 48, ovl_height =3D 64
[  341.900000] offset_x =3D 1303, offset_y =3D 335
[  341.900000] fb_width =3D 96, fb_height =3D 64


2) Round UP:

+ overlay->crtc_width =3D ((overlay->crtc_width + 16)/16)*16;
+ if(overlay->crtc_width > overlay->fb_width)
+         overlay->crtc_width =3D overlay->fb_width;

Cursor corruption from A to B
A: [   63.200000] start addr =3D 0x20408000, end addr =3D 0x2040e000, s=
ize =3D 0x6000
[   63.210000] ovl_width =3D 96, ovl_height =3D 64
[   63.210000] offset_x =3D 1271, offset_y =3D 346
[   63.220000] fb_width =3D 96, fb_height =3D 64

B: [   68.600000] start addr =3D 0x20408000, end addr =3D 0x2040e000, s=
ize =3D 0x6000
[   68.610000] ovl_width =3D 96, ovl_height =3D 64
[   68.610000] offset_x =3D 1272, offset_y =3D 346
[   68.620000] fb_width =3D 96, fb_height =3D 64

In both the scenarios ovl_width is always 16 Pixel aligned.
Please let me know if you have something else in mind. I
will check and share the observations.

The solution in the patch is proposed by hardware team
and work fine for exynos 5250, 5420 and 5800.

Regards,
Rahul Sharma

> Thanks,
> Inki Dae
>
>> +      */
>> +
>> +     if (win_data->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
>> +             val &=3D ~WINCONx_BURSTLEN_MASK;
>> +             val |=3D WINCONx_BURSTLEN_4WORD;
>> +     }
>> +
>>       writel(val, ctx->regs + WINCON(win));
>>  }
>>
>>
>
