From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] [media] exynos-gsc: remove an always false condition
Date: Thu, 14 Apr 2016 11:05:17 +0200
Message-ID: <570F5D4D.9040207@samsung.com>
References: <26a7ed9c18193dc7a3dfba33e3c711822f4bdd29.1460575950.git.mchehab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <26a7ed9c18193dc7a3dfba33e3c711822f4bdd29.1460575950.git.mchehab@osg.samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kamil Debski <k.debski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/13/2016 09:32 PM, Mauro Carvalho Chehab wrote:
> As reported by smatch:
> drivers/media/platform/exynos-gsc/gsc-core.c:1073 gsc_probe() warn: impossible condition '(gsc->id < 0) => (0-65535 < 0)'
> drivers/media/platform/exynos-gsc/gsc-core.c: In function 'gsc_probe':
> drivers/media/platform/exynos-gsc/gsc-core.c:1073:51: warning: comparison is always false due to limited range of data type [-Wtype-limits]
>   if (gsc->id >= drv_data->num_entities || gsc->id < 0) {
>                                                    ^
> 
> gsc->id is an u16, so it can never be a negative number. So,
> remove the always false condition.
> 
> Fixes: c1ac057173ba "[media] exynos-gsc: remove non-device-tree init code"
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

Thanks for fixing this.
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Regards,
Sylwester
