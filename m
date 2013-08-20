From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 01/16] pwm: samsung: Update DT bindings documentation
 to cover clocks
Date: Tue, 20 Aug 2013 14:34:30 -0600
Message-ID: <5213D2D6.50603@wwwdotorg.org>
References: <1377019903-14614-1-git-send-email-t.figa@samsung.com> <1377019903-14614-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:44704 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188Ab3HTUef (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 16:34:35 -0400
In-Reply-To: <1377019903-14614-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Kyungmin Park <kyungmin.park@samsung.com>

On 08/20/2013 11:31 AM, Tomasz Figa wrote:
> PWM driver consumes at least one and up to three clocks, which need to be
> specified in device tree when used. This patch updates bindings
> documentation to add information about clocks.

> diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.txt b/Documentation/devicetree/bindings/pwm/pwm-samsung.txt

> +- clock-names: should contain all following required clock names:
> +    - "timers" - PWM base clock used to generate PWM signals,
> +  and any subset of following optional clock names:
> +    - "pwm-tclk0" - first external PWM clock source,
> +    - "pwm-tclk1" - second external PWM clock source.
> +  Note that not all IP variants allow using all external clock sources.
> +  Refer to SoC documentation to learn which clock source configurations
> +  are available.

It might be nice to explicitly enumerate which variants (or rather, I
suppose which exact compatible values) support which optional clocks.
However, I suppose it's fine to just say "go read the HW manual" instead.

So, this patch,
Acked-by: Stephen Warren <swarren@nvidia.com>

(although this patch isn't backwards-compatible since before now, DT
nodes didn't need to provide any entries in clocks)
