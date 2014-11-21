From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2] serial: samsung: Fix serial config dependencies for
 exynos7
Date: Sat, 22 Nov 2014 00:11:15 +0900
Message-ID: <546F5613.1020208@kernel.org>
References: <1416199491-4841-1-git-send-email-a.kesavan@samsung.com> <1416383812-714-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416383812-714-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, jslaby@suse.cz, kesavan.abhilash@gmail.com, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 11/19/14 16:56, Abhilash Kesavan wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
> 
> Exynos7 has a similar serial controller to that present in older Samsung
> SoCs. To re-use the existing serial driver on Exynos7 we need to have
> SERIAL_SAMSUNG_UARTS_4 and SERIAL_SAMSUNG_UARTS selected. This is not
> possible because these symbols are dependent on PLAT_SAMSUNG which is
> not present for the ARMv8 based exynos7.
> 
> Change the dependency of these symbols from PLAT_SAMSUNG to the serial
> driver thus making it available on exynos7. As the existing platform
> specific code making use of these symbols is related to uart driver this
> change in dependency should not cause any issues.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Changes in v2:
> 	- Added Greg's ack and Kukjin Kim as a recepient

Applied, thanks.

- Kukjin
