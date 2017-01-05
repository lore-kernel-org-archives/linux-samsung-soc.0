From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Add EXYNOS5433 ARM architectures entry as a
 supporter
Date: Thu, 05 Jan 2017 22:36:06 +0900
Message-ID: <586E4BC6.70609@samsung.com>
References: <CGME20170105131251epcas1p18bb302757d0e45145595cc68c4ad947e@epcas1p1.samsung.com>
 <1483621969-27631-1-git-send-email-cw00.choi@samsung.com>
 <43019997-a6cf-30df-2437-306055ea6a78@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_qhSPzsMaiC86pxgXzL2seQ)"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35431 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935113AbdAENgK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2017 08:36:10 -0500
In-reply-to: <43019997-a6cf-30df-2437-306055ea6a78@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org
Cc: andi.shyti@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.

--Boundary_(ID_qhSPzsMaiC86pxgXzL2seQ)
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 8BIT

Hi,

On 2017년 01월 05일 22:18, Daniel Lezcano wrote:
> On 05/01/2017 14:12, Chanwoo Choi wrote:
>> This patch adds the 'ARM/SAMSUNG EXYNOS5433 ARM ARCHITECTURES' entry
>> in order to review and test the upcoming patches as a supporter.
>> I have developed the low-level devices and power related devices for
>> Exyno5433 and TM2/E board.
>>
>> Moreover, Andi proposed himself as a reviewer for Exynos5433 and TM2/E.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
>> ---
>>  MAINTAINERS | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cfff2c9e3d94..96c055e8dd0b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1712,6 +1712,13 @@ F:	Documentation/devicetree/bindings/sram/samsung-sram.txt
>>  F:	Documentation/devicetree/bindings/power/pd-samsung.txt
>>  N:	exynos
>>  
>> +ARM/SAMSUNG EXYNOS5433 ARM ARCHITECTURES
>> +M:	Chanwoo Choi <cw00.choi@samsung.com>
>> +R:	Andi Shyti <andi.shyti@samsung.com>
>> +L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
>> +S:	Supported
>> +F:	arch/arm64/boot/dts/exynos/exynos5433*
>> +
> 
> Does it make sense to add a MAINTAINER entry for some dts files ?
> 

I'm just helping to review the patches and test them
on real h/w target as a supporter. I can dedicate some time for this.
It would be easier for me for review if I'm cc'ed for patches.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

--Boundary_(ID_qhSPzsMaiC86pxgXzL2seQ)
Content-type: text/x-vcard; CHARSET=EUC-KR; name=cw00_choi.vcf
Content-transfer-encoding: base64
Content-disposition: attachment; filename=cw00_choi.vcf

bnVsbA0K

--Boundary_(ID_qhSPzsMaiC86pxgXzL2seQ)--
