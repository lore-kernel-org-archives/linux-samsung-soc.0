From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Patch v2 01/10] drm/exynos: using dev_get_drvdata directly
Date: Thu, 4 Jul 2019 15:09:59 +0100
Message-ID: <CACvgo50s0oh3tRjpUxeTkpFGJXahwB72hW=cc-de=2MG587m3Q@mail.gmail.com>
References: <20190704023436.4456-1-huangfq.daxian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704023436.4456-1-huangfq.daxian@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fuqian Huang <huangfq.daxian@gmail.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 4 Jul 2019 at 08:26, Fuqian Huang <huangfq.daxian@gmail.com> wrote:
>
> Several drivers cast a struct device pointer to a struct
> platform_device pointer only to then call platform_get_drvdata().
> To improve readability, these constructs can be simplified
> by using dev_get_drvdata() directly.
>
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
Thanks for the update. This patch is:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
