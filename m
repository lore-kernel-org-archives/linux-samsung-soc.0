From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] [media] exynos-gsc: Do not swap cb/cr for semi planar
 formats
Date: Mon, 13 Feb 2017 15:35:16 +0100
Message-ID: <983a36ab-bcba-b51d-6078-5d020b47b8d1@samsung.com>
References: <1485979523-32404-1-git-send-email-javier@osg.samsung.com>
 <1485979523-32404-2-git-send-email-javier@osg.samsung.com>
 <CGME20170213143524epcas5p1e1fdcf49d5fd9b0c40cc9ffe849f10d9@epcas5p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1485979523-32404-2-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Andi Shyti <andi.shyti@samsung.com>, Thibault Saunier <thibault.saunier@osg.samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/01/2017 09:05 PM, Javier Martinez Canillas wrote:
> From: Thibault Saunier <thibault.saunier@osg.samsung.com>
> 
> In the case of semi planar formats cb and cr are in the same plane
> in memory, meaning that will be set to 'cb' whatever the format is,
> and whatever the (packed) order of those components are.
> 
> Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Thibault Saunier <thibault.saunier@osg.samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
