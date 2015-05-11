From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 2/3] clocksource: exynos_mct: Staticize struct clocksource
Date: Mon, 11 May 2015 16:06:02 +0200
Message-ID: <5550B74A.8010607@linaro.org>
References: <1430368973-23786-1-git-send-email-k.kozlowski@samsung.com> <1430368973-23786-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430368973-23786-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 04/30/2015 06:42 AM, Krzysztof Kozlowski wrote:
> The struct clocksource 'mct_frc' is not exported and used outside so
> make it static.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Applied to my tree for 4.2

   -- Daniel

>   drivers/clocksource/exynos_mct.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/e=
xynos_mct.c
> index 87c2e558c465..8b2a9fc66dcc 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -209,7 +209,7 @@ static void exynos4_frc_resume(struct clocksource=
 *cs)
>   	exynos4_mct_frc_start();
>   }
>
> -struct clocksource mct_frc =3D {
> +static struct clocksource mct_frc =3D {
>   	.name		=3D "mct-frc",
>   	.rating		=3D 400,
>   	.read		=3D exynos4_frc_read,
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
