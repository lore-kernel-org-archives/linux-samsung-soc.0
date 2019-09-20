From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: sound: Convert Samsung I2S controller to
 dt-schema
Date: Fri, 20 Sep 2019 14:43:00 +0200
Message-ID: <20190920124300.GA26917@pi3>
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
 <CGME20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319@eucas1p2.samsung.com>
 <20190920113540.30687-1-m.szyprowski@samsung.com>
 <20190920122616.GA26862@pi3>
 <68ec938a-29b5-0c07-3a5e-771d6ce587b4@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <68ec938a-29b5-0c07-3a5e-771d6ce587b4@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, Maciej Falkowski <m.falkowski@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 20, 2019 at 02:33:13PM +0200, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
 >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/exynos-audss-clk.h>
> > Does it really work? When I tried, it was failing... If you look up at
> > resulting DTS example it is wrong.
> 
> In which way it was wrong? We checked and it was correctly propagated to 
> the example dts. It also compiled fine without errors. The only minor 
> issue was that the include was generated inside the root node, but for 
> the clock definitions this doesn't matter, but it makes the example 
> easier to understand.

Hmmm.... indeed this works. The output DTS is weird as include goes to
example node (not even root) but it compiles. Somehow my previous tries
with it were failing, I need to check why. In general I am all in for
this include.

Best regards,
Krzysztof
