From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] ARM: multi_v7_defconfig: Enable CPUFreq governors as modules
Date: Tue, 12 Apr 2016 16:20:12 +0200
Message-ID: <CAJKOXPePp9S9y=vrOf+H0Vu_vD_AZ0VN+MUTBQWyZRF3PowRNw@mail.gmail.com>
References: <1460142130-31822-1-git-send-email-javier@osg.samsung.com>
	<1460142130-31822-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460142130-31822-2-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Apr 8, 2016 at 9:02 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> Currently only the ondemand and performance CPUFreq policy governors are
> enabled in multi_v7 defconfig. But the other governors are also useful
> for some cases, enable them to allow users change the default if needed.
>
> The options are enabled as module to keep the kernel image size minimal.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>
> ---
>
>  arch/arm/configs/multi_v7_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Krzysztof
