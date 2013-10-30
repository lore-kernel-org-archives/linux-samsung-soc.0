From: Leela Krishna Amudala <leelakrishna.a@gmail.com>
Subject: Re: [PATCH Resend 1/1] Documentation/watchdog: Add binding example in samsung-wdt
Date: Wed, 30 Oct 2013 12:13:49 +0530
Message-ID: <CAL1wa8fDt2O++FwUDa8ErRkSKL_8=f-sjmUN6EcPzxN0+xE6cA@mail.gmail.com>
References: <1383110797-26225-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:39362 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379Ab3J3GoK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 02:44:10 -0400
In-Reply-To: <1383110797-26225-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-watchdog@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, mark.rutland@arm.com, Wim Van Sebroeck <wim@iguana.be>, linux@roeck-us.net

Hi Sachin,

On Wed, Oct 30, 2013 at 10:56 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Added an example for reference.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.txt   |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> index 2aa486c..7ddf461 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> @@ -12,3 +12,12 @@ Required properties:
>
>  Optional properties:
>  - timeout-sec : contains the watchdog timeout in seconds.
> +
> +Example:
> +
> +watchdog@101D0000 {
> +       compatible = "samsung,s3c2410-wdt";
> +       reg = <0x101D0000 0x100>;
> +       interrupts = <0 42 0>;
> +       status = "disabled";
> +};

This example node has been changed and I posted the latest version.
So, you can abandon this patch now.

Best Wishes,
Leela Krishna

> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
