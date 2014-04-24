From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v8 1/3] ARM: EXYNOS: initial board support for exynos5260 SoC
Date: Thu, 24 Apr 2014 12:09:12 -0700
Message-ID: <CAPdUM4O3imVNv3A3K1uEkfohc-r668SC6mVZQRCO8N+waxyb4w@mail.gmail.com>
References: <1397620738-14431-1-git-send-email-rahul.sharma@samsung.com>
	<1397620738-14431-2-git-send-email-rahul.sharma@samsung.com>
	<534E3803.5010404@gmail.com>
	<CAK9yfHztqGWhUJ=PNc7L-epu48PkEM6=v6JFDZ1n52NBeOUB8w@mail.gmail.com>
	<534E3AE7.10907@gmail.com>
	<00eb01cf5e7b$4eb9edf0$ec2dc9d0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:51514 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753229AbaDXTJO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 15:09:14 -0400
In-Reply-To: <00eb01cf5e7b$4eb9edf0$ec2dc9d0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sachin Kamat <sachin.kamat@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, sunil joshi <joshi@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

Hi Kukjin,

Need this macro to enable build for clock driver.

Regards,
Rahul Sharma.


On 22 April 2014 15:36, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Tomasz Figa wrote:
>>
>> On 16.04.2014 10:08, Sachin Kamat wrote:
>> > Hi Tomasz,
>> >
>> > On 16 April 2014 13:27, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> >> Hi Rahul,
>> >>
>> >>
>> >> On 16.04.2014 05:58, Rahul Sharma wrote:
>> >>>
>> >>> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>> >>>
>> >>> This patch add basic arch side support for exynos5260 SoC.
>> >>>
>> >>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> >>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> >>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>> >>> ---
>> >>>    arch/arm/mach-exynos/Kconfig |    5 +++++
>> >>>    1 file changed, 5 insertions(+)
>> >>>
>> >>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-
>> exynos/Kconfig
>> >>> index fc8bf18..bf4ed87 100644
>> >>> --- a/arch/arm/mach-exynos/Kconfig
>> >>> +++ b/arch/arm/mach-exynos/Kconfig
>> >>> @@ -84,6 +84,11 @@ config SOC_EXYNOS5250
>> >>>          help
>> >>>            Enable EXYNOS5250 SoC support
>> >>>
>> >>> +config SOC_EXYNOS5260
>> >>> +       bool "SAMSUNG EXYNOS5260"
>> >>> +       default y
>> >>> +       depends on ARCH_EXYNOS5
>> >>> +
>> >>>    config SOC_EXYNOS5420
>> >>>          bool "SAMSUNG EXYNOS5420"
>> >>>          default y
>> >>>
>> >>
>> >> Is this patch necessary now? After Sachin's consolidation series there
>> are
>> >> no per SoC entries anymore.
>> >
>> > Kukjin still wanted individual SoCs to be selectable. Please refer [1].
>> >
>> > [1] http://www.spinics.net/lists/devicetree/msg27040.html
>>
>> I don't think any valid reason was presented there. Features in code
>> should not be selected using #ifdef CONFIG_ anymore, so I don't really
>> see any reason to not proceed with this consolidation. Olof, Arnd?
>>
> Hi,
>
> Yeah, in this case, nothing happened with adding SOC_EXYNOS5260. So I don't have any idea why this is required.
>
> - Kukjin
>
