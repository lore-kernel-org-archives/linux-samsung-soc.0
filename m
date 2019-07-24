From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH 03/11] devfreq: exynos-bus: Change goto-based logic
 to if-else logic
Date: Wed, 24 Jul 2019 21:10:06 +0200
Message-ID: <20190724191006.GF14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122024eucas1p1ff060d072132bfbc8a8a1d10fa1f90f8@eucas1p1.samsung.com>
 <20190723122016.30279-4-a.swigon@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-4-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jul 23, 2019 at 02:20:08PM +0200, Artur Świgoń wrote:
> This patch improves code readability by changing the following construct:
> 
> >    if (cond)
> >        goto passive;
> >    foo();
> >    goto out;
> >passive:
> >    bar();
> >out:
> 
> into this:
> 
> >    if (cond)
> >        bar();
> >    else
> >        foo();
> 
> Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
> ---
>  drivers/devfreq/exynos-bus.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)

Code looks much better:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
