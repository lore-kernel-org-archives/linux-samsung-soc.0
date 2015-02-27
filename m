From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] phy: exynos-dp-video: Kill exynos_dp_video_phy_pwr_isol
 function
Date: Fri, 27 Feb 2015 14:44:49 +0100
Message-ID: <54F074D1.50904@samsung.com>
References: <1425011650.23256.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1425011650.23256.1.camel@phoenix>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 27/02/15 05:34, Axel Lin wrote:
> If IS_ERR(state->regs) the .probe fails.
> So IS_ERR(state->regs) test in exynos_dp_video_phy_pwr_isol() is not necessary.
> exynos_dp_video_phy_pwr_isol() simply does a regmap_update_bits() call now,
> just call regmap_update_bits() instead and return proper return value.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
