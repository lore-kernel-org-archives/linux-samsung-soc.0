From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Wed, 12 Feb 2014 20:14:53 +0100
Message-ID: <2286031.FWmKXGrGIV@wuerfel>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <1540B9A3-2485-4149-81DD-7D86A532E5D4@arm.com> <D225ECFF-E2A7-44C9-8D11-20EE77077797@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:63555 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752071AbaBLTO7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 14:14:59 -0500
In-Reply-To: <D225ECFF-E2A7-44C9-8D11-20EE77077797@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>

On Wednesday 12 February 2014 13:04:40 Kumar Gala wrote:
> On Feb 12, 2014, at 12:12 PM, Catalin Marinas <catalin.marinas@arm.co=
m> wrote:
> > On 12 Feb 2014, at 16:25, Kumar Gala <galak@codeaurora.org> wrote:
> >> One reason to keep around ARCH_* is for drivers shared between arm=
 and arm64 that depend on it.
> >=20
> > We already converted some of them (those depending on ARCH_VEXPRESS=
) to
> > just depend on ARM64. Ideally, at some point I=E2=80=99d like to se=
e them as
> > defaulting to modules but I don=E2=80=99t think we are there yet (w=
e had some
> > discussions at the last KS, I=E2=80=99m not sure anyone started loo=
king into
> > this).
>=20
> I=E2=80=99m torn about this, I think for something like VEXPRESS it m=
akes sense,
> however I think  its reasonable to still have an config symbol for a =
full
> SoC family or something of that nature.

I think for SBSA compliant systems, we should be able to live with a
generic ARCH_SBSA Kconfig symbol. For more irregular embedded platforms=
,
we may need something more specific.

	Arnd
