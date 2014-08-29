From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 10/14] arm64: dts: add pinctrl support to EXYNOS7
Date: Fri, 29 Aug 2014 11:16:35 +0530
Message-ID: <CAHfPSqBja8z6TLaLoyAYJ33pmNC-FdMEphmdL5UB9p_k1CG_tQ@mail.gmail.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
 <1409132660-1898-2-git-send-email-ch.naveen@samsung.com> <53FDBD7E.3050102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:48821 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752606AbaH2Fq4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Aug 2014 01:46:56 -0400
In-Reply-To: <53FDBD7E.3050102@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, catalin.marinas@arm.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, cpgs@samsung.com, Thomas Abraham <thomas.ab@samsung.com>, Rob Herring <robh@kernel.org>

Hello Tomasz,

On 27 August 2014 16:44, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Naveen,
>
> Please see my comments inline.
>
> On 27.08.2014 11:44, Naveen Krishna Chatradhi wrote:
>> Add the required pin configuration support to EXYNOS7
>
> [snip]
>
>> +/ {
>> +     /* ALIVE block @10580000 */
>> +     pinctrl@10580000 {
>
> This syntax repeating the whole hierarchy of nodes in every dts file is
> considered obsolete in case of Exynos DT sources. Please switch to
> reference-based one. Please see related files for Exynos5260 and 5800 as
> examples.

Sure, will respin with reference based usage.
>
> [snip]
>
>> +             disp_teson: disp_teson {
>> +                     samsung,pins = "gpg0-1";
>> +                     samsung,pin-function = <2>;
>> +             };
>> +
>> +             disp_tesoff: disp_tesoff {
>> +                     samsung,pins = "gpg0-1";
>> +                     samsung,pin-function = <0>;
>
> This is not a special function, so I don't think it belongs to this file.
>
> Best regards,
> Tomasz

Thanks for the in depth review.
Will fixes the comments.


-- 
Thanks & Regards,
(: Nav :)
