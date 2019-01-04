From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: mach-s3c24xx: Fix boolean expressions in osiris_dvs_notify
Date: Fri, 4 Jan 2019 14:27:17 +0100
Message-ID: <CAJKOXPcihzhU+K72p+B83kwXQECYgekSSjy3wZ9eaFi5qTnY_w@mail.gmail.com>
References: <20190103201408.GA27754@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190103201408.GA27754@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Ben Dooks <ben@simtec.co.uk>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 3 Jan 2019 at 21:46, Gustavo A. R. Silva <gustavo@embeddedor.com> wrote:
>
> Fix boolean expressions by using logical AND operator '&&'
> instead of bitwise operator '&'.
>
> This issue was detected with the help of Coccinelle.
>
> Fixes: 4fa084af28ca ("ARM: OSIRIS: DVS (Dynamic Voltage Scaling) supoort.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  arch/arm/mach-s3c24xx/mach-osiris-dvs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
> index 058ce73137e8..ccbd7b7965ca 100644
> --- a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
> +++ b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
> @@ -65,16 +65,16 @@ static int osiris_dvs_notify(struct notifier_block *nb,
>
>         switch (val) {
>         case CPUFREQ_PRECHANGE:
> -               if (old_dvs & !new_dvs ||
> -                   cur_dvs & !new_dvs) {
> +               if (old_dvs && !new_dvs ||
> +                   cur_dvs && !new_dvs) {

Technically the old code will work fine because all variables are
bools (so 0 or 1). Therefore I am not sure whether this should be
ported to stable.

Anyway the patch is itself okay and I will take it after merge window. Thanks!

Best regards,
Krzysztof
