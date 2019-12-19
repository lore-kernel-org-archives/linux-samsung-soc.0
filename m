Return-Path: <SRS0=HBcY=2J=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB24BC43603
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 08:03:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 832B72467B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 08:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="j74B/QNk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfLSIDs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Dec 2019 03:03:48 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39442 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfLSIDr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Dec 2019 03:03:47 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191219080345euoutp019001486cb50c8277ee362d1540f2296d~htxB3QyOe1349013490euoutp01F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2019 08:03:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191219080345euoutp019001486cb50c8277ee362d1540f2296d~htxB3QyOe1349013490euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576742625;
        bh=e8ew1VpbTWgxX8TMfSLIxJhUaIpngDyfiCvIitNcoiU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=j74B/QNkLKbjgul7YUOYKSW5FHNyH+rw94CBiEV+AgO+GqzjR5EIiZtr32PnLtFAq
         S6gQX49wqNciVqVB7Xgm96qeY1q/CkYk2xycGrJuKaAUTHStOoVVsQOAoE1e4clZXN
         8orm2fRvMFkjK0YTFMTEyRyQkEzG2u/vQ8B11umU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191219080345eucas1p198beb2205e3e4c76554a83fa08302c9e~htxBixZve0674206742eucas1p1Z;
        Thu, 19 Dec 2019 08:03:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 68.17.60679.1EE2BFD5; Thu, 19
        Dec 2019 08:03:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191219080344eucas1p21640f7eded7679fab092c68f3085f7ea~htxA-Poah1481314813eucas1p22;
        Thu, 19 Dec 2019 08:03:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191219080344eusmtrp2dbe096dd78dca4f43a1e9d5d5f92d5ca~htxA_kuTQ0356503565eusmtrp2e;
        Thu, 19 Dec 2019 08:03:44 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-66-5dfb2ee1b969
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 98.35.07950.0EE2BFD5; Thu, 19
        Dec 2019 08:03:44 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191219080344eusmtip2f988f3311c4fc2c3b577ff7adb2ac8e9~htxAe54cJ2751827518eusmtip27;
        Thu, 19 Dec 2019 08:03:44 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
To:     Mark Brown <broonie@kernel.org>
Cc:     Tzung-Bi Shih <tzungbi@google.com>,
        ALSA development <alsa-devel@alsa-project.org>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Takashi Iwai <tiwai@suse.de>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
Date:   Thu, 19 Dec 2019 09:03:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218162422.GG3219@sirena.org.uk>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO2dnOzNnx6n5olKwSNJS81IcMqTAaGE//BUhrVp6cJKbsjlL
        7YeXSrNMEU2diVqWMjHN29SscJJzac5LmVoGixFo6p8t07yU82T573mf53kvD7wkLtQRHmSc
        IolRKqTxIq4Dp71vecjP7L8iOfx0wJN+P6LH6GKzhUv392bgdHZZDqJNpiYeXWp6hdG9c9kE
        PdMyh9HdI7O8E3xxkzWTK65qVoubtXe44vutWiRuGUgTW5v3RHKjHI7HMPFxyYwyIOyyg2yw
        oAZLLPC4njHYhqejIrdcxCeBCoHytUUsFzmQQqoOwYPXfZhdEFI2BK1vd7KCFYHWeBPf6lg1
        zyNWqEWwsF5GsMU8gs6SBsLucqEU0FNTz7VjV2offPj5kmPHODWOQXd1lB1zqUDInc/d9Aio
        MFj8/H2zl0PtB2OeaYMnSTdKAjm1MtbiDMYyy+YYPhUEH8fWEDtyL2S1leMsdocpS+VmHKD0
        PCifySfYq8NhemUcY7ELzBpaeSz2gt+dWw1ZCMxDDTy2uIdgLLMUsa5Q6DWMEPaLcMoHGrsC
        WPoklH+x4nYaKCeYmHdmj3CCwvaSv7QAcm4LWbc3aAzP/q3tGR7FC5BIsy2aZlsczbY4mv97
        qxBHi9wZtUoey6iCFMw1f5VUrlIrYv2jE+TNaOOdBtYNtg7UtXpFjygSiRwFS6d+SYSENFmV
        ItcjIHGRq+BTzrJEKIiRpqQyyoRLSnU8o9IjT5IjchcEP5qRCKlYaRJzlWESGeWWipF8j3R0
        xPuMb7FPlXvlxFL844766VGdLuIY8fzAmM1SsZK6O+rWw4Vx/o9DjLnDLVx+94Jt8UWDqS7f
        WPHu7FfZRWb89BjqmcxTT1punPcg8qob/JTRWpkuTecrDzkYbKzvCH1yNLQwsuRcu7X/TXF2
        Zto310Yvx+Fd+cqixISIHVMifxFHJZMG+uJKlfQPhErHdkoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7oP9H7HGmx7b25x5eIhJoupD5+w
        WZw43Mhs0T6zg9Hi/PkN7BYzzu9jsjj8pp3V4uXmN0wWey6+Ynfg9NjwuYnNY8GmUo9NqzrZ
        PPq2rGL02Hy62uPzJrkAtig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07
        m5TUnMyy1CJ9uwS9jDMTljAVTJCqaDyzlbmBcYpoFyMnh4SAicSfh28Zuxi5OIQEljJKfFrS
        ywaRkJE4Oa2BFcIWlvhzrYsNoug1o8SMzi1MIAlhgTyJg0tWgzWICChLXP2+lwWkiFngGpPE
        okv7WSE6epkl/nV2glWxCRhKdL3tArN5Bewkvt15DbaCRUBV4mTvebC4qECsxPeVnxghagQl
        Ts58wgJicwoYSVy//BcszixgJjFv80NmCFteonnrbChbXOLWk/lMExiFZiFpn4WkZRaSlllI
        WhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjMltx35u2cHY9S74EKMAB6MSD2+Ax69Y
        IdbEsuLK3EOMEhzMSiK8tzt+xgrxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjBd5JXEG5oa
        mltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYBR78uPL6uj3G/uyP7ZaGnJf
        Va8VlH+7kFnJeHtGf9eaaSZ/0pxmpuVyeMr/4CpfKzhZgW9B+s6q7FNFNUY6NcHFrGE+D/tf
        7lhut1YpSOuDRYqA8V6Pf13/vxkcOtx0vvJAwxF1RiXBb/t+3K3uvZb0ZMe95Nhl7hXzmd/G
        ZEr8bRDVym35q8RSnJFoqMVcVJwIAJ08QSvfAgAA
X-CMS-MailID: 20191219080344eucas1p21640f7eded7679fab092c68f3085f7ea
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
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Mark,

On 18.12.2019 17:24, Mark Brown wrote:
> On Wed, Dec 18, 2019 at 03:48:14PM +0100, Marek Szyprowski wrote:
>> On 18.12.2019 14:26, Mark Brown wrote:
>>>> - snd_card_new( ) succeed in snd_soc_bind_card( ), so that userspace
>>>> can see the control
>>>>
>>> This feels like snd_card_new() is being overly enthusiastic here, I'd
>>> expect that we might have other problems elsewhere with that.  I'd not
>>> expect userspace to see things until snd_card_register() since between
>>> _new() and that we're in the process of building the card up.  Given
>>> this we *will* need to handle partially constructed cards after all,
>>> unless we change the ALSA core.  Takashi?
>> I'm not sure if this is an issue about partially registered card. Here
>> is the boot log:
>>
>> https://paste.debian.net/1121543/
>>
>> This oops happens when udev tries to do its job. The card is earlier
>> fully registered and advertised by alsa:
>>
>> [    3.501198] ALSA device list:
>> [    3.501300]   #0: Odroid-U3
> That's not what the analysis I was replying to said :(
>
> This log makes no sense to me, if this is the same card that was
> registered and announced earlier what caused it to become unregistered
> so that we are registering it now?

I've checked again the exact probe order and here is what happens in the 
system:

1. first call to odroid_audio_probe() is just after:

[    2.942428] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s

2. That time, i2s dai and max98090 devices are already registered. 
However the snd_soc_of_get_dai_link_codecs() return -EPROBE_DEFER, 
because it cannot get the HDMI codec component.

3. HDMI codec is being registered when Exynos DRM initializes. This 
happens later:

[    3.127833] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on 
minor 0

4. Then odroid_audio_probe() is called again from the deferred probe 
worker and succeeds:

[    3.501198] ALSA device list:
[    3.501300]   #0: Odroid-U3

5. Then userspace starts:

[    3.603825] Run /sbin/init as init process

6. when userspace init scripts (alsactl) enumerates devices in the 
system the lockdep warning is triggered:

[   10.068990] ======================================================
[   10.070970] WARNING: possible circular locking dependency detected
[   10.077136] 5.5.0-rc2-next-20191218 #7188 Not tainted
[   10.082168] ------------------------------------------------------
[   10.088332] alsactl/1106 is trying to acquire lock:

7. then alsa utils probably tries to load the saved values for the controls, what triggers the NULL ptr dereference:

[....] Setting up ALSA...[   10.502672] 8<--- cut here ---
[   10.502772] Unable to handle kernel NULL pointer dereference at virtual address 000000b0

>
>> If there are any useful logs for tracking this issue, let me know how to
>> enable them, so I will provide more logs.
> It'd be good to understand this unregistration/probe deferral for a
> start...  when did the card get unregistered and why?

I hope that the above description helps.

The same issue happens on OdroidXU, which uses simple-audio-card, so 
this is not related to odroid_audio_card only.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

