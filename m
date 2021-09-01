Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFD6C43214
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 12:29:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C9D2610A1
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 12:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244582AbhIAMaE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Sep 2021 08:30:04 -0400
Received: from mailgw.kylinos.cn ([123.150.8.42]:51579 "EHLO nksmu.kylinos.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244445AbhIAM3j (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 08:29:39 -0400
X-UUID: 32f15446eb9149f18bbe03b6a849763e-20210901
X-CPASD-INFO: 7cd1eae5a5814e928c06d72cb27a2c37@gLOeUZKTk2WNVXp9g6iEbFiUYGaUY1K
        ypGxXkWCTX1eVhH5xTWJsXVKBfG5QZWNdYVN_eGpQYl9gZFB5i3-XblBgXoZgUZB3hqWeUZWPlQ==
X-CPASD-FEATURE: 0.0
X-CLOUD-ID: 7cd1eae5a5814e928c06d72cb27a2c37
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,EXT:0.0,OB:0.0,URL:-5,T
        VAL:142.0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:288.0,IP:-2.0,MAL:0.0,ATTNUM:0
        .0,PHF:-5.0,PHC:-5.0,SPF:4.0,EDMS:-3,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CF
        OB:0.0,SPC:0.0,SIG:-5,AUF:3,DUF:10764,ACD:29,DCD:131,SL:0,AG:0,CFC:0.904,CFSR
        :0.049,UAT:0,RAF:2,VERSION:2.3.4
X-CPASD-ID: 32f15446eb9149f18bbe03b6a849763e-20210901
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1, 1
X-UUID: 32f15446eb9149f18bbe03b6a849763e-20210901
X-User: liuyun01@kylinos.cn
Received: from [172.16.31.99] [(116.128.244.169)] by nksmu.kylinos.cn
        (envelope-from <liuyun01@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 1455400938; Wed, 01 Sep 2021 20:26:24 +0800
Subject: Re: [PATCH] ARM: s3c: irq-s3c24xx: Fix return value check for
 s3c24xx_init_intc()
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jackie Liu <liu.yun@linux.dev>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210831095728.2447598-1-liu.yun@linux.dev>
 <4137a6dc-cd90-5813-07aa-c8b4dbf510ce@canonical.com>
From:   Jackie Liu <liuyun01@kylinos.cn>
Message-ID: <d0b556af-68b4-6972-7213-0067d65594c8@kylinos.cn>
Date:   Wed, 1 Sep 2021 20:28:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4137a6dc-cd90-5813-07aa-c8b4dbf510ce@canonical.com>
Content-Type: multipart/mixed;
        boundary="Add_By_Label_Mail_Nextpart_001"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

--Add_By_Label_Mail_Nextpart_001
Content-Type: text/plain;
Content-Transfer-Encoding: 8bit


Hi Krzysztof, Thanks for you message.

在 2021/9/1 下午8:09, Krzysztof Kozlowski 写道:
> On 31/08/2021 11:57, Jackie Liu wrote:
>> From: Jackie Liu <liuyun01@kylinos.cn>
>>
>> The s3c24xx_init_intc() returns an error pointer upon failure, not NULL.
>> let's add an error pointer check in s3c24xx_handle_irq.
>>
>> Fixes: 1f629b7a3ced ("ARM: S3C24XX: transform irq handling into a declarative form")
>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> 
> Please use scripts/get_maintainers.pl to get list of mailing lists to
> CC. You skipped two - arm and LKML.
> 
>> ---
>>   arch/arm/mach-s3c/irq-s3c24xx.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-s3c/irq-s3c24xx.c b/arch/arm/mach-s3c/irq-s3c24xx.c
>> index 0c631c14a817..d58bf0f9bf9a 100644
>> --- a/arch/arm/mach-s3c/irq-s3c24xx.c
>> +++ b/arch/arm/mach-s3c/irq-s3c24xx.c
>> @@ -362,11 +362,11 @@ static inline int s3c24xx_handle_intc(struct s3c_irq_intc *intc,
>>   static asmlinkage void __exception_irq_entry s3c24xx_handle_irq(struct pt_regs *regs)
>>   {
>>   	do {
>> -		if (likely(s3c_intc[0]))
>> +		if (likely(!IS_ERR_OR_NULL(s3c_intc[0])))
>>   			if (s3c24xx_handle_intc(s3c_intc[0], regs, 0))
> 
> Thanks for the patch but it does not look entirely correct.
> 
> For platform based machines, neither ERR nor NULL can happen here.
> The s3c24xx_handle_irq() will be set as IRQ handler iff this succeeds:
>      s3c_intc[0] = s3c24xx_init_intc()
> 
> If this fails, the next calls to s3c24xx_init_intc() won't be executed.
> 
> For DT machine, s3c_init_intc_of() could set the IRQ handler without
> setting s3c_intc[0] only if it was called with num_ctrl=0. There is no
> such code path, so again the s3c_intc[0] will have a valid pointer if
> set_handle_irq() is called.
> 
> Therefore in s3c24xx_handle_irq(), the s3c_intc[0] is always something.
> 
> The code can be simplified by removing if(), if we really wanted and
> were sure about it.

In fact, I didn't study his underlying logic in depth, but found that
this place was not particularly perfect based on the return value of the
function, because I happened to encounter a similar problem elsewhere.

> 
> 
>>   				continue;
>>   
>> -		if (s3c_intc[2])
>> +		if (!IS_ERR_OR_NULL(s3c_intc[2]))
> 
> For the non-DT case, this seems ugly but proper solution. The
> s3c_intc[2] could be NULL (not set at all) or set as ERR (if
> s3c24xx_init_intc() fails).
> 
>>   			if (s3c24xx_handle_intc(s3c_intc[2], regs, 64))
>>   				continue;
>>   
>>
> 
> 
> Best regards,
> Krzysztof
> 

Would you mind review v2?

--------------------------------------------------------------

diff --git a/arch/arm/mach-s3c/irq-s3c24xx.c 
b/arch/arm/mach-s3c/irq-s3c24xx.c
index 0c631c14a817..df471d322493 100644
--- a/arch/arm/mach-s3c/irq-s3c24xx.c
+++ b/arch/arm/mach-s3c/irq-s3c24xx.c
@@ -362,11 +362,24 @@ static inline int s3c24xx_handle_intc(struct 
s3c_irq_intc *intc,
  static asmlinkage void __exception_irq_entry s3c24xx_handle_irq(struct 
pt_regs *regs)
  {
         do {
-               if (likely(s3c_intc[0]))
-                       if (s3c24xx_handle_intc(s3c_intc[0], regs, 0))
-                               continue;
+               /* For platform based machines, neither ERR nor NULL can 
happen here.
+                * The s3c24xx_handle_irq() will be set as IRQ handler 
iff this succeeds:
+                *
+                *    s3c_intc[0] = s3c24xx_init_intc()
+                *
+                * If this fails, the next calls to s3c24xx_init_intc() 
won't be executed.
+                *
+                * For DT machine, s3c_init_intc_of() could set the IRQ 
handler without
+                * setting s3c_intc[0] only if it was called with 
num_ctrl=0. There is no
+                * such code path, so again the s3c_intc[0] will have a 
valid pointer if
+                * set_handle_irq() is called.
+                *
+                * Therefore in s3c24xx_handle_irq(), the s3c_intc[0] is 
always something.
+                */
+               if (s3c24xx_handle_intc(s3c_intc[0], regs, 0))
+                       continue;

-               if (s3c_intc[2])
+               if (!IS_ERR_OR_NULL(s3c_intc[2]))
                         if (s3c24xx_handle_intc(s3c_intc[2], regs, 64))
                                 continue;


---
Thanks, Jackie
