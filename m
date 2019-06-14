From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 01/13] clk: samsung: add needed IDs for DMC clocks in Exynos5420
Date: Fri, 14 Jun 2019 14:04:27 +0200
Message-ID: <CAJKOXPeeVhHS62jiUgwySf5EYzW2Rkvu=HxyA7NjpGZFp=fWYQ@mail.gmail.com>
References: <CGME20190614095320eucas1p2919a6169c997bb81c80416e8a0ede538@eucas1p2.samsung.com>
 <20190614095309.24100-1-l.luba@partner.samsung.com> <20190614095309.24100-2-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614095309.24100-2-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>, linux-clk@vger.kernel.org, s.nawrocki@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 14 Jun 2019 at 11:53, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> Define new IDs for clocks used by Dynamic Memory Controller in
> Exynos5422 SoC.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  include/dt-bindings/clock/exynos5420.h | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

I do not quite understand why this patch is still being resent instead
of have been applied some time ago. Are there any issues here? Or are
there any issues with the entire patchset (except some review comments
to be resolved)? If not, then this is a dependency which should go
regardless of other patches. There is no point to keep it pending...
All other changes, e.g. DTS will have to wait for more cycles till
this gets in.

Therefore either please apply this or please comment what is stopping
dependencies from being applied.

Best regards,
Krzysztof
