From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] [media] exynos-gsc: fix s2r functionality
Date: Wed, 07 Aug 2013 18:53:48 +0200
Message-ID: <52027B9C.7020704@samsung.com>
References: <1375879984-19052-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1375879984-19052-1-git-send-email-arun.kk@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com, prathyush.k@samsung.com, arun.m@samsung.com, arunkk.samsung@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On 08/07/2013 02:53 PM, Arun Kumar K wrote:
> From: Prathyush K <prathyush.k@samsung.com>
> 
> When gsc is in runtime suspended state, there is no need to call
> m2m_suspend during suspend and similarily, there is no need to call

s/similarily/similarly. I'll fix that typo when applying.

> m2m_resume during resume if already in runtime suspended state. This
> patch adds the necessary conditions to achieve this.
> 
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Arun Mankuzhi <arun.m@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>

Thanks, that looks good. I'll queue it for 3.12. We actually have
similar patch for the exynos4-is fimc-is-i2c driver.

However this is sort of things that IMO should ideally be handled
in the PM core.

-- 
Sylwester Nawrocki
Samsung R&D Institute Poland
