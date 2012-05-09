From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: exynos: Adapt to cpuidle core time keeping and irq
 enable
Date: Wed, 09 May 2012 21:18:30 +0900
Message-ID: <01a101cd2ddd$d8a1b0f0$89e512d0$%kim@samsung.com>
References: <1335355912-26063-1-git-send-email-amit.kachhap@linaro.org>
 <4F980DE6.1020504@linaro.org>
 <CAMXH7KG_=oupDTe7vcbDdp6wb=gHc3s8Z4EwxVeJBPGDNC8FSQ@mail.gmail.com>
 <CADGdYn6KLNA+EG4DCmvP_ZohORe0LjtUi+7m0DTxcjgqwUC1HQ@mail.gmail.com>
 <019801cd2dda$5dbbc680$19335380$%kim@samsung.com> <4FAA5E68.1060204@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12837 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758646Ab2EIMSd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 08:18:33 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3R00JT28UWNI40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 21:18:32 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3R005288UUJ880@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 21:18:32 +0900 (KST)
In-reply-to: <4FAA5E68.1060204@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Daniel Lezcano' <daniel.lezcano@linaro.org>
Cc: 'amit kachhap' <amit.kachhap@gmail.com>, 'Rob Lee' <rob.lee@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org

Daniel Lezcano wrote:
> 
> On 05/09/2012 01:53 PM, Kukjin Kim wrote:
> > amit kachhap wrote:
> >>
> >> Hi Mr Kukjin,
> >>
> >> Any comment or update about this patch?
> >>
> > I'm not sure we don't need to check the idle_time?
> > Others, looks ok to me.
> 
> Hi,
> 
> may be I misunderstood your question but the behavior is not changed
> here, just the code is refactored and using a common routine where the
> time is computed.
> 
> The idle_time computation is done by the cpuidle core now if the
> en_core_tk_irqen flag is enabled. That allows to remove a lot of
> duplicated code across the cpuidle drivers.
> 
OK, I see and checked. Daniel, thanks.

Amit, this looks ok to me, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
