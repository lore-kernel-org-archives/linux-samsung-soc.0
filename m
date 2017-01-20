From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 2/2] [media] exynos-gsc: Only reset the GSC HW on
 probe() if !CONFIG_PM
Date: Fri, 20 Jan 2017 07:14:06 -0300
Message-ID: <f2ccdd1d-0b70-ecd8-592a-6915164c661b@osg.samsung.com>
References: <1484865380-12651-1-git-send-email-javier@osg.samsung.com>
 <1484865380-12651-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484865380-12651-2-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On 01/19/2017 07:36 PM, Javier Martinez Canillas wrote:
> Commit 15f90ab57acc ("[media] exynos-gsc: Make driver functional when
> CONFIG_PM is unset") removed the implicit dependency that the driver
> had with CONFIG_PM, since it relied on the config option to be enabled.
> 
> In order to work with !CONFIG_PM, the GSC reset logic that happens in
> the runtime resume callback had to be executed on the probe function.
> 
> But there's no need to do this if CONFIG_PM is enabled, since in this
> case the runtime PM resume callback will be called by VIDIOC_STREAMON
> ioctl, so the resume handler will call the GSC HW reset function.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 

Please ignore this patch as suggested by Marek in other thread.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
