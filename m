From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: Add CPU performance counters to
 Exynos4 boards
Date: Mon, 4 Dec 2017 10:57:35 +0100
Message-ID: <CAJKOXPe3-3sPCVobaMHWT5B1hT+s2XkXNnZgg0M0bOZPscG2nQ@mail.gmail.com>
References: <20171123143431.12434-1-m.szyprowski@samsung.com>
 <CGME20171123143445eucas1p211f591cae7ad5121f5b5e19ede898db7@eucas1p2.samsung.com>
 <20171123143431.12434-2-m.szyprowski@samsung.com> <5d262ced-6f3b-75a7-53b3-01c64eecebad@fivetechno.de>
 <b3da343b-96ce-64d9-e8ad-86eaf2900fe5@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753119AbdLDJ5i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 04:57:38 -0500
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B07921933
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Dec 2017 09:57:37 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id 64so13067313wme.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Dec 2017 01:57:37 -0800 (PST)
In-Reply-To: <b3da343b-96ce-64d9-e8ad-86eaf2900fe5@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marian Mihailescu <mihailescu2m@gmail.com>

On Mon, Dec 4, 2017 at 10:49 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hi Markus,
>
> On 2017-12-01 12:12, Markus Reichl wrote:
>>
>> Hi Marek,
>>
>> with this patch (linux-next-20171201) I get on odroid-X2
>>
>> [    0.671862] hw perfevents: no interrupt-affinity property for /pmu,
>> guessing.
>> [    0.672242] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7
>> counters available
>> [    0.672618] hw perfevents: no interrupt-affinity property for /arm_pmu,
>> guessing.
>> [    0.672696] genirq: Flags mismatch irq 38. 00010c00 (arm-pmu) vs.
>> 00010c00 (arm-pmu)
>> [    0.672716] hw perfevents: unable to request IRQ38 for ARM PMU counters
>> [    0.672733] hw perfevents: /arm_pmu: failed to register PMU devices!
>> [    0.672761] armv7-pmu: probe of arm_pmu failed with error -16
>>
>> without it
>>
>> [    0.686817] hw perfevents: no interrupt-affinity property for /pmu,
>> guessing.
>> [    0.687194] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7
>> counters available
>>
>> Looks like arm_pmu in exynos4412.dtsi doubles pmu from exynos4.dtsi.
>
>
> You are right. I swear that I've checked exynos4 dts before preparing my
> patch
> and didn't notice existing ARM PMU node there. This means that my patch has
> to
> be reverted/dropped then. Sorry for the noise.

No problem, I'll drop it and rebase my tree.

Best regards,
Krzysztof
