From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 0/3] Add support for hardware reset of eMMC card on reboot
Date: Mon, 2 Feb 2015 09:51:02 +0100
Message-ID: <CABxcv=m2UjyF3V_B0PZkfA_jFkUPpKL+ZAmgBxTzmUb7JSwLiQ@mail.gmail.com>
References: <1422866028-27891-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1422866028-27891-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <liquid.acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Sebastian Reichel <sre@kernel.org>, Seungwon Jeon <tgih.jun@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, Chris Ball <chris@printf.net>, Joonyoung Shim <jy0922.shim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On Mon, Feb 2, 2015 at 9:33 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> This patchset adds new mmc power sequence driver, which performs eMMC
> card hardware reset. Such power sequence, involving resetting emmc card,
> is required on some boards to properly perform system reboot procedure.
>

Patches looks good to me, I've only one comment on patch 1/3. Once
that is addressed, feel free to add for all the series:

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
