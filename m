From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH] drm/exynos: use 4WORD dma burst length for small fbs
Date: Thu, 22 May 2014 14:09:25 +0530
Message-ID: <CAPdUM4MzfeS6JZEJHjRJ1PzT1gzMW2Eer_zvA3cN4Kr_Zsqwwg@mail.gmail.com>
References: <1399461922-27131-1-git-send-email-rahul.sharma@samsung.com>
	<537C8A45.6040407@samsung.com>
	<CAPdUM4NyCHsA8gBZrcDw1+1LqUbE9LquWA=H4NsjHEXb8Xp1dg@mail.gmail.com>
	<537D9F7D.9020204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:37824 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751547AbaEVIj1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 04:39:27 -0400
Received: by mail-wi0-f174.google.com with SMTP id r20so8927293wiv.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 01:39:25 -0700 (PDT)
In-Reply-To: <537D9F7D.9020204@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: sreekumar.c@samsung.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prathyush K <prathyush.k@samsung.com>

On 22 May 2014 12:25, Inki Dae <inki.dae@samsung.com> wrote:
> On 2014=B3=E2 05=BF=F9 22=C0=CF 13:36, Rahul Sharma wrote:
>> Hi Inki,
>>
>> On 21 May 2014 16:43, Inki Dae <inki.dae@samsung.com> wrote:
>>>
>>> Hi Rahul,
>>>
>>> On 2014=B3=E2 05=BF=F9 07=C0=CF 20:25, Rahul Sharma wrote:
>>>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>>>
>>>> In case of exynos, setting dma-burst to 16Word causes permanent
>>>> tearing for very small buffers, e.g. cursor buffer. Burst Mode
>>>> switching, which is based on overlay size is not recommended as
>>>> overlay size varies a lot towards the end of the screen. This
>>>> causes unstable DMA which results into tearing again.
>> [snip]
>>>> +     /*
>>>> +      * In case of exynos, setting dma-burst to 16Word causes per=
manent
>>>> +      * tearing for very small buffers, e.g. cursor buffer. Burst=
 Mode
>>>> +      * switching which is based on overlay size is not recommend=
ed as
>>>> +      * overlay size varies alot towards the end of the screen an=
d rapid
>>>> +      * movement causes unstable DMA which results into iommu cra=
sh/tear.
>>>
>>> FIMD has width limitation so width of hardware overlay may need to =
be
>>> aligned to 16 pixels.
>>> We had faced with similar issue and the issue had been resolved by
>>> aligning it to 16 pixels.
>>>
>>> So can you try to align it instead of changing burst len size?
>>>
>>
>> This problem is only with the very small FBs which are
>> rendered towards corners. For large FBs like 1366x768,
>> we dont see this issue though 1366 is not 16 pixel
>> aligned.
>
> Right, we had test it with 8x64 pixels. the limitation would be decid=
ed
> by memory bus length(ML), DMA burst length(DL) and pixel size in byte=
s(PS).
> And that can be calculated like below, which was guided by hardware t=
eam,
>
> Align { (ML * DI / PS) + (4bytes / PS), 2}

What will be the value for ML in Exynos? 4, I guess ?

>
> It seems too big value. Actually, 16 pixels works well and I don't se=
e
> why it works well although out of limitation.

Actually Peach Pit and Peach Pi, native LCD resolution is 1366x768
which has no issues.

In above experiments, I rendered FB of size 96*64 which corrupts when
overlay width reduces beyond 48 Pixels for 5420, 5800 and 64 for 5250.

Probably we have not tested rendering the Small buffers (<96 Pixels) wi=
th
16 bit DMA burst and towards end of FB. As if now, this scenario only
applicable for Chrome which is having cursor.

Please let me know how to proceed further.

Regards,
Rahul Sharma.

>
> Thanks,
> Inki Dae
>
>>
>> But I still carried out following experiments just to
>> verify the fimd behaviour for small overlay.
>>
>> 1) Round DOWN:
>> +  overlay->crtc_width =3D ((overlay->crtc_width)/16)*16;
>>
>> Cursor corruption from A to B
>> A: [  308.530000] start addr =3D 0x20408000, end addr =3D 0x2040e000=
, size =3D 0x6000
>> [  308.530000] ovl_width =3D 64, ovl_height =3D 64
>> [  308.540000] offset_x =3D 1302, offset_y =3D 335
>> [  308.540000] fb_width =3D 96, fb_height =3D 64
>>
>> B: [  341.890000] start addr =3D 0x20408000, end addr =3D 0x2040e000=
, size =3D 0x6000
>> [  341.890000] ovl_width =3D 48, ovl_height =3D 64
>> [  341.900000] offset_x =3D 1303, offset_y =3D 335
>> [  341.900000] fb_width =3D 96, fb_height =3D 64
>>
>>
>> 2) Round UP:
>>
>> + overlay->crtc_width =3D ((overlay->crtc_width + 16)/16)*16;
>> + if(overlay->crtc_width > overlay->fb_width)
>> +         overlay->crtc_width =3D overlay->fb_width;
>>
>> Cursor corruption from A to B
>> A: [   63.200000] start addr =3D 0x20408000, end addr =3D 0x2040e000=
, size =3D 0x6000
>> [   63.210000] ovl_width =3D 96, ovl_height =3D 64
>> [   63.210000] offset_x =3D 1271, offset_y =3D 346
>> [   63.220000] fb_width =3D 96, fb_height =3D 64
>>
>> B: [   68.600000] start addr =3D 0x20408000, end addr =3D 0x2040e000=
, size =3D 0x6000
>> [   68.610000] ovl_width =3D 96, ovl_height =3D 64
>> [   68.610000] offset_x =3D 1272, offset_y =3D 346
>> [   68.620000] fb_width =3D 96, fb_height =3D 64
>>
>> In both the scenarios ovl_width is always 16 Pixel aligned.
>> Please let me know if you have something else in mind. I
>> will check and share the observations.
>>
>> The solution in the patch is proposed by hardware team
>> and work fine for exynos 5250, 5420 and 5800.
>>
>> Regards,
>> Rahul Sharma
>>
>>> Thanks,
>>> Inki Dae
>>>
>>>> +      */
>>>> +
>>>> +     if (win_data->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
>>>> +             val &=3D ~WINCONx_BURSTLEN_MASK;
>>>> +             val |=3D WINCONx_BURSTLEN_4WORD;
>>>> +     }
>>>> +
>>>>       writel(val, ctx->regs + WINCON(win));
>>>>  }
>>>>
>>>>
>>>
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
