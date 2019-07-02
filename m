From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v11 3/9] drivers: memory: extend of_memory by LPDDR3 support
Date: Tue, 2 Jul 2019 14:06:15 +0200
Message-ID: <CAJKOXPcc3q4_GLg21TL=xNO5U1Kp9ZHqpSERHFVCi8OLasgm3Q@mail.gmail.com>
References: <CGME20190701131152eucas1p2c5ac5f1611fd07e3b7a4ad289abe3e81@eucas1p2.samsung.com>
 <20190701131138.22666-1-l.luba@partner.samsung.com> <20190701131138.22666-4-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701131138.22666-4-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 1 Jul 2019 at 15:11, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> The patch adds AC timings information needed to support LPDDR3 and memory
> controllers. The structure is used in of_memory and currently in Exynos
> 5422 DMC. Add parsing data needed for LPDDR3 support.
> It is currently used in Exynos5422 Dynamic Memory Controller.
>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  drivers/memory/of_memory.c | 149 +++++++++++++++++++++++++++++++++++++
>  drivers/memory/of_memory.h |  18 +++++
>  include/memory/jedec_ddr.h |  61 +++++++++++++++
>  3 files changed, 228 insertions(+)

Hi,

As I mentioned before in v10, I can take entire patchset through
samsung-soc but this one patch requires ack or at least reviews.

Best regards,
Krzysztof
