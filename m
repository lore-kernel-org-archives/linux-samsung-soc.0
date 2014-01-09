From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 4/6 v2] crypto:s5p-sss: Kconfig: Let Exynos SoCs select
 SSS driver
Date: Thu, 9 Jan 2014 14:59:26 +0530
Message-ID: <CAK9yfHyya0LwYp0f2ZrBbb9M51FVxnBkZuHqrD1ju9yDBffmqg@mail.gmail.com>
References: <1389095509-14357-5-git-send-email-ch.naveen@samsung.com>
	<1389243595-13207-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1389243595-13207-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-crypto@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, vzapolskiy@gmail.com, Herbert Xu <herbert@gondor.apana.org.au>, Tomasz Figa <tomasz.figa@gmail.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Naveen,

On 9 January 2014 10:29, Naveen Krishna Chatradhi <ch.naveen@samsung.com> wrote:
> From: Naveen Krishna Ch <ch.naveen@samsung.com>
>
> This patch modifies Kconfig such that ARCH_EXYNOS SoCs
> which includes (Exynos4210, Exynos5250 and Exynos5420)
> can also select Samsung SSS(Security SubSystem) driver.

What about Exynos4x12 and 5440 as they too come under ARCH_EXYNOS?

-- 
With warm regards,
Sachin
