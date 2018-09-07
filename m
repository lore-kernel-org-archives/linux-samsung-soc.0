From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: s3c24xx: Correct SD card write protect detection
 on Mini2440
Date: Fri, 7 Sep 2018 14:37:54 +0200
Message-ID: <CAJKOXPc5UTG2viu8KcbthJmdZW06_yAt+JttNBnbMuW4YU8hSQ@mail.gmail.com>
References: <96fe9889-2649-7a1e-23bf-b4d16713d212@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <96fe9889-2649-7a1e-23bf-b4d16713d212@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: sed@free.fr
Cc: kgene@kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 6 Sep 2018 at 23:27, Cedric Roux <sed@free.fr> wrote:
>
> The mini2440 computer uses "active high" to signal that the "write protect"
> of the inserted MMC is set. The current code uses the opposite, leading to
> a wrong detection of write protection. The solution is simply to use
> ".wprotect_invert = 1" in the description of the MMC.
>
> Signed-off-by: Cedric Roux <sed@free.fr>
> ---
>  arch/arm/mach-s3c24xx/mach-mini2440.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
> index 95753e0..4cd8d45 100644
> --- a/arch/arm/mach-s3c24xx/mach-mini2440.c
> +++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
> @@ -232,10 +232,11 @@ static struct s3c2410fb_mach_info mini2440_fb_info __initdata = {
>  /* MMC/SD  */
>
>  static struct s3c24xx_mci_pdata mini2440_mmc_cfg __initdata = {
> -   .gpio_detect   = S3C2410_GPG(8),
> -   .gpio_wprotect = S3C2410_GPH(8),
> -   .set_power     = NULL,
> -   .ocr_avail     = MMC_VDD_32_33|MMC_VDD_33_34,
> +       .wprotect_invert = 1,
> +       .gpio_detect   = S3C2410_GPG(8),
> +       .gpio_wprotect = S3C2410_GPH(8),
> +       .set_power     = NULL,
> +       .ocr_avail     = MMC_VDD_32_33|MMC_VDD_33_34,

I see that entire struct has wrong indentation. In such case can you
send a separate patch cleaning it up, prior to introducing new
feature? First patch would be cleanup and second new feature.

While at cleanup you can also get rid of other checkpatch errors, like:
ERROR: Macros with complex values should be enclosed in parentheses
ERROR: space required after that ',' (ctx:VxV)
WARNING: please, no space before tabs
ERROR: trailing whitespace
WARNING: Avoid unnecessary line continuations
ERROR: "foo * bar" should be "foo *bar"
ERROR: space prohibited before that close parenthesis ')'
WARNING: quoted string split across lines
WARNING: printk() should include KERN_<LEVEL> facility level

Best regards,
Krzysztof
