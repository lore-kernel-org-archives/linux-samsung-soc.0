From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 6/8 v3] ARM: dts: exynos5250/5420: add dt node for sss
 module
Date: Fri, 10 Jan 2014 17:00:58 +0100
Message-ID: <52D0193A.30301@samsung.com>
References: <1389243621-13245-1-git-send-email-ch.naveen@samsung.com>
 <1389354291-32051-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-reply-to: <1389354291-32051-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vzapolskiy@gmail.com, herbert@gondor.apana.org.au, naveenkrishna.ch@gmail.com, cpgs@samsung.com, tomasz.figa@gmail.com, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Naveen,

On 10.01.2014 12:44, Naveen Krishna Chatradhi wrote:
> This patch adds the device tree node for SSS module
> found on Exynos5420 and Exynos5250
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> TO: <linux-samsung-soc@vger.kernel.org>
> CC: Kukjin Kim <kgene.kim@samsung.com>
> CC: <linux-crypto@vger.kernel.org>
> ---
> Changes since v2:
> 1. Added device tree node for SSS on Exynos5250 aswell
>
>   arch/arm/boot/dts/exynos5250.dtsi |    8 ++++++++
>   arch/arm/boot/dts/exynos5420.dtsi |   10 ++++++++++
>   2 files changed, 18 insertions(+)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
