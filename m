From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2 0/7] Add G2D nodes to Exynos4 machines
Date: Tue, 26 Mar 2013 22:08:54 +0530
Message-ID: <CAK9yfHwTkPWy5i-NcK3oYYzr_L6kAwXAwky+n6T4NptcokTPFg@mail.gmail.com>
References: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
	<CAK9yfHyQ=2EjRKknhN7nKUygnryKfWZ2A61w1+WRtrzLaF3SBA@mail.gmail.com>
	<052101ce1e25$4370c410$ca524c30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:54009 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754864Ab3CZQiz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 12:38:55 -0400
Received: by mail-ob0-f180.google.com with SMTP id wo10so4851036obc.25
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2013 09:38:54 -0700 (PDT)
In-Reply-To: <052101ce1e25$4370c410$ca524c30$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

On 11 March 2013 12:24, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> Hi Kukjin,
>>
>> Can you please look into this series as it is pending since quite some time.
>>
> Applied, I have another opinion about the compatible string though...

Couldn't find this series in your latest for-next. Please let me know
which branch this is applied to.



>> On 18 February 2013 10:32, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> > This patch series is based on Kukjin Kim's next/dt-exynos branch of
>> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> > tree.
>> >
>> > Changes since v1:
>> > * Removed power-domain entry in patch 1/7 as the driver currently
>> >   does not use it.
>> > * Addressed review comments from Sylwester Nawrocki and Tomasz Figa
>> >   in patch 7/7.
>> >
>> > Sachin Kamat (7):
>> >   ARM: dts: Add G2D node to exynos4210.dtsi
>> >   ARM: dts: Add G2D node to SMDKV310
>> >   ARM: dts: Add G2D node to exynos4210-origen
>> >   ARM: dts: Add G2D node to exynos4x12.dtsi
>> >   ARM: dts: Add G2D node to SMDK4412
>> >   ARM: dts: Add G2D node to exynos4412-origen
>> >   ARM: dts: Add Samsung G2D DT bindings documentation
>



-- 
With warm regards,
Sachin
