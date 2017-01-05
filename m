From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Add EXYNOS5433 ARM architectures entry as a
 supporter
Date: Thu, 05 Jan 2017 22:47:24 +0900
Message-ID: <586E4E6C.9020207@samsung.com>
References: <CGME20170105131251epcas1p18bb302757d0e45145595cc68c4ad947e@epcas1p1.samsung.com>
 <1483621969-27631-1-git-send-email-cw00.choi@samsung.com>
 <651f27a4-bbe4-7832-d4e8-07716d78b2c6@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_7OMSijAQ7Fr/+giYvAL6Dw)"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38508 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161538AbdAENrd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2017 08:47:33 -0500
In-reply-to: <651f27a4-bbe4-7832-d4e8-07716d78b2c6@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, krzk@kernel.org, kgene@kernel.org
Cc: andi.shyti@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.

--Boundary_(ID_7OMSijAQ7Fr/+giYvAL6Dw)
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8BIT

Hello Javier,

On 2017년 01월 05일 22:36, Javier Martinez Canillas wrote:
> Hello Chanwoo,
> 
> On 01/05/2017 10:12 AM, Chanwoo Choi wrote:
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
>>  ARM/SAMSUNG MOBILE MACHINE SUPPORT
>>  M:	Kyungmin Park <kyungmin.park@samsung.com>
>>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>
> 
> I think these fall under the "ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" entry,
> we don't have MAINTAINERS entry for individual Exynos SoCs.

You're right. So, I just add the entry as a supporter.

> 
> What you can do is to post a patch to add Andi and you as reviewers for the
> existing entry. The more people there, the better IMHO.

Thanks for your suggestion. I think that the reviewer
of all Exynos should much times to review and test the patches.
It is very important role. But, I have not much time to review all
of Exynos patches. So, I just add the entry for Exynos5433.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

--Boundary_(ID_7OMSijAQ7Fr/+giYvAL6Dw)
Content-type: text/x-vcard; CHARSET=EUC-KR; name=cw00_choi.vcf
Content-transfer-encoding: base64
Content-disposition: attachment; filename=cw00_choi.vcf

bnVsbA0K

--Boundary_(ID_7OMSijAQ7Fr/+giYvAL6Dw)--
