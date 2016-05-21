From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: exynos: don't select keyboard driver
Date: Fri, 20 May 2016 22:11:37 -0400
Message-ID: <b20eb044-f575-9504-2446-ca74df9d1724@osg.samsung.com>
References: <1463581102-1007639-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:45513 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751582AbcEUCLq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 May 2016 22:11:46 -0400
In-Reply-To: <1463581102-1007639-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Arnd,

On 05/18/2016 10:17 AM, Arnd Bergmann wrote:
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

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
