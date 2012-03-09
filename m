From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V6 1/5] ARM: exynos: Add support AFTR mode on EXYNOS4210
Date: Fri, 09 Mar 2012 07:34:27 -0800
Message-ID: <4F5A2303.7040403@samsung.com>
References: <1329805190-8874-1-git-send-email-amit.kachhap@linaro.org>	<1329805190-8874-2-git-send-email-amit.kachhap@linaro.org>	<CAMXH7KHTgzY7XZ=4rOxsu-Ra8SRTOsCg=YWOLBD1QDTskRbygw@mail.gmail.com> <CAK44p22LOnJx=bZRfdzAHt7X_snhJGrNoBuXOfsgwBHLLuUziA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:53273 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755491Ab2CIPeb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 10:34:31 -0500
Received: by obbuo6 with SMTP id uo6so2275403obb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 07:34:31 -0800 (PST)
In-Reply-To: <CAK44p22LOnJx=bZRfdzAHt7X_snhJGrNoBuXOfsgwBHLLuUziA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Kachhap <amit.kachhap@linaro.org>
Cc: Rob Lee <rob.lee@linaro.org>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On 02/23/12 03:49, Amit Kachhap wrote:
> On 23 February 2012 11:54, Rob Lee<rob.lee@linaro.org>  wrote:

[...]

> Hi Mr kim,
>
> Can this change be accommodated in the current patch series as below
> or should i send a new patchset?
>
I did, Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -41,7 +41,7 @@ static int exynos4_enter_lowpower(struct cpuidle_device *dev,
>                                  struct cpuidle_driver *drv,
>                                  int index);
>
> -static struct cpuidle_state exynos4_cpuidle_set[] = {
> +static struct cpuidle_state exynos4_cpuidle_set[] __initdata = {
>          [0] = {
>                  .enter                  = exynos4_enter_idle,
>                  .exit_latency           = 1,
>
>
