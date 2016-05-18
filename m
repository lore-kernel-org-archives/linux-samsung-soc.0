From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos: don't select keyboard driver
Date: Wed, 18 May 2016 17:01:50 +0200
Message-ID: <573C83DE.60106@samsung.com>
References: <1463581102-1007639-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1463581102-1007639-1-git-send-email-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/18/2016 04:17 PM, Arnd Bergmann wrote:
> The samsung-keypad driver is implicitly selected by ARCH_EXYNOS4 (why?),
> but this fails if CONFIG_INPUT is a loadable module:
> 
> drivers/input/built-in.o: In function `samsung_keypad_remove':
> drivers/input/keyboard/samsung-keypad.c:461: undefined reference to `input_unregister_device'
> drivers/input/built-in.o: In function `samsung_keypad_irq':
> drivers/input/keyboard/samsung-keypad.c:137: undefined reference to `input_event'
> drivers/input/built-in.o: In function `samsung_keypad_irq':
> include/linux/input.h:389: undefined reference to `input_event'
> drivers/input/built-in.o: In function `samsung_keypad_probe':
> drivers/input/keyboard/samsung-keypad.c:358: undefined reference to `devm_input_allocate_device'
> drivers/input/built-in.o:(.debug_addr+0x34): undefined reference to `input_set_capability'
> 
> This removes the 'select' as suggested by Krzysztof Kozlowski and
> instead enables the driver from the defconfig files.
> 
> The problem does not happen on mainline kernels, as we don't normally
> build built-in input drivers when CONFIG_INPUT=m, but I am experimenting
> with a patch to change this, and the samsung keypad driver showed up
> as one example that was silently broken before.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lkml.org/lkml/2016/2/14/55
> ---
>  arch/arm/configs/exynos_defconfig   | 1 +
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  arch/arm/mach-exynos/Kconfig        | 1 -
>  3 files changed, 2 insertions(+), 1 deletion(-)

Thanks for update.

Applied for v4.7 (same reason as in plat-samsung/devs.c).

Best regards,
Krzysztof
