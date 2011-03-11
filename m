From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 0/3] ARM: S5P: Add HRT support for s5p series
Date: Sat, 12 Mar 2011 08:08:30 +0900
Message-ID: <002201cbe041$3eca1c00$bc5e5400$%kim@samsung.com>
References: <1299636813-4869-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48274 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751533Ab1CKXIg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Mar 2011 18:08:36 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHX00MQH1MA9Y30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 12 Mar 2011 08:08:34 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHX00ANV1M9NO@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 12 Mar 2011 08:08:34 +0900 (KST)
In-reply-to: <1299636813-4869-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Sangbeom Kim wrote:
> 
> The Following  patches support high resolution timer for s5p series.
> In this version, I had modified smdkv210 clockevent source.
> Because, PWM timer3 is used as  pwm backlight driver in the smdkv210.
> and In previous version(v3), I had made a mistake for making patches.
> 
> Changes since v3:
>  - Change smdkv210 clockevent source by PWM timer2
> 
> Changes since v2:
>  - Add S5P_HRT configuration for s5p_timer
> 
> Changes since v1:
>  - Add sched_clock support (Linus Walleij)
>  - Add clockevents_calc_mult_shift
>  - Modify clk_get scheme
>  - Default clockevent is PWM timer3
> 
> The patch series contains:
> 
> [PATCH v4 1/3] ARM: S5P: Add s5p_timer support for HRT
> [PATCH v4 2/3] ARM: S5P: Update machine initialization for HRT
> [PATCH v4 3/3] ARM: S5P: Update defconfig for HRT support

Looks ok to me, will apply with following.
- removing .shift which is not needed (Jamie's pointing out)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
