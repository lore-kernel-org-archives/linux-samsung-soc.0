From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S3C24XX: Fix restart on S3C2442
Date: Thu, 16 Feb 2012 21:00:56 +0900
Message-ID: <4F3CEFF8.8020904@samsung.com>
References: <1329051929-8303-1-git-send-email-GNUtoo@no-log.org> <201202121457.18632.heiko@sntech.de> <201202121459.54568.heiko@sntech.de> <201202160843.48203.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:37232 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751618Ab2BPMBC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 07:01:02 -0500
Received: by pbcun15 with SMTP id un15so2436397pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2012 04:01:01 -0800 (PST)
In-Reply-To: <201202160843.48203.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>, 'Ben Dooks' <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 02/16/12 16:43, Heiko St=FCbner wrote:
> Hi Kgene,
>
> Am Sonntag, 12. Februar 2012, 14:59:54 schrieb Heiko St=FCbner:
>> Commit b27b072791dc (ARM: 7265/1: restart: S3C24XX: use new restart =
hook)
>> introduced the new restart hook also for the S3C244x cpus, but it
>> was only defined in the S3C2440 scope, i.e. when CPU_S3C2440 was
>> selected. Devices using the S3C2442 like the GTA02 normally don't se=
lect
>> this CPU which leads to compilation errors like:
>>      LD      .tmp_vmlinux1
>>    arch/arm/mach-s3c2440/built-in.o:(.arch.info.init+0x3c): undefine=
d
>> reference to `s3c2440_restart' make: *** [.tmp_vmlinux1] Error 1
>>
>> Therefore move the s3c2440_restart function to s3c244x.c which is
>> common to both cpus and also fix the naming to reflect this.
>>
>> Reported-by: Denis 'GNUtoo' Carikli<GNUtoo@no-log.org>
>> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> could you take a look at this patch and possibly pick it up as fix fo=
r the
> current -rcs.
>
Hi,

Yes, looks ok to me. I will apply in v3.3-samsung-fixes-4.

Thanks for fixing and testing :)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
