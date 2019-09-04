From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 0/8] Exynos5 Dynamic Memory Controller driver
Date: Wed, 4 Sep 2019 12:16:51 +0200
Message-ID: <CAJKOXPehHNDasNQDgTC+WtVpb_h-s0iTxXiDQY1WT=+zEdB18A@mail.gmail.com>
References: <CGME20190821104316eucas1p2ecd715f3105921ec83e0acf1291201f8@eucas1p2.samsung.com>
 <20190821104303.32079-1-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821104303.32079-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 21 Aug 2019 at 12:43, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> Hi all,
>
> This is v13 which makes cosmetic changes. It is based on current mainline
> (v5.3-rc5) with with devfreq/for-next where there is a PPMU patch [1].
>
> The patch set adds support of Dynamic Memory Controller for Exynos5422 SoC.
> The driver supports Dynamic Voltage and Frequency Scaling
> for the DMC and DRAM. It also provides needed timings for different
> speed operations of the DRAM memory.
> There is also new generic code in of_memory and headers which allows to parse
> LPDDR3 memories defined in device-tree.
>
> Here are the last changes suggested by Krzysztof during his review.
> For the previous changes in older revisions please refer to [2], there is
> more detailed change log.
>
> changes:
> v13:
> - skipped patch with chipID changes in DT, since it is not used anymore,
> - removed license comment in of_memory.c since SPDX has been merged,
> - aligned comment to the current fields in the structure,
> - changed printed warning when timings are not found,
>
> Regards,
> Lukasz Luba
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git/commit/?h=for-next&id=b617376df8f01c975dee66802f4da16291f92079
> [2] https://lkml.org/lkml/2019/7/22/251
>

Hi Lukasz,

Thanks for the effort and work on this patchset. The text-based
bindings are slowly converted to JSON-schema but your patches were
developed some time ago and have Rob's review. It would be nice if you
or someone converted it to JSON schema later.
Anyway, I'll pick up everything today evening either for this merge
window or eventually postponed till next one. It is quite late in the
cycle and I want the patches to sit in linux-next for some time.

Best regards,
Krzysztof
