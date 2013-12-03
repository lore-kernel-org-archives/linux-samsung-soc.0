From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] hwmon: ntc_thermistor: Fix typo (pullup-uV -> pullup-uv)
Date: Mon, 2 Dec 2013 23:44:41 -0600
Message-ID: <CAL_JsqLQaAJiaCYh3=NyEM7h02z_UCmeX8q_L-Cguj==F9pfbw@mail.gmail.com>
References: <1382492690-4056-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f179.google.com ([209.85.128.179]:62760 "EHLO
	mail-ve0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752333Ab3LCFoo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Dec 2013 00:44:44 -0500
In-Reply-To: <1382492690-4056-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Jonathan Cameron <jic23@kernel.org>, ch.naveen@samsung.com, Douglas Anderson <dianders@chromium.org>, Lars-Peter Clausen <lars@metafoo.de>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>

On Tue, Oct 22, 2013 at 8:44 PM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> This patch fix typo of property name from 'pullup-uV' to 'pullup-uv'.
> The ntc_thermistor.c use 'pullup-uv' when parsing dt data.
>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Applied for 3.13.

Rob
