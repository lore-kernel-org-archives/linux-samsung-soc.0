From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung Cleanup S3C24XX for v3.4
Date: Sat, 10 Mar 2012 08:16:46 -0800
Message-ID: <4F5B7E6E.2010909@samsung.com>
References: <4F589313.1050706@samsung.com> <CAOesGMhbmnWSrfEQC5tVrskhjQPMSj1aki1CQ-UM_=mv0-re+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:55601 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752487Ab2CJQQu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 11:16:50 -0500
Received: by yenl12 with SMTP id l12so1586503yen.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 08:16:50 -0800 (PST)
In-Reply-To: <CAOesGMhbmnWSrfEQC5tVrskhjQPMSj1aki1CQ-UM_=mv0-re+A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>

On 03/08/12 08:56, Olof Johansson wrote:
> On Thu, Mar 8, 2012 at 3:08 AM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>> Hi Arnd, Olof,
>>
>> Please pull cleanup s3c24xx from following:
>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> next/cleanup-s3c24xx
>>
>> As I said before, this is including merge of mach-s3c24.. directories into
>> just one mach-s3c24xx directory.
>>
>> If any problems, please kindly let me know.
>
> Thanks, pulled. Nice first step on making all of this common!
>
Thanks and as a note, will happen conflicts when this is on top of 
latest mainline.

Just FYI.

arch/arm/mach-s3c2440/common.h can be deleted with following

diff --cc arch/arm/mach-s3c24xx/common.h
index f65dc80,62a2e19..a7cd62f
--- a/arch/arm/mach-s3c24xx/common.h
+++ b/arch/arm/mach-s3c24xx/common.h
@@@ -12,6 -12,12 +12,12 @@@
   #ifndef __ARCH_ARM_MACH_S3C2410_COMMON_H
   #define __ARCH_ARM_MACH_S3C2410_COMMON_H

+ #ifdef CONFIG_CPU_S3C2410
   void s3c2410_restart(char mode, const char *cmd);
+ #endif
+
  -#ifdef CONFIG_CPU_S3C2440
  -void s3c2440_restart(char mode, const char *cmd);
++#ifdef CONFIG_CPU_S3C244X
++void s3c244x_restart(char mode, const char *cmd);
+ #endif

   #endif /* __ARCH_ARM_MACH_S3C2410_COMMON_H */

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
