From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] irqchip: exynos-combiner: remove hard-coded irq_base
 value
Date: Mon, 23 Sep 2013 14:10:55 +0200
Message-ID: <28750420.TCzZ6UT49K@amdc1227>
References: <1379937815-21746-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1379937815-21746-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, tglx@linutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chander,

On Monday 23 of September 2013 17:33:35 Chander Kashyap wrote:
> Replace irq_domain_add_simple with "irq_domain_add_linear" in order to
> use linear irq domain, and to remove hardcoded irq_base_value.
> 
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> ---
> Changes since v1:
> 	- Replaced irq_domain_add_simple with irq_domain_add_linear,
> 	  as suggested by Tomasz
> 
>  drivers/irqchip/exynos-combiner.c |   15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
