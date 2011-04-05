From: =?ks_c_5601-1987?B?x9HB+LG4?= <jg1.han@samsung.com>
Subject: RE: [PATCH v3] ARM: EXYNOS4: Add PWM backlight support on Samsung
 SMDKC210
Date: Tue, 05 Apr 2011 16:52:31 +0900
Message-ID: <000601cbf366$6e1b5590$4a5200b0$%han@samsung.com>
References: <1301552179-23735-1-git-send-email-jg1.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10797 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752470Ab1DEHwv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Apr 2011 03:52:51 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJ6004ZI5VPVEC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Apr 2011 16:52:37 +0900 (KST)
Received: from DOJG1HAN01 ([12.23.103.214])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJ600FNL5VOAF@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Apr 2011 16:52:37 +0900 (KST)
In-reply-to: <1301552179-23735-1-git-send-email-jg1.han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Jingoo Han wrote:
> +	.pwm_period_ns	= 1000,

I will explain how I get the value of PWM period.

The SMDK boards use LT3591 as backlight LED driver of LTE480WV LCD
According to the LT3591 datasheet, the switching frequency should
be 1MHz. So, PWM period is calculated by following formula:
	PWM period = 1/switching frequency
                       = 1/1MHz
                       = 1000 ns

You can find LT3591 datasheet easily on the Internet. Please refer to it
for more information.
