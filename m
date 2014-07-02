From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 4/7] Exynos: add support for 'domain-always-on' property
Date: Wed, 02 Jul 2014 09:56:51 +0200
Message-ID: <53B3BB43.2080304@samsung.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
 <1404202211-15788-5-git-send-email-m.szyprowski@samsung.com>
 <53B276BE.2090509@gmx.net> <53B27AA3.5030000@samsung.com>
 <53B2F5C0.1000509@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:27808 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751723AbaGBH4x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 03:56:53 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N82009PSREBYW50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Jul 2014 08:56:35 +0100 (BST)
In-reply-to: <53B2F5C0.1000509@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Hello,

On 2014-07-01 19:54, Tobias Jakobi wrote:
> Marek Szyprowski wrote:
>> On 2014-07-01 10:52, Tobias Jakobi wrote:
>>> I think you had a similar patch in the tizen tree, but according to
>>> Tomasz Figa, it was considered a hack. I don't quite see how this is
>>> different.
>>>
>>> Also, if I have been following the discussion correctly, then the
>>> powerdomain issue essentially is about the question which SoC block
>>> needs the LCD0 domain and how the proper power on/off sequences should
>>> look like.
>>>
>>> At least the mixer power issue, which I pointed out some time ago, seems
>>> to be deal with now:
>>> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=381be025ac1a6dc8efebdf146ced0d4a6007f77b
>> Well, that patch solves power on/off sequence issue with mixer and hdmi,
>> but it didn't solve the issue with additional managing of power domain
>> on/off. You can check that if you remove always on property, system will
>> freeze when hdmi cable is connected for the second time. I've investigated
>> it for some time, but right now I didn't find any 100% reliable solution
>> other than keeping the power domain enabled all the time. At least for
>> now, this patch lets you use HDMI without any stability issues.
> Hmm, I have also applied a similar hack to force TV and LCD0 pd on on my
> system, but I didn't experience this behaviour (cable reconnecting).
> Guess I have to recheck with some more recent tree to make sure.
>
>
>> I've only found that there are still at least 2 issues with power domains.
>> One is Mixer/Video Processor dependency on LCD0 domain, second is the
>> proper
>> power on/off sequence of HDMI/Mixer and TV domain. Forcing both domains to
>> 'always on' workarounds both issues for now. Right now I have no better
>> idea.
> I had the impression that the patch from above, plus this one
> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=245f98f269714c08dc6d66d021d166cf36059bc4
> were supposed to fix these issues. I haven't tested them yet, because of
> lack of time, but Rahul's patch appears to fix mixer poweroff, and
> Inki's patch the sequencing (VP, Mixer and last but not least, the HDMI).

You can check it directly from the git branch I've prepared:
https://git.linaro.org/people/marek.szyprowski/linux-srpol.git/shortlog/refs/heads/v3.16-odroid

If you disable this always-on property from tv pd domain (you can keep lcd0
domain enabled to simplify things), the system will freeze. I really have
no idea how to fix this.

>
>> Later, once the proper sequence is found we can remove those properties
>> from Odroid DTS.
> I dunno, because you would have to support the property to the end of
> time then, even though it's not used anymore. Isn't that the kind of
> thing that shouldn't end up in DT bindings specs?

I think that there have been recently similar issue with one of Exyno5 SoCs,
where one of the domain has been removed from DTS just to keep it enabled
all the time (assuming that bootloader left it enabled). See commit
8b3ca983a69ab28bab257bdbaa9eaa1b8830d7b7 ("ARM: dts: Remove g2d_pd node for
exynos5420"). So this property can be used for that case too.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
