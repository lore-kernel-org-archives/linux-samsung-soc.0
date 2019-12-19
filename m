Return-Path: <SRS0=HBcY=2J=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8979DC2D0C1
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 12:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AC3C24650
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 12:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="t0sUmwc+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfLSMyl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Dec 2019 07:54:41 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57080 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbfLSMyl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Dec 2019 07:54:41 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191219125439euoutp022dd674719919a88cf6546d48f2bc3bf8~hxvA-Dt5z2933429334euoutp02T
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2019 12:54:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191219125439euoutp022dd674719919a88cf6546d48f2bc3bf8~hxvA-Dt5z2933429334euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576760079;
        bh=Hrht/d8GmcmFKanCFb5HqQzFkDSgRpXPsI3GIUQrdvQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=t0sUmwc+rRMnzzc6+FcUxxvFdvYLo5RUaxOyFeM2KGpvLu5kUoW2GPDO/6S/A7A35
         Wi7J1Qmw6tS/EIQbCMyeugHC85M0DPgNy4wjznXdibol0R+xDVbAAV4oXC0S2a5XfX
         JyuUGYlFy1w0ltBgpGKHgGZX8Sv4AjmLi9ptEE9w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191219125439eucas1p1fd8a6f5514f76c3a3ddd866b56f5adfe~hxvAqAb0U3025930259eucas1p1N;
        Thu, 19 Dec 2019 12:54:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 8F.AD.61286.F037BFD5; Thu, 19
        Dec 2019 12:54:39 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191219125438eucas1p1bd6e07610053d800a79e16bbb5123d60~hxvABMTkU0449204492eucas1p1r;
        Thu, 19 Dec 2019 12:54:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191219125438eusmtrp2ad1ac7f668c1f7421752ee90316c1f1f~hxvAAiLKb2126321263eusmtrp2f;
        Thu, 19 Dec 2019 12:54:38 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-b1-5dfb730fa908
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id AC.CC.07950.E037BFD5; Thu, 19
        Dec 2019 12:54:38 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191219125438eusmtip288e95f87ccb2fbe348a7f8cb45439211~hxu-gvtUA2426024260eusmtip2E;
        Thu, 19 Dec 2019 12:54:38 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
To:     Mark Brown <broonie@kernel.org>
Cc:     Tzung-Bi Shih <tzungbi@google.com>,
        ALSA development <alsa-devel@alsa-project.org>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Takashi Iwai <tiwai@suse.de>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
Date:   Thu, 19 Dec 2019 13:54:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191219123709.GB5047@sirena.org.uk>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7djPc7r8xb9jDWZdF7C4cvEQk8XUh0/Y
        LE4cbmS2aJ/ZwWhx/vwGdotXh3cxWsw4v4/J4vCbdlaLl5vfMFnsufiK3YHLY8PnJjaPBZtK
        PTat6mTz+HZmIotH35ZVjB6bT1d7fN4kF8AexWWTkpqTWZZapG+XwJXxd3N0wT7BikcHHzM2
        MM7i62Lk5JAQMJG4tvEPSxcjF4eQwApGicszb7FDOF8YJf5sOsoM4XxmlPg24yhrFyMHWMus
        1QIQ8eWMEicWz4Fqf8socf/3fHaQucICeRIHl6xmA7FFBJQlrn7fC1bELNDHLHHqzQ2wBJuA
        oUTX2y42kKm8AnYSmxq0QMIsAqoS5x41sYCERQViJTqWZ4CEeQUEJU7OfMICYnMKGEks3fAL
        bAqzgLxE89bZzBC2uMStJ/OZQFZJCFxjl3i6dTEjxNEuEi+eG0C8LCzx6vgWdghbRuL/Tpj6
        ZkaJh+fWskM4PcCwaJrBCFFlLXH4+EWw75kFNCXW79KHCDtKzL73mRliPp/EjbeCEDfwSUza
        Nh0qzCvR0SYEUa0mMev4Ori1By9cYp7AqDQLyWezkHwzC8k3sxD2LmBkWcUonlpanJueWmyY
        l1quV5yYW1yal66XnJ+7iRGYrE7/O/5pB+PXS0mHGAU4GJV4eB3SfscKsSaWFVfmHmKU4GBW
        EuG93fEzVog3JbGyKrUoP76oNCe1+BCjNAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OKWCi
        EeFIiff9d2qtemP8p1nNgg+sfzZ3tkW4TJSVYHjLPSVzUom/aNn+p0oJ/jKcG9zF1T96Xwvc
        KbbyutwCM5Mlyu9e7lwg85/hQW24xReu/LJ3ZRysYtXmK+Tef3O/2/d25grLgxMnhSevnmL+
        TtS9Z8onG66n/c51C0IeXfiY5Lx9gv7fFYpKLMUZiYZazEXFiQBOJ7mDUgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRmVeSWpSXmKPExsVy+t/xe7p8xb9jDba+VLS4cvEQk8XUh0/Y
        LE4cbmS2aJ/ZwWhx/vwGdotXh3cxWsw4v4/J4vCbdlaLl5vfMFnsufiK3YHLY8PnJjaPBZtK
        PTat6mTz+HZmIotH35ZVjB6bT1d7fN4kF8AepWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKp
        Z2hsHmtlZKqkb2eTkpqTWZZapG+XoJfxd3N0wT7BikcHHzM2MM7i62Lk4JAQMJGYtVqgi5GT
        Q0hgKaPEnydaILaEgIzEyWkNrBC2sMSfa11sXYxcQDWvgWqmnGUHSQgL5EkcXLKaDcQWEVCW
        uPp9LwtIEbNAH7PEjstzWCE6XjFLTNo/E6yDTcBQoustyCgODl4BO4lNDWDbWARUJc49amIB
        sUUFYiW+r/zECGLzCghKnJz5BCzOKWAksXTDL7BlzAJmEvM2P2SGsOUlmrfOhrLFJW49mc80
        gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzA+Nx27OeWHYxd
        74IPMQpwMCrx8Dqk/Y4VYk0sK67MPcQowcGsJMJ7u+NnrBBvSmJlVWpRfnxRaU5q8SFGU6Dn
        JjJLiSbnA1NHXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRvcl
        63PTA2t1dXZ8afaL/HHUo2SmxsT/xcb1rqxTo84E+7wuf3RgbQ0b7x353YntGoo883uvnN3l
        eyfn1nN/QeNMrgqvBXe2v2Td3vfgELP699w5evGpe0wLRfreMF7ml7E10y5Q7dg762O33drA
        p30/NtrMeNiu5/lKdu9fb7v45V5KcgtWKbEUZyQaajEXFScCADCRm8LlAgAA
X-CMS-MailID: 20191219125438eucas1p1bd6e07610053d800a79e16bbb5123d60
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
        <20191128151908.180871-1-tzungbi@google.com>
        <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
        <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
        <20191218132620.GE3219@sirena.org.uk>
        <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
        <20191218162422.GG3219@sirena.org.uk>
        <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
        <20191219123709.GB5047@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Mark,

On 19.12.2019 13:37, Mark Brown wrote:
> On Thu, Dec 19, 2019 at 09:03:42AM +0100, Marek Szyprowski wrote:
>> On 18.12.2019 17:24, Mark Brown wrote:
>>
>> I've checked again the exact probe order and here is what happens in the
>> system:
>>
>> 1. first call to odroid_audio_probe() is just after:
>>
>> [    2.942428] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
>>
>> 2. That time, i2s dai and max98090 devices are already registered.
>> However the snd_soc_of_get_dai_link_codecs() return -EPROBE_DEFER,
>> because it cannot get the HDMI codec component.
>>
>> 3. HDMI codec is being registered when Exynos DRM initializes. This
>> happens later:
>>
>> [    3.127833] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on
>> minor 0
>>
>> 4. Then odroid_audio_probe() is called again from the deferred probe
>> worker and succeeds:
>>
>> [    3.501198] ALSA device list:
>> [    3.501300]   #0: Odroid-U3
>> 5. Then userspace starts:
>> [    3.603825] Run /sbin/init as init process
>>
>> 6. when userspace init scripts (alsactl) enumerates devices in the
>> system the lockdep warning is triggered:
>>
>> [   10.068990] ======================================================
>> [   10.070970] WARNING: possible circular locking dependency detected
>> [   10.077136] 5.5.0-rc2-next-20191218 #7188 Not tainted
>> [   10.082168] ------------------------------------------------------
>> [   10.088332] alsactl/1106 is trying to acquire lock:
>>
>> 7. then alsa utils probably tries to load the saved values for the controls, what triggers the NULL ptr dereference:
>>
>> [....] Setting up ALSA...[   10.502672] 8<--- cut here ---
>> [   10.502772] Unable to handle kernel NULL pointer dereference at virtual address 000000b0
> OK, so this is probably related to some of Morimoto-san's bisections.
> Is there any chance you coudld do a bisect to try to isolate where
> things go wrong?

I can do the bisect, but please let me know exactly what to bisect.

The initial bisection I did was from v5.5-rc1 to linux-next and pointed 
to the $subject commit.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

