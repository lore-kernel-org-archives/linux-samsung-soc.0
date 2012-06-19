From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Update keypad entries for SMDK4X12
Date: Tue, 19 Jun 2012 17:51:08 +0900
Message-ID: <019d01cd4df8$ab313790$0193a6b0$%kim@samsung.com>
References: <1337752798-6987-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47481 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753952Ab2FSIvJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:51:09 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U00BYKWJAA3C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:51:08 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00GLJWL84380@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:51:08 +0900 (KST)
In-reply-to: <1337752798-6987-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Keypad entries are updated as per the latest revision of the board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-smdk4x12.c |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-
> exynos/mach-smdk4x12.c
> index fe772d8..31b105f 100644
> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
> @@ -219,8 +219,10 @@ static struct platform_pwm_backlight_data
> smdk4x12_bl_data = {
> 
>  static uint32_t smdk4x12_keymap[] __initdata = {
>  	/* KEY(row, col, keycode) */
> -	KEY(1, 0, KEY_D), KEY(1, 1, KEY_A), KEY(1, 2, KEY_B),
> -	KEY(1, 3, KEY_E), KEY(1, 4, KEY_C)
> +	KEY(1, 3, KEY_1), KEY(1, 4, KEY_2), KEY(1, 5, KEY_3),
> +	KEY(1, 6, KEY_4), KEY(1, 7, KEY_5),
> +	KEY(2, 5, KEY_D), KEY(2, 6, KEY_A), KEY(2, 7, KEY_B),
> +	KEY(0, 7, KEY_E), KEY(0, 5, KEY_C)
>  };
> 
>  static struct matrix_keymap_data smdk4x12_keymap_data __initdata = {
> @@ -230,8 +232,8 @@ static struct matrix_keymap_data smdk4x12_keymap_data
> __initdata = {
> 
>  static struct samsung_keypad_platdata smdk4x12_keypad_data __initdata = {
>  	.keymap_data	= &smdk4x12_keymap_data,
> -	.rows		= 2,
> -	.cols		= 5,
> +	.rows		= 3,
> +	.cols		= 8,
>  };
> 
>  static struct platform_device *smdk4x12_devices[] __initdata = {
> --
> 1.7.4.1

Looks ok, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
