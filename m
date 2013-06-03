From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V4 3/4] ARM: dts: add Exynos audio subsystem clock
 controller node
Date: Mon, 3 Jun 2013 13:13:16 -0700
Message-ID: <CAD=FV=WXEDA+R3BSn7TgSB5BpS2yuWGGmFDpxcQoYmQHGTAQMw@mail.gmail.com>
References: <1370236744-16802-1-git-send-email-padma.v@samsung.com>
	<1370236744-16802-4-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:57699 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753061Ab3FCUNR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Jun 2013 16:13:17 -0400
Received: by mail-lb0-f180.google.com with SMTP id r10so4269437lbi.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Jun 2013 13:13:16 -0700 (PDT)
In-Reply-To: <1370236744-16802-4-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, broonie@kernel.org, Mike Turquette <mturquette@linaro.org>

Padmavathi,

On Sun, Jun 2, 2013 at 10:19 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
> Audio subsystem introduced in s5pv210 and exynos platforms
> which has a internal clock controller. This patch adds a node
> for the same on exynos5250.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index bccda67..388983e 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -72,6 +72,12 @@
>                 #clock-cells = <1>;
>         };
>
> +       clock_audss: audss-clock-controller@3810000 {

Nit: other places in the same file have the leading 0, like
  i2s0: i2s@03830000 {

So you could follow suit and do:

  clock_audss: audss-clock-controller@03810000 {

-Doug
