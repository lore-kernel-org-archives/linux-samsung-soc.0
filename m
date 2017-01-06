From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Add EXYNOS5433 ARM architectures entry as a
 supporter
Date: Fri, 06 Jan 2017 12:15:58 +0900
Message-ID: <586F0BEE.7050404@samsung.com>
References: <CGME20170105131251epcas1p18bb302757d0e45145595cc68c4ad947e@epcas1p1.samsung.com>
 <1483621969-27631-1-git-send-email-cw00.choi@samsung.com>
 <20170105170951.2yftdz4nfqsgauoc@kozik-lap>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_hrTFwh599Kuphe7d0WrpEA)"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170105170951.2yftdz4nfqsgauoc@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: javier@osg.samsung.com, kgene@kernel.org, andi.shyti@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.

--Boundary_(ID_hrTFwh599Kuphe7d0WrpEA)
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 8BIT

Hi Krzysztof,

On 2017년 01월 06일 02:09, Krzysztof Kozlowski wrote:
> On Thu, Jan 05, 2017 at 10:12:49PM +0900, Chanwoo Choi wrote:
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
> Review and testing is always highly appreciated and you are doing,
> Chanwoo, great work. I would like to sincerely thank you for that.
> Samsung probably should thank you, as well. :)
> 
> As for the additional sub-entry, I do not see any need for creating
> such entries for specific DTSes. This looks like overkill.
> 

I'm in charge of verifying the all features of Exynos5433 and testing
the Exynos5433-based TM/TM2E board in order to guarantee the stabilization
and performance with Platform because TM2/TM2E is Tizen reference board.
So, I just proposed this patch to prevent the missing patch.

But, if you think it is not proper, I respect the opinion of maintainer.

> At the same time I would like to strongly avoid something which is
> happening for example in our DRM where we have *four* maintainers but
> only *one* is responding. We can add bazilions of maintainers to satisfy
> Samsung KPIs but still this might not help reviewing patches (damn, why
> am I waiting with this small [0] thing since 21st of October?).
> 
> On the other hand, this is just my personal opinion. If the broad
> open-source community would like to do any changes here
> (add/remove/move/whatever) I do not mind at all.
> 
> Best regards and happy New Year! :D
> Krzysztof
> 
> 
> 

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

--Boundary_(ID_hrTFwh599Kuphe7d0WrpEA)
Content-type: text/x-vcard; CHARSET=EUC-KR; name=cw00_choi.vcf
Content-transfer-encoding: base64
Content-disposition: attachment; filename=cw00_choi.vcf

bnVsbA0K

--Boundary_(ID_hrTFwh599Kuphe7d0WrpEA)--
