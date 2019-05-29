From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH -next] usb: ohci-s3c2410: Remove set but not used variable 'hcd'
Date: Wed, 29 May 2019 10:06:04 +0200
Message-ID: <CAJKOXPfdhZ1WZZQrqMn69mwJ1aAVVOAD4TJqOc7FMws0+-MG9A@mail.gmail.com>
References: <20190528134305.10184-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528134305.10184-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: stern@rowland.harvard.edu, kgene@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 28 May 2019 at 15:43, YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/usb/host/ohci-s3c2410.c: In function s3c2410_hcd_oc:
> drivers/usb/host/ohci-s3c2410.c:296:18: warning: variable hcd set but not used [-Wunused-but-set-variable]
>
> It is never used, so can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/usb/host/ohci-s3c2410.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
