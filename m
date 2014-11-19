From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v5 2/2] ARM: EXYNOS: PMU: move restart code into pmu driver
Date: Wed, 19 Nov 2014 15:26:23 +0100
Message-ID: <546CA88F.5010406@samsung.com>
References: <1416307650-15162-1-git-send-email-pankaj.dubey@samsung.com>
 <1416307650-15162-3-git-send-email-pankaj.dubey@samsung.com>
 <546B6395.8020403@samsung.com> <000801d003a7$404882a0$c0d987e0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17656 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752950AbaKSO02 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 09:26:28 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFA00462IWLEAA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Nov 2014 14:29:09 +0000 (GMT)
In-reply-to: <000801d003a7$404882a0$c0d987e0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, linux@roeck-us.net

On 19/11/14 04:16, Pankaj Dubey wrote:
>>> > > +static int pmu_restart_notify(struct notifier_block *this,
>>> > > +		unsigned long code, void *unused)
>>> > > +{
>>> > > +	pmu_raw_writel(0x1, EXYNOS_SWRESET);
>> > 
>> > Is it also valid on exynos5440 ? Doesn't it cause any harm there ?
>> > Perhaps we could add a comment saying it has not effect on that SoC ?
>> > 
> Seeing original code from exynos.c (restart hook) I can say it's not valid
> for exynos5440.
> But it should not cause any harm as of now, because for exynos54440 PMU will
> not be probed.
> If in future support for exynos5440 PMU gets added, that time one may need
> to consider this
> point. This will be applicable for any SoC which does not have same register
> for restart.

OK, I wasn't aware PMU driver won't be probed for exynos5440 at all.
Anyway, I hope we can get someone testing the patch set on exynos5440.

--
Regards,
Sylwester
