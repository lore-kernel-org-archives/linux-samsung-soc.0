From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [GIT PULL 2/2] Samsung fixes-2 for v4.0
Date: Fri, 6 Mar 2015 11:07:34 +0100
Message-ID: <CABxcv==QyMUr6jUpzkWqpKCWc_msokCefxrBGvmDHrtgXmevig@mail.gmail.com>
References: <54F4B33E.3070803@kernel.org>
	<2064108.qlOP0oDx90@wuerfel>
	<20154650.hb5Lekq8n0@wuerfel>
	<CABxcv=nTi_+qkNhw=4NypNnR795cX4QUsWLOR4S+2w3suXvz5g@mail.gmail.com>
	<027501d057f1$f13a5090$d3aef1b0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:36351 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754221AbbCFKHg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Mar 2015 05:07:36 -0500
Received: by wghk14 with SMTP id k14so8308526wgh.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2015 02:07:35 -0800 (PST)
In-Reply-To: <027501d057f1$f13a5090$d3aef1b0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lukasz Majewski <l.majewski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org, Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello Kukjin,

On Fri, Mar 6, 2015 at 10:43 AM, Kukjin Kim <kgene@kernel.org> wrote:
> Javier Martinez Canillas wrote:
>>
>> Hello Arnd,
>>
> Hi,
>
>> On Thu, Mar 5, 2015 at 12:04 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> > On Wednesday 04 March 2015 21:04:40 Arnd Bergmann wrote:
>> >> On Tuesday 03 March 2015 04:00:14 Kukjin Kim wrote:
>> >> > Please pull Samsung tmu and hdmi regression fixes for v4.0 and I know
>> >> > this is quite big for fixes but I couldn't handle this series for
>> >> > previous merge window because of dependency with driver side...sorry for
>> >> > that and please pull so that we could support them in v4.0 on exynos
>> >> > platforms.
>> >>
>> >> What kind of dependency do you have there? It really should not be
>> >> necessary to wait for driver changes, unless you do an incompatible
>> >> DT binding change, which you should avoid.
>> >>
>> >> I've pulled it into fixes, but won't forward it until I hear a
>> >> good explanation.
>> >
>> > Even with both fixes-1 and fixes-2 applied, we still get boot failures
>> > on Exynos:
>> >
>> > http://arm-soc.lixom.net/bootlogs/arm-soc/v4.0-rc2-104-g2ee4716/
>> >
>> > Any idea what is going on?
>> >
>>
>> Yes, the problem is the Exynos DRM driver which has a lot of issues.
>> It's broken if CONFIG_DRM_EXYNOS_IOMMU is enabled which defaults to
>> yes after commit 8dcc14f82f06 ("drm/exynos: IOMMU support should not
>> be selectable by user").
>>
>> I posted a patch to disable IOMMU support on Exynos to avoid these
>> boot failures and also mentioned to Kukjin that it should be a fix for
>> 4.0 [0]. But even with IOMMU disabled, the Exynos DRM is broken in
>> some boards [1] so we may have to disable that driver until everything
>> gets sorted out and is stable again.
>>
> Yes, the fix is in my tree and it will be sent to upstream via arm-soc soon.
>

Thanks a lot for your help. You meant the patch to disable IOMMU
support right? While being there could you please also disable the DRM
driver as discussed since is unlikely that the Exynos DRM maintainers
would be able to sort out all the issues in time for 4.0.

> Thanks,
> Kukjin
>

Best regards,
Javier
