From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/3] clk: Add __clk_hw_set_clk helper function
Date: Thu, 12 Feb 2015 11:55:16 -0800
Message-ID: <54DD0524.4060503@codeaurora.org>
References: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk> <1423749510-14525-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423749510-14525-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Mike Turquette <mturquette@linaro.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?windows-1252?Q?Emilio_?= =?windows-1252?Q?L=F3pez?= <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 02/12/15 05:58, Javier Martinez Canillas wrote:
> After the clk API change to return a per-user clock instance, both the
> struct clk_core and struct clk pointers from the hw clock needs to be
> assigned to clock that share the same state.
>
> In the future the struct clk_core will be removed and this is going to

s/clk_core/clk/?

> change again so to avoid having to change the assignments twice in all
> the drivers, add a helper function to have an indirection level.
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
