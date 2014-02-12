From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC
 family
Date: Wed, 12 Feb 2014 10:38:24 +0000
Message-ID: <20140212103824.GF29702@arm.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
 <1392100183-30930-3-git-send-email-kgene.kim@samsung.com>
 <CAOesGMiWsWXkQkb-_VZGco0gKNZPsHf3ubR88y4Pt4-umk5_Ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:24211 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750963AbaBLKia (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 05:38:30 -0500
Content-Disposition: inline
In-Reply-To: <CAOesGMiWsWXkQkb-_VZGco0gKNZPsHf3ubR88y4Pt4-umk5_Ww@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

On Tue, Feb 11, 2014 at 11:39:27PM +0000, Olof Johansson wrote:
> On Mon, Feb 10, 2014 at 10:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > This patch adds support for Samsung GH7 SoC in arm64/Kconfig.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> 
> The overhead of building one more device tree isn't very large, and I
> don't see any other need to have a Kconfig entry per SoC at this time.
> It's of course up to Catalin, but you might just want to always
> compile all dts files instead.

For arm64, I thought of getting rid of ARCH_* Kconfig entries entirely,
only that I haven't heard any strong opinion either way (in which case
I'll do it, with a risk of single Image getting bigger and bigger and
people needing smaller Image can trim their .config).

-- 
Catalin
