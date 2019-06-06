From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 06/13] drivers: memory: extend of_memory by LPDDR3 support
Date: Thu, 6 Jun 2019 10:27:11 +0200
Message-ID: <CAJKOXPcyOA_wmwUefMMH36qNKBeXwZ47uF+BVMYbkkMDYaaa2w@mail.gmail.com>
References: <CGME20190605165432eucas1p170415ca2025df5b2cefdaa4ae7fb0f64@eucas1p1.samsung.com>
 <20190605165410.14606-1-l.luba@partner.samsung.com> <20190605165410.14606-7-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605165410.14606-7-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 5 Jun 2019 at 18:54, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> The patch adds AC timings information needed to support LPDDR3 and memory
> controllers. The structure is used in of_memory and currently in Exynos
> 5422 DMC. Add parsing data needed for LPDDR3 support.
> It is currently used in Exynos5422 Dynamic Memory Controller.
>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  drivers/memory/of_memory.c | 154 +++++++++++++++++++++++++++++++++++++
>  drivers/memory/of_memory.h |  18 +++++
>  include/memory/jedec_ddr.h |  62 +++++++++++++++
>  3 files changed, 234 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
