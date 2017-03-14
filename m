From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/4] phy: exynos5: Remove duplicated defines of PHY
 register defines
Date: Tue, 14 Mar 2017 16:56:44 +0200
Message-ID: <CAJKOXPcZ4nks2k9M91fr7QX25Zuk-OTUGuvG7xRepE8ZPWSGyg@mail.gmail.com>
References: <20170311182534.13345-1-krzk@kernel.org> <CGME20170314143705epcas5p42e226d072b9ec705bb0dca981923f313@epcas5p4.samsung.com>
 <20170311182534.13345-3-krzk@kernel.org> <10362020.XmlhBa7gD6@amdc3058>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:52364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752874AbdCNO4z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 10:56:55 -0400
In-Reply-To: <10362020.XmlhBa7gD6@amdc3058>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Mar 14, 2017 at 4:37 PM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> On Saturday, March 11, 2017 08:25:32 PM Krzysztof Kozlowski wrote:
>> Phy drivers access PMU region through regmap provided by exynos-pmu
>> driver.   However there is no need to duplicate defines for PMU
>> registers.  Instead just use whatever is defined in exynos-regs-pmu.h.
>>
>> This reduces number of defines and allows removal of one header.
>
> exynos5-pmu.h goes away in patch #4

Right, I will leave only the first part about number of defines.

Thanks,
Krzysztof
