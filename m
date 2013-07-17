From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/2] clk: exynos4: Remove unused external clock
 registration function
Date: Wed, 17 Jul 2013 20:00:19 +0530
Message-ID: <CAK9yfHxam3dunXcjZCHQRryWNemFCnntnQ=rf-R-reqxeR9CYg@mail.gmail.com>
References: <1374058786-16603-1-git-send-email-broonie@kernel.org>
	<1374058786-16603-2-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374058786-16603-2-git-send-email-broonie@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 17 July 2013 16:29, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> As the comment says exynos4_clk_register_fixed_ext() was only used by
> non-DT platforms. Since Exynos is now DT only it is no longer referenced
> and can be removed.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>

Similar patch has already been posted
http://www.spinics.net/lists/arm-kernel/msg258043.html

-- 
With warm regards,
Sachin
