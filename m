From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 2/2] MAINTAINERS: Add exynos filename match to ARM/S5P
 EXYNOS ARM ARCHITECTURES
Date: Tue, 18 Jun 2013 00:37:54 +0900
Message-ID: <51BF2D52.2040000@samsung.com>
References: <1371143144-31764-1-git-send-email-dianders@chromium.org> <1371421068-28743-1-git-send-email-dianders@chromium.org> <1371421068-28743-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1371421068-28743-2-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.abraham@linaro.org>, Joe Perches <joe@perches.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Cesar Eduardo Barros <cesarb@cesarb.net>, "David S. Miller" <davem@davemloft.net>, Hans Verkuil <hans.verkuil@cisco.com>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/17/13 07:17, Doug Anderson wrote:
> This will help direct patches related to exynos to the
> linux-samsung-soc mailing list for discussion.
>
> Suggested by Joe Perches.
>
> Signed-off-by: Doug Anderson<dianders@chromium.org>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks,
- Kukjin

> ---
> Changes in v2:
> - New for this version.
>
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f55e3c7..2e95fd8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1140,6 +1140,7 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
>   S:	Maintained
>   F:	arch/arm/mach-s5p*/
>   F:	arch/arm/mach-exynos*/
> +N:	exynos
>
>   ARM/SAMSUNG MOBILE MACHINE SUPPORT
>   M:	Kyungmin Park<kyungmin.park@samsung.com>
