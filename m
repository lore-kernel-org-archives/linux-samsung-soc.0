From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v4 2/3] ARM: dts: Update the status of RTC DT node of
 Exynos5250 SoC to "okay"
Date: Thu, 15 Aug 2013 10:02:43 +0530
Message-ID: <CAHbNUh3LG4coLDfGZ5b=agaJ0PhhAR0A3Nhq-tPyL78KekhFOw@mail.gmail.com>
References: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org>
	<1376488710-12124-3-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:58941 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752863Ab3HOEco (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Aug 2013 00:32:44 -0400
Received: by mail-ob0-f171.google.com with SMTP id tb18so347600obb.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 21:32:44 -0700 (PDT)
In-Reply-To: <1376488710-12124-3-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org, Doug Anderson <dianders@chromium.org>

On 14 August 2013 19:28, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Updates the RTC DT node's status to "okay", since the bindings in
> exynos5250.dtsi depicts the RTC h/w completely.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index f426ce6..c82137b 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -181,6 +181,7 @@
>         rtc@101E0000 {
>                 clocks = <&clock 337>;
>                 clock-names = "rtc";
> +               status = "okay";
>         };
>

Sometime back we had a discussion on this, the decision was to enable
it in respective boards.

Also if we are going ahead with this, we would need to remove the
corresponding status statements from board files.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2013-June/176402.html

-- 
Tushar Behera
