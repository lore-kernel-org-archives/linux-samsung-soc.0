From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: Odroid HC1 cryptsetup:encrypt sata driver
Date: Tue, 30 Jan 2018 16:32:15 +0100
Message-ID: <f1966769-106e-a95e-8068-642e93c390b4@partner.samsung.com>
References: <CGME20180124130437epcas2p251156941d5fd0dab2c24807a26a156be@epcas2p2.samsung.com>
        <CANAwSgQ3WE9XmjmzHxJstDz52fj_SFvmBKnMjY3MVjhxJuoFmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45898 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752640AbeA3PcV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Jan 2018 10:32:21 -0500
In-reply-to: <CANAwSgQ3WE9XmjmzHxJstDz52fj_SFvmBKnMjY3MVjhxJuoFmg@mail.gmail.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Anand,

On 24.01.2018 14:04, Anand Moon wrote:
> Hi Kamil Konieczny,
> 
> I am looking in setup of encrypted sata hard-disk on Odroid XU4/HC1 device.
> using following encryption method.
> 
> aes-cbc-essiv:sha256 128
> aes-cbc-essiv:sha256 256
> 
> Here is my defconfig I am using. https://pastebin.com/gF5T2stp
> 
> Following crypt benchmark we use to test : https://pastebin.com/WiexsJA2
> 
> When I am trying to format the the hard drive I am getting kernel panic.
> I have tired different option like below.
> 
> *Please guide me in how to fix this bug*
> [...]

Sorry for late response, I was on holidays. Try latest kernel 4.15
and turn off option:

CONFIG_CRYPTO_DEV_EXYNOS_HASH=n

in 

Cryptographic API: 
Hardware crypto devices:
Support for Samsung Exynos HASH accelerator --> turn off

You should also turn on option for software SHA256 (and maybe SHA1)

This is last change in this driver,
so maybe there is some problem with concurrent access to hardware
by AES and HASH driver parts.

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
