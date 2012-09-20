From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ARM: dts: use uart2 for console on smdkv310 and smdk5250
Date: Thu, 20 Sep 2012 10:15:47 +0530
Message-ID: <CAJuYYwQTYw69wrJZJ7q6pWzmAEx+dLe0sRZk29eZ=nuyzB+-BA@mail.gmail.com>
References: <052601cd94ca$058db4d0$10a91e70$%kim@samsung.com>
	<CAJuYYwQ0A9c_R=HzjeBCxL7E5bpw3j+64ApsCH5Uc8Q6i+HY4Q@mail.gmail.com>
	<099701cd96bd$0e7a3dd0$2b6eb970$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:64438 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751856Ab2ITEpt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 00:45:49 -0400
Received: by lbbgj3 with SMTP id gj3so1891504lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Sep 2012 21:45:47 -0700 (PDT)
In-Reply-To: <099701cd96bd$0e7a3dd0$2b6eb970$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 20 September 2012 04:48, Kukjin Kim <kgene@kernel.org> wrote:
> Thomas Abraham wrote:
>>
>> On 17 September 2012 17:16, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> >
>> > Cc: Thomas Abraham <thomas.abraham@linaro.org>
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > ---
>> >  arch/arm/boot/dts/exynos4210-smdkv310.dts |    2 +-
>> >  arch/arm/boot/dts/exynos5250-smdk5250.dts |    2 +-
>> >  2 files changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts
>> b/arch/arm/boot/dts/exynos4210-smdkv310.dts
>> > index 1beccc8..cb01e3d 100644
>> > --- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
>> > +++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
>> > @@ -26,7 +26,7 @@
>> >         };
>> >
>> >         chosen {
>> > -               bootargs = "root=/dev/ram0 rw ramdisk=8192
>> initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
>> > +               bootargs = "root=/dev/ram0 rw ramdisk=8192
>> initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
>> >         };
>>
>> Dear Mr. Kim,
>>
>> What is the reason for changing the console port to 2 for smdkv310 board?
>>
> Since uart1 can be used for other purpose, we changed the default console
> port to use uart2 a few month ago for all of SMDKs. And if required, I will
> change it for current defconfigs.

Ok, thanks for the information.

Regards,
Thomas.
