From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/7] Exynos4: enable HDMI support for Odroid and
 UniversalC210
Date: Tue, 26 Aug 2014 15:03:35 +0200
Message-ID: <53FC85A7.4090303@samsung.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
 <CAAObsKC96xCOU8-hoecDn0PAZM5Z-T6Y3pb885csQm4_AakuyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37202 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754828AbaHZNDj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 09:03:39 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NAX00C5T0EWS820@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Aug 2014 14:06:32 +0100 (BST)
In-reply-to: <CAAObsKC96xCOU8-hoecDn0PAZM5Z-T6Y3pb885csQm4_AakuyA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>

Hello,

On 2014-08-12 15:00, Tomeu Vizoso wrote:
> On 1 July 2014 10:10, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> This is a long awaited patch series enabling support for HDMI output
>> available on Exynos4412-based Odroid boards (X/X2/U2/U3/U3+) and
>> Exynos4210 Universal C210 board.
> Hello,
>
> have tested a few of these patches on an Odroid-U2 on top of
> linux/master (c8d6637):
>
> 1a8edf8 clk: exynos4: add support for MOUT_HDMI and MOUT_MIXER clocks
> bb2561d drm: exynos: hdmi: make 'hdmi-en' regulator optional and keep it enabled
> afe0bff Exynos: add support for 'domain-always-on' property
> be421b7 ARM: dts: exynos4: add hdmi related nodes
> 1206d41 ARM: dts: exynos4412-odroid: enable hdmi support
>
> Tested-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>
> I also needed these two patches from Daniel Drake:
>
> 64489ec ARM: dts: Enable PMIC interrupts on ODROID
> ef009d7 ARM: dts: ODROID i2c improvements

Those 2 patches finally reached v3.17-rc2.

> HDMI worked just fine in the testing I did, I have pushed a branch here:
>
> http://cgit.collabora.com/git/user/tomeu/linux.git/log/?h=odroid-hdmi
>
> Marek, Daniel: would you like me to send a series with all the needed
> patches together?

I don't think it is needed now, especially taking into account that there
is no consensus on domain-always-on approach. Maybe I will try once again
to investigate the power on/off issue and check if it is possible to get
rid of it.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
