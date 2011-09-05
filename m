From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/2] mmc: sdhci-s3c: add default controller configuration
Date: Mon, 5 Sep 2011 13:28:13 +0530
Message-ID: <CAJuYYwQ-tCFnL9ti5rtuGuqYkT+g7MEqdD1EpXOiC71zxeJbyg@mail.gmail.com>
References: <1314976702-19284-1-git-send-email-thomas.abraham@linaro.org>
	<1314976702-19284-2-git-send-email-thomas.abraham@linaro.org>
	<4E64265D.9090206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <4E64265D.9090206@samsung.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cjb@laptop.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jaehoon,

On 5 September 2011 07:01, Jaehoon Chung <jh80.chung@samsung.com> wrote:
> Hi Thomas.
>
> I have some question. This patch looks good.
> Some names are used S3C_SDHCI_xxxx. but some names are used S3C64XX_SDHCI_xxxx.
> Do you know what differ them?

I am not sure why there are S3C_SDHCI_xxx and S3C64XX_SDHCI_xxx
macros. This patch reused the existing macros from regs-sdhci.h file.
It should be possible to rename S3C64XX_SDHCI_xxx to S3C_SDHCI_xxx.

Thanks,
Thomas.

>
> Thanks,
> Jaehoon Chung
>
[...]
