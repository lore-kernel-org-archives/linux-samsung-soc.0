From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: exynos4: skip gpiolib registration if pinctrl
 driver is used
Date: Tue, 5 Jun 2012 14:46:18 +0200
Message-ID: <CACRpkda1iiOFfjWbtJTf=R7qqHkzPbA3oTsWSiC08W_zctaexQ@mail.gmail.com>
References: <1337816857-14694-1-git-send-email-thomas.abraham@linaro.org>
	<1337816857-14694-4-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1337816857-14694-4-git-send-email-thomas.abraham@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, May 24, 2012 at 1:47 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> Pinctrl driver, when enabled, registers all the gpio pins and hence the
> registration of gpio pins by this driver can be skipped.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess it's already applied... sorry for taking so long time
to respond.

Yours,
Linus Walleij
