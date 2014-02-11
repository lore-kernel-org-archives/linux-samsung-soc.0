From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Tue, 11 Feb 2014 11:52:06 +0900
Message-ID: <52F99056.6010906@samsung.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <1540B9A3-2485-4149-81DD-7D86A532E5D4@arm.com> <D225ECFF-E2A7-44C9-8D11-20EE77077797@codeaurora.org> <2286031.FWmKXGrGIV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:36288 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751554AbaBMA4Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 19:56:25 -0500
Received: by mail-pb0-f47.google.com with SMTP id rp16so9970950pbb.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 16:56:24 -0800 (PST)
In-Reply-To: <2286031.FWmKXGrGIV@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>

On 02/13/14 04:14, Arnd Bergmann wrote:
> On Wednesday 12 February 2014 13:04:40 Kumar Gala wrote:
>> On Feb 12, 2014, at 12:12 PM, Catalin Marinas<catalin.marinas@arm.co=
m>  wrote:
>>> On 12 Feb 2014, at 16:25, Kumar Gala<galak@codeaurora.org>  wrote:
>>>> One reason to keep around ARCH_* is for drivers shared between arm=
 and arm64 that depend on it.
>>>
>>> We already converted some of them (those depending on ARCH_VEXPRESS=
) to
>>> just depend on ARM64. Ideally, at some point I=E2=80=99d like to se=
e them as
>>> defaulting to modules but I don=E2=80=99t think we are there yet (w=
e had some
>>> discussions at the last KS, I=E2=80=99m not sure anyone started loo=
king into
>>> this).
>>
>> I=E2=80=99m torn about this, I think for something like VEXPRESS it =
makes sense,
>> however I think  its reasonable to still have an config symbol for a=
 full
>> SoC family or something of that nature.
>
> I think for SBSA compliant systems, we should be able to live with a
> generic ARCH_SBSA Kconfig symbol. For more irregular embedded platfor=
ms,
> we may need something more specific.
>
Basically, I agreed with Arnd's suggestion to use ARCH_SBSA. Or we need=
=20
to define level in Kconfig like ARCH_SBSA_L1 for level1. BTW, how about=
=20
compliant with SBSA Level1 and having some specific features?

- Kukjin
