From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] ARM: S5P[v210|c100|64x0]: Fix build error
Date: Wed, 15 Jan 2014 13:48:52 +0100
Message-ID: <CACRpkdZmNb+-BJdxcKMBe-LTT9-325KosEp0jTniAgBoD0hcdQ@mail.gmail.com>
References: <1389776489-29853-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1389776489-29853-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kgene Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 15, 2014 at 10:01 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> gpio-samsung.h header file introduced by commit 93177be0910c
> ("ARM: S3C[24|64]xx: move includes back under <mach/> scope")
> is required only by S3C[24|64]xx machines. Include them conditionally
> to avoid the following build errors for other machine configurations.
> drivers/gpio/gpio-samsung.c:35:31: fatal error: mach/gpio-samsung.h: No such file or directory
> arch/arm/plat-samsung/pm-gpio.c:22:31: fatal error: mach/gpio-samsung.h: No such file or directory
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Damned I couldn't get rid of the ifdefs anyway :-(

Thanks Sachin, patch applied.

Yours,
Linus Walleij
