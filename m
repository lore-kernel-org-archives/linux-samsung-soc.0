From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH RESEND 0/3] ARM: S3C24XX: add missing dma-devices and
 warning fix
Date: Wed, 16 Oct 2013 07:32:20 +0900
Message-ID: <525DC274.8090808@samsung.com>
References: <201310111059.19791.heiko@sntech.de> <20131013145642.GJ2954@intel.com> <201310132011.11285.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:56898 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932802Ab3JOWcb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 18:32:31 -0400
Received: by mail-pa0-f47.google.com with SMTP id kp14so74429pab.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Oct 2013 15:32:31 -0700 (PDT)
In-Reply-To: <201310132011.11285.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org

On 10/14/13 03:11, Heiko St=FCbner wrote:
> Am Sonntag, 13. Oktober 2013, 16:56:42 schrieb Vinod Koul:
>> On Fri, Oct 11, 2013 at 10:59:19AM +0200, Heiko St=FCbner wrote:
>>> [I messed up the linux-arm-kernel list address yesterday, so I rese=
nd it
>>> with a fixed address, sorry for the noise]
>>>
>>> When Olof reported the warning about the unused s3c2410_dma_resourc=
e, I
>>> thought the best way forward would be to simply implement the missi=
ng
>>> pieces and so it has users :-) .
>>>
>>> Therefore this series adds the necessary platform-devices for s3c24=
10,
>>> s3c2440 and s3c2442. This especially also includes the
>>> channel-constraints of those socs.
>>>
>>> As I do not have access to any of those socs these changes are of c=
ourse
>>> compile-tested only.
>>
>> Do you want this to be applied thru dma or arm tree?
>
> hmm, the original series went into the samsung tree for 3.13, so mayb=
e this
> addition should go the same way?
>
I think so, let me pick this up into Samsung tree for v3.13.

Thanks,
Kukjin

>
> Heiko
>
>
>> ~Vinod
>>
>>> Heiko Stuebner (3):
>>>    ARM: S3C24XX: Fix possible dma selection warning
>>>    dmaengine: s3c24xx-dma: add support for the s3c2410 type of cont=
roller
>>>    ARM: S3C24XX: add dma platformdata for s3c2410, s3c2440 and s3c2=
442
>>>
>>>   arch/arm/mach-s3c24xx/Kconfig             |    3 +-
>>>   arch/arm/mach-s3c24xx/common.c            |  100
>>>   +++++++++++++++++++++++++++++ arch/arm/mach-s3c24xx/common.h
>>>   |    2 +
>>>   drivers/dma/s3c24xx-dma.c                 |   10 +++
>>>   include/linux/platform_data/dma-s3c24xx.h |    3 +
>>>   sound/soc/samsung/Kconfig                 |    2 +-
>>>   6 files changed, 118 insertions(+), 2 deletions(-)
