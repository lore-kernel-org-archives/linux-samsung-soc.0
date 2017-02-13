From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 0/2] [media] exynos-gsc: Fix support for NV21 and NV61 formats
Date: Mon, 13 Feb 2017 09:53:11 -0300
Message-ID: <CABxcv==+Di=i_KBY1LY0Ejo8UXMYa5yhS=bugsyxFkQTyh0xUw@mail.gmail.com>
References: <1485979523-32404-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485979523-32404-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Andi Shyti <andi.shyti@samsung.com>, Thibault Saunier <thibault.saunier@osg.samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On Wed, Feb 1, 2017 at 5:05 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> Hello,
>
> Commit 652bb68018a5 ("[media] exynos-gsc: do proper bytesperline and
> sizeimage calculation") fixed corrupted frames for most exynos-gsc
> formats, but even after that patch two issues were still remaining:
>
> 1) Frames were still not correct for NV21 and NV61 formats.
> 2) Y42B format didn't work when used as output (only as input).
>
> This patch series fixes (1).
>
> Best regards,
> Javier
>
>
> Thibault Saunier (2):
>   [media] exynos-gsc: Do not swap cb/cr for semi planar formats
>   [media] exynos-gsc: Add support for NV{16,21,61}M pixel formats
>
>  drivers/media/platform/exynos-gsc/gsc-core.c | 29 ++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)

Any comments on this series?

Best regards,
Javier
