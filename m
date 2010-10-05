From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/2] ARM: S3C64XX: Add suspend support
Date: Wed, 6 Oct 2010 08:39:50 +0900
Message-ID: <AANLkTimL_G7E5u1Q8ttqbkTZ8N2D_sSELZ0RfTJQpJV1@mail.gmail.com>
References: <cover.1286319272.git.mcuelenaere@gmail.com>
	<1fa4a7a39d9fd48b8329e1a1077a65adb96475b5.1286319272.git.mcuelenaere@gmail.com>
	<AANLkTi=CH6BJZDYsCHXmcYAVuu-LTsqjKXUVGnBAikiN@mail.gmail.com>
	<4CABB459.6070209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:41408 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756434Ab0JEXjv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 19:39:51 -0400
Received: by wwj40 with SMTP id 40so6353223wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2010 16:39:50 -0700 (PDT)
In-Reply-To: <4CABB459.6070209@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Wed, Oct 6, 2010 at 8:27 AM, Maurus Cuelenaere <mcuelenaere@gmail.co=
m> wrote:
> =A0Op 06-10-10 01:23, Kyungmin Park schreef:
>> Hi,
>>
>> I agree your approach, put the common features in common place.
>> but Samsung maintainers insist put these at each machine file at cur=
rent time.
>>
>> So move this to the each machines for their tastes.
> I did it that way first, but then wondered why this wasn't done for a=
ll boards.
>
> When looking at some S3C24XX boards, you'll see that these need chang=
es to the
> bootloader to support suspend; but IIRC this isn't needed for S3C64XX=
 so I think
> this can be safely enabled for all S3C64XX boards?

There are be answered by Samsung maintainers.
I'm have same opinions since it's common feature. Previous time I
already argued with them but they reject it.
you can issue it again.

and current status.
# grep s3c_pm_init -H -R arch/arm/mach-*
arch/arm/mach-s3c2410/mach-qt2410.c:    s3c_pm_init();
arch/arm/mach-s3c2410/mach-h1940.c:     s3c_pm_init();
arch/arm/mach-s3c2412/mach-jive.c:      s3c_pm_init();
arch/arm/mach-s3c2440/mach-rx3715.c:    s3c_pm_init();
arch/arm/mach-s3c2440/mach-gta02.c:     s3c_pm_init();
arch/arm/mach-s3c2440/mach-rx1950.c:    s3c_pm_init();
arch/arm/mach-s5pv210/mach-smdkv210.c:  s3c_pm_init();
arch/arm/mach-s5pv210/mach-smdkc110.c:  s3c_pm_init();

Thank you,
Kyungmin Park

>
> --
> Maurus Cuelenaere
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
