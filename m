From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH 1/3] clk: exynos-audss: Keep the parent of mout_audss always enabled
Date: Wed, 11 Jun 2014 09:50:38 -0700
Message-ID: <7ha99jjspt.fsf@paris.lan>
References: <1402464739-19044-1-git-send-email-tushar.b@samsung.com>
	<1402464739-19044-2-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402464739-19044-2-git-send-email-tushar.b@samsung.com> (Tushar
	Behera's message of "Wed, 11 Jun 2014 11:02:17 +0530")
Sender: linux-kernel-owner@vger.kernel.org
To: Tushar Behera <tushar.b@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, t.figa@samsung.com, linux@arm.linux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, kgene.kim@samsung.com, dianders@google.com, trblinux@gmail.com, Shaik Ameer Basha <shaik.ameer@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Tushar Behera <tushar.b@samsung.com> writes:

> When the output clock of AUDSS mux is disabled, we are getting kernel
> oops while doing a clk_get() on other clocks provided by AUDSS. 
>
> Though user manual doesn't specify this dependency, we came across
> this issue while disabling the parent of AUDSS mux clocks.
>
> Keeping the parents of AUDSS mux always enabled fixes this issue.

While this patch works (and fixes the boot problem for me), it seems
like it's papering over the real problem.

Seems like the right fix is actually modelling the clocks properly so
that enabling a child clock ensures that the parent is also enabled.

Kevin
