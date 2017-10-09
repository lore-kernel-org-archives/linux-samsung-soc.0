From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/4] Fix problems with Exynos4412 ISP clocks
Date: Mon, 9 Oct 2017 12:49:53 +0200
Message-ID: <CAJKOXPd5_tV_VenxOL-H_z+ej0QR7X8F3DBZ=Mneu_9pe+h4QQ@mail.gmail.com>
References: <CGME20171002104824eucas1p1f9795b5403b6cd599b1e33e9dc7b604f@eucas1p1.samsung.com>
 <20171002104759.25944-1-m.szyprowski@samsung.com> <cdea0207-adea-d9e3-f95a-64188bd4bcca@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751257AbdJIKt4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 06:49:56 -0400
In-Reply-To: <cdea0207-adea-d9e3-f95a-64188bd4bcca@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Mon, Oct 9, 2017 at 12:34 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 10/02/2017 12:47 PM, Marek Szyprowski wrote:
>> Patch summary:
>>
>> Marek Szyprowski (4):
>>   clk: samsung: Instantiate Exynos4412 ISP clocks only when available
>>   clk: samsung: Add a separate driver for Exynos4412 ISP clocks
>>   ARM: dts: exynos: Add Exynos4412 ISP clock controller
>>   clk: samsung: Remove obsolete code for Exynos4412 ISP clocks
>
> I have applied whole series, with v2 of patch 2/4, thanks.

You mean you applied 1/4 and 2/4 for now, right? 3/4 will go through
my tree in release after this and 4/4 even later?

BR,
Krzysztof
