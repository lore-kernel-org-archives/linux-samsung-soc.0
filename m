From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 4/4] ARM: Exynos5: Add PDMA and MDMA physical base address defines
Date: Sun, 8 Apr 2012 20:48:57 -0700
Message-ID: <CAOesGMisDq_Z3zNFNmOeyDPEj-VXDsy9a8ABhJie4fsjtRkeJw@mail.gmail.com>
References: <1332840365-24827-1-git-send-email-thomas.abraham@linaro.org>
	<1332840365-24827-5-git-send-email-thomas.abraham@linaro.org>
	<4F73C0EC.60201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:58697 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753765Ab2DIDs6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Apr 2012 23:48:58 -0400
Received: by yenl12 with SMTP id l12so1677473yen.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Apr 2012 20:48:57 -0700 (PDT)
In-Reply-To: <4F73C0EC.60201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi,

2012/3/28 Kukjin Kim <kgene.kim@samsung.com>:
> Thomas Abraham wrote:
>> Add PDMA and MDMA physical base address macros which is require for =
Exynos5
>> of_dev_auxdata setup.
>>
>> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
>> ---
>> =A0 arch/arm/mach-exynos/include/mach/map.h | =A0 =A05 +++++
>> =A0 arch/arm/mach-exynos/mach-exynos5-dt.c =A0| =A0 =A03 ++-
>> =A0 2 files changed, 7 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach=
-exynos/include/mach/map.h
>> index 024d38f..37d93fd 100644
>> --- a/arch/arm/mach-exynos/include/mach/map.h
>> +++ b/arch/arm/mach-exynos/include/mach/map.h
>> @@ -90,6 +90,11 @@
>> =A0 #define EXYNOS4_PA_PDMA0 =A0 =A0 =A0 =A0 =A0 =A00x12680000
>> =A0 #define EXYNOS4_PA_PDMA1 =A0 =A0 =A0 =A0 =A0 =A00x12690000
>>
>> +#define EXYNOS5_PA_PDMA0 =A0 =A0 =A0 =A0 =A0 =A0 0x121A0000
>> +#define EXYNOS5_PA_PDMA1 =A0 =A0 =A0 =A0 =A0 =A0 0x121B0000
>> +#define EXYNOS5_PA_MDMA0 =A0 =A0 =A0 =A0 =A0 =A0 0x10800000
>> +#define EXYNOS5_PA_MDMA1 =A0 =A0 =A0 =A0 =A0 =A0 0x11C10000
>> +
>
> See, "ARM: EXYNOS: Support DMA for Exynos5250 SoC"
> http://lists.infradead.org/pipermail/linux-arm-kernel/2012-February/0=
85434.html
>
> But this merge window is not including it :(

Compilation of CONFIG_MACH_EXYNOS5_DT is broken without the above PDMA
defines. Either add the defines, or remove the AUXDATA as part of the
fixes for this release, please.


-Olof
