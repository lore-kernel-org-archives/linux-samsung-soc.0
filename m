From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [RESEND PATCH 2/3] ARM: EXYNOS4: Update consistent DMA size to
 8MB
Date: Wed, 21 Sep 2011 14:53:47 +0530
Message-ID: <4E79AD23.8050807@linaro.org>
References: <23185691.178841316589732769.JavaMail.weblogic@epv6ml02>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43750 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752247Ab1IUJXl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 05:23:41 -0400
Received: by iaqq3 with SMTP id q3so1512168iaq.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Sep 2011 02:23:40 -0700 (PDT)
In-Reply-To: <23185691.178841316589732769.JavaMail.weblogic@epv6ml02>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: hatim.rv@samsung.com
Cc: Kyungmin Park <kmpark@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, "mchehab@infradead.org" <mchehab@infradead.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, BANAJIT GOSWAMI <banajit.g@samsung.com>

Hi,

On Wednesday 21 September 2011 12:52 PM, HATIMALI RV wrote:
> Hello Mr. Park,
>
> As I mentioned in the cover letter of v1 patch set (http://www.spinic=
s.net/lists/arm-kernel/msg138054.html),
> this is a temporary patch which is just for testing HDMI on SMDKV310.
> Once CMA gets merged, we will be using that to allocate memory.
>
The macro definition CONSISTENT_DMA_SIZE has been removed and has been=20
replaced by a function call. Please refer to this patch.

http://www.spinics.net/lists/linux-samsung-soc/msg06627.html

> Thanks for your review.
>
> Regards,
> Hatim Ali
>
> ------- Original Message -------
> Sender : Kyungmin Park<kmpark@infradead.org>
> Date   : Sep 21, 2011 11:55 (GMT+05:30)
> Title  : Re: [RESEND PATCH 2/3] ARM: EXYNOS4: Update consistent DMA s=
ize to 8MB
>
> Hi,
>
> As I know,  CONSISTENT_DMA_SIZE is removed, please use the updated AP=
Is.
>
> Thank you,
> Kyungmin Park
>
> On Wed, Sep 21, 2011 at 2:44 PM, Hatim Ali<hatim.rv@samsung.com>  wro=
te:
>> Change the consistent DMA allocation to 8MB to support the
>> TVOUT driver.
>>
>> NOTE: Once CMA support is merged into mainline, we will use it for m=
emory
>> allocation.
>>
>> Signed-off-by: Hatim Ali<hatim.rv@samsung.com>
>> ---
>>   arch/arm/mach-exynos4/include/mach/memory.h |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/include/mach/memory.h b/arch/arm/=
mach-exynos4/include/mach/memory.h
>> index 374ef2c..7549742 100644
>> --- a/arch/arm/mach-exynos4/include/mach/memory.h
>> +++ b/arch/arm/mach-exynos4/include/mach/memory.h
>> @@ -15,6 +15,8 @@
>>
>>   #define PLAT_PHYS_OFFSET               UL(0x40000000)
>>
>> +#define CONSISTENT_DMA_SIZE            SZ_8M
>> +
>>   /* Maximum of 256MiB in one bank */
>>   #define MAX_PHYSMEM_BITS       32
>>   #define SECTION_SIZE_BITS      28
>> --
>> 1.7.2.3
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> N=8B=A7=B2=E6=ECr=B8=9By=FA=E8=9A=D8b=B2X=AC=B6=C7=A7v=D8^=96)=DE=BA{=
=2En=C7+=89=B7=A5=8A{=B1=B1=A9=AC=BAx,=A1=C8=A7=B6=17=9B=A1=DC=A8}=A9=9E=
=B2=C6 z=DA&j:+v=89=A8=BE=07=AB=91=EA=E7zZ+=80=CA+zf=A3=A2=B7h=9A=88=A7=
~=86=AD=86=DBi=FF=FB=E0z=B9=1E=AEw=A5=A2=B8?=99=A8=E8=AD=DA&=A2)=DF=A2=1B=
fl=3D=3D=3D


--=20
Tushar Behera
