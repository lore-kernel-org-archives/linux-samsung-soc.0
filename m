From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/3] clk: Don't dereference parent clock if is NULL
Date: Thu, 12 Feb 2015 11:00:16 -0800
Message-ID: <54DCF840.60709@codeaurora.org>
References: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk> <1423749510-14525-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423749510-14525-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Mike Turquette <mturquette@linaro.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?windows-1252?Q?Emilio_?= =?windows-1252?Q?L=F3pez?= <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 02/12/15 05:58, Javier Martinez Canillas wrote:
> The clock passed as an argument to clk_mux_determine_rate_flags()
> has the CLK_SET_RATE_PARENT flag set but it has no parent, then a
> NULL pointer will tried to be dereferenced.
>
> This shouldn't happen since setting that flag for a clock with no
> parent is a bug but the core should be robust to handle that case.
>
> Fixes: 035a61c314eb3 ("clk: Make clk API return per-user struct clk instances")
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
