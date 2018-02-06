From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/8] ASoC: samsung: i2s: Prevent external
 abort on exynos5433 I2S1 access
Date: Tue, 6 Feb 2018 13:22:32 +0100
Message-ID: <CAJKOXPcVMbrRyhAhRcB4sRkMnOTrqLDVy4uzt=VEqzEPmxAsPg@mail.gmail.com>
References: <CGME20180205154516epcas1p39c5977145e7b32879b935087ee3865f8@epcas1p3.samsung.com>
 <20180205154403.13520-1-s.nawrocki@samsung.com>
 <20180205154403.13520-4-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180205154403.13520-4-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, jcsing.lee@samsung.com, lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 5, 2018 at 4:43 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> It seems both PCLK_I2S1 and SCLK_I2S1 clocks need to be enabled before
> I2S1 control registers can be accessed on exynos5433, if SCLK clock

Full stop before "if"?

> is disabled an exception is triggered. To fix this parent clock of
> the RCLK_SRC clock is assigned to pri_dai->op_clk so required gate
> clock is handled by the runtime PM ops.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index b7d25a63da8b..1c05170e4999 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -1328,6 +1328,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>                 dev_err(&pdev->dev, "failed to enable clock: %d\n", ret);
>                 return ret;
>         }
> +

This should not be part of this patch. Beside that looks okay.

Best regards,
Krzysztof

>         pri_dai->dma_playback.addr = regs_base + I2STXD;
>         pri_dai->dma_capture.addr = regs_base + I2SRXD;
>         pri_dai->dma_playback.chan_name = "tx";
> @@ -1401,9 +1402,14 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>         pm_runtime_enable(&pdev->dev);
>
>         ret = i2s_register_clock_provider(pdev);
> -       if (!ret)
> -               return 0;
> +       if (ret < 0)
> +               goto err_disable_pm;
> +
> +       pri_dai->op_clk = clk_get_parent(pri_dai->clk_table[CLK_I2S_RCLK_SRC]);
> +
> +       return 0;
>
> +err_disable_pm:
>         pm_runtime_disable(&pdev->dev);
>  err_disable_clk:
>         clk_disable_unprepare(pri_dai->clk);
> --
> 2.14.2
>
