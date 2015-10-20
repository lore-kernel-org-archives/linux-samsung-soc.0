From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 6/8] drivers: soc: add support for exynos SROM driver
Date: Tue, 20 Oct 2015 21:37:03 +0900
Message-ID: <5626356F.4030805@samsung.com>
References: <1445332540-12814-1-git-send-email-pankaj.dubey@samsung.com>
 <1445332540-12814-7-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445332540-12814-7-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: k.kozlowski.k@gmail.com, kgene.kim@samsung.com, p.fedin@samsung.com, thomas.ab@samsung.com, andi.shyti@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 20.10.2015 o 18:15, Pankaj Dubey pisze:
> This patch adds Exynos SROM controller driver which will handle
> save restore of SROM registers during S2R.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  drivers/soc/Kconfig               |   1 +
>  drivers/soc/Makefile              |   1 +
>  drivers/soc/samsung/Kconfig       |  13 +++
>  drivers/soc/samsung/Makefile      |   1 +
>  drivers/soc/samsung/exynos-srom.c | 175 ++++++++++++++++++++++++++++++++++++++
>  drivers/soc/samsung/exynos-srom.h |  51 +++++++++++
>  6 files changed, 242 insertions(+)
>  create mode 100644 drivers/soc/samsung/Kconfig
>  create mode 100644 drivers/soc/samsung/Makefile
>  create mode 100644 drivers/soc/samsung/exynos-srom.c
>  create mode 100644 drivers/soc/samsung/exynos-srom.h
> 

Looks good to me, thanks:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
