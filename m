From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Thu, 13 Feb 2014 14:08:30 -0600
Message-ID: <CAL_JsqJ5FHt4HoV2NtU1ddFpcdxi=Jji0-mPSXL872P8fXrCuQ@mail.gmail.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
	<1392100183-30930-3-git-send-email-kgene.kim@samsung.com>
	<CAOesGMiWsWXkQkb-_VZGco0gKNZPsHf3ubR88y4Pt4-umk5_Ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f172.google.com ([209.85.128.172]:33067 "EHLO
	mail-ve0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751460AbaBMUIb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 15:08:31 -0500
Received: by mail-ve0-f172.google.com with SMTP id c14so8868700vea.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2014 12:08:30 -0800 (PST)
In-Reply-To: <CAOesGMiWsWXkQkb-_VZGco0gKNZPsHf3ubR88y4Pt4-umk5_Ww@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ilho Lee <ilho215.lee@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Feb 11, 2014 at 5:39 PM, Olof Johansson <olof@lixom.net> wrote:
> On Mon, Feb 10, 2014 at 10:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> This patch adds support for Samsung GH7 SoC in arm64/Kconfig.
>>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>
> The overhead of building one more device tree isn't very large, and I
> don't see any other need to have a Kconfig entry per SoC at this time.
> It's of course up to Catalin, but you might just want to always
> compile all dts files instead.

I think having "make dtbs" build all regardless of the config would be
better. Perhaps a "all_dtbs" target could be added and everyone can
get what they want. If/when we add checking into dtc, this we
certainly become more desirable.

Rob
