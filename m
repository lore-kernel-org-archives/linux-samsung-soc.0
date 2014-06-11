From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RESEND PATCH v2] clk: exynos4: Add PPMU IP block source clocks.
Date: Wed, 11 Jun 2014 02:30:17 +0200
Message-ID: <5397A319.8030209@gmail.com>
References: <1402446171-3560-1-git-send-email-jonghwa3.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402446171-3560-1-git-send-email-jonghwa3.lee@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonghwa Lee <jonghwa3.lee@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, mturquette@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jonghwa,

On 11.06.2014 02:22, Jonghwa Lee wrote:
> Exynos4 has saveral PPMUs and each of them has operation clock which
> can be gated through CMU's SFR control.
> 
> New clocks are listed below. All clocks are added as a gate-typed clock.
> 
> CLK_PPMULEFT, CLK_PPMURIGHT, CLK_PPMUCAMIF, CLK_PPMUTV, CLK_PPMUMFC_L,
> CLK_PPMUMFC_R, CLK_G3D, CLK_PPMUIMAGE, CLK_PPMULCD0, CLK_PPMULCD1,
> CLK_PPMUFILE, CLK_PPMUGPS, CLK_PPMUDMC0, CLK_PPMUDMC1, CLK_PPMUCPU,
> CLK_PPMUACP,
> 
> Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  V2 :
>     - Change clock definition order.
> 
>  drivers/clk/samsung/clk-exynos4.c   |   19 +++++++++++++++++++
>  include/dt-bindings/clock/exynos4.h |   18 ++++++++++++++++++
>  2 files changed, 37 insertions(+)

I have already queued the original v2 you sent, just waiting for
3.16-rc1 to be released to apply. :)

Best regards,
Tomasz
