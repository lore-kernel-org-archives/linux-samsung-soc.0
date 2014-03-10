From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: Move exynos-audss-clk.h to dt-bindings/clock
Date: Mon, 10 Mar 2014 01:20:30 +0100
Message-ID: <531D054E.70008@gmail.com>
References: <1394085884-13081-1-git-send-email-tushar.behera@linaro.org> <1394085884-13081-3-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1394085884-13081-3-git-send-email-tushar.behera@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: mark.rutland@arm.com, kgene.kim@samsung.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, t.figa@samsung.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, plagnioj@jcrosoft.com, linux@maxim.org.za
List-Id: linux-samsung-soc@vger.kernel.org

On 06.03.2014 07:04, Tushar Behera wrote:
> Most of the clock related dt-binding header files are located in
> dt-bindings/clock folder. It would be good to keep all the similar
> header files at a single location.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> CC: Kukjin Kim <kgene.kim@samsung.com>
> CC: Tomasz Figa <t.figa@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5250.dtsi                  |    2 +-
>   arch/arm/boot/dts/exynos5420.dtsi                  |    2 +-
>   drivers/clk/samsung/clk-exynos-audss.c             |    2 +-
>   .../dt-bindings/{clk => clock}/exynos-audss-clk.h  |    0
>   4 files changed, 3 insertions(+), 3 deletions(-)
>   rename include/dt-bindings/{clk => clock}/exynos-audss-clk.h (100%)

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
