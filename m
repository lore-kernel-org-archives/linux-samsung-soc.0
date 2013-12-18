From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: add board dts file for EXYNOS4412 based
 TINY4412 board
Date: Wed, 18 Dec 2013 16:01:36 +0100
Message-ID: <1486025.NpqSQkmkfm@amdc1227>
References: <1387373039-4738-1-git-send-email-kasimling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1387373039-4738-1-git-send-email-kasimling@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Ling <kasimling@gmail.com>
Cc: rob.herring@calxeda.com, mark.rutland@arm.com, linux@arm.linux.org.uk, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, kgene.kim@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Alex,

On Wednesday 18 of December 2013 21:23:59 Alex Ling wrote:
> Add a minimal board dts file for EXYNOS4412 based FriendlyARM's
> TINY4412 board. This patch including support peripherals like
> UART, SD card on SDMMC2 port and GPIO connected LEDs.
> 
> Signed-off-by: Alex Ling <kasimling@gmail.com>
> ---
> Changes for v2:
>   - Clean up patch description
>   - Fix LED labels as Tomasz's suggested
>   - Fix style issues
> 
>  arch/arm/boot/dts/Makefile                |    1 +
>  arch/arm/boot/dts/exynos4412-tiny4412.dts |   93 +++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos4412-tiny4412.dts

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
