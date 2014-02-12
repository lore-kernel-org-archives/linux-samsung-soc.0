From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Wed, 12 Feb 2014 18:12:31 +0000
Message-ID: <1540B9A3-2485-4149-81DD-7D86A532E5D4@arm.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <1392100183-30930-3-git-send-email-kgene.kim@samsung.com> <CAOesGMiWsWXkQkb-_VZGco0gKNZPsHf3ubR88y4Pt4-umk5_Ww@mail.gmail.com> <20140212103824.GF29702@arm.com> <B1132DDA-ECB1-4971-98AE-6DDDDD985CFB@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:55483 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753725AbaBLSMX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 13:12:23 -0500
Received: by mail-we0-f176.google.com with SMTP id q58so6232867wes.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 10:12:22 -0800 (PST)
In-Reply-To: <B1132DDA-ECB1-4971-98AE-6DDDDD985CFB@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.ab@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 12 Feb 2014, at 16:25, Kumar Gala <galak@codeaurora.org> wrote:
> On Feb 12, 2014, at 4:38 AM, Catalin Marinas <catalin.marinas@arm.com=
> wrote:
>=20
>> On Tue, Feb 11, 2014 at 11:39:27PM +0000, Olof Johansson wrote:
>>> On Mon, Feb 10, 2014 at 10:29 PM, Kukjin Kim <kgene.kim@samsung.com=
> wrote:
>>>> This patch adds support for Samsung GH7 SoC in arm64/Kconfig.
>>>>=20
>>>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>=20
>>> The overhead of building one more device tree isn't very large, and=
 I
>>> don't see any other need to have a Kconfig entry per SoC at this ti=
me.
>>> It's of course up to Catalin, but you might just want to always
>>> compile all dts files instead.
>>=20
>> For arm64, I thought of getting rid of ARCH_* Kconfig entries entire=
ly,
>> only that I haven't heard any strong opinion either way (in which ca=
se
>> I'll do it, with a risk of single Image getting bigger and bigger an=
d
>> people needing smaller Image can trim their .config).
>=20
> One reason to keep around ARCH_* is for drivers shared between arm an=
d arm64 that depend on it.

We already converted some of them (those depending on ARCH_VEXPRESS) to
just depend on ARM64. Ideally, at some point I=92d like to see them as
defaulting to modules but I don=92t think we are there yet (we had some
discussions at the last KS, I=92m not sure anyone started looking into
this).--
To unsubscribe from this list: send the line "unsubscribe linux-samsung=
-soc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
